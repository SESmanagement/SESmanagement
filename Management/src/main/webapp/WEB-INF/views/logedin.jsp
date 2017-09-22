<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 된 상태</title>
</head>
<script>
	function goJoin(){
		location.href="/manage/member/join";
	}
</script>


<body>

<form action="/manage/member/logout" method="post">
${sessionScope.vo.name } 님이 로그인 중입니다. <input type="button" value="회원정보수정" class="btn v-btn v-btn-default v-small-button v-alizarin" onclick="javascript:goJoin();">
<input type="submit" class="btn v-btn v-btn-default v-small-button v-alizarin" value="로그아웃">
</form>

</body>
</html>