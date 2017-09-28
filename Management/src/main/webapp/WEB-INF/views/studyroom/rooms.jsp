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
	<title>스터디룸 예약현황</title>
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
	<link rel="stylesheet" href="/manage/resources/HTML/css/style_tooltip.css" />
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>


<style type="text/css">
    #leftside {
        margin-top: 40px;
        margin-bottom: 40px;
    }

	 #leftside > button {
	    font-size: 10px;
	    text-align: center;
	    padding-right: 0px;
	    padding-left: 0px;
	    width: 65px;
	    height: 40px;
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
	
	input[type=checkbox] + label:before {     
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
    
    aside [class=fc-event] {
        line-height: 20px;
        width: 100px;
        color: white;
        border-radius: 3px;
        border: 1px solid;
    }
	
</style>
</head>
<body>
<script>

	// 현재 시각
	var now = "${sysdate}" // yy-mm-dd hh24:mi:ss dy
	var now_mm = now.substring(9, 14); // 현재 시간 + 분
	var now_time = now.substring(9, 11); // 현재 시간
	
	// 센터  배치도 바탕 만들기
    function allocateCenter() {
        var addButton = "";
        for (var i = 5; i >= 1; i--) {
            for (var j = 1; j <= 7; j++) {
                addButton += "<button class='btn v-btn' style='background-color: white' id='"+j+"__"+i+"'></button>"; // 
            } // for j
            addButton += "<br>";
        } // for i
        $("#leftside").append(addButton);
    }; 
        
    // 현재 DB에 저장되어 있는 스터디룸 배치하기 (room_x , room_y)
    function getStudyRoomLocation(){
        $.ajax({
            url: "/manage/studyroom/getStudyRoomLocation",
            type: "get",
            success: function(result) {
                $(result).each(function (index, item) {
                    $("#"+item.room_x+"__"+item.room_y+"").text("스터디룸"+item.studyroom_num);
                    $("#"+item.room_x+"__"+item.room_y+"").attr("style", "");
                }) // each
            } // success
        }) // ajax
        
    };
    
    // 스터디룸  배치도 바탕 만들기
    function allocateStudyRoom() {
        var addRow = "";
        for (var i = 7; i >= 1; i--) {
            for (var j = 1; j <= 10; j++) {
                addRow += "<button id='"+j+"_"+i+"'></button>";
            } // for j
            addRow += "<br>";
        } // for i
        $("#rightside").append(addRow);
    }; 
    
    // 페이지 로딩시
    $(function(){
        allocateCenter(); // 센터 배치도 바탕
        getStudyRoomLocation(); // 스터디룸 배치도
    });
    
    // 초기화
    // 예약 시작시간이 지나면 조회 불가 처리
    $(function (){
        // 버튼 초기화
        $("#leftside > button").removeClass();
        $("#leftside > button").addClass("btn v-btn");
        
        // 체크박스 초기화  
        if (now_time > '00' && now_time < '19') {
            $(".checkbox").each(function (index, item) {
                $(item).removeAttr("disabled") // 선택 가능한 상태에서만 전체 해제 가능
            }) // each
        } // if
        
        // 접속 시점 예약가능한 스터디룸 표시
             $.ajax({
                    url: "/manage/studyroom/nowAvailableRoom",
                    type: "get",
                    data: {"now_time":now_time},
                    success: function(result){
                        $(result).each(function(index, item) {
                            if (item.activate == 0) { // 비활성화 표시
                                $("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn v-midnight-blue");
                            } else if (now_mm >= '08:30' && now_mm < '18:59') { // 19시 이전
                                if (item.seven < item.count_seat || item.eight < item.count_seat || 
                                        item.nine < item.count_seat || item.ten < item.count_seat) {
                                    $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                                } else $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                            } else if (now_time == '19') { // 19시
                                if (item.eight < item.count_seat || item.nine < item.count_seat || item.ten < item.count_seat) {
                                    $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                                } else $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                            } else if (now_time == '20') { // 20시
                                if (item.nine < item.count_seat || item.ten < item.count_seat) {
                                    $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                                } else $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                            } else if (now_time == '21') { // 21시
                                if (item.ten < item.count_seat) {
                                    $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                                } else $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                            } else if (now_mm >= '22:00' || now_mm < '08:30') { // 비활성화 표시
                            	$("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                            }
                        }) // each
                    } // success
                }) // ajax
                
        // 현재 시간보다 작은 예약시간대 체크 박스 선택 불가 처리
        $(".checkbox").each(function (index, item) {
            if (now_time >= $(item).val()) { // 부등호 >= 로 바꾸기!!!!!!!!
                $(item).attr("disabled", true);
            } // if
        }) // each
    }); // 초기화
    
    // 스터디룸에 마우스 오버시
    $(document).on("mouseover", "#leftside > button", function(){ 
//         showInside($(this).text().substring(4,6))
        var studyroom_num = $(this).text().substring(4,6);
        
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

        if ($(this).css("background-color") == "rgb(255, 255, 255)") {
	    	document.getElementById("right_studyroom_num").innerHTML = "";
		} else document.getElementById("right_studyroom_num").innerHTML = "<h4>스터디룸 "+studyroom_num+"</h4>"; 
        
//      해당 스터디룸 배치
        $.ajax({ 
            url: "/manage/studyroom/getStudyRoomInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {
                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").text(item.sr_seat_num);
                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").attr("margin", "0px");
                    if (item.activate == 0) {
                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                        
                    } else if (now_mm <= '18:59') { // 19시 이전
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
            url: "/manage/studyroom/getSRFacilityInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {//*
                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y).text(item.facility_name);
                    if (item.activate == 0) {
                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                    } else  $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-peter-river");
                }) // each
            } // success
        }) // ajax
        
    }); // mouseover
    
	// 해당 스터디룸(studyroom_num)에 마우스 오버시 툴팁 띄우기
	function showInside(studyroom_num){
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
        
        // 스터디룸 번호, 처리 버튼 이름 표시 해제 
        if ($(this).css("background-color") == "rgb(255, 255, 255)") {
            document.getElementById("right_studyroom_num").innerHTML = "";
        } else document.getElementById("right_studyroom_num").innerHTML = "<h4>스터디룸 "+studyroom_num+"</h4>"; 
        
// 		해당 스터디룸 배치
		$.ajax({ 
            url: "/manage/studyroom/getStudyRoomInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {
                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").text(item.sr_seat_num);
                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").attr("margin", "0px");
                    if (item.activate == 0) {
                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                    } 
                    else if (item.activate == 0) {
                        $("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn v-midnight-blue");
                    } else if (item.seated_status == 4) {
                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn");
                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").css("background-color", "grey"); // 풀예약으로 예약 불가
                    } else $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-emerald");
                    
                }) // each
            } // success
        }) // ajax
        

        // 부대시설 표시 (칠판, 출입구 및 콘센트 등)
        $.ajax({
            url: "/manage/studyroom/getSRFacilityInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {//*
                    $("#rightside").children("#"+item.seat_x+"_"+item.seat_y).text(item.facility_name);
                    if (item.activate == 0) {
                        $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                    } else  $("#rightside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-peter-river");
                }) // each
            } // success
        }) // ajax
	}; // showInside
	
	// 해당 스터디룸(studyroom_num)에 마우스 클릭시 예약 페이지로 이동
	$(function() {
		$("#leftside > button").click(function() {
			
			if (this.getAttribute("class") == "btn v-btn v-midnight-blue") {
				alert("현재 사용이 불가한 스터디룸입니다. 다른 스터디룸을 이용하세요");
				return;
			} 
			else if ($(this).css("background-color") == "rgb(255, 255, 255)") { // 버튼색이 흰 색인 경우
				return;
			}
			var studyroom_num = $(this).text().substring(4,6);
			location.href="/manage/studyroom/reserveRoomForm?studyroom_num="+studyroom_num;
		});
	});
	
	// 체크박스 선택시 (시간대별 예약가능여부 조회, 복수 선택 가능)
	// 체크박스 전체 선택하기
	$(document).on("click", "#checkAll", function() {
	      if ($("#checkAll").is(":checked")) {
			$(".checkbox").each(function (index, item) {
				if (!($(item).is(":disabled"))) { // 선택 가능한 상태에서만 전체 선택 가능
					$(item).prop("checked", true); // 전체 선택 
				} // if
			}) // each
		} else {
			$(".checkbox").each(function (index, item) {
				if (!($(item).is(":disabled"))) { // 선택 가능한 상태에서만 전체 해제 가능
					$(item).prop("checked", false); // 전체 해제
				} // if
			}) // each
		} // else
	});
	
	// 체크박스 개별 선택시, 선택된 시간대 예약가능여부 조회하기
	$(document).on("click", "#submit", function() {
		var checkList = []; // 선택된 체크박스의 예약 시작 시간를 담을 배열
		$(".checkbox").each(function (index, item) {
			if ($(item).is(":checked")) { // 체크된 내역
				checkList.push($(item).val());
			} // if
		}) // each
		
		// 선택된 내역이 없을 경우, submit 취소
		if (checkList.length < 1) {
			alert("선택된 예약 내역이 없습니다.");
			return;
		} // if 
		
		// 22 ~ 8시 30분에는 조회 불가 처리
		if (now_mm >= "22:00" || now_time < "08:30") {
			alert("예약 이용시간이 아닙니다. 다시 확인해 주세요");
			$(".checkbox").each(function (index, item){
				$(item).prop("checked", false); // 체크박스 초기화
			}) // each
			$("#checkAll").prop("checked", false); // 체크박스 전체 선택 초기화
			return;
		}
		
		// 체크박스로 선택된 시간대 배열로 넘기기 (컨트롤러에서는 리스트로 받는다.)
		$.ajax({
			url: "/manage/studyroom/checkAvailableRoom", 
			type: "post",
			data: {"checkList":checkList},
			success: function(result) {
// 				checkList.sort(); // 선택 시간대 오름차순 정렬
				// 초기화
				$("#leftside > button").removeClass();
                $("#leftside > button").addClass("btn v-btn");
                
				$(result).each(function(index, item) {
					for (var i = 0; i < checkList.length; i++) {
						if (item.activate == 0) {
							$("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn v-midnight-blue");
                         } else {
								if (checkList.indexOf("19") != -1) { // 배열에 없으면 -1 반환
									if ($("#"+item.room_x+"__"+item.room_y).attr("class") != "btn v-btn no") {
										if (item.seven < item.count_seat) {
				                            $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
				                        } else {
				                        	$("#"+item.room_x+"__"+item.room_y).removeClass(); // 19시에 예약 불가
				                        	$("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn no"); // 19시에 예약 불가
				                        	$("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
				                        }
									} // class check
								} // if-19
                                if (checkList.indexOf("20") != -1) { // 배열에 없으면 -1 반환
                                    if ($("#"+item.room_x+"__"+item.room_y).attr("class") != "btn v-btn no") {
                                        if (item.eight < item.count_seat) {
                                            $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                                        } else {
                                            $("#"+item.room_x+"__"+item.room_y).removeClass(); // 20시에 예약 불가
                                            $("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn no"); // 20시에 예약 불가
                                            $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                                        }
                                    } // class check
                                } // if-20
                                if (checkList.indexOf("21") != -1) { // 배열에 없으면 -1 반환
                                    if ($("#"+item.room_x+"__"+item.room_y).attr("class") != "btn v-btn no") {
                                        if (item.nine < item.count_seat) {
                                            $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                                        } else {
                                            $("#"+item.room_x+"__"+item.room_y).removeClass(); // 21시에 예약 불가
                                            $("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn no"); // 21시에 예약 불가
                                            $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                                        }
                                    } // class check
                                } // if-21
                                if (checkList.indexOf("22") != -1) { // 배열에 없으면 -1 반환
                                    if ($("#"+item.room_x+"__"+item.room_y).attr("class") != "btn v-btn no") {
                                        if (item.ten < item.count_seat) {
                                            $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                                        } else {
                                            $("#"+item.room_x+"__"+item.room_y).removeClass(); // 22시에 예약 불가
                                            $("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn no"); // 22시에 예약 불가
                                            $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                                        }
                                    } // class check
                                } // if-22
					    } // else
					} // for
				}) // each
			alert("조회 결과")
			} // success
		}) // ajax
	});
	
	// 현시점 조회버튼 누르기
	 $(document).on("click", "#now_submit", function(){
		 alert("현시점 조회버튼 누르기")
		// 22시 이후에는 예약 가능 시간 경과로 조회X
		if (now_mm >= "22:00" || now_time < "08:30") {
			alert("예약 이용시간이 아닙니다. 다시 확인해 주세요");
			return;
		}
         $.ajax({
             url: "/manage/studyroom/nowAvailableRoom",
             type: "get",
             data: {"now_time":now_time},
             success: function(result){
                 $("#leftside > button").removeClass();
                 $("#leftside > button").addClass("btn v-btn");
                 $(result).each(function(index, item) {
                     if (item.activate == 0) {
                         $("#"+item.room_x+"__"+item.room_y).addClass("btn v-btn v-midnight-blue");
                     } else if (now_mm < '18:59') { // 19시 이전
                         if (item.seven < item.count_seat || item.eight < item.count_seat || 
                                 item.nine < item.count_seat || item.ten < item.count_seat) {
                             $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                         } $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                     } else if (now_time == '19') { // 19시
                         if (item.eight < item.count_seat || item.nine < item.count_seat || item.ten < item.count_seat) {
                             $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                         } else $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                     } else if (now_time == '20') { // 20시
                         if (item.nine < item.count_seat || item.ten < item.count_seat) {
                             $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                         } else $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                     } else if (now_time == '21') { // 21시
                         if (item.ten < item.count_seat) {
                             $("#"+item.room_x+"__"+item.room_y).addClass("v-emerald");
                         } else $("#"+item.room_x+"__"+item.room_y).css("background-color", "grey");
                     }
                 }) // each
             } // success
         }) // ajax
         
			$(".checkbox").each(function (index, item){
				$(item).prop("checked", false); // 체크박스 초기화
			}) // each
			$("#checkAll").prop("checked", false); // 체크박스 전체 선택 초기화
	 });
	
</script>
<%@ include file="../top.jsp" %>
        <div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="heading-text">
                            <h1>스터디룸 예약 현황</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="container">
<%--             <h5 style="text-align:right">현재 시각 : ${sysdate }</h5> --%>
                <!--Article-->
                    <article class="col-sm-9">
                        <div class="post-info clearfix">
                    <c:set var="now" value="${sysdate }"/>
                    <c:if test="${fn:substring(now, 18, 19) == '토'||fn:substring(now, 18, 19) == '일'}">
                        <h3>금일은 스터디룸 예약 이용시간이 아닙니다.</h3>
                    </c:if>
                    <c:if test="${fn:substring(now, 9, 13) < '08:30' && fn:substring(now, 9, 11) >= '22'}">
                        <h3>스터디룸 예약 이용시간이 아닙니다.</h3>
                    </c:if>
                        <span class="vcard author">
                            <div class="v-heading-v2" style="display: inline-block">
			                    <h4>시간대별 예약가능 현황</h4> 
			                </div>
                             
                            <table>
                                    <tr>
                                    <td><input type="checkbox" id="checkAll" value="99" /><label for="checkAll">전체</label></td>
                                    <td><input type="checkbox" id="checkbox1" class="checkbox" value="19" /><label for="checkbox1">7-8시</label></td>
                                    <td><input type="checkbox" id="checkbox2" class="checkbox" value="20" /><label for="checkbox2">8-9시</label></td>
                                    <td><input type="checkbox" id="checkbox3" class="checkbox" value="21" /><label for="checkbox3">9-10시</label></td>
                                    <td><input type="checkbox" id="checkbox4" class="checkbox" value="22" /><label for="checkbox4">10-11시</label></td>
                                    <td><input type="button" value="조회" id="submit" class="btn v-btn v-btn-default v-small-button"></td>
                                    <td>
                                        <input type="button" value="현시점 조회" id="now_submit" class="btn v-btn v-second-dark" 
                                          style="border-color:#f5245f; font-size:12px; color:#f5245f!important;">
                                    </td>
                                    </tr>
                            </table>
                            </span>
                        </div>
                    </article>
                    
                    <!--Right Sidebar-->
		            <aside class="sidebar right-sidebar col-sm-3">
		                <section class="widget v-search-widget clearfix">
		                    <div class="v-heading-v2 h5" style="display: inline-block">
		                        <h4>상태 색상 구분</h4>
		                    </div>
		                    <div style="text-align:justify;">
		                        <div style="display: inline-block;">
		                            <div class="fc-event" style="background-color:#2ecc71;">예약가능</div>
		                            <div class="fc-event" style="background-color:#FFA500;">현재 선택</div>

		                        </div>
		                        <div style="display: inline-block;">
		                            <div class="fc-event" style="background-color:#808080;">예약불가</div>
		                            <div class="fc-event" style="background-color:#2c3e50;">사용불가</div>
		                            <div class="fc-event" style="background-color:#3498db;">부대시설</div>
		                        </div>
		                </section>
		            </aside>
                </div>
        
                 <!--Article-->
            <section class="article-body-wrap">
         <div class="container">
<!-- 			    <div class="v-heading-v2" style="display: inline-block"> -->
<!--                     <h4>센터</h4> -->
<!--                 </div> -->
				<div id="leftside" class="v-gallery-widget col-sm-6"><!-- 센터 배치도  style="display: inline-block" --></div>
				<div class="v-heading-v2" style="display: inline-block;" id="right_studyroom_num">
					<!-- 스터디룸 + 번호 -->
				</div>
				<div id="rightside" class="v-gallery-widget col-sm-6"><!-- 스터디룸 배치도 style="display: inline-block;"  --></div>
		</div> <!-- container -->
            </section>
        

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
