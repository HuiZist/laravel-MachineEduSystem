<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="/font-awesome-4.7.0/css/font-awesome.min.css">
    @yield('css')
    <style>
        body{
          padding-top: 50px;
          overflow-y: scroll;
        }

        #content .jumbotron{
          text-align: center;
          padding:22px;
          margin-bottom:10px;
        }

        .btn-group .btn{
          background: #eee;
          color:#636b6f;
        }

        .btn-group .btn:hover{
          background: #636b6f;
          color:#fff;
        }

        .page{
          text-align: center;
          clear: both;
        }
        .page .pagination{
          border: none;
          font-size: 20px;
        }
        .page .pagination li span{
          background:#ccc;
          color:#fff;
          border: none;
        }
        .page .pagination li span:hover{
          background:#ccc;
          color:#fff;
        }
        .page .pagination li a{
          color: #fff;
          border: none;
          background:#ccc;
        }
        .page .pagination li a:hover{
          background: #333;
          color: #fff;
        }
        .page .pagination .active span{
          background: #333;
        }
        .page .pagination .active span:hover{
          background: #333;
        }
        #content{
            min-height:784px;
        }
        .footer{
            margin-top:20px;
        }
        .footer-content{
            height: 120px;
            margin-bottom: 0px;
            padding-top: 20px;
            background: #333;
            text-align: center;
            color:#fff;
            line-height: 30px;
        }
        .footer-link a{
            color:#fff;
            text-decoration: none;
        }
        .weixin-link{
            position:relative;
            display: inline-block;
        }
        .weixin-code{
            display: none;
            position: absolute;
            top:-150px;
            left: -65px;
        }
        .weixin-code img{
            width:150px;
            height:150px;
        }
        .qq-link{
            position:relative;
            display: inline-block;
            margin-left: 20px;
        }
        .qq-code{
            display: none;
            position: absolute;
            top:-185px;
            left: -57px;
        }
        .qq-code img{
            width:135px;
            height:185px;
        }
        .modal-open {
            overflow: auto !important;
            padding-right: 0px !important;
        }
    </style>
</head>
<body>
    <div id="app">
        @include('layouts.navbar')
        <div id="content">
            @yield('content')
        </div>
        @include('layouts.foot')
    </div>
    <!-- Scripts -->
    <script src="{{ mix('js/app.js') }}"></script>
    @include('UEditor::head')
    @yield('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $("#weixin-link").mouseover(function () {
                $("#weixin-code").show();
            });
            $("#weixin-link").mouseleave(function () {
                $("#weixin-code").hide();
            });

            $("#qq-link").mouseover(function () {
                $("#qq-code").show();
            });
            $("#qq-link").mouseleave(function () {
                $("#qq-code").hide();
            });

        });
    </script>
</body>
</html>
