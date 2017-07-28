@extends('layouts.app')
@section('css')
    <style>
        .article-content{
            width:800px;
            float:left;
        }
        .article-title{
            font-size:20px;
            font-weight: bold;
        }
        .article-topic{
            padding-top: 10px;
        }
        .article-author{
            float:left;
            width:250px;
            margin:0 10px;
        }
        .article-author .panel .media{
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }
        .article-comment{
            width: 800px;
            clear: both;
        }
        .article-comment .panel-body .media{
            padding-bottom: 10px;
            border-bottom:1px solid #d9e0e2;
        }
        .article-comment .comment-body{
            padding:5px 10px;
        }
        .article-comment .panel-body .media .btn{
            padding:2px 5px;
        }
        .article-comment .panel-body .media .button{
            margin-left: 20px;
        }
    </style>
@endsection
@section('content')
    <div class="article-show">
        <div class=" container">
            <div class="article-content">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="article-title">
                            {!! $article->title !!}
                        </div>
                        <div class="article-topic">
                            @foreach($article->topics as $topic)
                                <a class="topic" href="/topic/{{$topic->id}}"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span>&ensp;{{$topic->name}}</a>
                            @endforeach
                        </div>
                    </div>
                    <div class="panel-body content">
                        {!! $article->body !!}
                    </div>
                    <div class="actions">
                        @if(Auth::check() && Auth::user()->owns($article))
                            <span class="edit"><a href="/articles/{{ $article->id }}/edit">编辑</a></span>
                            <form action="/articles/{{ $article->id }}" method="POST" class="delete-form">
                                {{ method_field('DELETE') }}
                                {{ csrf_field() }}
                                <button class="button is-naked delete-button">删除</button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
            <div class="article-author">
                <div class="panel panel-default">
                    <div class="panel-heading about-author">
                        <h5><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&ensp;关于作者</h5>
                    </div>
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img width="36" src="{{ $article->user->avatar }}" alt="{{$article->user->name}}">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="/people/{{$article->user->id}}">
                                        {{$article->user->name}}
                                    </a>
                                </h4>
                            </div>
                        </div>
                        <div class="user-statics">
                            <div class="statics-item text-center">
                                <div class="statics-text">文章</div>
                                <div class="statics-count">
                                    {{$article->user->articles_count}}
                                </div>
                            </div>
                            <div class="statics-item text-center">
                                <div class="statics-text">评论</div>
                                <div class="statics-count">
                                    {{$article->user->answers_count}}
                                </div>
                            </div>
                            <div class="statics-item text-center">
                                <div class="statics-text">关注者</div>
                                <div class="statics-count">
                                    {{$article->user->followers_count}}
                                </div>
                            </div>
                        </div>
                        @if(Auth::check())
                            @if(Auth::id()!==$article->user->id)
                                <div class="question-action-btns">
                                    <send-message user="{{$article->user->id}}"></send-message>
                                </div>
                            @endif
                        @endif
                    </div>
                </div>
            </div>
            <div class="article-comment">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        {{ $article->answers_count }}个评论
                    </div>
                    <div class="panel-body">
                        @foreach($article->answers as $answer)
                            <div class="media">
                                <div class="media-left">
                                    <a href="">
                                        <img width="36" src="{{ $answer->user->avatar }}" alt="{{ $answer->user->name }}">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="/user/{{ $answer->user->id }}">
                                            {{ $answer->user->name }}
                                        </a>
                                    </h4>
                                </div>
                                <div class="comment-body">
                                    {!! $answer->body  !!}
                                </div>
                                <div>
                                    <user-vote-button
                                            answer="{{$answer->id}}"
                                            count="{{$answer->votes_count}}"
                                    ></user-vote-button>
                                    <comments model="{{$answer->id}}"
                                              count="{{$answer->comments()->count()}}">
                                    </comments>
                                </div>
                            </div>
                        @endforeach
                        @if(Auth::check())
                        <form action="/articles/{{ $article->id }}/answer" method="post">
                            {!! csrf_field() !!}
                            <div class="form-group"{{ $errors->has('body') ? ' has-error' : '' }}>
                                <div id="container" name="body" type="text/plain" style="height:100px;">
                                    {!! old('body') !!}
                                </div>
                                @if ($errors->has('body'))
                                    <span class="help-block">
                                    <strong>{{ $errors->first('body') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <button class="btn btn-success pull-right" type="submit">提交评论</button>
                        </form>
                        @else
                            <a href="/login" class="btn btn-success btn-block">登录提交评论</a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container', {
        toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'preview', 'searchreplace', 'help'
        ]],
        elementPathEnabled: false,
        enableContextMenu: false,
        autoClearEmptyNode: true,
        wordCount: false,
        imagePopup: false,
        autotypeset: {indent: true, imageBlockLine: 'center'},
        zIndex : 900,
    });
   ue.ready(function() {
      ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
   });
</script>
@endsection