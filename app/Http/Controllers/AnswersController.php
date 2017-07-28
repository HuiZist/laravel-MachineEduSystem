<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreAnswerRequest;
use App\Repositories\AnswerRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AnswersController extends Controller
{
    protected $answer;
    public function __construct(AnswerRepository $answer)
    {
        $this->answer = $answer;
    }
    //创建答案
    public function store(StoreAnswerRequest $request,$articleId)
    {
        $answer = $this->answer->create([
            'article_id'=>$articleId,
            'user_id' => Auth::id(),
            'body'=>$request->get('body')
        ]);
        $answer->article()->increment('answers_count');
        Auth::user()->increment('answers_count');

        return back();
    }
}
