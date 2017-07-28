<?php

namespace App\Http\Controllers;

use App\Message;
use App\Repositories\MessageRepository;
use Illuminate\Http\Request;

class InboxController extends Controller
{
    protected $message;

    public function __construct(MessageRepository $message)
    {
        $this->middleware('auth');
        $this->message = $message;
    }

    //私信列表
    public function index()
    {
        $messages = Message::where('to_user_id',user()->id)
            ->orWhere('from_user_id',user()->id)
            ->with(['fromUser','toUser'])->latest()->get();
        return view('inbox.index',['messages'=>$messages->groupBy('to_user_id')]);
    }
}
