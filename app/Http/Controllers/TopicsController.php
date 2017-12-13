<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Topic;
use App\Article;

class TopicsController extends Controller
{
    //
    public function show($topicId){
    	$articles = Topic::find($topicId)->articles()->latest('updated_at')->paginate(5);
    	$pattern="/<[img|IMG].*?src=[\'\"](.*?[\.gif|\.jpg|\.png|\.jpeg])[\'|\"].*?[\/]?>/"; 
        foreach($articles as $article){
            preg_match_all( $pattern, $article->body,$img,PREG_OFFSET_CAPTURE );
            $article->img = $img[0]?$img[1][0][0]:'';
            $article->body = mb_substr(strip_tags($article->body),0,300).'...';
        }
        $topics = Topic::orderBy('articles_count','desc')->latest('articles_count')->take(10)->get();
        return view('articles.index',compact('articles','topics'));
    }
    
}
