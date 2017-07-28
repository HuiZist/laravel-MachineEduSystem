<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    protected $fillable = [
        'title', 'body','user_id','lessons_sort_id'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function lessons_sort(){
        return $this->belongsTo(LessonsSort::class);
    }
}
