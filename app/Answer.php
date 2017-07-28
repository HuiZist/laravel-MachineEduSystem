<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $fillable = [
        'user_id','article_id','body','is_first'
    ];

    //答案---用户
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    //答案---帖子
    public function article()
    {
        return $this->belongsTo(Article::class);
    }

    //答案---评论
    public function comments()
    {
        return $this->hasMany('App\Comment');
    }

}
