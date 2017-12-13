<?php

namespace App\Http\Controllers;

use App\Article;
use App\Topic;
use App\Http\Requests\StoreArticleRequest;
use App\Repositories\ArticleRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ArticlesController extends Controller
{
    protected $articleRepository;
    public function __construct(ArticleRepository $articleRepository)
    {
        $this->middleware('auth')->except(['index','show']);
        $this->articleRepository = $articleRepository;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $articles = $this->articleRepository->getArticleFeed();
        $pattern="/<[img|IMG].*?src=[\'\"](.*?[\.gif|\.jpg|\.png|\.jpeg])[\'|\"].*?[\/]?>/"; 
        foreach($articles as $article){
            preg_match_all( $pattern, $article->body,$img,PREG_OFFSET_CAPTURE );
            $article->img = $img[0]?$img[1][0][0]:'';
            $article->body = mb_substr(strip_tags($article->body),0,300).'...';
        }
        $topics = Topic::orderBy('articles_count','desc')->latest('articles_count')->take(10)->get();
        return view('articles.index',compact('articles','topics'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('articles.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreArticleRequest $request)
    {
        $topics = $this->articleRepository->normalizeTopics($request->get('topics'));
        $data = [
            'title' => $request->get('title'),
            'body' => $request->get('body'),
            'user_id' => Auth::id(),
        ];
        $article = $this->articleRepository->create($data);
        $article->topics()->attach($topics);
        return redirect()->route('articles.show', [$article->id]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $article = $this->articleRepository->byIdWithTopicsAndAnswers($id);
        return view('articles.show',compact('article'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $article = $this->articleRepository->byId($id);
        if (Auth::user()->owns($article)) {
            return view('articles.edit',compact('article'));
        }
        return back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreArticleRequest $request, $id)
    {
        $article=$this->articleRepository->byId($id);
        //取得一个Topic数组
        $topics = $this->articleRepository->normalizeTopics($request->get('topics'));

        $article->update([
            'title'=>$request->get('title'),
            'body'=>$request->get('body')
        ]);

        //sync同步Topic
        $article->topics()->sync($topics);
        return redirect()->route('articles.show', [$article->id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $article = $this->articleRepository->byId($id);

        if (Auth::user()->owns($article)) {
            $article->delete();
            Auth::user()->decrement('articles_count');
            return redirect('/');
        }
        //不是文章作者返回403
        abort(403, 'Forbidden');
    }

}
