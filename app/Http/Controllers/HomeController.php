<?php

namespace App\Http\Controllers;

use App\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    public function articles()
    {
        $articles = Auth::user()->articles()->latest('updated_at')->paginate(10);
        $user = $this->getUser();
        $userinfo = $this->getUserInfo();

        return view('home.articles',compact('user','userinfo','articles'));
    }

    public function answers()
    {
        $answers = Auth::user()->answers()->with('article')->latest('updated_at')->paginate(10);
        $user = $this->getUser();
        $userinfo = $this->getUserInfo();
        foreach($answers as $answer){
            $answer->body = strip_tags($answer->body);
        }

        return view('home.answers',compact('user','userinfo','answers'));
    }

    public function comments()
    {
        $user = $this->getUser();
        $UserId = $user->id;
        $comments = Comment::where('user_id',$UserId)->with('answer')->latest('updated_at')->paginate(10);
        foreach($comments as $comment){
            $comment->body = strip_tags($comment->body);
        }

        $userinfo = $this->getUserInfo();

        return view('home.comments',compact('user','userinfo','comments'));
    }

    public function getUserInfo()
    {
        return $userinfo = Auth::user()->userinfo;
    }

    public function getUser()
    {
        return $user = Auth::user();
    }
}
