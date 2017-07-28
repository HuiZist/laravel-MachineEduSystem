<?php

namespace App\Http\Controllers;

use App\Repositories\AnswerRepository;
use App\Repositories\CommentRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentsController extends Controller
{
    /**
     * @var AnswerRepository
     */
    protected $answer;

    /**
     * @var CommentRepository
     */
    protected $comment;

    /**
     * CommentsController constructor.
     * @param $answer
     * @param $question
     * @param $comment
     */
    public function __construct(AnswerRepository $answer, CommentRepository $comment)
    {
        $this->answer = $answer;
        $this->comment = $comment;
    }

    //答案的评论
    public function answer($id)
    {
        return $this->answer->getAnswerCommentsById($id);
    }

    //用户评论
    public function store()
    {
        $this->answer->addCommentsCount(request('model'));

        Auth::user()->increment('comments_count');
        $newComment = $this->comment->create([
            'user_id'=>Auth::user()->id,
            'body'=>request('body'),
            'answer_id'=>request('model'),
        ]);
        return $newComment->load('user');

    }

}
