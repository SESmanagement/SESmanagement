<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.manage.vo.StudyRoomVO" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>Nexus - Responsive HTML5 Bootstrap Template</title>
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
    
    <script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script> 
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">

    <!-- 별도 적용분 - 이후 삭제 처리 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
    
    
    
<style type="text/css">
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
        color: #FFF;  
        background:#f5245f;
        text-align: center;  
        line-height: 18px;  
    }
    
    #showCenter > button {
        font-size: 10px!important;
        text-align: center!important;
        padding-right: 1px!important;
        padding-left: 1px!important;
        margin-top: 0px!important;
        margin-bottom: 0px!important;
        width: 25px!important;
        height: 5px!important;
    }
    
    #printStudyRoom > button {
        font-size: 10px!important;
        text-align: center!important;
        padding-right: 1px!important;
        padding-left: 1px!important;
        margin-top: 0px!important;
        margin-bottom: 0px!important;
        width: 25px!important;
        height: 5px!important;
    }
    
</style>    
    
</head>
<body>

<script>
    var studyroom_checkList = [];
    var date_checkList = [];
    var etc_checkList = [];
    
    // First Modal - 스터디룸 선택
    $(document).on("click", "#searchSR", function() {
    	clickSearchSR();
    	// 확인 버튼 클릭시
    	$(document).on("click", "#studyroomSubmit", function() {
		 	var checkList = []; // 선택된 체크박스의 스터디룸 번호를 담을 배열
		 	$("#text-area_SR").empty();
    		$(".checkbox").each(function (index, item) {
                if ($(item).is(":checked")) { // 체크된 내역
                    checkList.push($(item).attr("id").substring(8,10));
                 } // if
            }) // each
            
            // 선택된 내역이 없을 경우, submit 취소
//             if (checkList.length < 1) {
//                 alert("선택된 내역이 없습니다.");
//                 return;
//             } // if 
            
            var addRow = "";
            for (var i = 0; i < checkList.length; i++) {
            	  addRow += "스터디룸 "+checkList[i]+" ";
			}
            $("#text-area_SR").append(addRow);
            studyroom_checkList = checkList;
            $("#next").attr("data-dissmiss", true); // ??????
            
    	}) // click-#studyroomSubmit
    }); // click-#searchSR
    
	// #searchSR 버튼 클릭시
	function clickSearchSR() {
		// rightside - 센터 배치도
		$("#showCenter").show(); // 센터 배치도 표시
		$("#showStudyRoom").hide(); // 해당 스터디룸 배치도 숨김
		$("#roleForm").empty();
		$("#showCenter").empty();
		document.getElementById("studyroom_title").innerHTML = "센터 배치도";
		var addButton = "";
		for (var i = 7; i >= 1; i--) {
			for (var j = 1; j <= 10; j++) {
				addButton += "<button class='btn v-btn' style='background-color: white' id='"+j+"__"+i+"'></button>";
			} // for j
			addButton += "<br>";
		} // for i
		$("#showCenter").append(addButton);

		// leftside - 스터디룸 텍스트 목록
		var addRow = "<input type='checkbox' id='checkAll'/><label for='checkAll'>전체</label>";
		$.ajax({
			url : "/manage/studyroom/getStudyRoomLocation",
			type : "get",
			success : function(result) {
				$(result).each(function(index, item) {
					addRow += "<div class='checkbox'>";
					addRow += "<input type='checkbox' class='checkbox' id='checkbox"+item.studyroom_num+"'/>";
					addRow += "<label for='checkbox"+item.studyroom_num+"'>스터디룸 " + item.studyroom_num+ "</label>";
					addRow += "</div>";

					$("#" + item.room_x + "__"+ item.room_y + "").text(item.studyroom_num);
					$("#" + item.room_x + "__"+ item.room_y + "").css("background-color", "");
					if (item.activate == 0) {
						$("#" + item.room_x+ "__"+ item.room_y+ "").addClass("btn v-btn v-midnight-blue");
					} else
						$("#" + item.room_x+ "__"+ item.room_y+ "").addClass("btn v-btn v-emerald");
				}) // each
				$("#roleForm").append(addRow);
			} // success
		}) // ajax
	};

	// 배치도 클릭시 해당 스터디룸 체크박스 선택
	$(document).on("click", "#showCenter > .v-btn", function() {
		if ($(this).css("background-color") == "rgb(255, 255, 255)") {
			return;
		}

		if ($("#checkbox" + $(this).text()).is(":checked")) {
			$("#checkbox" + $(this).text()).prop("checked", false);
			$("#showCenter").show(); // 센터 배치도 표시
			$("#showStudyRoom").hide(); // 해당 스터디룸 배치도 숨김
			document.getElementById("studyroom_title").innerHTML = "센터 배치도";
		} else {
			$("#checkbox" + $(this).text()).prop("checked", true);
		}
	});

	// 해당 스터디룸 배치
	function allocateStudyRoom(target) {
		$("#printStudyRoom").empty(); // 초기화
		$("#printSeatNum").empty(); // 초기화
		var studyroom_num = target.textContent.substring(4, 6);
		$("#showCenter").hide(); // 센터 배치도 숨김
		$("#showStudyRoom").show(); // 해당 스터디룸 배치도 표시
		var addRow = "";
		for (var i = 7; i >= 1; i--) {
			for (var j = 1; j <= 10; j++) {
				addRow += "<button class='btn v-btn' style='background-color: white' id='"+j+"_"+i+"'></button>";
			} // for j
			addRow += "<br>";
		} // for i
		$("#printStudyRoom").append(addRow);

		// 해당 스터디룸 배치
		$.ajax({
			url : "/manage/studyroom/getStudyRoomInfo",
			type : "post",
			data : {
				"studyroom_num" : studyroom_num
			},
			success : function(result) {
				$(result).each(
						function(index, item) {
							$("#printStudyRoom").children("#" + item.seat_x + "_" + item.seat_y + "").text(item.sr_seat_num);
							// $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").css("margin-right", 0);
							$("#printStudyRoom").children("#" + item.seat_x + "_" + item.seat_y + "").attr("margin", "0px");
							$("#printStudyRoom").children("#" + item.seat_x + "_" + item.seat_y + "").css("background-color", "");
							//                             if (item.activate == 0) {
							//                                 $("#showStudyRoom").children("#" + item.seat_x + "_" + item.seat_y+ "").addClass(
							//                                         "btn v-btn v-midnight-blue");
							//                             } else if (item.seated_status == 4) {
							//                                 $("#showStudyRoom").children("#" + item.seat_x + "_" + item.seat_y+ "").addClass("btn v-btn");
							//                                 $("#showStudyRoom").children("#" + item.seat_x + "_" + item.seat_y+ "").css("background-color","red"); // 풀예약으로 예약 불가
							//                             } else
							$("#printStudyRoom").children(
									"#" + item.seat_x + "_" + item.seat_y + "")
									.addClass("btn v-btn v-emerald");

						}) // each
			} // success
		}) // ajax

		// 부대시설 표시 (칠판, 출입구 및 콘센트 등)
		$.ajax({
			url : "/manage/studyroom/getSRFacilityInfo",
			type : "post",
			data : {
				"studyroom_num" : studyroom_num
			},
			success : function(result) {
				$(result).each(
						function(index, item) {//*
							$("#printStudyRoom").children(
									"#" + item.seat_x + "_" + item.seat_y)
									.text(item.facility_name);
							$("#printStudyRoom").children(
									"#" + item.seat_x + "_" + item.seat_y + "")
									.css("background-color", "");
							//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y).css("margin-right", 0);
							if (item.activate == 0) {
								$("#printStudyRoom").children(
										"#" + item.seat_x + "_" + item.seat_y
												+ "").addClass(
										"btn v-btn v-midnight-blue");
							} else
								$("#printStudyRoom").children(
										"#" + item.seat_x + "_" + item.seat_y
												+ "").addClass(
										"btn v-btn v-peter-river");
						}) // each
			} // success
		}) // ajax

	};

	// 스터디룸 텍스트 클릭시 해당 스터디룸 배치도 표시
	$(document)
			.on(
					"click",
					"label",
					function() {
						allocateStudyRoom(this);
						document.getElementById("studyroom_title").innerHTML = this.textContent;
					});

	// 체크박스 전체 선택하기
	$(document).on("click", "#checkAll", function() {
		if ($("#checkAll").is(":checked")) {
			$(".checkbox").each(function(index, item) {
				if (!($(item).is(":disabled"))) { // 선택 가능한 상태에서만 전체 선택 가능
					$(item).prop("checked", true); // 전체 선택 
				} // if
			}) // each
		} else {
			$(".checkbox").each(function(index, item) {
				if (!($(item).is(":disabled"))) { // 선택 가능한 상태에서만 전체 해제 가능
					$(item).prop("checked", false); // 전체 해제
				} // if
			}) // each
		} // else
		$("#showCenter").show(); // 센터 배치도 표시
		$("#showStudyRoom").hide(); // 해당 스터디룸 배치도 숨김
		document.getElementById("studyroom_title").innerHTML = "센터 배치도";
	});
	
	
	// Second Modal - 조회할 날짜 및 시간 선택
    $(function() {
        $('#fromDate').datetimepicker(
                {
                    format : 'Y/m/d H:00',
                    onShow : function(currentDateTime) {
                        this.setOptions({
                            maxDate : jQuery('#toDate').val() ? jQuery(
                                    '#toDate').val() : false
                        })
                    },
                    timepicker : true,
                    allowTimes:['19:00', '20:00', '21:00', '22:00'],
                });

        $('#toDate').datetimepicker(
                {
                    format : 'Y/m/d H:00',
                    onShow : function(currentDateTime) {
                        this.setOptions({
                            minDate : jQuery('#fromDate').val() ? jQuery(
                                    '#fromDate').val() : false
                        })
                    },
                    timepicker : true,
                    allowTimes:['19:00', '20:00', '21:00', '22:00'],
                });
    });
	
    $(document).on("click", "#dateSubmit", function() {
    	$("#text-area_date").empty();
        var fromDate = $("#fromDate").val();
        var toDate = $("#toDate").val();
        var addRow = "";
        addRow += fromDate
        date_checkList.push(fromDate);
        if (toDate != "") {
        	addRow += "~" + toDate;
        	date_checkList.push(toDate);
        }
        $("#text-area_date").append(addRow);
    }) // click-#dateSubmit
    
	
 // Third Modal - 기타 조건 선택 (+좌석번호)
    // 조건 삭제
    $(document).on("click", "#deleteLine", function() {
    	alert($("#tbody").children("tr").length)
    	if ($("#tbody").children("tr").length < 2){
    		alert("최소 1개의 조건이 필요합니다.")
    		return;
    	}
    	
    	// 테이블의 마지막 행 삭제
    	$("#tbody tr:last").remove();
    });
    
    // 조건 추가
    $(document).on("click", "#addLine", function() {
        if ($(".keyword").val() == ""){
            alert("검색할 조건을 입력하세요")
            return;
        }
        var addRow = "";
        addRow += "<tr><td>";
        addRow += "<select name='etc' class='option'><option value='sr_seat_num'>좌석번호</option><option value='name'>이름</option>";
        addRow += "<option value='student_num'>학번</option><option value='party_num'>기수</option></select></td>";
        addRow += "<td><input name='keyword' type='text' class='keyword'></td></tr>"
        
        $("#tbody").append(addRow);
    });
    
    // 조건별 숫자 입력 제한 (이름을 제외한 좌석번호, 학생번호, 기수는 숫자만 입력 가능)
    $(function() {
    	$(document).on("change", ".option", function() {
    		$(this).parent('td').siblings().children(".keyword").val("");
    	});
    	
    	$(".keyword").bind("focus", function() { // 
    		  //
          }).bind("blur", function() {
        	  if ($(".option").val() != "name") {
                  if (this.value.length != 0 && !$.isNumeric(this.value)) {
                	  alert("숫자만 입력 가능합니다.");
	                  this.value = "";
                  } // if
              } // if
          }) // blur
    });
    
    
    
 // 확인 버튼 클릭시
    $(document).on("click", "#etcSubmit", function() {
        $("#text-area_etc").empty();
        
        // 옵션리스트
        var optionList = [];
        $(".option").each(function(index, item) {
            optionList.push(item.value);
        }); //each-option
        
        // 키워드리스트
        var keywordList = [];
        $(".keyword").each(function(index, item) {
        	keywordList.push(item.value);
        }); // each-keyword
        
        var checkList = []; // 기타 조건을 배열
        for (var i = 0; i < optionList.length; i++) {
            if (keywordList[i] == ""){
                alert("검색할 조건을 입력하세요")
                return;
            }
        	checkList.push(optionList[i] +":"+ keywordList[i]);
		}
        
        var addRow = "";
        for (var i = 0; i < checkList.length; i++) {
        	  var array = checkList[i].split(":");
        	  var option = "";
        	  if (array[0] == "sr_seat_num") {
				option = "좌석번호";
			} else if (array[0] == "student_num") {
                option = "학번";
            } else if (array[0] == "name") {
                option = "이름";
            } else if (array[0] == "party_num") {
                option = "기수";
            }
              addRow += option+":"+array[1]+" <br>";
        }
        $("#text-area_etc").append(addRow);
        etc_checkList = checkList;
//         $("#next").attr("data-dissmiss", true); // ??????
    }) // click-#etcSubmit
    
    // 제출 버튼 누르기
    $(document).on("click", "#submit", function() {
    	var array = [];
//     	array.push($("#text-area_SR").text()+"_"+$("#text-area_date").text()+"_"+$("#text-area_etc").text());
    	array.push(studyroom_checkList+"_"+date_checkList+"_"+etc_checkList);
    	
    	var form = document.createElement("form");
    	form.setAttribute("method", "post");
    	form.setAttribute("action", "/manage/studyroom/getResvList");
    	for ( var key in array) {
			var hidden1 = document.createElement("input");
			hidden1.setAttribute("type", "hidden");
			hidden1.setAttribute("name", "studyroom_checkList");
			hidden1.setAttribute("value", studyroom_checkList);
			form.appendChild(hidden1);
			
	        var hidden2 = document.createElement("input");
	        hidden2.setAttribute("type", "hidden");
	        hidden2.setAttribute("name", "date_checkList");
	        hidden2.setAttribute("value", date_checkList);
	        form.appendChild(hidden2);
	        
            var hidden3 = document.createElement("input");
            hidden3.setAttribute("type", "hidden");
            hidden3.setAttribute("name", "etc_checkList");
            hidden3.setAttribute("value", etc_checkList);
            form.appendChild(hidden3);
		}
    	
    	document.body.appendChild(form);
    	form.submit();
    });
 
 // 조회 결과 페이징
    function pageProc(currentPage, studyroom_checkList_ctrl, date_checkList_ctrl, etc_checkList_ctrl) {
    	var array_ctrl = [];
    	array_ctrl.push(studyroom_checkList_ctrl+"_"+date_checkList_ctrl+"_"+etc_checkList_ctrl);
        
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", "/manage/studyroom/getResvList");
        for ( var key in array_ctrl) {
            var hidden1 = document.createElement("input");
            hidden1.setAttribute("type", "hidden");
            hidden1.setAttribute("name", "studyroom_checkList");
            hidden1.setAttribute("value", studyroom_checkList_ctrl);
            form.appendChild(hidden1);
            
            var hidden2 = document.createElement("input");
            hidden2.setAttribute("type", "hidden");
            hidden2.setAttribute("name", "date_checkList");
            hidden2.setAttribute("value", date_checkList_ctrl);
            form.appendChild(hidden2);
            
            var hidden3 = document.createElement("input");
            hidden3.setAttribute("type", "hidden");
            hidden3.setAttribute("name", "etc_checkList");
            hidden3.setAttribute("value", etc_checkList_ctrl);
            form.appendChild(hidden3);
            
            var hidden4 = document.createElement("input");
            hidden3.setAttribute("type", "hidden");
            hidden3.setAttribute("name", "currentPage");
            hidden3.setAttribute("value", currentPage);
            form.appendChild(hidden4);
        }
        
        document.body.appendChild(form);
        form.submit();
    }
 
