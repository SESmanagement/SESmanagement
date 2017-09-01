<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title}</title>

</head>
<body>
<script>
	function bookUpdate() {
		var result = confirm("수정 하시겠습니까?");
		if(result) {
			document.fm.submit();
		}
	}
</script>

<h1>[ 글 수정 ]</h1>
<form action="update" name="fm" method="post">
	<table>
		<tr>
			<th>번호</th>
			<td>${vo.book_num}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.name}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" value="${vo.title}" required="required"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" required="required">${vo.content}</textarea></td>
		</tr>
		<tr>
			<td class="right" colspan="2">
				<input type="button" value="수정" onclick="bookUpdate()">
				<input type="button" value="취소" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
	<input type="hidden" name="book_num" value="${vo.book_num}">
</form>
</body>
</html>
