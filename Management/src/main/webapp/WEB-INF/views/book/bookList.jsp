<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
<!-- like -->
    <link rel="stylesheet" href="/manage/resources/like/style.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="/resources/js/jquery-3.2.1.min.js"></script> -->
<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Nexus - Responsive HTML5 Template">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="shortcut icon" type="image/png"
	href="/manage/resources/bootstrap/HTML/img/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700|Montserrat:300,400,500,600,700,800,900|Open+Sans:300,400,400i,600,600i,700,800|Raleway:300,400,400i,500,600,700|Roboto:300,400,400i,500,700,900"
	rel="stylesheet">


<!-- Libs CSS -->
<link href="/manage/resources/HTML/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/style.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/streamline-icon.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-nav-menu.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-portfolio.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-blog.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-animation.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-bg-stylish.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-shortcodes.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/theme-responsive.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/plugins/owl-carousel/owl.theme.css"
	rel="stylesheet" />
<link
	href="/manage/resources/HTML/plugins/owl-carousel/owl.carousel.css"
	rel="stylesheet" />

<!-- Current Page CSS -->
<link href="/manage/resources/HTML/plugins/rs-plugin/css/settings.css"
	rel="stylesheet" />
<link
	href="/manage/resources/HTML/plugins/rs-plugin/css/custom-captions.css"
	rel="stylesheet" />

<!-- Custom CSS -->
<link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">



<!--  -->

<!--  -->





</head>
<body>
	<%@ include file="../top.jsp"%>
	<script>
		$(function() {
			if ("${empty cnt}" == 'true') {
				location.href = "bookList";
			}
			$("#showNum").change(
					function() {
						location.href = "bookList?searchType="
								+ $("#searchType option:selected").val()
								+ "&searchValue=" + $("#searchValue").val()
								+ "&showNum="
								+ $("#showNum option:selected").text();
					});

			$("#searchBtn").click(
					function() {
						location.href = "bookList?searchType="
								+ $("#searchType option:selected").val()
								+ "&searchValue=" + $("#searchValue").val()
								+ "&showNum="
								+ $("#showNum option:selected").text();
					});
		});
		

		
		//


	</script>

	<div class="v-page-wrap has-right-sidebar has-one-sidebar">
		<div class="container">
			<div class="col-sm-4">
				<div class="row">
					<div id="boardSearch">
						<form action="bookList" method="get">
							<ul class="list-inline">
								<li><select id="searchType">
										<option value="title"
											${searchType=='title' ? 'selected' : '' }>도서제목</option>
										<option value="publisher"
											${searchType=='publisher' ? 'selected' : '' }>출판사</option>
										<option value="author"
											${searchType=='author' ? 'selected' : '' }>저자</option>
								</select></li>
								<li><input type="text" id="searchValue"	value="${searchValue}" /></li>
								<li><input type="button" id="searchBtn" value="검색" /></li>
							</ul>
						</form>
					</div>
				</div>

				<!--  -->
				<div class="v-spacer col-sm-12 v-height-mini"></div>
				<div class="col-sm-12">
					<div class="v-heading-v2">
						<c:if test="${sessionScope.vo.name == '관리자'}">
							<td class="right"><a href="registBook">도서등록</a></td>
						</c:if>
						<h4 class="v-search-result-count">Books List</h4>
					</div>
				</div>
			</div>
		<!--  -->
			<div class="row">
				<div class="col-sm-12">
					<ul class="v-search-items">
							<c:forEach var="book" items="${booklist}">
								<li class="search-item">
								<div class="search-item-img">
								<a	href="bookDetail?num=${book.num}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}"><img
									src="downloadBook?num=${book.num}" width='70' height='70'></a>
								</div>
									<!--  -->
									<div class="search-item-content">
									<h1 class="search-item-caption">
<%-- 											<a href="selectOne?num=${book.num}">${book.title}</a>&nbsp;&nbsp;&nbsp; <!-- ? --> --%>
											<a	href="bookDetail?num=${book.num}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">${book.title}</a>&nbsp;&nbsp;&nbsp;
									</h1>
									
								<div class="search-item-meta">

									<ul class="list-inline">
										<li>${book.publisher }</li>
										<li>${book.author }</li>
										<li>대출가능 여부&nbsp;${book.status}</li>	
										<div>${book.content }</div>
												<!-- 09.19 -->


								<!--  -->
											</ul>
								</div>
<!-- like -->
<div>
  <button class="button js-likeButton">
    <div class="loader button--icon button--icon-loading js-likeLoadingIcon">Loading...</div>
    <svg class="button--icon button--icon-like js-likeIcon" width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M896 1664q-26 0-44-18l-624-602q-10-8-27.5-26t-55.5-65.5-68-97.5-53.5-121-23.5-138q0-220 127-344t351-124q62 0 126.5 21.5t120 58 95.5 68.5 76 68q36-36 76-68t95.5-68.5 120-58 126.5-21.5q224 0 351 124t127 344q0 221-229 450l-623 600q-18 18-44 18z"/></svg>
    <span class="button--text js-likeText">Like</span>
  </button>
  <span class="js-numberOfLikes">7</span> likes
</div>
<div>
  <button class="button js-likeButton is-liked">
    <div class="loader button--icon button--icon-loading js-likeLoadingIcon">Loading...</div>
    <svg class="button--icon button--icon-like js-likeIcon" width="24" height="24" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M896 1664q-26 0-44-18l-624-602q-10-8-27.5-26t-55.5-65.5-68-97.5-53.5-121-23.5-138q0-220 127-344t351-124q62 0 126.5 21.5t120 58 95.5 68.5 76 68q36-36 76-68t95.5-68.5 120-58 126.5-21.5q224 0 351 124t127 344q0 221-229 450l-623 600q-18 18-44 18z"/></svg>
    <span class="button--text js-likeText">Like</span>
  </button>
  <span class="js-numberOfLikes">23</span> likes
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.3/velocity.min.js'></script>

    <script  src="/manage/resources//like/index.js"></script>
    <!-- like -->
							</c:forEach>
							
				</div>
				
				</li>
				</ul>
				
			</div>
		</div>

				<!--  -->

			<!--  -->
				<!-- 페이징 출력 -->
				<div id="navigator">
				
					<a
						href="bookList?currentPage=${navi.currentPage-navi.pagePerGroup}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">◁◁
					</a> <a
						href="bookList?currentPage=${navi.currentPage-1}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">◀</a>

					<c:forEach var="page" begin="${navi.startPageGroup}"
						end="${navi.endPageGroup}">
						<c:if test="${page eq navi.currentPage}">
							<span style="color: red; font-weight: bolder; font-size: 1em">${page}</span>
						</c:if>
						<c:if test="${page ne navi.currentPage}">
							<a
								href="bookList?currentPage=${page}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">${page}</a>
						</c:if>
					</c:forEach>

					<a
						href="bookList?currentPage=${navi.currentPage+1}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">
						▶</a> <a
						href="bookList?currentPage=${navi.currentPage+navi.pagePerGroup}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">
						▷▷</a>
				</div>
				<a href="/manage"><input type="button" value="메인으로"></a>
		</div>
	</div>

<!--  -->
    <ul class="pagination pagination-lg">
                                                <li><a href="#"><i class="fa fa-angle-left"></i>Previous</a></li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li><a href="#">Next <i class="fa fa-angle-right"></i></a></li>
                                            </ul>

<!--  -->
</body>
</html>