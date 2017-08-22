<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/manage/resources/js/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		if(${vo.address == null}){
			alert('회원정보 입력 후 이용해주세요.');
		}
	});
</script>



</head>
<body>
<h1> [ 회원가입 ]</h1>
<form action="/member/join" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<!-- 아이디로 쓸 학번 -->
			<td>학번</td>
			<td>${vo.student_num }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="pwd" name="pwd" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" id="pwd2" name="pwd2"></td>
		</tr>
		<tr>
			<td>기수</td>
			<td> ${vo.member_num }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td> ${vo.name }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td> ${vo.sex }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" readonly><input type="button" value="주소찾기"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" placeholder="나머지 주소를 입력해주세요."></td>
		</tr>
		<tr>
			<td>메일</td>
			<td><input type="email"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file"></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정완료"></td>
			<td></td>
		</tr>
	</table>
</form>

</body>
</html>