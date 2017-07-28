<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $fillable = ['title','body','user_id'];

    public function topics()
    {
        return $this->belongsToMany(Topic::class)->withTimestamps();
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    //过滤隐藏的articles
    public function scopePublished($query)
    {
        return $query->where('is_hidden','F');
    }

    //帖子---答案
    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

}
