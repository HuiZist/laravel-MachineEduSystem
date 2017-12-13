<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'ArticlesController@index')->name('welcome');

//文章
Route::resource('articles','ArticlesController',['names'=>[
	'create'=>'articles.create',
    'show'=>'articles.show'
]]);

Auth::routes();

Route::get('/home', 'HomeController@articles')->name('home');
Route::get('/home/answers', 'HomeController@answers')->name('home.answers');
Route::get('/home/comments', 'HomeController@comments')->name('home.comments');


//邮件的验证
Route::get('/email/verify/{token}',['as'=>'email.verify','uses'=>'EmailController@verify']);

Route::post('articles/{articleId}/answer','AnswersController@store');//创建问题的答案

Route::get('messages','NotificationsController@index');//用户的站内信通知

Route::get('inbox','InboxController@index');
Route::get('inbox/{dialogId}','InboxController@show');//私信消息详情

Route::get("/setting",'UsersController@setting')->name('setting');//用户头像
Route::post("/avatar",'UsersController@changeAvatar');//修改用户头像
Route::post("/setchange",'UsersController@setchange')->name('setchange');//用户信息修改

Route::get('/lessonsort','LessonController@sortIndex')->name('lessonsort');
Route::get('/lessonsort/{lessonsortId}/lessonindex','LessonController@index')->name('lesson.index');
Route::get('/lessons/{lessonId}/show','LessonController@show')->name('lesson.show');

Route::get("/examine",'ExamineController@show')->name('examine');//用户考核

Route::group(['middleware'=>'auth'],function(){
    Route::post('/lessonsort/create','LessonController@sortStore')->name('lessonsort.create');
    Route::get('/{lessonsortId}/lesson/create','LessonController@create')->name('lesson.create');
    Route::post('/{lessonsortId}/lesson/store','LessonController@store');
    Route::post('/{lessonId}/work/store','WorkController@store')->name('work.store');
});

Route::get('/topic/{topicId}','TopicsController@show')->name('topics.Show');