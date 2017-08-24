<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="/manage/resources/css/style.css">
<meta name="viewport" content="width=device-width">
</head>
<body>
	<div class="wrap">
		<span class="decor"></span>
		<nav>
			<ul class="primary">
				<li><a href="/manage">HOME</a></li>
				<li>
					<!-- user --> 
					<a href="">도서예약</a>
					<ul class="sub">
						<li><a href="">책 목록</a></li>
						<li><a href="">도서대출상태</a></li>
						<li><a href="">대출신청</a></li>
					</ul>
				</li>
				<li><a href="/manage/studyroom/rooms">스터디룸예약 입니다</a>
					<ul class="sub">
						<li><a href="/manage/studyroom/rooms">스터디룸 현황조회</a></li>
						<li><a href="">내 예약현황</a></li>
						<li><a href="">스터디룸 이용안내</a></li>
					</ul>
				</li>
				<li><a href="">소모임</a>
					<ul class="sub">
						<li><a href="">모집중인 소모임</a></li>
						<li><a href="">종료된 소모임</a></li>
					</ul>
				</li>

				<li><a href="">마이페이지</a>
					<ul class="sub">
						<li><a href="">스케줄 확인</a></li>
						<li><a href="">대출한 책 확인</a></li>
						<li><a href="">스터디룸 예약 확인</a></li>
						<li><a href="">소모임 확인</a></li>
					</ul>
				</li>


					<!-- admin --> <c:if test="${vo.student_num == 00001}">
				<li><a href="">관리자메뉴</a>
						<ul class="sub">
<<<<<<< HEAD
							<li><a href="/manage/admin/registBookForm">도서등록</a></li>
=======
							<li><a href="registBook">도서등록</a></li>
							<li><a href="classRoomSetting">강의실 설정</a>
							<li><a href="home">메인으로</a></li>
>>>>>>> refs/remotes/origin/master
						</ul>
				</li>
					</c:if>
				</ul>
		</nav>
	</div>
</body>
</html>