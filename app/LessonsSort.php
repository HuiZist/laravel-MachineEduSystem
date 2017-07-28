<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LessonsSort extends Model
{
    protected $fillable = [
        'name', 'thumbnail','abstract','type','user_id','lessons_count'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function lesson(){
        return $this->hasMany(Lesson::class);
    }
}
