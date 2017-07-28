<?php
/**
 * Created by PhpStorm.
 * User: 1430
 * Date: 2017/6/2
 * Time: 15:53
 */

namespace App\Repositories;


use App\Answer;

class AnswerRepository
{
    public function create(array $attributes)
    {
        return Answer::create($attributes);
    }

    public function byId($id)
    {
        return Answer::find($id);
    }

    //获取答案的所有评论
    public function getAnswerCommentsById($id)
    {
        //通过AnswerId获取回复
        $comments = Answer::find($id)->comments;
        //延迟预加载
        return $comments->load('user');
    }

    //增加答案的评论数
    public function addCommentsCount($id)
    {
        $answer = Answer::find($id);
        $answer->increment('comments_count');
    }

}