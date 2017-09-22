<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jquery -->
<script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script>

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700|Montserrat:300,400,500,600,700,800,900|Open+Sans:300,400,400i,600,600i,700,800|Raleway:300,400,400i,500,600,700|Roboto:300,400,400i,500,700,900"
	rel="stylesheet">


<!-- Form Elements -->
<link href="/manage/resources/HTML/css/v-form-element.css"
	rel="stylesheet" />

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">


<title>학번 / 비밀번호 찾기</title>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<div id="container">
	<div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 ">
                        <div class="heading-text">
                            <h1 class="entry-title">학번 / 비밀번호 찾기</h1>
                        </div>

                        <ol class="breadcrumb">
                            <li><a href="#"> 회원정보관리 </a></li>
                            <li class="active"> 학번 비밀번호 찾기</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
	
	
		<div class="v-page-wrap">
			<div class="col-sm-11">
				<h3 class="v-heading v-text-heading">
					<span>학번찾기</span>
				</h3>
				<div class="col-sm-5">
					<label>이름</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control col-sm-5">
				</div>
				<br>
				<div class="col-sm-5">
					<label>생일</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control col-sm-5"
						placeholder="숫자만 입력해주세요">
				</div>
				<button class="btn v-btn v-btn-default v-small-button">학번
					찾기</button>

			</div>
			<div class="col-sm-11">
				<h3 class="v-heading v-text-heading">
					<span>비밀번호 찾기</span>
				</h3>
				<div class="col-sm-5">
					<label>학번</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control">
				</div>
				<br>
				<div class="col-sm-5">
					<label>이메일</label>
				</div>
				<div class="col-sm-5">
					<input type="email" class="form-control col-sm-5"
						placeholder="회원정보의 메일을 입력해주세요">
				</div>
				<button class="btn v-btn v-btn-default v-small-button">비밀번호
					찾기</button>
			</div>

		</div>

	</div>


	<%@ include file="../footer.jsp"%>
	
	<!-- Libs -->

	<script src="/manage/resources/HTML/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.flexslider-min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.easing.js"></script>
	<script src="/manage/resources/HTML/js/jquery.fitvids.js"></script>
	<script src="/manage/resources/HTML/js/jquery.carouFredSel.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.validate.js"></script>
	<script src="/manage/resources/HTML/js/jquery.isotope.min.js"></script>
	<script src="/manage/resources/HTML/js/imagesloaded.js"></script>
	<script src="/manage/resources/HTML/js/view.min.js?auto"></script>

	<script src="/manage/resources/HTML/js/bootstrap-timepicker.js"></script>
	<script src="/manage/resources/HTML/js/bootstrap-datepicker.js"></script>
	<script src="/manage/resources/HTML/js/jquery.maskedinput.js"></script>
	<script src="/manage/resources/HTML/js/theme-form-element.js"></script>
	
	
</body>
</html>