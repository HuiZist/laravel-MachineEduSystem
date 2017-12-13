@extends('layouts.app')
@section('css')
    <style>
    </style>
@endsection
@section('content')
    <div class="articles-create">
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&ensp;写&ensp;文&ensp;章</div>
                <div class="panel-body">
                    <form action="/articles" method="post">
                        {!! csrf_field() !!}
                        <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                            <label for="title">标题</label>
                            <input type="text" value="{{ old('title') }}" name="title" class="form-control" placeholder="标题不能少于三个字" id="title">
                            @if ($errors->has('title'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('title') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <label for="topics[]">话题</label>
                            <select name="topics[]" class="js-data-example-ajax form-control" multiple="multiple">
                            </select>
                        </div>
                        <div class="form-group"{{ $errors->has('body') ? ' has-error' : '' }}>
                            <label for="body">内容</label>
                            <div id="container" name="body" type="text/plain" style="height:400px;">
                                {!! old('body') !!}
                            </div>
                            @if ($errors->has('body'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('body') }}</strong>
                                </span>
                            @endif
                        </div>
                        <button class="btn btn-block" type="submit">发布文章</button>
                    </form>
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
            placeholder: '选择已有话题或者发起新的话题',
            minimumInputLength: 1,
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
