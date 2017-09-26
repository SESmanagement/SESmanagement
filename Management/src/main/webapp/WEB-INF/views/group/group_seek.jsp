<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소모임 모집하기</title>

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


<!-- Custom CSS -->
<link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">

<!-- Form Elements -->
<link href="/manage/resources/HTML/css/v-form-element.css"
	rel="stylesheet" />

</head>
<body>
	<%@ include file="../top.jsp"%>
	<div class="v-heading-v2">
		<br> <br>
		<div class="v-page-wrap">
			<div class="container">
				<div class="row">
					<h3>소모임 모집하기</h3>
				</div>
				<br> <br>
				<form action="/manage/group/group_seek" method="post"
					onsubmit="javascript:return seekok();">
					<div class="tb">
						<table>
							<tr>
								<td>소모임 이름</td>
								<td><input type="text" name="group_title" id="group_title" required ></td>
							</tr>
							<tr>
								<td>콘텐츠</td>
								<td><select name="content" class="form-control"
									onchange="javascript:change(this)">
										<option>스터디</option>
										<option>일본문화</option>
										<option>쉬는시간</option>
										<option>밥</option>
								</select></td>
							</tr>
							<tr>
								<td>모집기간</td>
								<td>
									<div class="form-group">
										<div class="input-daterange input-group"
											data-plugin-datepicker>
											<span class="input-group-addon"> <i
												class="fa fa-calendar"></i>
											</span> <input type="text" class="form-control" id="seek_start_date"
												name="seek_start_date"> <span
												class="input-group-addon">to</span> <input type="text"
												class="form-control" id="seek_end_date" name="seek_end_date" required>
										</div>
									</div>
								</td>
							</tr>
							<!-- 단기용 시간 -->
							<tr id="short" style="display:none">
								<td>시간</td>
								<td>
									<div class="form-group">											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-clock-o"></i>
												</span> <input type="text" data-plugin-timepicker
												data-plugin-options='{ "showMeridian": false }' class="form-control">
										</div>
									</div>
								</td>
							</tr>
							<!-- 장기용 달력 -->
							<tr id="long">
								<td>소모임기간</td>
								<td>
									<div class="form-group">
										<div class="input-daterange input-group"
											data-plugin-datepicker>
											<span class="input-group-addon"> <i
												class="fa fa-calendar"></i>
											</span> <input type="text" class="form-control" id="start_date"
												name="start_date" required > <span class="input-group-addon">to</span>
											<input type="text" class="form-control" id="end_date"
												name="end_date" required >
										</div>
									</div>
								</td>
							<tr>
								<td>인원</td>
								<td>
									<div class="row">
										<div class="col-md-4">
											<input type="text" name="headcount" id="headcount" required ></div><div class="col-md-4 left">명
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>모집내용</td>
								<td>
								<textarea class="form-control" rows="15" name="content_detail" id="content_detail" required></textarea>
									</td>
							</tr>
							<tr>
								<td><input type="submit" value="모집"
									class="btn v-btn v-btn-default"></td>
								<td><input type="button" value="취소"
									class="btn v-btn v-btn-default"
									onclick="javascript:history.go(-1);"></td>
							</tr>
						</table>
						<input type="hidden" name="student_num" id="student_num"
							value="${vo.student_num }"> <input type="hidden"
							name="penalty_total" value="0"> <input type="hidden"
							name="group_num" value="0">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="back-to-top" class="animate-top">
		<i class="fa fa-angle-up"></i>
	</div>

	<!-- Libs -->
	<script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script>
	<script src="/manage/resources/HTML/js/bootstrap.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.flexslider-min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.easing.js"></script>
	<script src="/manage/resources/HTML/js/jquery.fitvids.js"></script>
	<script src="/manage/resources/HTML/js/jquery.carouFredSel.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.validate.js"></script>
	<script src="/manage/resources/HTML/js/theme-plugins.js"></script>
	<script src="/manage/resources/HTML/js/jquery.isotope.min.js"></script>
	<script src="/manage/resources/HTML/js/imagesloaded.js"></script>
	<script src="/manage/resources/HTML/js/view.min.js?auto"></script>
	<script src="/manage/resources/HTML/js/theme-core.js"></script>
	<script src="/manage/resources/HTML/js/bootstrap-timepicker.js"></script>
	<script src="/manage/resources/HTML/js/bootstrap-datepicker.js"></script>
	<script src="/manage/resources/HTML/js/jquery.maskedinput.js"></script>
	<script src="/manage/resources/HTML/js/theme-form-element.js"></script>




	<!-- script단 -->
	<script>
	$(function() {
		var student_num = document.getElementById("student_num");
		if (student_num.value == "") {
			// 			로그인창으로 보내버리자
			alert('다시 로그인해주세요');
			location.href = "/manage";
		}
		
		$("#long").show();
		$("#short").hide();
		
		
	})

	function seekok() {
		if ($("#headcount").val() == 1 || $("#headcount").val() == 0) {
			alert('모집인원수는 2명 이상이어야 합니다');
			return false;
		}
		
		if($("#seek_start_date").val() > $("#seek_end_date").val()){
			alert('모집시작일은 모집종료일보다 빨라야 합니다');
			$("#seek_start_date").focus();
			return false;
		}
		
		
		if($("#start_date").val() > $("#end_date").val()){
			alert('시작일은 종료일보다 빨라야 합니다');
			$("#start_date").focus();
			return false;
		}
		
		
		return true;
	}

	function change(obj) {
		if (obj.value == "장기스터디" || obj.value == "단기스터디" || obj.value == "일본문화") {
			$("#long").show();
			$("#short").hide();
		} else if (obj.value == "쉬는시간" || obj.value == "밥") {
			$("#short").show();
			$("#long").hide();
		}

	}
</script>

	<%@ include file="../footer.jsp"%>
</body>
</html>