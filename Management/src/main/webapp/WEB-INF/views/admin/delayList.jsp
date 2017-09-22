<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
		url : "delayedList"
		, method : "get"
		, dataType : "json"
		, success : dealyedList
	});
	
	//검색 결과 가져오기
	$("#adminSearchBtn").click(function(){
		var searchTarget={"adminSearchType" : $("#adminSearchType option:selected").val(),
						  "adminSearchValue" : $("#adminSearchValue").val()};
	 	$.ajax({
			url : "delayedList"
			, method : "get"
			, data : searchTarget
			, dataType : "json"
			, success : dealyedList
		});
		 
	});
});

//연체일 계산하기
function dateDiff(_date1, _date2) {
    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
 
    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}



//처음에 리스트 불러오기
function dealyedList(resp){
	var temp="<table><tr><th>책 제목</th><th>대출자</th><th>시작일</th><th>종료일</th><th>연체일</th><th>액션</th></tr>";
	var today=new Date();
	$.each(resp, function(index, item){
		temp+="<tr>";
		temp+="<td>"+item.title+"</td>";
		temp+="<td>"+item.name+"</td>";
		temp+="<td>"+item.startdate+"</td>";
		temp+="<td>"+item.enddate+"</td>";
		temp+="<td>"+dateDiff(item.enddate ,today)+"</td>";
		temp+="<td><input type='button' value='반납' data-num="+item.num+" class='returnDelayedBook'></td>"
		temp+="</tr>";
	});
	temp+="</table>"
	$("#delayresult").html(temp);
	
	
	//반납 버튼을 클릭했을 때
	$(".returnDelayedBook").click(function(){
		var removetr = $(this).parent().parent();
		var result=confirm("반납처리 하시겠습니까?");
		if(result){
			$.ajax({
				url : "returnDelayedBook"
				, method : "GET"
				, data : "num="+$(this).data("num")
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
<%@ include file="../top.jsp" %>
<div id="wrapper">
		<table>
<!-- 			<tr> -->
<%-- 				<td colspan="2"><%@include file="../books/menu.jsp" %></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<%-- 				<td >${user.username}로그인중</td> --%>
<!-- 				<td>연체 목록</td> -->
<!-- 				<td id="todayDate"></td> -->
<!-- 			</tr> -->
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
	<div id="delayresult"></div>
</body>
	
</html>