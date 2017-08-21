<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
</head>
<body>

<form action="member/login" method="post">
	<table>
		<tr>
			<td>학번</td>
			<td><input type="text" id="student_num" name="student_num"></td>	
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="pwd" name="pwd" placeholder="최초 비밀번호는 생년월일"></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>

</body>
</html>