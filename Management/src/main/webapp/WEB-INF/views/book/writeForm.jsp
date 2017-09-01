<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>

</head>
<body>
<h1>[ 도서등록 ]</h1>
<form action="/manage/book/write" method="post">
	<table>
			<tr>
			<th>작성자</th>
			<td>${sessionScope.vo.name}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" required="required"></td>
		</tr>

		<tr>
			<th>내용</th>
			<td><textarea name="content" required="required"></textarea></td>
		</tr>
		
		<tr>
			<td class="right" colspan="2">
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
	<input type="hidden" name="name" value="${sessionScope.vo.name}">
</form>
</body>
</html>