</script>


<%@ include file="../top.jsp" %>
        <div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="heading-text">
                            <h1>스터디룸 예약내역 조회</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="container">
    <div class="row">
<!--========== First Modal ==========-->
<article class="col-md-4 well">
    <h3 class="page-header text-center">스터디룸 조회<br />
        <small>조회할 스터디룸 선택</small>
    </h3>
        <div id="text-area_SR" style="text-align:center"></div> <!-- 선택된 내역 표시 -->
    <hr> 
    <div class="text-center">
        <a class="btn btn-success" href="#successModal" data-toggle="modal" id="searchSR"><i class="glyphicon glyphicon-eye-open"></i> Start Quiz</a>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-header-success">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">[ × ]</button>
                    <h2><i class="glyphicon glyphicon-cloud"></i>   스터디룸 번호 선택</h2>
                </div>
                <div class="modal-body">
                    <div class="col-md-12 radio-choices">
                        <div class="col-md-6 col-xs-6 radio-left" style="width:30%">
                            <div id="roleForm">
                                <!-- 스터디룸 텍스트 목록 -->
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-6 radio-right" style="width:70%">
                            <h6  class="v-heading v-text-heading" style="display: inline-block"><span id="studyroom_title"></span></h6>
                            <div id="showCenter"></div> <!-- 센터 배치도 -->
                            <div id="showStudyRoom" style="width:70%"><!-- 스터디룸 배치도 -->
	                            <div id="printSeatNumber"></div>
	                            <div id="printStudyRoom" style="width:150%; margin-right: 0px;"></div> 
                            </div> <!-- #showStudyRoom -->
                            
                        </div>
                    </div><!-- ends col-12 -->

                </div><div class="clearfix" style="box-size:700px"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary pull-right" data-dismiss="modal" id="studyroomSubmit">Next</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</article>

