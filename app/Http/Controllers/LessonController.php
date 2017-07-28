<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreLessonRequest;
use App\Http\Requests\StoreLessonSortRequest;
use App\Lesson;
use App\LessonsSort;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

class LessonController extends Controller
{
    //
    public function sortIndex(){
        $lesson_sorts = LessonsSort::latest('updated_at')->with('user')->get();
        return view('lessons.sort',compact('lesson_sorts'));
    }

    public function sortStore(StoreLessonSortRequest $request){
        $data = [
            'name' => $request->get('name'),
            'thumbnail' => $this->thumbnail($request),
            'abstract' => $request->get('abstract'),
            'user_id' => Auth::id(),
        ];
        LessonsSort::create($data);
        return redirect()->route('lessonsort');
    }

    public function thumbnail($request){
        if ($request->hasFile('thumbnail')){
            $file = $request->thumbnail;
            $filename = str_random(10).'.'.$file->getClientOriginalExtension();
            $filepath = public_path().'/uploads/lessons/lessons_sort/'.$filename;
            Image::make($file)->resize(219,162)->save($filepath);
            return $filename;
        }

    }

    public function index($lessonsortId){
        $lessonsortInfo = LessonsSort::where('id',$lessonsortId)->with('user','lesson')->first();
        return view('lessons.index',compact('lessonsortInfo'));
    }

    public function create($lessonsortId){
        return view('lessons.create',compact('lessonsortId'));
    }

    public function store(StoreLessonRequest $request,$lessonsortId){
        $data = [
            'title' => $request->get('title'),
            'body' => $request->get('body'),
            'user_id' => Auth::id(),
            'lessons_sort_id' => $lessonsortId,
        ];
        Lesson::create($data);
        return redirect()->route('lessonsort');
    }

    public function show($lessonId)
    {
        $lesson = Lesson::where('id',$lessonId)->with('user','lessons_sort')->first();
        return view('lessons.show',compact('lesson'));
    }
}
