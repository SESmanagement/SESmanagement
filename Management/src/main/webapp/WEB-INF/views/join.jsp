<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="/manage/resources/js/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<script>


	$(function(){
		if("${result}" != "" &&"${result}"==false){
			alert('회원정보수정오류!');
		}
		if("${vo.address}" == ""){
			alert('회원정보 입력 후 이용해주세요.');
		}
	});
	
	function openSearch(){
		window.open('/manage/add/open', 'child', 'width=700, height=400');
	}
	
	function confirmOk(){
		var pwd = document.getElementById("pwd").value;
		var pwd2 = document.getElementById("pwd2").value;
		var addr1 = document.getElementById("addr1").value;
		if(pwd != pwd2){
			alert('비밀번호는 동일하게 입력해주세요');
			return false;
		}
		
		if(pwd.length < 7 || pwd.length > 14 ){
			alert("비밀번호는 7자 이상 14자 미만으로 입력해주세요");
			return false;
		}
		
		if(addr1=="" || addr1==""){
			alert('주소를 입력해주세요');
			return false;
		}
		
		return confirm("수정하시겠습니까?");
		
	}
	
</script>



</head>
<body>
<%@ include file="top.jsp" %>
<br>
회원정보수정
<form name="infor" action="/manage/member/join" method="post" onsubmit="return confirmOk()">
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
			<td>주소</td>
			<td><input type="text" name="zip" id="zip" value="${zip}" readonly>
			<input type="button" value="주소찾기" onclick="javascript:openSearch();"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" name="addr1" id="addr1" value="${vo.address}" readonly></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" placeholder="나머지 주소를 입력해주세요." id="addr2" name="addr2"></td>
		</tr>
		<tr>
			<td>메일</td>
			<td><input type="email" id="email" name="email" value="${vo.email }" required></td>
		</tr>
		
		<!-- 파일첨부는 나중에 구현 -->
<!-- 		<tr> -->
<!-- 			<td>사진</td> -->
<!-- 			<td><input type="file" id="photo" name="photo"></td> -->
<!-- 		</tr> -->
		
		<tr>
			<td><input type="submit" value="수정완료"></td>
			<td></td>
		</tr>
	</table>
</form>

</body>
</html>