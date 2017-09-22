<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<style>
.no-border {
	border: 0px;
	background: #ffeeee;
}

body {
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="form-group">
		<div class="col-lg-6 col-md-7 col-sm-12 col-xs-12 pull-right general-font-area">
			<form action="/manage/member/login" method="post">
				<div class="col-md-3 form-group input-sm">
					<input type="text" id="student_num" name="student_num"
						class="form-control" placeholder="학번">
				</div>
				<div class="col-md-3 form-group input-sm">
					<input type="password" id="pwd" name="pwd" class="form-control"
						placeholder="최초 비밀번호는 생년월일">
				</div>
				<div class="col-md-3 form-group input-sm">
					<button type="submit"
						class="form-control btn v-btn v-btn-default v-small-button v-alizarin">로그인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>