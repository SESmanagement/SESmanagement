<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 예약현황</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
	<link rel="stylesheet" href="/manage/resources/css/style.css" />
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
<style type="text/css">
	header ul{
		padding : 0px;
		width : 800px;
		
		display : inline-block;
		background: #dedeff;
		border: 1px dotted black;
		clear : both;
	}
	li {
		float : left;
		margin : 20px;
		list-style: none;
		
	}
	
	
	section {
		clear : both;
	}
	section h1 {
		text-align:center;
	}
	h2.title {
		font-size : 1.2em;
		color : blue;
	}
	a.plus {
		display : inline-block;
		padding : 3px;
		margin-left : 10px;
	}
	form {
		margin : 0 auto;
	}
	table {
		border-collapse: collapse;
		border : none;
		width : 750px;
		margin : 0 auto;
		
	}
	tr {
		border-top : 1px dotted black;
		border-bottom: 1px dotted black;
		
	}
	th {
		background : #aaaaff;
	}
	td {
		padding : 5px;
	}

	.roomtitle, .starttime, .endtime, .action {
		width : 200px;
		text-align:center;
	}
	input[type='text'], input[type='password'] {
		width: 250px;
	}
</style>
</head>
<body>
<script>

	
</script>
<%@ include file="../top.jsp" %>
<br>
<section>
		<h1>회의실 예약</h1>
		<article>
			<form action="make" method="post">
				<input type="hidden" name="roomNum" value="${room.num}">
				<table>
					<tr>
						<th class="roomtitle">스터디룸 번호</th>
						<td>${srVO.studyroom_num}</td>
					</tr>
					<tr>
						<th class="roomtitle">좌석번호</th>
						<td>
							<input type="text" name="title">
						</td>
					</tr>
					<tr>
						<th class="starttime">시작</th>
						<td>
							<input type="text" name="startTime">
						</td>
					</tr>
					<tr>
						<th  class="endtime">끝</th>
						<td>
							<input type="text" name="endTime">
						</td>
					</tr>
					<tr>
						<th >참가자</th>
						<td>
							<!-- 멤버 목록을 체크박스로 표시 -->
							<!-- JSTL 코드를 이용하여 멤버목록이 체크박스로 출력되도록 코드 완성하시오 -->
							<c:forEach var="member" items="${memberList}">
								<c:if test="${sessionScope.loginId ne member.id}">
									<input type="checkbox" name="id" value="${member.id}">${member.name}&nbsp;
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td colspan="2"  style="text-align:center">
							<input id="makeBtn" type="submit" value="예약">
						</td>
					</tr>
				</table>
			</form>
		</article>
	</section>


</body>
</html>