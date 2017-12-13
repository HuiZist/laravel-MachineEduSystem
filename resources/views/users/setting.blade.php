@extends('layouts.app')
@section('css')
    <style>
        .setting{
            margin-top:50px;
        }
        .list-group{
            width:350px;
            float:left;
        }
        .list-group .title{
            background:#101010;
            color:#fff;
        }
        .list-group-item{
            padding:20px;
            border-left:none;
            border-right:none;
        }
        .SetContent{
            width: 700px;
            float:left;
            background:#fff;
            border-radius: 15px;
            margin-left:50px;
        }
    </style>
@endsection
@section('content')
<div class="setting">
    <div class="container">
        <div class="list-group">
            <p class="list-group-item title">
                设置
            </p>
            <a href="#" class="list-group-item" style="background: #d3e0e9;">个人信息</a>
            <a href="#" class="list-group-item">账号密码</a>
            <a href="#" class="list-group-item">消息通知</a>
        </div>
        <form class="form-inline" action="/setchange" method="post">
            {!! csrf_field() !!}
            <ul class="list-group SetContent">
                <li class="list-group-item title">个人信息</li>
                <input type="hidden" id="userId" name="userId" value="{{ $user->id }}">
                <li class="list-group-item"><label>账号邮箱:&emsp;</label>{{ $user->email }}</li>
                <li class="list-group-item"><label for="name">账号名称:&emsp;</label>
                    <input type="text" id="name" name="name" class="form-control"
                           value="{{ $user->name }}">
                </li>
                <li class="list-group-item"><label>头像修改:</label><user-avatar avatar="{{Auth::user()->avatar}}"></user-avatar></li>
                <li class="list-group-item"><label for="blog">博&emsp;客:&emsp;</label>
                    <input type="text" id="blog" name="blog" class="form-control"
                           placeholder="个人博客地址"
                           value="{{ $userinfo->blog==null?'':$userinfo->blog }}">
                </li>
                <li class="list-group-item"><label for="github">GitHub:&emsp;</label>
                    <input type="text" id="github" name="github" class="form-control"
                           placeholder="GitHub地址"
                           value="{{ $userinfo->github==null?'':$userinfo->github }}">
                </li>
                <li class="list-group-item"><label for="live">居住地:&emsp;</label>
                    <input type="text" id="live" name="live" class="form-control"
                           placeholder="现居地"
                           value="{{ $userinfo->live==null?'':$userinfo->live }}">
                </li>
                <li class="list-group-item"><label for="phone">手机号:&emsp;</label>
                    <input type="text" id="phone" name="phone" class="form-control" placeholder="请填写现用手机号码"
                           value="{{ $userinfo->phone==null?'':$userinfo->phone }}">
                </li>
                <li class="list-group-item"><label for="webchat">网络联系方式:&emsp;</label>
                    <input type="text" id="webchat" name="webchat" class="form-control"
                           placeholder="请填写网络上的通信方式如:QQ、微信、邮箱"
                           value="{{ $userinfo->webchat==null?'':$userinfo->webchat }}">
                </li>
                <input type="submit" class="btn btn-default pull-right" value="提交修改">
            </ul>
        </form>
    </div>
</div>
@endsection