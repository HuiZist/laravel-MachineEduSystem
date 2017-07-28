@extends('layouts.app')
@section('content')
    <div class="examine-show">
        <div class="jumbotron">
            <h1>Your Performance!</h1>
            <p>学习成果</p>
        </div>
        <div class="container">
            <div class="panel panel-primary">
                <!-- Default panel contents -->
                <div class="panel-heading">考核记录</div>
                <div class="panel-body">
                    <br />
                    <ul style="font-weight: bold;">
                        <li>最近操作时间：&emsp;17.7.20/20:04</li><br />
                        <li>操作总时长：&emsp;22min.58s</li><br />
                        <li>总得分：&emsp;267</li><br />
                    </ul>
                </div>
                <!-- Table -->
                <table class="table">
                    <tr style="font-weight: bold;">
                        <td>时间</td>
                        <td>时长</td>
                        <td>考核类型</td>
                        <td>得分</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>17.7.20/20:04</td>
                        <td>10min.3s</td>
                        <td>三菱机床对刀</td>
                        <td>95</td>
                        <td style="color:blue;">查看详情>></td>
                    </tr>
                    <tr>
                        <td>17.7.20/18:24</td>
                        <td>7min.42s</td>
                        <td>三菱机床刀补调整</td>
                        <td>92</td>
                        <td style="color:blue;">查看详情>></td>
                    </tr>
                    <tr>
                        <td>17.7.19/18:14</td>
                        <td>5min.13s</td>
                        <td>三菱机床MDI练习</td>
                        <td>80</td>
                        <td style="color:blue;">查看详情>></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
@endsection