<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>lenDLlIST</title>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="resources/jquery-3.2.1.min.js"></script> -->
<script>
$(function(){
	//오늘 날짜 찍기
	var today=new Date();
	$("#todayDate").text("오늘 "+today.getFullYear()+"."+(today.getMonth()+1)+"."+today.getDate());
	$("#cancel").click(function(){
		location.href="${pageContext.request.contextPath}/";
	});
	//목록 불러오기
	$.ajax({
		url : "lentList"
		, method : "get"
		, dataType : "json"
		, success : lentList
	});
	
	$("#adminSearchBtn").click(function(){
		var searchTarget={"adminSearchType" : $("#adminSearchType option:selected").val(),
						  "adminSearchValue" : $("#adminSearchValue").val()};
	 	$.ajax({
			url : "lentList"
			, method : "get"
			, data : searchTarget
			, dataType : "json"
			, success : lentList
		});
		 
	});
});

//처음에 리스트 불러오기
function lentList(resp){
	var temp="<table><tr><th>책 제목</th><th>대출자</th><th>시작일</th><th>종료일</th><th>액션</th></tr>";
	$.each(resp, function(index, item){
		temp+="<tr>";
		temp+="<td>"+item.title+"</td>";
		temp+="<td>"+item.name+"</td>";
		temp+="<td>"+item.startdate+"</td>";
		temp+="<td>"+item.enddate+"</td>";
		temp+="<td><input type='button' value='반납' data-num="+item.num+" class='returnBook'></td>"
		temp+="</tr>";
	});
	temp+="</table>"
	$("#lentresult").html(temp);
	
	
	//반납 버튼을 클릭했을 때.
	$(".returnBook").click(function(){
		var removetr = $(this).parent().parent();
		var result=confirm("반납처리 하시겠습니까?");
		if(result){
			var target = {"num" : $(this).data("num")}
			$.ajax({
				url : "returnBook"
				, method : "GET"
				, data : target
				, dataType : "text"
				, success : function(resp){
					alert(resp);
					removetr.remove();
				}
			});
		}
	});
};
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="../top.jsp" %>
		<table>
<!-- 			<tr> -->
<%-- 				<td colspan="2"><%@include file="../books/menu.jsp" %></td> --%>
<!-- 			</tr> -->
			<tr>
				<td >${vo.name}로그인중</td>
				<td>대출 목록</td>
				<td id="todayDate"></td>
			</tr>
		</table>
	</div>
	<div id="search">
		<form action="applyList" method="POST">
			<table>
				<tr>
					<td>
					<select id="adminSearchType">
						<option value="title">책 제목</option>
						<option value="name">대출자</option>
					</select>
					</td>
					<td><input type="text" id="adminSearchValue" name="adminSearchValue"></td>
					<td><input type="button" id="adminSearchBtn" value="검색하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="lentresult"></div>
</body>
	
</html>
