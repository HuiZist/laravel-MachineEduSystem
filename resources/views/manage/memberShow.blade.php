@extends('layouts.app')
@section('css')
<style>
.userManage .manageBody{
	margin-top: 20px;
}
.userManage .manageSider{
	float: left;
}
.userManage .manageSider>a{
	background: #101010;
	color: #fff;
}
.userManage .manageSider>a:hover{
	background: #fff;
	color: #000;
}
.userManage .manageMember{
	float: left;
	width: 1000px;
}
.userManage .manageMember .panel-heading{
	background: #101010;
	color: #fff;
	text-align: center;
}
.userManage .manageMember .table{

}
</style>
@endsection
@section('content')
<div class="userManage">
	<div class="container manageBody">
		<div class="btn-group-vertical manageSider">
			<a class="btn btn-default" href="#">成员管理</a>
			<a class="btn btn-default" href="#">网站信息</a>
			<a class="btn btn-default" href="#">全局消息</a>
			<a class="btn btn-default" href="#">...</a>
		</div>
		<div class="panel panel-default manageMember">
	  	<!-- Default panel contents -->
	  		<div class="panel-heading">成员管理</div>
	  		<!-- Table -->
  			<table class="table">
	  			<thead>
	  				<th>#id</th><th>用户名</th><th>邮箱</th><th>激活</th><th>权限</th><th>创建时间</th><th>更改时间</th>
	  			</thead>
  				<tbody>
  				@foreach($users as $user)
					<tr>
						<td>{{ $user->id }}</td>
						<td>{{ $user->name }}</td>
						<td>{{ $user->email }}</td>
						<td>{{ $user->is_active }}</td>
						@if($user->is_admin===2)
							<td>SupManager</td>
						@elseif($user->is_admin===1)
							<td>Manager</td>
						@else
							<td>Member</td>
						@endif
						<td>{{ $user->created_at }}</td>
						<td>{{ $user->updated_at }}</td>
					</tr>
				@endforeach
				</tbody>
			</table>
		</div>
		<div class="page">
            {{ $users->links() }}
        </div>
	</div>
</div>
@endsection