<!--========== Second Modal ==========-->
<article class="col-md-4 well">
    <h3 class="page-header text-center">날짜 및 시간 조회<br />
        <small>조회할 날짜 및 시간 선택</small>
    </h3>
    <div id="text-area_date" style="text-align:center"></div> <!-- 선택된 내역 표시 -->
    <hr>
    <div class="text-center">
        <a class="btn btn-warning" href="#warningModal" data-toggle="modal" id="searchDate"><i class="glyphicon glyphicon-briefcase"></i> Add Contact</a>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="warningModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-header-warning">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h2><i class="glyphicon glyphicon-user"></i>   날짜 및 시간 조회</h2>
                </div>
                <div class="modal-body">
                    <div class="col-md-12 radio-choices">
                        <div class="col-md-6 col-xs-6 radio-left">
<!--                             <form role="form" action=""> -->
                            <div class="radio">
                                <label>조회시작일자</label>
                            </div>
                            <div class="radio">
                                <label>조회종료일자</label>
                            </div>
                        </div>

                        <div class="col-md-6 col-xs-6 radio-right">
                            <div class="radio">
                                <input type="text" id="fromDate">
                            </div>
                            <div class="radio">
                                <input type="text" id="toDate">
                            </div>
<!--                             </form> -->
                        </div>
                    </div><!-- ends col-12 -->

                </div><div class="clearfix"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary pull-right" data-dismiss="modal" id="dateSubmit">Submit</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</article>

