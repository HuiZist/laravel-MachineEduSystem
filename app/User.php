<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Mail;
use Naux\Mail\SendCloudTemplate;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'avatar','is_active', 'confirmation_token','followers_count','followings_count','comments_count','articles_count','answers_count','likes_count','api_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token'
    ];

    //是否属于本对象
    public function owns(Model $model)
    {
        return $this->id == $model->user_id;
    }

    public function sendPasswordResetNotification($token)
    {
        $data = [
            'url' => route('password.reset', $token)
        ];
        $template = new SendCloudTemplate('zhihu_app_passwordreset', $data);

        Mail::raw($template, function ($message){
            $message->from('863403035@qq.com', 'HuiZ');

            $message->to($this->email);
        });
    }

    //关联文章
    public function articles()
    {
        return $this->hasMany(Article::class);
    }

    //关联评论
    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

    //关联回复
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    //用户点赞答案多对多关系
    public function votes()
    {
        return $this->belongsToMany(Answer::class,'votes')->withTimestamps();
    }

    //用户点赞一个答案
    public function voteFor($answer)
    {
        return $this->votes()->toggle($answer);
    }

    //用户是否已经对一个答案进行点赞
    public function hasVotedFor($answer)
    {
        return !!$this->votes()->where('answer_id',$answer)->count();
    }

    //用户的私信
    public function messages()
    {
        return $this->hasMany(Message::class,'to_user_id');
    }

    public function userinfo()
    {
        return $this->hasOne(UserInfo::class);
    }
}
