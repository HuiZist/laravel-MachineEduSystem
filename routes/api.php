<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('api')->get('/topics', function (Request $request) {
    $topics = \App\Topic::select(['id','name'])
        ->where('name','like','%'.$request->query('q').'%')
        ->get();
    return $topics;
});

Route::post('/answer/{id}/votes/users','VotesController@isVoted');//用户是否虽一个答案进行点赞
Route::post('/answer/vote','VotesController@vote');//用户点赞一个答案
Route::post('/message/store','MessagesController@store');//用户发送私信

//回答或者问题的评论
Route::get('/answer/{id}/comments','CommentsController@answer');

Route::post('/comment','CommentsController@store');//用户评论
