@extends('layouts.app')
@section('css')
<style type="text/css">
</style>
@endsection
@section('content')
    <div class="container articles-create">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">编辑文章</div>
                    <div class="panel-body">
                        <form action="/articles/{{  $article->id }}" method="post">
                            {{ method_field('PATCH') }}
                            {!! csrf_field() !!}
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <label for="title">标题</label>
                                <input type="text" value="{{ $article->title }}" name="title" class="form-control" placeholder="标题" id="title">
                                @if ($errors->has('title'))
                                    <span class="help-block">
                                    <strong>{{ $errors->first('title') }}</strong>
                                </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <select name="topics[]" class="js-data-example-ajax form-control" multiple="multiple">
                                    @foreach($article->topics as $topic)
                                        <option value="{{ $topic->id }}" selected="selected">{{ $topic->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group"{{ $errors->has('body') ? ' has-error' : '' }}>
                                <label for="body">文章内容</label>
                                <script id="container" name="body" type="text/plain" style="height:260px;">
                                    {!! $article->body !!}
                                </script>
                                @if ($errors->has('body'))
                                <span class="help-block"> <strong>{{ $errors->first('body') }}</strong></span>
                                @endif
                            </div>
                            <button class="btn btn-success pull-right" type="submit">发布文章</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
<!-- 实例化编辑器 -->
<script type="text/javascript">
var ue = UE.getEditor('container',{
    toolbars: [[
        'fullscreen', 'source', '|', 'undo', 'redo', '|',
        'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
        'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
        'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
        'directionalityltr', 'directionalityrtl', 'indent', '|',
        'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
        'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
        'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
        'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
        'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
        'print', 'preview', 'searchreplace', 'drafts', 'help'
    ]]});
ue.ready(function() {
    ue.execCommand('serverparam', '_token', '{{ csrf_token() }}');
});
$(function () {
    function formatTopic (topic) {
        return "<div class='select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__meta'>" +
        "<div class='select2-result-repository__title'>" +
        topic.name ? topic.name : "Laravel"   +
            "</div></div></div>";
    }

    function formatTopicSelection (topic) {
        return topic.name || topic.text;
    }

    $(".js-data-example-ajax").select2({
        tags: true,
        placeholder: '选择相关话题',
        minimumInputLength: 2,
        ajax: {
            url: '/api/topics',
            dataType: 'json',
            delay: 350,
            data: function (params) {
                return {
                    q: params.term
                };
            },
            processResults: function (data, params) {
                return {
                    results: data
                };
            },
            cache: true
        },
        templateResult: formatTopic,
        templateSelection: formatTopicSelection,
        escapeMarkup: function (markup) { return markup; }
    });
})
</script>
@endsection