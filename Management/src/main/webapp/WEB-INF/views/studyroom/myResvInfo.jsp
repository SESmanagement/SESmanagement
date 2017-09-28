<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>스터디룸 예약확인</title>
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
    <link href="/manage/resources/HTML/css/v-animation.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-bg-stylish.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-shortcodes.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/theme-responsive.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/plugins/owl-carousel/owl.theme.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/manage/resources/css/custom.css">


	<!-- 별도 적용분 - 이후 삭제 처리 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
	<script src="/manage/resources/js/jquery.datetimepicker.full.min.js"></script>
	
<style type="text/css">
	[class="timeline"] {
		background-color:lime;
	}
	
	input[type=checkbox] {  
	    display: none;  
	}
	
	input[type=checkbox] + label{
	    display: inline-block;  
	    cursor: pointer;  
	    position: relative;  
	    padding-left: 25px;  
	    margin-right: 15px;  
	    font-size: 13px;
	}
	
	input[type=checkbox]+ label:before {     
	
	    content: "";  
	    display: inline-block;  
	  
	    width: 20px;  
	    height: 20px;  
	  
	    margin-right: 10px;  
	    position: absolute;  
	    left: 0;  
	    bottom: 1px;  
	    background-color: #ccc;  
	    border-radius: 2px; 
	    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
	}
	input[type=checkbox]:checked + label:before { 
	
	    content: "\2713";  /* 체크모양 */
	    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
	    font-size: 18px; 
	    font-weight:800; 
	    color: #fff;  
	    background:#f5245f;
	    text-align: center;  
	    line-height: 18px;  
	
	}
	
	.v-btn {
        background-color: #FFF;
    }
    
    table {
        font-family: Arial, Helvetica, sans-serif;
        color: #666;
        font-size: 12px;
        text-shadow: 1px 1px 0px #fff;
        background: #eaebec;
        margin: auto;
        text-align: center;
    }
    
    table > thead th {
        padding: 21px 25px 22px 25px;
        border-top: 1px solid #e0e0e0;
        border-bottom: 1px solid #e0e0e0;
    
        background: #ededed; /* Old browsers */
        background: -moz-linear-gradient(top,  #ededed 0%, #ebebeb 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ededed), color-stop(100%,#ebebeb)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  #ededed 0%,#ebebeb 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  #ededed 0%,#ebebeb 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  #ededed 0%,#ebebeb 100%); /* IE10+ */
        background: linear-gradient(to bottom,  #ededed 0%,#ebebeb 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ededed', endColorstr='#ebebeb',GradientType=0 ); /* IE6-9 */
    }
    
    table > tbody > tr {
        text-align: center;
        padding-left: 20px;
    }
    
    table > tbody > tr > td {
        padding:18px;
        border-top: 1px solid #ffffff;
        border-bottom: 1px solid #e0e0e0;
        border-left: 1px solid #e0e0e0;
        border-right: 1px solid #e0e0e0;
    
        background: #fbfbfb; /* Old browsers */
        background: -moz-linear-gradient(top,  #fbfbfb 0%, #fafafa 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fbfbfb), color-stop(100%,#fafafa)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* IE10+ */
        background: linear-gradient(to bottom,  #fbfbfb 0%,#fafafa 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fbfbfb', endColorstr='#fafafa',GradientType=0 ); /* IE6-9 */
    }
    
    table > tbody > tr:last-child > td{
        text-align: center;
    }
    
    table > tbody > tr:hover > td {
        background: #f2f2f2; /* Old browsers */
        background: -moz-linear-gradient(top,  #f2f2f2 0%, #f0f0f0 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f2f2), color-stop(100%,#f0f0f0)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* IE10+ */
        background: linear-gradient(to bottom,  #f2f2f2 0%,#f0f0f0 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f2f2', endColorstr='#f0f0f0',GradientType=0 ); /* IE6-9 */
    }
	
</style>
</head>
<body>
<script>
// 예약 취소 성공 메세지
	if ("${param.cancelResult}" != null) {
		if ("${param.cancelResult}" == "true") alert("예약이 취소되었습니다.")
		else ("예약 취소에 실패했습니다.")
	}

	// 체크박스 전체 선택하기
	$(document).on("click", "#checkAll", function() {
	      if ($("#checkAll").is(":checked")) {
			$("input[name=checkbox]").prop("checked", true); // 전체 선택
		} else {
			$("input[name=checkbox]").prop("checked", false); // 전체 해제
		}
	});

	// 선택된 예약건 취소 신청하기
	$(document).on("click", "#submit", function() {
		var checkList = []; // 선택된 체크박스의 예약번호를 담을 배열
		
		$(".checkbox").each(function (index, item) {
			var sr_resv_num = $(item).val();
// 			if ($(".checkbox").is(":checked")) {
			if ($(item).is(":checked")) { // 체크된 내역
				checkList.push(sr_resv_num);
			} // if
		}) // each
		
		// 선택된 내역이 없을 경우, submit 취소
		if (checkList.length < 1) {
			alert("선택된 예약 내역이 없습니다.");
			return;
			
		} else { // 취소할 예약 번호들이 담긴 checkList를 컨트롤로 넘김
			$("#fm").attr("action", "/manage/studyroom/cancelMySRR?checkList="+checkList+"&student_num=${sessionScope.vo.student_num }");			
			$("#submit").attr("type", "submit");
// 			$("#fm").submit();
			
		} // else
	});
</script>
<%@ include file="../top.jsp" %>
        <div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="heading-text">
                            <h1>내 예약 현황</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="container">
	<h3 class="v-heading v-text-heading"><span>${sessionScope.vo.name } 님의 스터디룸 예약 현황</span></h3>
</div>

<div class="container">
	<form method="post" id="fm">
	<table border="1">
	   <thead>
		<tr>
			<th><input type="checkbox" id="checkAll"><label for="checkAll">전체 선택</label></th>
			<th>예약 일자</th>
			<th>스터디룸 번호</th>
			<th>좌석번호</th>
			<th>시작 시간</th>
			<th>종료 시간</th>
		</tr>
		</thead>
		<c:if test="${empty myResvList}">
		<tr>
			<td colspan="6" style="text-align: center">금일 예약내역이 없습니다.</td>
		</tr>
		</c:if>
		<c:if test="${!empty myResvList}">
		<c:forEach items="${myResvList}" var="vo">
		<tr>
		<fmt:parseDate var="now" value="${sysdate }" pattern="yy-MM-dd kk:mm:ss"/>
		<fmt:parseDate var="start_date" value="${vo.start_time }" pattern="yy-MM-dd kk:mm:ss"/>
		<c:set var="start_time" value="${vo.start_time }"></c:set>
		<c:set var="end_time" value="${vo.end_time }"></c:set>
				<td>
			<c:if test="${now < start_date }"> 
					<input type="checkbox" id="${vo.sr_resv_num }" name="checkbox" class="checkbox" value="${vo.sr_resv_num }">
					<label for="${vo.sr_resv_num }" style="color:white">${vo.sr_resv_num }</label>
			</c:if>
				</td>
				<td>${fn:substring(start_time, 2, 10)}</td>
				<td>${vo.studyroom_num}</td>
				<td>${vo.sr_seat_num}</td>
				<td>${fn:substring(start_time, 11, 16)}</td>
				<td>${fn:substring(end_time, 11, 16)}</td>
				<input type="hidden" name="sr_resv_num" value="${vo.sr_resv_num }" >
		</tr>
		</c:forEach>
		</c:if>
		<tfoot>
			<tr>
				<td colspan="6" style="text-align: center">
					<input type="button" value="취소 신청" id="submit" class="btn v-btn v-btn-default v-small-button">
					<input type="reset" value="전체 선택취소" class="btn v-btn v-btn-default v-small-button">
					<a href="/manage/studyroom/rooms">
					<button type="button" class="btn v-btn v-btn-default v-small-button v-second-dark" style="border-color:#f5245f; font-size:12px; color:#f5245f!important;">현황페이지로</button>
                    </a>
				</td>
			</tr>
		</tfoot>
	</table>
	
	</form>
</div>
	
<!--// BACK TO TOP //-->
    <div id="back-to-top" class="animate-top"><i class="fa fa-angle-up"></i></div>

<%@ include file="../footer.jsp" %>

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
    <script src="/manage/resources/HTML/js/theme-core.js"></script>

</body>
</html>
