@extends('layouts.app')
@section('css')
    <style>
        .lesson-index .container .lesson-list{
            padding:10px 0;
        }
        .lesson-index .list-group-item{
            background: #eee;
        }
        .lesson-index .list-group-item > a{
            color:#333;
            font-size:20px;
        }
    </style>
@endsection
@section('content')
    <div class="lesson-index">
        <div class="jumbotron">
            <h1>{{ $lessonsortInfo->name }}</h1>
            <p>
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&ensp;{{ $lessonsortInfo->user->name }}&emsp;
                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>&ensp;{{ $lessonsortInfo->updated_at }}
            </p>
            <p>{{ $lessonsortInfo->abstract }}</p>
        </div>
        <div class="container">
            <div class="btn-group">
                <a class="btn" href="{{ route('lesson.create',['lessonsortId'=>$lessonsortInfo->id]) }}"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&ensp;新建课程</a>
            </div>
            <div class="lesson-list">
                <ul class="list-group">
                    @foreach($lessonsortInfo->lesson as $lesson)
                        <li class="list-group-item">
                            <a href="{{ route('lesson.show',['$lessonId'=>$lesson->id]) }}">
                                {{ $lesson->title }}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
@endsection