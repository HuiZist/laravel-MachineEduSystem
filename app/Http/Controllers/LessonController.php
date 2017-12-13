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
        $lesson_sorts = LessonsSort::latest('updated_at')->with('user')->paginate(8);
        return view('lessons.sort',compact('lesson_sorts'));
    }

    public function sortStore(StoreLessonSortRequest $request){
        $this->authorize('create',LessonsSort::class);
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
        $lessons = Lesson::where('lessons_sort_id',$lessonsortId)->paginate(10);
        $lessonsortInfo = LessonsSort::where('id',$lessonsortId)->with('user')->first();
        return view('lessons.index',compact('lessons','lessonsortInfo'));
    }

    public function create($lessonsortId){
        return view('lessons.create',compact('lessonsortId'));
    }

    public function store(StoreLessonRequest $request,$lessonsortId){
        $this->authorize('create',Lesson::class);
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
