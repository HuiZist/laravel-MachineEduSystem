@extends('layouts.app')
@section('css')
    <style>
        .weclome-page .jumbotron .btn{
            border:none;
        }
        .weclome-page .jumbotron .btn:focus{
            outline:none;
        }
        .weclome-page .jumbotron .form-control{
            margin-bottom: 10px;
        }
        .weclome-page .jumbotron .form-control:focus{
            outline:none;
        }
        .weclome-page .container .post{
            margin-top:20px;
            margin-bottom: 20px;
            padding:20px;
            border-radius: 5px;
            background:#fff;
        }
        .weclome-page .container .post-title{
            font-weight:bold;
            font-size: 18px;
            color:#000;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .weclome-page .container .post-content img{
            max-width:100%;
            max-height:100%
        }
    </style>
@endsection
@section('content')
    <div class="weclome-page">
        <div class="jumbotron">
            <h1>Write The World!</h1>
            <p>数控科技，建造精密世界</p>
            <p>
                <!-- Button trigger modal -->
                <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&ensp;
                    写心情
                </button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">发布动态</h4>
                            </div>
                            <form action="/post/store" method="post" enctype="multipart/form-data">
                                {!! csrf_field() !!}
                                <div class="modal-body">
                                    <div class="form-group"{{ $errors->has('title') ? ' has-error' : '' }}>
                                        <label for="title">标题</label>
                                        <input type="text" class="form-control" name="title" id="title" placeholder="标题不超过60字，不小于3字">
                                        @if ($errors->has('title'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('title') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group"{{ $errors->has('content') ? ' has-error' : '' }}>
                                        <div id="container" name="content" type="text/plain" style="height:200px;">
                                            {!! old('content') !!}
                                        </div>
                                        @if ($errors->has('content'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('content') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">发布</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </p>
        </div>

        <div class="container">
            @foreach($posts as $post)
                <div class="post">
                    <div class="post-author">
                        <div class="media">
                            <div class="media-left">
                                <a href="">
                                    <img class="media-object" width="36" src="{{ $post->user->avatar }}" alt="{{ $post->user->name }}">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    {{ $post->user->name }}
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="post-title">
                        {!! $post->title !!}
                    </div>
                    <div class="post-content">
                        {!! $post->content !!}
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
@section('js')
    <script>
        var ue = UE.getEditor('container',{
            toolbars: [[
                'fullscreen', 'source', '|', 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                'directionalityltr', 'directionalityrtl', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'map', 'insertframe', 'insertcode', 'webapp', 'background', '|',
                'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                'preview', 'searchreplace', 'help'
            ]],
            zIndex : 1100,
        });
        ue.ready(function() {
            ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
        });
    </script>
@endsection
