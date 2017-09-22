<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SESSchool 홈페이지</title>
<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Nexus - Responsive HTML5 Template">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="shortcut icon" type="image/png" href="img/favicon.png" />
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
<link href="/manage/resources/HTML/css/v-bg-stylish.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-shortcodes.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/theme-responsive.css" rel="stylesheet" />
<link href="/manage/resources/HTML/plugins/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="/manage/resources/HTML/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" />

<!-- Current Page CSS -->
<link href="/manage/resources/HTML/plugins/rs-plugin/css/settings.css" rel="stylesheet" />
<link href="/manage/resources/HTML/plugins/rs-plugin/css/custom-captions.css" rel="stylesheet" />

<!-- Custom CSS -->
<link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">
</head>

<body class="home">

<!--Header-->
<div class="header-container">
  <div class="top_line">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-md-7 col-sm-12 col-xs-12 pull-left general-font-area">
          <ul class="contact-top">
            <li><i class="fa fa-map-marker" aria-hidden="true"></i> 서울특별시 삼성동 코엑스 4층</li>
            <li><i class="fa fa-phone" aria-hidden="true"></i> (02) 456-7890</li>
            <li><i class="fa fa-envelope" aria-hidden="true"></i> goback@gmail.com</li>
          </ul>
        </div>
        <div class="col-lg-6 col-md-5 pull-right hidden-phone">
          <ul class="social-links">
	          <div class="row">
	       		<%@ include file="login.jsp" %>
	          </div>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <header class="header fixed clearfix">
    <div class="container"> 
      
      <!--Site Logo-->
      <div class="logo"> <a href="index.html"> SESSchool로고<img alt="Nexus" src="/manage/resources/HTML/img/logo.png" data-logo-height="35"> </a> </div>
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
            <li class="active"> <a class="dropdown-toggle" href="/manage">Home </a></li>
            <li class="dropdown"> <a class="dropdown-toggle" href="#">도서예약 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="page-about-us.html">책 목록</a></li>
                <li><a href="page-about-us-2.html">도서대출상태</a></li>
                <li><a href="page-about-me.html">대출신청</a></li>
              </ul>
            </li>
            <li class="dropdown"> <a class="dropdown-toggle" href="#">스터디룸예약 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="page-about-us.html">스터디룸 현황 조회</a></li>
                <li><a href="page-about-us-2.html">내 예약현황</a></li>
                <li><a href="page-about-me.html">스터디룸 이용 안내</a></li>
              </ul>
            </li>
            <li class="dropdown"> <a class="dropdown-toggle" href="/manage/group/list">소모임 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="page-about-us.html">전체 소모임</a></li>
                <li><a href="page-about-us-2.html">소모임 모집하기</a></li>
              </ul>
            </li>
            <li class="dropdown"> <a class="dropdown-toggle" href="#">마이페이지 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="page-about-us.html">스케줄 확인</a></li>
                <li><a href="page-about-us-2.html">대출한 책 확인</a></li>
                <li><a href="page-about-me.html">스터디룸 예약 확인</a></li>
                <li><a href="page-services.html">소모임 확인</a></li>
              </ul>
            </li>
            <li class="dropdown"> <a class="dropdown-toggle" href="#">관리자 메뉴 <i class="fa fa-caret-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="page-about-us.html">도서 등록</a></li>
                <li><a href="page-about-us-2.html">강의실</a></li>
                <li><a href="page-about-me.html">스터디룸 관리</a></li>
                <li><a href="page-services.html">도서리스트</a></li>
              </ul>
            </li>
            
          </ul>
        </nav>
        <!--End Main Menu--> 
      </div>
      <button class="btn btn-responsive-nav btn-inverse" data-toggle="collapse" data-target=".nav-main-collapse"> <i class="fa fa-bars"></i> </button>
    </div>
    <span class="v-header-shadow"></span> </header>
</div>

<!--End Header-->

<div id="container"> 
  
  <!--Set your own slider options. Look at the v_RevolutionSlider() function in 'theme-core.js' file to see options-->
  <div class="home-slider-wrap fullwidthbanner-container">
    <div class="v-rev-slider" data-slider-options='{ "startheight":750 }'>
      <ul>
        <!-- SLIDE  -->
        <li data-transition="fade" data-slotamount="7" data-masterspeed="1000"> 
          <!-- MAIN IMAGE --> 
          <img src="/manage/resources/HTML/img/slider/slide1-rev2.jpg" alt="fullslide6" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat"> 
          <!-- LAYERS --> 
          <!-- LAYER NR. 1 -->
          <div class="tp-caption light_heavy_70_shadowed lfb ltt tp-resizeme main-home"
                             data-x="center" data-hoffset="0"
                             data-y="250" data-voffset="0"
                             data-speed="600"
                             data-start="800"
                             data-easing="Power4.easeOut"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.1"
                             data-endspeed="500"
                             data-endeasing="Power4.easeIn"
                             style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">우린 안 크리에이티브</div>
          
          <!-- LAYER NR. 2 -->
          <div class="tp-caption light_medium_30 lfb ltt tp-resizeme"
                            data-x="center" data-hoffset="0"
                             data-y="330" data-voffset="0"
                             data-speed="600"
                             data-start="900"
                             data-easing="Power4.easeOut"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.1"
                             data-endspeed="500"
                             data-endeasing="Power4.easeIn"
                             style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">CSS 어쩌라고 </div>
        </li>
        <li data-transition="fade" data-slotamount="7" data-masterspeed="600"> <img alt="Nexus" src="/manage/resources/HTML/img/slider/slider6.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
          <div class="tp-caption lfb light_heavy_70_shadowed stb white-color no-line"
                             data-x="center" data-hoffset="0"
                             data-y="250" data-voffset="0"
                             data-speed="800"
                             data-start="600"
                             data-easing="Circ.easeInOut"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0"
                             data-endelementdelay="0"
                             data-endspeed="600"
                             style="z-index: 2; line-height: 60px;">넘나 귀찮다</div>
          <div class="tp-caption v-caption-h1 lfb st center"
                             data-x="center" data-hoffset="0"
                             data-y="330" data-voffset="0"
                             data-speed="700"
                             data-start="1100"
                             data-easing="Circ.easeInOut"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0"
                             data-endelementdelay="0"
                             data-endspeed="600"> 이거 <br>
            언제하고 앉아있냐</div>
          <!--<div class="v-slider-overlay overlay-colored"></div>--> 
        </li>
      </ul>
    </div>
  </div>