<!--========== Third Modal ==========-->
<article class="col-md-4 well">
    <h3 class="page-header text-center">기타 조건 조회<br />
        <small>그 외 기타 조건 선택</small>
    </h3>
     <div id="text-area_etc" style="text-align:center"></div> <!-- 선택된 내역 표시 -->
    <hr>
    <div class="text-center">
        <a class="btn btn-primary" href="#primaryModal" data-toggle="modal"><i class="glyphicon glyphicon-shopping-cart"></i> Shopping Cart</a>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="primaryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-header-primary">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> [ × ] </button>
                    <h2><i class="glyphicon glyphicon-shopping-cart"></i>   기타 조건 조회</h2>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                      <div class="table-responsive">
<!--                         <form action="" method="" name=""> -->
                        <table class="table table-condensed"><thead>
                        <tr>
                        <th>조건 선택</th>
                        <th>조건 입력</th>
                        </tr></thead>
                        <tbody id="tbody">
                        <tr>
                        <td>
                        <select name='option' class="option">
                            <option value='sr_seat_num'>좌석번호</option>
                            <option value='name'>이름</option>
                            <option value='student_num'>학번</option>
                            <option value='party_num'>기수</option>
                        </select>
                        </td>

                        <td>
                        <input name="keyword" type="text" class="keyword">
                        </td>
                        
                        </tr>
                        </tbody></table>
<!--                         </form> -->
                           <button id="addLine" class="btn v-btn v-btn-default v-small-button">조건 추가</button>
                           <button id="deleteLine" class="btn v-btn v-small-button v-second-dark"
                                style="border-color:#f5245f; color:#f5245f!important;">조건 삭제</button>
                      </div>
                    </div><!-- ends col-12 -->

                </div><div class="clearfix"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary pull-right" data-dismiss="modal" id="etcSubmit">Continue Shopping</button>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</article>

<!--========== 제출 버튼 어디에 두지?? ==========-->
<article class="col-md-4 well">
    <button id="submit" class="btn v-btn v-btn-default large pink standard">버튼</button>
</article>
    </div> <!-- row -->
<div id="resultside" style="text-align: center"> <!-- 검색 결과 내역 -->
	<table>
		<tr>
			<th>조회번호</th>
			<th>예약일자</th>
			<th>예약시간</th>
			<th>스터디룸</th>
			<th>좌석번호</th>
			<th>이름</th>
			<th>학번</th>
			<th>기수</th>
		</tr>
	<c:if test="${empty resvList}">
		<tr><td colspan="6">검색 내역이 없습니다.</td></tr>
	</c:if>
	<c:if test="${!empty resvList}">
    <c:forEach items="${resvList}" var="vo" varStatus="status">
    <c:set var="start_time" value="${vo.start_time }"></c:set>
        <tr>
            <td>${(navi.totalRecordsCount - status.index) - ((navi.currentPage - 1) * navi.countPerPage)}</td>
            <td>${fn:substring(start_time, 0, 6)}</td>
            <td>${fn:substring(start_time, 7, 9)}:00</td>
            <td>${vo.studyroom_num}</td>
            <td>${vo.sr_seat_num}</td>
            <td>${vo.name}</td>
            <td>${vo.student_num}</td>
            <td>${vo.party_num}</td>
        </tr>
    </c:forEach>
        <tr>
            <td id="navigator" colspan="6">
                <a href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, ${studyroom_checkList}, ${date_checkList}, ${etc_checkList})">◁◁ </a>
                <a href="javascript:pageProc(${navi.currentPage - 1}, ${studyroom_checkList}, ${date_checkList}, ${etc_checkList})">◀</a>
            
                <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
                    <c:if test="${counter == navi.currentPage}"><b></c:if>
                        <a href="javascript:pageProc(${counter}, ${studyroom_checkList}, ${date_checkList}, ${etc_checkList})">${counter}</a>
                    <c:if test="${counter == navi.currentPage}"></b></c:if>
                </c:forEach>
                <a href="javascript:pageProc(${navi.currentPage + 1}, ${studyroom_checkList}, ${date_checkList}, ${etc_checkList})">▶</a>
                <a href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, ${studyroom_checkList}, ${date_checkList}, ${etc_checkList})">▷▷</a>
            </td>
        </tr>
	</c:if>
    </table>

</div> <!-- #resultside -->

</div> <!-- container -->


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
    <!--  -->
</body>

    <!-- datetimepicker -->
    <link rel="stylesheet" href="/manage/resources/date/jquery.datetimepicker.css" />
<!--     <script src="/manage/resources/date/jquery.datetimepicker.min.js"></script> -->
    <script src="/manage/resources/js/jquery.datetimepicker.full.min.js"></script>

</html>
