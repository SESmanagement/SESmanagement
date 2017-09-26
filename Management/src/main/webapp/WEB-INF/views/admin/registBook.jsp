<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="/resources/jquery-3.2.1.min.js"></script> -->
<script>
$(function(){
	var today=new Date();
	$("#todayDate").text("오늘 "+today.getFullYear()+"."+(today.getMonth()+1)+"."+today.getDate());
	$("#cancel").click(function(){
		location.href="${pageContext.request.contextPath}/";
	});
});
</script>
</head>
<body>
<%@ include file="../top.jsp" %>
<div id="wrapper">

<div class="container">
<div class="v-heading-v2">
			<br>
			<br>
			<h3>도서 등록</h3>
		</div>
		${vo.name}로그인중
		<div id="todayDate"></div>
<table>
	<tr>
		<td>
		<form action="registBook" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>책제목</td>
					<td><input type="text" id="title" name="title"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" id="publisher" name="publisher"></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="textt" id="author" name="author"></td>
				</tr>
				<tr>
					<td>책설명</td>
					<td><textarea name="content" rows="10" cols="40"></textarea></td>
				</tr>
				<tr>
					<td>책이미지</td>
					<td><input type="file" value="파일선택" id="upload" name="upload"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td colspan="2">
					<button type="button" class="btn v-btn v-small-button v-alizarin"> 등록하기</button>
					<button type="button" class="btn v-btn v-small-button" id="cancel">취소</button></td>
				</tr>
			</table>
		</form>
	</tr>
</table>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>