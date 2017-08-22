<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 된 상태</title>
</head>
<body>

${sessionScope.vo.name } 님이 로그인 중입니다.
<form action="member/logout" method="post">
<input type="submit" value="로그아웃">
</form>

</body>
</html>