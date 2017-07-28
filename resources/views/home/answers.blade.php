@extends('layouts.app')
@section('css')
    <style>
        .UserInfo{
            margin-top:-170px;
            margin-bottom: 30px;
        }
        .UserInfoLeft{
            position:absolute;
        }
        .UserAvatar{
            width:192px;
            border-radius: 96px;
        }
        .UserInfoMiddle{
            display: inline-block;
            margin-left:235px;
            padding-top: 20px;
        }
        .UserInfoMiddle ul li{
            line-height:45px;
        }
        .UserInfoMiddle li a{
            color:#304356;
            font-size: 16px;
        }
        .UserInfoRight{
            display: inline-block;
            float:right;
            font-size: 25px;
            padding-top: 70px;
            color:#000;
        }
        .UserLink{
            margin-left:200px;
        }
        .UserLink>table{
            width:800px;
        }
        .UserLink td{
            text-align: center;
            padding:10px;
        }
        .badge{
            background:#304356;
        }
        .UserLink a{
            color:#304356;
            text-decoration: none;
        }
        .UserLink a:hover{
            color:#9c9987;
        }
        .UserLink a:hover .badge{
            background: #9c9987;
        }
        .UserLink .SelectTd a{
            color:#9c9987;
        }
        .UserLink .SelectTd .badge{
            background: #9c9987;
        }
        .UserContent{
            margin:50px;
        }
        .UserContent .UserAnswers{
            border-bottom:1px solid #ddd;
            font-size: 18px;
            margin:20px;
            padding:10px;
        }
        .UserContent .UserAnswers a{
            color:#333;
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
                        <span style="font-size: 24px;font-weight: bold;">{{ $user->name }}</span>
                        &emsp;/&emsp;
                        <i class="fa fa-home"></i><span> {{ $userinfo->live }}</span></li>
                    <li>
                        <i class="fa fa-mobile"> {{ $userinfo->phone }}
                        </i>
                        &emsp;/&emsp;
                        <i class="fa fa-comment"> {{ $userinfo->webchat }}
                        </i>
                    </li>
                    <li>
                        <a target="_blank" href="{{ $userinfo->blog }}" title="{{ $userinfo->blog }}">
                            <i class="fa fa-link"> 博客</i>
                        </a>
                        &emsp;/&emsp;
                        <a target="_blank" href="{{ $userinfo->github }}" title="{{ $userinfo->github }}">
                            <i class="fa fa-github"> GitHub</i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="UserInfoRight">
                <i class="fa fa-fire"></i> {{ $user->experience_count }}
            </div>
        </div>
        <div class="UserLink">
            <table>
                <tr>
                    <td><a href="{{ route('home') }}">文章&emsp;<span class="badge">{{ $user->articles_count }}</span></a></td>
                    <td class="SelectTd"><a href="{{ route('home.answers') }}">评论&emsp;<span class="badge">{{ $user->answers_count }}</span></a></td>
                    <td><a href="{{ route('home.comments') }}">回复&emsp;<span class="badge">{{ $user->comments_count }}</span></a></td>
                    <td><a href="#">关注&emsp;<span class="badge">{{ $user->followers_count }}</span></a></td>
                </tr>
            </table>
        </div>
        <div class="UserContent">
            @foreach($answers as $answer)
                <div class="UserAnswers">
                    <a href="/articles/{{ $answer->article_id }}">{!! $answer->body !!}</a>
                </div>
            @endforeach
        </div>
    </div>
</div>
@endsection