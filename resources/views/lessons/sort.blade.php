@extends('layouts.app')
@section('css')
    <style>
        .lessons-sort .sort-list .thumbnail{
            overflow: hidden;
        }
    </style>
@endsection
@section('content')
    <div class="lessons-sort">
        <div class="jumbotron">
            <h1>Learn The World!</h1>
            <p>学习，在路上</p>
        </div>
        <div class="container">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="/uploads/lessons/lessons_ad/111.jpg" alt="...">
                        <div class="carousel-caption">
                            课程一简介
                        </div>
                    </div>
                    <div class="item">
                        <img src="/uploads/lessons/lessons_ad/222.jpg" alt="...">
                        <div class="carousel-caption">
                            课程二简介
                        </div>
                    </div>
                    <div class="item">
                        <img src="/uploads/lessons/lessons_ad/333.jpg" alt="...">
                        <div class="carousel-caption">
                            课程三简介
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="sort-list">
            @if(Auth::check() && Auth::user()->is_admin)
                <div class="btn-group">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&ensp;创建课程项目
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">创建课程项目</h4>
                                </div>
                                <form method="POST" action="/lessonsort/create" enctype="multipart/form-data">
                                    <div class="modal-body">
                                            {!! csrf_field() !!}
                                            <div class="form-group">
                                                <label for="name">分类名</label>
                                                <input type="text" value="{{ old('name') }}" name="name" class="form-control" placeholder="标题不能少于三个字" id="name">
                                            </div>
                                            <div class="form-group">
                                                <label for="thumbnail">缩略图</label>
                                                <input type="file" name="thumbnail" id="thumbnail">
                                            </div>
                                            <div class="form-group">
                                                <label for="abstract">简介</label>
                                                <textarea class="form-control" rows="3" name="abstract" id="abstract" placeholder="输入课程分类简介"></textarea>
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary">创建</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                @endif
                <div>
                    @foreach( $lesson_sorts as $lesson_sort )
                        <div class="thumbnailcell">
                            <div class="thumbnail">
                                <div class="thumbimg" style="background-image:url(/uploads/lessons/lessons_sort/{{ $lesson_sort->thumbnail }});"><a href="{{ route('lesson.index',['lessonsortId'=>$lesson_sort->id]) }}"></a></div>
                                <div class="caption">
                                    <a href="{{ route('lesson.index',['lessonsortId'=>$lesson_sort->id]) }}">
                                        <h3>{{ $lesson_sort->name }}</h3>
                                        <p>{{ $lesson_sort->abstract }}</p>
                                    </a>
                                    <p>
                                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&ensp;{{ $lesson_sort->user->name }}&emsp;
                                        <span class="glyphicon glyphicon-time" aria-hidden="true"></span>&ensp;{{ $lesson_sort->created_at->format('Y.m.d') }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="page">
                    {{ $lesson_sorts->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    <script>
        $('.carousel').carousel({
        })
    </script>
@endsection