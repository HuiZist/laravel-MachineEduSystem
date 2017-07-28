<?php

namespace App\Http\Controllers;

use App\Work;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WorkController extends Controller
{
    //
    public function store(Request $request,$lessonId){
        $data=[
            'content'=>$request->get('body'),
            'user_id'=>Auth::id(),
            'lesson_id'=>$lessonId,
        ];
        Work::create($data);
        return redirect()->route('lesson.show',compact('lessonId'));
    }
}
