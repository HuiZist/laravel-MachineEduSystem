@extends('layouts.app')
@section('css')
<style>
.articles-index .btn-nav{
    margin: 10px;
    text-align: right;
}
.articles-index .dropdown-menu{
    background: #636b6f;
    min-width: 89px;
    right:0;
    left: auto;
}
.articles-index .dropdown-menu > li > a{
    color:#fff;
    text-align: center;
}
.articles-index .dropdown-menu > li >a:hover{
    color:#fff;
    background: #000;
}
.articles-index .media-body > h4 > a{
    color:#000;
}
.articles-index .articles-list{
    width:800px;
    float:left;
}
.articles-index .articles-list .articleCom{
    margin-bottom: 15px;
    background: #f1f1f1;
    border-radius: 5px;
    box-shadow:2px 2px 3px #aaaaaa;
    overflow: hidden;
    padding:15px;
}
.articles-index .articles-list .articleUser a{
    color:#333;
    text-decoration: none;
}
.articles-index .articles-list .articleUser a:hover{
    color:#666;
}
.articles-index .articles-list .articleUser img{
    border-radius: 36px;
}
.articles-index .articles-list .articleTitle{
    margin-bottom: 10px;
}
.articles-index .articles-list .articleTitle h2{
    margin-top:5px;
}
.articles-index .articles-list .articleTitle h2>a{
    color: #000;
    text-decoration:none;
}
.articles-index .articles-list .articleTitle h2>a:hover{
    color: #666;
}
.articles-index .articleTopics>a{
    color: #000;
    font-size: 12px;
    background: #eee;
    text-decoration:none;
}
.articles-index .articleTopics>a:hover{
    color: #fff;
    background: #666;
}
.articles-index .articles-list .articleImg{
    float:left;
    width:230px;
    height:140px;
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    border-radius: 5px;
    margin-right: 20px;
    margin-bottom: 10px;
}
.articles-index .articles-list .articleBody a{
    font-size: 15px;
    color:#262626;
    text-decoration: none;
}
.articles-index .articles-list .articleBody a:hover{
    color:#666;
}
.articles-index .indexSider{
    width: 300px;
    height:500px;
    float:left;
    margin-left:20px;
}
.articles-index .indexSider .articleTopics{
    margin-top:50px;
}
.articles-index .indexSider .articleTopics>h4{
    color:#000;
}
.articles-index .indexSider .articleTopics>a{
    color:#666;
    font-size: 16px;
}
.articles-index .indexSider .articleTopics>a:hover{
    color:#fff;
}
</style>
@endsection
@section('content')
    <div class="articles-index">
        <div class="jumbotron">
            <h1>Share The World!</h1>
            <p>分享技术，分享快乐</p>
        </div>
        <div class="container">
            <div class="articles-list">
                @foreach($articles as $article)
                    <div class="articleCom">
                        <div class=articleUser>
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" width="36" src="{{ $article->user->avatar }}" alt="{{ $article->user->name }}">
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading">
                                        <a href="/articles/{{ $article->id }}">
                                            {{ $article->user->name }}
                                        </a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class=articleTitle>
                            <h2><a href="/articles/{{ $article->id }}">{{ mb_substr($article->title,0,50) }}</a></h2>
                            <div class="articleTopics">
                            @foreach($article->topics as $topic)
                                <a class="topic" href="/topic/{{$topic->id}}">
                                    <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                                    &ensp;{{$topic->name}}
                                </a>
                            @endforeach
                            </div>
                        </div>
                        <div class="articleBody">
                            @if($article->img)
                                <div class="articleImg" style="background-image: url({{ $article->img }});">
                                </div>
                            @endif
                            <a href="/articles/{{ $article->id }}">{{ $article->body }}</a>
                        </div>
                    </div>
                @endforeach
                <div class="page">
                    {{ $articles->links() }}
                </div>
            </div>
            <div class="indexSider">
                <div class="btn-nav">
                    <div class="btn-group">
                        <a class="btn" href="{{ url('articles/create') }}" role="button">
                            <i class="fa fa-file-word-o"></i></span>&ensp;
                            写文章
                        </a>
                        <button type="button" class="btn dropdown-toggle btn-mydef" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="caret"></span>&ensp;文章排序 
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">综合</a></li>
                            <li><a href="#">时间</a></li>
                            <li><a href="#">热度</a></li>
                        </ul>
                    </div>
                </div>
                <div class="articleTopics">
                <h4>热门话题</h4>
                @foreach($topics as $topic)
                    <a class="topic" href="/topic/{{$topic->id}}">
                        <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                        &ensp;{{$topic->name}}
                    </a>
                @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
