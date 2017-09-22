<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출이력</title>
<style>
	label{
		background-color: blue;
		color : white;
		border : 0.5px solid black;
	}
</style>
<script src="resources/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	var today=new Date();
	$("#todayDate").text("오늘 "+today.getFullYear()+"."+(today.getMonth()+1)+"."+today.getDate());
});

//연체일 계산하기
function dateDiff(_date1, _date2) {
    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
    alert(diffDate_1);
    alert(diffDate_2);
 
    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 	
    alert(diff);
}
</script>
</head>
<body>
<div id="wrapper">
		<table>
				<td>
					<table id="borrowDetail">	
						<tr>
							<td><h2>대출이력</h2></td>
							<td id="todayDate"></td>
						</tr>
						<tr>
							<td>대출일</td>
							<td>반납일</td>
							<td>이미지</td>
							<td>제목</td>
							<td>상태</td>
						</tr>
						<c:forEach var="lend" items="${borrowlist}">
						<tr>
							<td>${lend.startdate}</td>
							<td>
								<c:if test="${lend.status == '대출중' || lend.status == '연체'}">
									${lend.enddate}
								</c:if>			
								<c:if test="${lend.status == '반납완료' || lend.status == '연체반납'}">
									${lend.returndate}
								</c:if>
								<c:if test="${lend.status == '대출신청중' || lend.status == '대출거절' }">
								
								</c:if>
							</td>
							<td><img src="downloadBook?num=${lend.booknum}"></td>
							<td> ${lend.title} </td>
							<td>
								<c:if test="${lend.status eq '연체'}">
									<span style="color:red;">${lend.status}</span>
								</c:if>
								<c:if test="${lend.status ne '연체'}">
									<span style="color:black;">${lend.status}</span>
								</c:if>
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:parseDate var="end" value="${lend.enddate}" pattern="yyyy.MM.dd" />
								<fmt:parseNumber value="${end.date-now.date}" var="diff" integerOnly="true" />
								<c:if test="${lend.status eq '대출중'}">
									<c:if test="${diff==0 or diff==1}">
										<br/><label>반납임박</label>
									</c:if>
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<!-- 페이징 출력 -->
	<div id="navigator">
		<a href="borrowList?currentPage=${navi.currentPage-1}">◀</a>
		<a href="borrowList?currentPage=${navi.currentPage+1}"> ▶</a>
	</div>
</body>
</html>