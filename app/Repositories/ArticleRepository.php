<?php
/**
 * Created by PhpStorm.
 * User: 1430
 * Date: 2017/6/1
 * Time: 15:34
 */

namespace App\Repositories;


use App\Article;
use App\Topic;

class ArticleRepository
{
    //根据id查找article包含topics
    public function byIdWithTopicsAndAnswers($id)
    {
        return Article::where('id',$id)->with('topics','answers')->first();
    }

    //新增article
    public function create($attribute)
    {
        return Article::create($attribute);
    }

    //根据id查找article包含topics
    public function byId($id)
    {
        return Article::find($id);
    }

    //获取articles列表
    public function getArticleFeed()
    {
        //scopePublished,按updated_at降序排列,带user表数据
        return Article::published()->orderBy('is_first','desc')->latest('updated_at')->with('user')->paginate(5);
    }

    //当Topic存在时获取topic_id，当Topic不存在时创建该Topic并获取topic_id
    public function normalizeTopics(array $topics)
    {
        return collect($topics)->map(function ($topic){
            if(is_numeric($topic)){
                Topic::find($topic)->increment('articles_count');
                return (int)$topic;
            }
            $newTopic = Topic::create(['name'=>$topic,'articles_count'=>1]);
            return $newTopic->id;
        })->toArray();
    }

}