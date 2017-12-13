@extends('layouts.app')
@section('css')
    <style>
    </style>
@endsection
@section('content')
    <div class="lesson-show">
        <div class="jumbotron">
            <h1>{{ $lesson->title }}</h1>
            <p>
                <span class="glyphicon glyphicon-book" aria-hidden="true"></span>&ensp;{{ $lesson->lessons_sort->name }}&emsp;
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&ensp;{{ $lesson->user->name }}&emsp;
                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>&ensp;{{ $lesson->updated_at }}
            </p>
        </div>
        <div class="container">
            <div class="lesson-body">
                {!! $lesson->body !!}
            </div>
            <div class="work">
                <button class="btn btn-my" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>&ensp;
                    写作业
                </button>
                <div class="collapse" id="collapseExample">
                    <div class="work-form">
                        <form action="/{{ $lesson->id }}/work/store" method="post" enctype="multipart/form-data">
                            {!! csrf_field() !!}
                            <div id="container" name="body" type="text/plain" style="height:300px;">
                                {!! old('body') !!}
                            </div>
                            <div class="form-foot">
                                <button class="btn btn-my" type="submit">提交作业</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    <script>
        var ue = UE.getEditor('container',{
            toolbars: [[
                'fullscreen','undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', '|', 'forecolor',  'insertorderedlist', 'insertunorderedlist', '|',
                'fontfamily', 'fontsize', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|',
                'insertimage', 'attachment',
                'horizontal', '|',
                'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                'print', 'preview', 'searchreplace', 'help'
            ]]});
        ue.ready(function() {
            ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
        });
    </script>
@endsection