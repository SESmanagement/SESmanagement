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
	<title>스터디룸 예약페이지</title>
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
<!-- 	<link rel="stylesheet" href="/manage/resources/css/style.css" /> -->
<!-- 	<link rel="stylesheet" href="/manage/resources/css/jquery.datetimepicker.min.css" /> -->
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
	<script src="/manage/resources/js/jquery.datetimepicker.full.min.js"></script>
	
<style type="text/css">
 	[class="timeline2525"] { 
 		border: 1px solid #ffffff;
 		width: 100px; 
 		height: 30px;
 	} 
 	
 	[class="sr_seat_num"] {
 		width: 100px; 
 		height: 30px;
 		text-align: center;
 	}
 	
 	   #leftside > button {
        font-size: 10px;
        text-align: center;
        padding-right: 0px;
        padding-left: 0px;
        width: 60px;
        height: 35px;
     }
     
        #rightside > button {
        font-size: 10px;
        text-align: center;
        padding-right: 1px;
        padding-left: 1px;
        margin-top: 1px;
        margin-bottom: 1px;
        width: 40px;
        height: 40px;
     }
    
    .leftside {
        display: inline-block;
    }
    
      .rightside {
        display: inline-block;
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
        text-align: left;
        padding-top: 10px;
        padding-bottom: 10px;
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
    
    table > thead > tr:nth-child(2) > th {
        text-align : justify;
        text-justify: inter-cluster;
        padding-right: 0px;
        padding-left: 0px;
        border-top: none;
    }
    
    table > tbody > tr > th {
        text-align: center;
        padding-right: 0px;
        border-left: 1px solid #e0e0e0;
        
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
	// 현재 시각
	var now = "${sysdate}" // yy-mm-dd hh24:mi:ss dy
	var now_mm = now.substring(9, 14); // 현재 시간 + 분
	var now_time = now.substring(9, 11); // 현재 시간

	var resvApplyArr = []; // 예약시간대 담는 배열

	$(function() {
		loadSRResvPage();
	});

	// 해당 스터디룸의 예약 현황 조회
	function loadSRResvPage() {
		$
				.ajax({
					url : "/manage/studyroom/srResvInfo",
					data : {
						"studyroom_num" : "${studyroom_num}"
					},
					type : "post",
					success : function(result) {
						$(".timeline2525").empty(); // 초기화
						$(".timeline2525").css("background-color", "#2ECC71"); // 초기화
						$(".timeline2525").val(""); // 초기화
						resvApplyArr = []; // 초기화

						// 테이블에 좌석번호별 id속성 입력
						$(".sr_seat_num").each(function(indexx, itemm) {
							var sr_seat_num = $(itemm).text();
							$(itemm).attr("id", sr_seat_num);

							// db에서 조회한 예약 현황 조회
							$(result).each(	function(index,	item) {
								var id = itemm.id; // 테이블의 좌석 번호
								var start_time = item.start_time.substring(0, 2); // 예약 시작시간
								var end_time = item.end_time.substring(0, 2); // 예약 종료시간
								var resv_time = end_time - start_time; // 예약 시간 (종료-시작)

								if (item.sr_seat_num == id) { // item.sr_seat_num : 예약현황의 좌석번호 
									if (start_time == '19') {
										for (var i = 1; i <= resv_time; i++) {
											$("#" + id).siblings("#time" + i).css("background-color", "grey");
											$("#" + id).siblings("#time" + i).val("non-selectable");
										} // for
									} 
									if (start_time == '20') {
										for (var i = 2; i <= resv_time + 1; i++) {
											$("#" + id).siblings("#time"+ i).css("background-color", "grey");
											$("#"+ id).siblings("#time"+ i).val("non-selectable");
										} // for
									}
									if (start_time == '21') {
										for (var i = 3; i <= resv_time + 2; i++) {
											$("#"+ id).siblings("#time"+ i).css("background-color","grey");
											$("#"+ id).siblings("#time"+ i).val("non-selectable");
										} // for
									}
									if (start_time == '22') {
										for (var i = 4; i <= resv_time + 3; i++) {
											$("#"+ id).siblings("#time"+ i).css("background-color","grey");
											$("#"+ id).siblings("#time"+ i).val("non-selectable");
										} // for
									}
								} // outer if
							}) // result의 each
						})//.sr_seat_num의 each

						// 조회 시점 이후에는 선택불가 처리
						// 00:00 ~ 08시 30분까지 선택불가 처리
						var sysdate_all = "${sysdate}"; // yy-mm-dd hh24:mi:ss
						var sysdate = sysdate_all.substring(9, 14);
						if (sysdate > "00:00" && sysdate < "08:30") {
							for (var i = 1; i <= 4; i++) {
								$(".sr_seat_num").siblings("#time" + i).css("background-color", "grey");
								$(".sr_seat_num").siblings("#time" + i).val("non-selectable");
							} // for
						} // if
						// 19시 이후 #time1 선택불가 처리
						if (sysdate.substring(0, 2) == '19') {
							$(".sr_seat_num").siblings("#time1").css("background-color", "grey");
							$(".sr_seat_num").siblings("#time1").val("non-selectable");
						}
						// 20시 이후 #time1,2 선택불가 처리
						if (sysdate.substring(0, 2) == '20') {
							for (var i = 1; i <= 2; i++) {
								$(".sr_seat_num").siblings("#time" + i).css("background-color", "grey");
								$(".sr_seat_num").siblings("#time" + i).val("non-selectable");
							} // for
						} // if
						// 21시 이후 #time1~3 선택불가 처리
						if (sysdate.substring(0, 2) == '21') {
							for (var i = 1; i <= 3; i++) {
								$(".sr_seat_num").siblings("#time" + i).css("background-color", "grey");
								$(".sr_seat_num").siblings("#time" + i).val("non-selectable");
							} // for
						} // if
						// 22시 이후 #time1~4 선택불가 처리
						if (sysdate.substring(0, 2) == '22') {
							for (var i = 1; i <= 4; i++) {
								$(".sr_seat_num").siblings("#time" + i).css("background-color", "grey");
								$(".sr_seat_num").siblings("#time" + i).val("non-selectable");
							} // for
						} // if
					} // success
				}) // ajax
	};

	// 좌석 및 예약 시간대 선택
	$(document).on("click",".timeline2525",function() {
		var select_timeline2525 = this.id; // 예약 시간대
		var target = $(this);
		// 내 예약 현황 조회
		$.ajax({
			url : "/manage/studyroom/myResvInfo",
			type : "post",
			data : {"student_num" : '${sessionScope.vo.student_num}'},
			success : function(result) {
				$(result).each(function(index, item) {
					var start_time_with_date = item.start_time; // 이미 등록된 예약 시작일자 및 시간 (yy-mm-dd hh24:mi:ss)
					var start_time_array = start_time_with_date.split(" ");
					var start_time = start_time_array[1].substring(0,2); // 이미 등록된 예약 시간만 출력

					var select_time = ""; // 현재 선택한 예약 시작시간
					if (select_timeline2525 == "time1") select_time = "19";
					else if (select_timeline2525 == "time2") select_time = "20";
					else if (select_timeline2525 == "time3") select_time = "21";
					else if (select_timeline2525 == "time4") select_time = "22";

					// 동일 시간대 선택 불가 처리
					if (start_time == select_time) {
						if (target.val() == "non-selectable") {
							// alert("이미 예약된 좌석입니다. 다시 확인하세요"); // 두번 뜨니까 아래 경고창 안뜨게 하기 위해서 별도로 빼줌!! => 다른 사용자 예약내역 선택시 결과 확인하기!!!!!!!!!
							return;
						} else {
							alert("동일 시간대에 나의 예약내역이 있습니다. 다시 확인하세요.");
							resvApplyArr.pop();
							target.css("background-color","#2ECC71");
							target.val("");
							return;
						}
					} // if
				}) // each
			} // success
		}); // ajax

		// 선택불가 셀(value="non-selectable")이 선택시 함수 종료
		if ($(this).val() == "non-selectable") {
			alert("현재 예약이 가능한 좌석이 아닙니다. 다시 확인하세요");
			return;
		} // if

		// 선택 셀(value="selected")을 다시 클릭할 경우 -> 선택 해제
		if ($(this).val() == "selected") {
			alert("선택이 취소됩니다.");
			var removeIndex = resvApplyArr.indexOf("${studyroom_num}"+ ":"+ $(this).siblings(".sr_seat_num").text() + ":" + this.id); // 선택 셀의 인덱스값 확인
			resvApplyArr.splice(removeIndex, 1); // 배열에서 선택 셀 삭제
			$(this).css("background-color", "#2ECC71");
			$(this).val("");
			return;
		} // if

		// 예약 신청 좌석 표시하기
		var sr_seat_num = target.siblings(".sr_seat_num").text(); // 좌석 번호
		var studyroom_num = "${studyroom_num}"; // 스터디룸 번호
		var resvApply = studyroom_num + ":" + sr_seat_num + ":" + select_timeline2525; // 스터디룸 번호:좌석번호:에약시간대
		resvApplyArr.push(resvApply); // 선택 배열에 담기
		$(this).css("background-color", "orange"); // 선택 시간대 표시하기
		$(this).val("selected");

		// 동일 시간대 선택 불가 처리
		for (var i = 0; i < resvApplyArr.length - 1; i++) {
			var selected_timeline2525 = resvApplyArr[i].split(":")[2]; // 이미 선택된 시간대

			if (select_timeline2525 == selected_timeline2525) {
				alert("동일 시간대에 예약내역이 있습니다. 다시 확인하세요.");
				resvApplyArr.pop();
				$(this).css("background-color", "#2ECC71"); // emerald
				$(this).val("");
			}
		} // for

		// 예약 시간대 4개 이상 선택시 알림창 및 선택 배열에서 제외
			if (resvApplyArr.length > 4) {
				alert("최대 4시간까지만 가능합니다.");
			    resvApplyArr.pop();
			}
	});

	// 전체 취소 버튼 클릭
	$(document).on("click", "#reset", function() {
		loadSRResvPage();
	});

	// 예약신청 버튼 클릭
	$(document).on("click","#resvApply",function() {
		if (resvApplyArr.length == 0) {
			alert("선택된 예약내역이 없습니다. 다시 확인해 주세요.");
			return;
		} // if
		location.href = "/manage/studyroom/resvApply?resvApplyArr=" + resvApplyArr;
	});

	// 해당 스터디룸(studyroom_num)에 마우스 오버시 배치도 띄우기
	window.onload = function(studyroom_num) {
		var studyroom_num = '${studyroom_num}';
		$("#rightside").empty();
		// 스터디룸 배치도 바탕
		var addRow = "";
		for (var i = 7; i >= 1; i--) {
			for (var j = 1; j <= 10; j++) {
				addRow += "<button class='btn v-btn' id='"+j+"_"+i+"'></button>";
			} // for j
			addRow += "<br>";
		} // for i
		$("#rightside").append(addRow);

		// 해당 스터디룸 배치
		$.ajax({
			url : "/manage/studyroom/getStudyRoomInfo",
			type : "post",
			data : {"studyroom_num" : studyroom_num},
			success : function(result) {
				 $(result).each(function (index, item) {
	                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").text(item.sr_seat_num);
	                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").attr("margin", "0px");
	                    if (item.activate == 0) {
	                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
	                        
	                        for (var i = 1; i <= 4; i++) { // 예약 테이블에 예약 불가 처리
                                $("#" + item.sr_seat_num).siblings("#time" + i).css("background-color", "#2C3E50");
                                $("#" + item.sr_seat_num).siblings("#time" + i).val("non-selectable");
                            }// for
	                        
	                    } else if (now_mm < '18:59') { // 19시 이전
	                        if (item.seven == item.count_seat && item.eight == item.count_seat && 
	                                item.nine == item.count_seat && item.ten == item.count_seat) {
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn");
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").css("background-color", "grey"); // 풀예약으로 예약 불가
	                        } else $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("v-emerald");
	                    } else if (now_time == '19') { // 19시
	                        if (item.eight == item.count_seat && item.nine == item.count_seat && item.ten == item.count_seat) {
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn");
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").css("background-color", "grey"); // 풀예약으로 예약 불가
	                        } else $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("v-emerald");
	                    } else if (now_time == '20') { // 20시
	                        if (item.nine == item.count_seat && item.ten == item.count_seat) {
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn");
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").css("background-color", "grey"); // 풀예약으로 예약 불가
	                        } else $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("v-emerald");
	                    } else if (now_time == '21') { // 21시
	                        if (item.ten == item.count_seat) {
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn");
	                            $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").css("background-color", "grey"); // 풀예약으로 예약 불가
	                        } else $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("v-emerald");
	                    } else if (now_time >= '22' || now_mm < '08:30') {
	                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn");
	                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y).css("background-color", "grey");
	                    }
	                }) // each
			} // success
		}) // ajax

		// 부대시설 표시 (칠판, 출입구 및 콘센트 등)
		$.ajax({
			url : "/manage/studyroom/getSRFacilityInfo",
			type : "post",
			data : {"studyroom_num" : studyroom_num},
			success : function(result) {
				$(result).each(function(index, item) {//*
					$("#rightside").children("#" + item.seat_x + "_" + item.seat_y).text(item.facility_name);
//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y).css("margin-right", 0);
					if (item.activate == 0) {
						$("#rightside").children("#" + item.seat_x + "_" + item.seat_y+ "").addClass("btn v-btn v-midnight-blue");
					} else $("#rightside").children("#" + item.seat_x + "_" + item.seat_y+ "").addClass("btn v-btn v-peter-river");
				}) // each
			} // success
		}) // ajax
	};
</script>
<%@ include file="../top.jsp" %>
        <div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="heading-text">
                            <h1>스터디룸 예약하기</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="container">
			<h3 class="v-heading v-text-heading"><span>스터디룸 ${studyroom_num}</h1></span></h3>
<%-- 			<h5 style="text-align:right">현재 시각 : ${sysdate } </h5> --%>
	<div id="leftside" style="display:inline-block" class="v-gallery-widget col-sm-6">
		<table id="tb"> <!--  border="1" -->
		  <thead>
				<tr>
					<th rowspan="2" style="vertical-align:middle; text-align:center; padding-right: 0px;">좌석<br>번호</th>
					<th colspan="4" style="text-align:center">이용시간</th>
				</tr>
				<tr>
					<th>7</th>
					<th>8</th>
					<th>9</th>
					<th style="text-align:justify;"><div style="text-align:left; display:inline-block;">10</div><div style="float:right; display:inline-block;">11</div></th>
<!-- 					<th style="width:0px;">11</th> -->
				</tr>
			</thead>
			<c:set var="now" value="${sysdate }"/>
			<c:if test="${fn:substring(now, 18, 19) == '토'||fn:substring(now, 18, 19) == '일'}">
				<tr>
					<td colspan="5">금일은 스터디룸 예약 이용시간이 아닙니다.</td>
				</tr>
			</c:if>
			<c:if test="${fn:substring(now, 18, 19) != '토'&&fn:substring(now, 18, 19) != '일'}">
			<c:forEach items="${srList}" var="vo">
				<tr>
					<th class="sr_seat_num">${vo.sr_seat_num}</th>
					<td class="timeline2525" id="time1" width="150"></td>
					<td class="timeline2525" id="time2" width="150"></td>
					<td class="timeline2525" id="time3" width="150"></td>
					<td class="timeline2525" id="time4" width="150"></td>
				</tr>
			</c:forEach>
			</c:if>
			 <tfoot>
				<tr>
					<td></td>
					<td colspan="4" style="text-align:center">
						<button id="resvApply" class="btn v-btn v-btn-default v-small-button">예약 신청</button>
						<button id="reset" class="btn v-btn v-btn-default v-small-button">전체 선택 취소</button>
<!-- 						<button class="btn v-btn v-second-dark" style="border-color:#f5245f; font-size:12px;"> -->
<!-- 						  <a href="/manage/studyroom/rooms">현황페이지로</a> -->
<!-- 						</button> -->
						<button class="btn v-btn v-btn-default v-small-button v-second-dark" style="border-color:#f5245f; font-size:12px;">
						  <a href="/manage/studyroom/rooms">현황페이지로</a>
						</button>
					</td>
				</tr>
			 </tfoot>
		</table>
	</div>

    <div >
		<div class="v-heading-v2" style="display:inline-block">
			<h3>배치도</h3> 
		</div>
		<div id="rightside" style="display:inline-block;" class="v-gallery-widget col-sm-6"><!-- 스터디룸 배치도 --></div>
	</div>

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
