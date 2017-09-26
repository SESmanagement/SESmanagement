<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript" src="/manage/resources/js/jquery-3.2.1.min.js"></script>
<title>주소등록창</title>

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


<script>
	function submitAddr(){
		var address2 = $("#address2").val();
		opener.document.infor.zip.value = "${zip}";
		opener.document.infor.address.value = "${address}";
		opener.document.infor.address2.value = address2;
		self.close();
	}
</script>


</head>
<body>
<div class='container'>
<br><br>
<div class='v-heading-v2'>
<h3>세부 주소 입력</h3>
</div>
<p>
<span class="label label-info">우편번호</span> ${zip}<br>
</p>
${address}<br>
<input type="text" id="address2" name="address2" placeholder="나머지 주소를 입력해주세요">
<button class="btn v-btn v-alizarin v-small-button" type="button" onclick="submitAddr()">주소 등록</button>

</div>
</body>
</html>