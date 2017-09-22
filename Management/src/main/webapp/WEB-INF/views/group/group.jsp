<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="../resources/js/jquery-3.2.1.min.js"></script>

<!-- 툴팁 -->
		<link rel="stylesheet" type="text/css" href="../resources/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="../resources/css/demo.css" />
<!-- 		<link rel="stylesheet" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css"> -->
		<link rel="stylesheet" type="text/css" href="../resources/css/tooltip-flip.css" />
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<!-- 툴팁끝 -->

<meta charset="utf-8">
<script>
	function pageProc(currentPage, searchCondition, searchKeyword) {
		location.href = "/manage/group/list?currentPage=" + currentPage+"&searchCondition=" + searchCondition + "&searchKeyword=" + searchKeyword;
	}
	
</script>

<style>
.isotope-item:hover {
	cursor: pointer;
	border: 4px solid #D9418C;
}
</style>


</head>
<body>
	<%@ include file="../top.jsp"%>
<%-- <fmt:formatDate value="<%=new java.util.Date() %>" var="today" type="date" pattern="yyyy/MM/dd"/> 날짜용으로 했는데 포기 --%>


	<div id="container" class="slideshow">
		<div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
			<div class="container">
				<div class="row">

					<div class="col-sm-12">
						<div class="heading-text">
							<h1 class="entry-title">전체 소모임</h1>
						</div>
						<ol class="breadcrumb">
							<li><a href="#">소모임</a></li>
							<li class="active">전체 소모임</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="v-page-wrap">

		<div class="container">
			<div class="row">

				<div class="col-sm-12">

					<div class="v-portfolio-wrap">
						<div class="v-portfolio-filter-wrap row clearfix">
							<ul
								class="v-portfolio-filter-nav bar-styling filtering col-sm-12 clearfix">
								<li class="all selected"><a data-filter="*" href="#"><span
										class="item-name">All</span><span class="item-count">0</span></a></li>
								<li><a href="#" class="장기스터디" data-filter=".장기스터디"><span
										class="item-name">장기스터디</span><span class="item-count">0</span></a></li>
								<li><a href="#" class="단기스터디" data-filter=".단기스터디"><span
										class="item-name">단기스터디</span><span class="item-count">0</span></a></li>
								<li><a href="#" class="일본문화" data-filter=".일본문화"><span
										class="item-name">일본문화</span><span class="item-count">0</span></a></li>
								<li><a href="#" class="쉬는시간" data-filter=".쉬는시간"><span
										class="item-name">쉬는시간</span><span class="item-count">0</span></a></li>
								<li><a href="#" class="밥" data-filter=".밥"><span
										class="item-name">밥</span><span class="item-count">0</span></a></li>
							</ul>
						</div>

						<ul
							class="v-portfolio-items gallery-portfolio filterable-items col-3 row clearfix">

							<c:forEach items="${list }" var="vo">
								<li
									class="clearfix v-portfolio-item col-sm-4 gallery-item ${vo.content } center">
									<figure class="animated-overlay center ">
										<c:if test="${vo.end == 1 }">
										<a class="tooltip tooltip-effect-3" href="/manage/group/detail?group_num=${vo.group_num }"
											class="link-to-post center ">
											<span class="tooltip-content">
<!-- 										<span class="tooltip-front"><img src="img/user3.png" alt="user3"/></span> -->
										<span class="tooltip-back">모집 1일 남았음!</span>
										</span>
											</a>
											</c:if>
											<c:if test="${vo.end != 1 }">
										<a href="/manage/group/detail?group_num=${vo.group_num }"
											class="link-to-post center "></a>
											</c:if>
										<h4 class="center">
											<b>${vo.group_title }</b>
										</h4>
										<h5 class="center">${vo.owner_name }</h5>
										<h5 class="center">${vo.headcount }명모집</h5>
									</figure>
								</li>
							</c:forEach>
						</ul>
						<form name="form" id="form">
							<input type="hidden" name="currentPage" value="1" /> <input
								type="hidden" name="countPerPage" value="9" />
						</form>
						<!-- 페이징 출력부분 -->
						<div>
							<ul class="pagination pagination-lg" id="list">
								<li><a
									href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, '${searchCondition}', '${searchKeyword}')"><i
										class="fa fa-angle-left"></i></a></li>
								<!-- 현재선택페이지 bold 처리 -->
								<c:forEach var="counter" begin="${navi.startPageGroup}"
									end="${navi.endPageGroup}">
									<c:if test="${counter == navi.currentPage}"></c:if>
									<li class="current"><a
										href="javascript:pageProc(${counter}, , '${searchCondition}', '${searchKeyword}')">${counter}</a></li>
									<c:if test="${counter == navi.currentPage}"></c:if>
								</c:forEach>
								<li><a
									href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, '${searchCondition}', '${searchKeyword}')"><i
										class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<!-- 검색 input이랑 검색 시작 -->
						<div class="col-md-6">
							<form action="/manage/group/list" method="get">
								<select name="searchCondition">
									<option value="NAME" selected="selected">작성자 기준</option>
									<option value="TITLE">제목</option>
									<option value="CONTENT">유형</option>
								</select>
								<div class="input-group mb-md">
									<input type="text" name="searchKeyword" class="form-control"
										placeholder="검색어를 입력해주세요"> <span
										class="input-group-btn">
										<button class="btn btn-success" type="submit">검색!</button>
									</span>
								</div>
							</form>
						</div>
						<!-- 검색기능 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../footer.jsp"%>