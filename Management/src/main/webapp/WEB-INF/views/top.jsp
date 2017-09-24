<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>SESSchool 홈페이지</title>
    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Nexus - Responsive HTML5 Template">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" type="image/png" href="/manage/resources/HTML/img/sesschool.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Web Fonts  -->
<link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700|Montserrat:300,400,500,600,700,800,900|Open+Sans:300,400,400i,600,600i,700,800|Raleway:300,400,400i,500,600,700|Roboto:300,400,400i,500,700,900" rel="stylesheet">


    <!-- Libs CSS -->
    <link href="/manage/resources/HTML/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/style.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/streamline-icon.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-nav-menu.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-portfolio.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-blog.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-animation.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-bg-stylish.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-shortcodes.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/theme-responsive.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/plugins/owl-carousel/owl.theme.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">
</head>

<body>

    <!--Header-->
<div class="header-container">
  <div class="top_line">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-md-7 col-sm-12 col-xs-12 pull-left general-font-area">
          <ul class="contact-top">
            <li><i class="fa fa-map-marker" aria-hidden="true"></i> 서울특별시 삼성동 코엑스 4층</li>
            <li><i class="fa fa-phone" aria-hidden="true"></i> (02) 456-7890</li>
            <li><i class="fa fa-envelope" aria-hidden="true"></i> kita@kita.net</li>
          </ul>
        </div>
           <div class="row">
	       	<c:if test="${sessionScope.vo.name == null}">
				<%@ include file="login.jsp" %>
			</c:if>
			<c:if test="${sessionScope.vo.name != null}">
				<%@ include file="logedin.jsp" %>
			</c:if>
      	   </div>
      </div>
    </div>
  </div>
  <header class="header fixed clearfix">
    <div class="container"> 
      
      <!--Site Logo-->
      <div class="logo"> <a href="/manage"> <img alt="Nexus" src="/manage/resources/HTML/img/sesschool.png" data-logo-height="35"> </a> </div>
      <!--End Site Logo-->
      
      <div class="navbar-collapse nav-main-collapse collapse"> 
        
        <!--Header Search-->
        <div class="search" id="headerSearch"> <a href="#" id="headerSearchOpen"><i class="fa fa-search"></i></a>
          <div class="search-input">
            <form id="headerSearchForm" action="#" method="get">
              <div class="input-group">
                <input type="text" class="form-control search" name="q" id="q" placeholder="Search...">
                <span class="input-group-btn">
                <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
                </span> </div>
            </form>
            <span class="v-arrow-wrap"><span class="v-arrow-inner"></span></span> </div>
        </div>
        <!--End Header Search--> 
        <!--Main Menu-->
        <nav class="nav-main mega-menu">
          <ul class="nav nav-pills nav-main" id="mainMenu">
            <li class=""> <a class="dropdown-toggle" href="/manage">Home</a></li>
            <li class="dropdown"> <a class="dropdown-toggle" href="#">도서예약 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/manage/book/getBookList">책목록</a></li>
                <li><a href="">도서대출상태</a></li>
                <li><a href="">대출신청</a></li>
              </ul>
            </li>
            <li class="dropdown"> <a class="dropdown-toggle" href="#">스터디룸예약 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/manage/studyroom/rooms">스터디룸 현황 조회</a></li>
                <li><a href="/manage/studyroom/myResvInfoPage?student_num=${sessionScope.vo.student_num }">내 예약현황</a></li>
                <li><a href="">스터디룸 이용 안내</a></li>
              </ul>
            </li> 
            <li class="dropdown"> <a class="dropdown-toggle" href="/manage/group/list">소모임 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/manage/group/list">전체 소모임</a></li>
                <li><a href="/manage/group/seek	">소모임 모집하기</a></li>
              </ul>
            </li> 
            <li class="dropdown"> <a class="dropdown-toggle" href="#">마이페이지 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/manage/myPage/mySchedule">스케줄 확인</a></li>
                <li><a href="">대출한 책 확인</a></li>
	            <li><a href="/manage/studyroom/myResvInfoPage?student_num=${sessionScope.vo.student_num }">스터디룸 에약 확인</a></li>	
	            <li><a href="/manage/group/mygroup?student_num=${vo.student_num }">소모임 확인</a></li>
              </ul>
            </li> 
            <c:if test="${vo.student_num == 00001}">
            <li class="dropdown"> <a class="dropdown-toggle" href="#">관리자 메뉴<i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/manage/book/writeForm">도서 등록</a></li>
           		<li><a href="applyList">대출승인리스트</a></li>
                <li><a href="lendList">대출목록</a></li>
                <li><a href="delayList">연체목록</a></li>
                <li><a href="">강의실</a></li>
	            <li><a href="">스터디룸 관리</a></li>	
	            <li><a href="/manage/book/getBookList">도서리스트</a></li>
              </ul>
            </li>
            </c:if> 
          </ul>
        </nav>
        <!--End Main Menu--> 
      </div>
    </div>
    <span class="v-header-shadow"></span> </header>
</div>
    <!--End Header-->
    <div id="container" class="slideshow" >
            <!--            <div class="v-call-to-action v-bg-stylish v-bg-stylish-v3">
                <div class="v-call-to-action-wrap clearfix">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="v-call-to-action-inner">
                                    <h1>Nexus is a Modern and Fully Responsive Bootstrap Template.</h1>
                                </div>
                            </div>
                            <div class="col-md-3 pull-right">
                                <a href="#" class="btn v-btn" target="_self"><i class="fa fa-fire"></i>Purchase Nexus</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
            