<?php

namespace App\Http\Controllers;

use App\User;
use App\UserInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UsersController extends Controller
{
    //用户头像
    public function setting()
    {
        $user = Auth::user();

        //如果当前用户信息不存在，则创建一个关联的用户信息项
        if (!UserInfo::where('user_id',Auth::id())->first())
        {
            $data = [
                'user_id'=>Auth::id(),
            ];
            UserInfo::create($data);
        }
        $userinfo = Auth::user()->userinfo;
        return view('users.setting',compact('user','userinfo'));
    }

    //修改用户头像
    public function changeAvatar(Request $request)
    {
        $oldavatar = Auth::user()->avatar;
        if($oldavatar != '/images/avatars/default.png'){
            unlink(public_path($oldavatar));
        }
        $file = $request->file('img');
        $filename = md5(time().Auth::user()->id).'.'.$file->getClientOriginalExtension();
        $file->move(public_path('images/avatars'),$filename);

        Auth::user()->avatar = '/images/avatars/'.$filename;
        Auth::user()->save();

        return ['url'=>Auth::user()->avatar];
    }

    //修改用户信息
    public function setchange(Request $request)
    {
        $user = User::where('id',$request->get('userId'))->first();
        $this->authorize('update', $user);
        $data = [
            'user_id'=>Auth::id(),
            'blog'=>$request->get('blog'),
            'github'=>$request->get('github'),
            'live'=>$request->get('live'),
            'phone'=>$request->get('phone'),
            'webchat'=>$request->get('webchat'),
        ];
        if (UserInfo::where('user_id',Auth::id())){
            UserInfo::where('user_id',Auth::id())->update($data);
        }else{
            UserInfo::create($data);
        }

        Auth::user()->update(['name'=>$request->get('name'),]);
        return $this->setting();
    }

    public function memberShow()
    {
        $this->authorize('memberShow');
        $users = User::orderBy('updated_at','desc')->paginate(20);
        return view('manage.memberShow',compact('users'));
        
    }
    public function memberAuthorize($memberId,$admValue)
    {
        $this->authorize('memberShow');
        User::where('id',$memberId)->update(['is_admin'=>$admValue,]);
        return redirect()->route('manage.memberShow');
    }
}