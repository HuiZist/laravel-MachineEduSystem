<?php

namespace App\Http\Controllers;

use App\Repositories\MessageRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MessagesController extends Controller
{
    protected $message;

    public function __construct(MessageRepository $message)
    {
        $this->message = $message;
    }

    //保存私信内容
    public function store()
    {
        $toUserId = request('user');
        $fromUserId = Auth::user()->id;
        $message = $this->message->create([
            'to_user_id'=>request('user'),
            'from_user_id'=> Auth::user()->id,
            'body'=>request('body')
        ]);

        //成功创建数据
        if($message){
            return response()->json(['status'=>true]);
        }
        return response()->json(['status'=>false]);
    }
}
