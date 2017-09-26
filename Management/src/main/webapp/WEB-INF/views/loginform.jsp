<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 창</title>

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


</head>
<body>

	<%@ include file="top.jsp"%>

	<form action="/manage/member/login" method="post">
		<div class="middle-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 right-text">
						<h3>로그인을 한 후 이용해 주세요</h3>
						<h2>SESSCHOOL</h2>
						<a href="/manage/member/search_member" class="learn-btn">학번/비밀번호 찾기</a>
					</div>
					<div class="col-sm-6 center">
						<div class="contact-form">
							<div class="form-group">
								<label>학번</label> <input type="text" name="student_num"
								placeholder="학번을 입력하세요">
							</div>

							<div class="form-group">
								<label>비밀번호</label> <input type="password"
									name="pwd" placeholder="최초 비밀번호는 생년월일">
							</div>

							<div class="form-group">
								<input type="submit" value="로그인" class="get-started-btn">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<%@ include file="footer.jsp"%>
	
	
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