</div>
<article class="notice">
  <div class="container"> <span>이것은 무엇인가</span> <a href="#">회원정보수정 여기 넣을까</a> </div>
</article>
  <!--End Client Carousel v2-->
  <div class="section-content banner-section">
    <div class="container triggerAnimation animated" data-animate="bounceIn">
      <h1>스케줄 관리를 제공할 예정입니다</h1>
      <p>공지사항</p>
    </div>
  </div>
  
  <!--Footer-Wrap-->
  <div class="footer-wrap">
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <section class="widget"> 로고 여기도 넣어야댐<img alt="Nexus" src="/manage/resources/HTML/img/logo.png"> <br>
              <br>
              <p class="pull-bottom-small"> 아무것도 하기시러염 </p>
              <p> <a href="page-about-us-2.html">더 읽으러 갈래? 시러 →</a> </p>
            </section>
          </div>
          <div class="col-sm-4">
            <section class="widget v-recent-entry-widget">
              <div class="widget-heading">
                <h4>공지사항</h4>
              </div>
              <ul>
                <li> <a href="blog-standard-post.html">공지사항인데</a> </li>
                <li> <a href="blog-full-width-post.html">여기는 forEach를</a> </li>
                <li> <a href="blog-video-post.html">돌려야겠지?</a> </li>
                <li> <a href="blog-slideshow-post.html">ㅅㅂ</a> </li>
              </ul>
            </section>
          </div>
          <div class="col-sm-4">
            <section class="widget">
              <div class="widget-heading">
                <h4>요긴뭘쓸까 고민하자</h4>
              </div>
              <ul class="portfolio-grid">
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-1.jpg" /> <span class="tooltip">Phasellus enim libero<span class="arrow"></span></span> </a> </li>
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-2.jpg" /> <span class="tooltip">Phasellus enim libero<span class="arrow"></span></span> </a> </li>
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-3.jpg" /> <span class="tooltip">Phasellus enim<span class="arrow"></span></span> </a> </li>
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-4.png" /> <span class="tooltip">Lorem Imput<span class="arrow"></span></span> </a> </li>
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-5.jpg" /> <span class="tooltip">Phasellus Enim libero<span class="arrow"></span></span> </a> </li>
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-6.jpg" /> <span class="tooltip">Phasellus Enim<span class="arrow"></span></span> </a> </li>
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-7.jpg" /> <span class="tooltip">Phasellus Enim libero<span class="arrow"></span></span> </a> </li>
                <li> <a href="portfolio-single.html" class="grid-img-wrap"> <img alt="Nexus" src="/manage/resources/HTML/img/thumbs/project-3.jpg" /> <span class="tooltip">Phasellus Enim<span class="arrow"></span></span> </a> </li>
              </ul>
            </section>
          </div>
        </div>
      </div>
    </footer>
    <div class="copyright">
      <div class="container">
        <p>&copy; Copyright 2017 by <a href="#">6조한테있음</a> All Rights Reserved.</p>
      </div>
    </div>
  </div>
  <!--End Footer-Wrap--> 
</div>

<!--// BACK TO TOP //-->
<div id="back-to-top" class="animate-top"><i class="fa fa-angle-up"></i></div>

<!-- Libs --> 

<script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script> 
<script src="/manage/resources/HTML/js/bootstrap.min.js"></script> 
<script src="/manage/resources/HTML/js/jquery.flexslider-min.js"></script> 
<script src="/manage/resources/HTML/js/jquery.easing.js"></script> 
<script src="/manage/resources/HTML/js/jquery.fitvids.js"></script> 
<script src="/manage/resources/HTML/js/jquery.carouFredSel.min.js"></script> 
<script src="/manage/resources/HTML/js/jquery.validate.js"></script> 
<script src="/manage/resources/HTML/js/theme-plugins.js"></script> 
<script src="/manage/resources/HTML/js/jquery.isotope.min.js"></script> 
<script src="/manage/resources/HTML/js/imagesloaded.js"></script> 
<script src="/manage/resources/HTML/js/view.min.js?auto"></script> 
<script src="/manage/resources/HTML/plugins/rs-plugin/js/jquery.themepunch.tools.min.js"></script> 
<script src="/manage/resources/HTML/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script> 
<script src="/manage/resources/HTML/js/theme-core.js"></script>
</body>
</html>
