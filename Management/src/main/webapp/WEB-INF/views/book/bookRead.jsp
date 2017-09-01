<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bookVO.title}</title>

</head>
<body>
<script>
	if("${result}"=="true") alert("처리 완료");
	else if("${result}"=="false") alert("처리 실패");
	
	// 게시글 삭제
	function bookDelete() {
		var result = confirm("정말로 삭제 하시겠습니까?");
		if(result) {
			location.href = "/manage/book/delete?book_num=${bookVO.book_num}";
		}
	}
	
	// 게시글 수정 폼 이동
	function updateForm() {
		location.href = "/manage/book/bookUpdateForm?book_num=${bookVO.book_num}";
	}
	
	// 목록
	function getBookList() {
		location.href = "/manage/book/getBookList";
	}
	
</script>

<h1>[ 글 읽기 ]</h1>
<table>
	<tr>
		<td class="right" colspan="2">
		<c:if test="${sessionScope.vo.name == '관리자'}">
			<input type="button" value="수정" onclick="updateForm()">
			<input type="button" value="삭제" onclick="bookDelete()">
		</c:if>
			<input type="button" value="목록" onclick="getBookList()">
		</td>
	</tr>
	<tr>
		<th>번호</th>
		<td>${bookVO.book_num}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${bookVO.name}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${bookVO.title}</td>
	</tr>

	<tr>
		<th>내용</th>
		<td><textarea readonly="readonly">${bookVO.content}</textarea></td>
	</tr>
</table>
</body>
</html>
