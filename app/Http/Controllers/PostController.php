<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePostRequest;
use App\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function store(StorePostRequest $request){
        $data=[
            'title'=>$request->get('title'),
            'content'=>$request->get('content'),
            'user_id'=>Auth::id(),
        ];
        Post::create($data);
        return redirect()->route('welcome');
    }

    public function index(){
        $posts = Post::latest('updated_at')->with('user')->take(5)->get();
        return view('welcome',compact('posts'));
    }
}
