@extends('layouts.app')
@section('css')
    <style>
        .articles-index .btn-nav{
            width:100%;
            margin: 10px;
            text-align: right;
        }
        .articles-index .btn-mydef{
            color:#fff;
            background:#304356;
            margin-right:10px;
        }
        .articles-index .btn-mydef:hover{
            color:#9c9987;
        }
        .articles-index .media{
            padding:10px 0;
            border-bottom: 1px solid #ccc;
        }
        .articles-index .media-body > h4 > a{
            color:#000;
        }
        .articles-index .dropdown-menu{
            background: #304356;
            min-width: 94px;
        }
        .articles-index .dropdown-menu > li > a{
            color:#fff;
            text-align: center;
        }
        .articles-index .dropdown-menu > li >a:hover{
            color:#9c9987;
            background: #3a5775;
        }


    </style>
@endsection
@section('content')
    <div class="articles-index">
        <div class="jumbotron">
            <h1>Share The World!</h1>
            <p>分享技术，分享快乐</p>
            <p><a class="btn" href="{{ url('articles/create') }}" role="button">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&ensp;
                    写文章
                </a>
            </p>
        </div>
        <div class="container">
            <div class="btn-nav">
                <div class="btn-group">
                    <button type="button" class="btn dropdown-toggle btn-mydef" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        文章排序 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">综合</a></li>
                        <li><a href="#">时间</a></li>
                        <li><a href="#">热度</a></li>
                    </ul>
                </div>
            </div>
            <div class="articles-list">
                @foreach($articles as $article)
                    <div class="media">
                        <div class="media-left">
                            <a href="">
                                <img class="media-object" width="48" src="{{ $article->user->avatar }}" alt="{{ $article->user->name }}">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <a href="/articles/{{ $article->id }}">
                                    {{ $article->title }}
                                </a>
                            </h4>
                        </div>
                    </div>
                @endforeach
                <div class="page">
                    {{ $articles->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection
