<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    protected $fillable = [
        'name', 'articles_count','bio'
    ];

    public function articles()
    {
        return $this->belongsToMany(Article::class)->withTimestamps();
    }
}
