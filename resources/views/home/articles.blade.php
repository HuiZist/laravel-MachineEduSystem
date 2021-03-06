@extends('layouts.app')
@section('css')
    <style>
        .UserInfo{
            margin-top:-170px;
            margin-bottom: 30px;
            overflow: hidden;
        }
        .UserInfoLeft{
            float: left;
        }
        .UserAvatar{
            width:192px;
            border-radius: 96px;
        }
        .UserInfoMiddle{
            float: left;
            margin-left:30px;
            padding-top: 20px;
        }
        .UserInfoMiddle ul li{
            line-height:45px;
        }
        .UserInfoMiddle li,.UserInfoMiddle li>a{
            color:#000;
            font-size: 18px;
        }
        .UserInfoMiddle li>a:hover{
            color: #666;
        }
        .UserInfoRight{
            float:right;
            font-size: 25px;
            padding-top: 70px;
            color:#000;
        }
        .UserInfoBody .infoItem{
            float: left;
            width: 350px;
        }
        .UserInfoBody .title{
            background:#101010;
            color:#fff;
        }
        .UserInfoBody .infoList{
            margin-left: 20px;
            float: left;
            width: 700px;
        }
    </style>
@endsection
@section('content')
<div class="home">
    <div class="jumbotron" style="height: 200px;">
    </div>
    <div class="container">
        <div class="UserInfo">
            <div class="UserInfoLeft">
                <img class="UserAvatar" src="{{ $user->avatar }}">
            </div>
            <div class="UserInfoMiddle">
                <ul class="list-unstyled" style="">
                    <li>
                        <span style="font-size: 36px;font-weight: bold;">{{ $user->name }}</span>
                        &ensp;/&ensp;
                        <i class="fa fa-home"></i><span> {{ $userinfo->live }}</span></li>
                    <li>
                        <i class="fa fa-mobile">&ensp;{{ $userinfo->phone }}
                        </i>
                        &ensp;/&ensp;
                        <i class="fa fa-comment">&ensp;{{ $userinfo->webchat }}
                        </i>
                    </li>
                    <li>
                        <a target="_blank" href="{{ $userinfo->blog }}" title="{{ $userinfo->blog }}">
                            <i class="fa fa-external-link">&ensp;Blog</i>
                        </a>
                        &ensp;/&ensp;
                        <a target="_blank" href="{{ $userinfo->github }}" title="{{ $userinfo->github }}">
                            <i class="fa fa-github">&ensp;GitHub</i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="UserInfoRight">
                <i class="fa fa-coffee"></i> {{ $user->experience_count }}
            </div>
        </div>
        <div class="UserInfoBody">
            <div class="list-group infoItem">
                <p class="list-group-item title">
                    选项
                </p>
                <a href="{{ route('home') }}" class="list-group-item" style="background: #d3e0e9;">文章</a>
                <a href="{{ route('home.answers') }}" class="list-group-item">评论</a>
                <a href="{{ route('home.comments') }}" class="list-group-item">回复</a>
                <a href="#" class="list-group-item">课程</a>
            </div>
            <div class="list-group infoList">
                <p class="list-group-item title">
                    列表
                </p>
                @foreach($articles as $article)
                <a href="/articles/{{ $article->id }}" class="list-group-item">
                {{ $article->title }}
                </a>
                @endforeach
                <div class="page">
                    {{ $articles->links() }}
                </div>
            </div>
        </div>
        
    </div>
</div>
@endsection