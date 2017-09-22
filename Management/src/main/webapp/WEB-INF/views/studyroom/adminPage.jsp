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
<meta charset="UTF-8">
	<title>관리자-스터디룸 관리</title>
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
.leftside {
  float: left;
  width: 60%;
}
.rightside {
  float: right;
  width: 40%;
/*   margin-top: 20%; */
}
.topside {
  float: top;
  height: 230px;
}
.bottomtside {
  float: bottom;
  height: 455px;
}

section {
	padding: 20px;
	display: inline-block;
}

 #outside > button {
 	font-size: 10px;
 	text-align: center;
 	padding-right: 0px;
 	padding-left: 0px;
 	width: 55px;
 	height: 25px;
 }
 
  #inside > button {
	border: none;
 	padding-left: 0px;
	padding-right: 0px;
 	margin-right: 2px;
 	margin-left: 2px;
	width: 51px;
	height: 46px;
 }
 
 table {
    border-collapse: collapse;
    border-spacing: 0;
    font-size: 14px;
    line-height: 2;
 }
 
 .v-small-button {
 	padding-left: 2px;
 	padding-right: 2px;
 }
 
</style>
</head>
<body>
<script>
	// 처리 완료 메세지
	if ("${param.result}" != null) {
		if ("${param.result}" == "true" ) {
			alert("처리가 성공적으로 완료되었습니다.");
			
		} else if ("${param.result}" == "false") {
			alert("처리에 실패했습니다. 다시 확인해 주세요");
		} else if ("${param.result}" == "duplicated") {
			alert("중복된 스터디룸 또는 좌석 번호입니다. 다시 확인해 주세요");
		}
	};

	// 센터  배치도 바탕 만들기
	function allocateCenter() {
		var addButton = "";
		for (var i = 5; i >= 1; i--) {
			for (var j = 1; j <= 7; j++) {
				addButton += "<button class='btn v-btn v-concrete' id='"+j+"__"+i+"'></button>";
			} // for j
			addButton += "<br>";
		} // for i
		$("#outside").append(addButton);
	}; 
		
	// 스터디룸  배치도 바탕 만들기
	function allocateStudyRoom() {
		var addButton = "";
		for (var i = 7; i >= 1; i--) {
			for (var j = 1; j <= 10; j++) {
				addButton += "<button id='"+j+"_"+i+"'></button>";
			} // for j
			addButton += "<br>";
		} // for i
		$("#inside").append(addButton);
	}; 
	
	
	// 현재 DB에 저장되어 있는 스터디룸 배치하기 (room_x , room_y)
	function getStudyRoomLocation(){
	    $.ajax({
	        url: "/manage/studyroom/getStudyRoomLocation",
	        type: "get",
	        success: function(result) {
	            $(result).each(function (index, item) {
	                $("#"+item.room_x+"__"+item.room_y+"").text("스터디룸"+item.studyroom_num);
	                $("#"+item.room_x+"__"+item.room_y+"").removeClass("v-concrete");
	                if (item.activate == 0) {
	                	$("#"+item.room_x+"__"+item.room_y+"").addClass("v-midnight-blue");
	                } else $("#"+item.room_x+"__"+item.room_y+"").addClass("v-emerald");
	            }) // each
	        } // success
	    }) // ajax
		
	};
	
	// 페이지 로딩시
	$(function(){
		allocateCenter(); // 센터 배치도 바탕
		allocateStudyRoom(); // 스터디룸 배치도 바탕
		getStudyRoomLocation(); // 스터디룸 배치도
		$(".bottomside").hide();
	}); // 페이지 로딩시
	
	// 해당 스터디룸을 클릭하면 스터디룸의 좌석 배치 페이지를 호출 및 좌석 배치
	var studyroom_num = 0; // 스터디룸 번호
	var sr_xy = ""; // 스터디룸 좌표
	
	function clickOutside() {
		// inside 버튼 초기화
        $("#inside").children("button").removeClass();
        $("#inside").children("button").text("");
        $("#inside").children("button").css("width", "51px");
        $("#inside").children("button").css("height", "46px");
        
        studyroom_num = $(this).text().substring(4,6); // 스터디룸 번호
        sr_xy = $(this).attr("id");
        alert("클릭아웃사이드: " + studyroom_num)
        
        $.ajax({
            url: "/manage/studyroom/getStudyRoomInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {
                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").text(item.sr_seat_num);
//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").css("margin-right", 0);
                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").attr("margin", "0px");
                    if (item.activate == 0) {
                        $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                    } else $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-emerald");
                }) // each
            } // success
        }) // ajax
        
        // html에 표시할 스터디룸 번호 표시 
        document.getElementById("outside_studyroom_num").innerHTML = "스터디룸" + studyroom_num; 
        
        // 부대시설 표시 (칠판, 출입구 및 콘센트 등)
        $.ajax({
            url: "/manage/studyroom/getSRFacilityInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {//*
                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y).text(item.facility_name);
//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y).css("margin-right", 0);
                    if (item.activate == 0) {
                        $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                    } else  $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-peter-river");
                }) // each
            } // success
        }) // ajax
	} // clickOutside
	
	$(document).on("click", "#outside > button", function() {
		// 빈 셀 선택시 bottomside를 숨긴다. (해당 스터디룸 표시 부분)
	    if (this.getAttribute("class") == "btn v-btn v-concrete") {
	        $("#left-bottom").hide(); // bottomside의 해당 스터디룸 배치도 숨김
	        $("#right-bottom").hide(); // bottomside의 해당 스터디룸 처리버튼 숨김
	        return;
	    }
		
	    // 빈 셀 선택시 변화X
		if (this.getAttribute("class") == "" ||
            this.getAttribute("class") == "btn v-btn v-orange") {return;} 
			
		$("#left-bottom").show(); // 해당 스터디룸 배치도 표시
		$("#right-bottom").show(); // 해당 스터디룸 처리버튼 표시
		
		
	      // inside 버튼 초기화
        $("#inside").children("button").removeClass();
        $("#inside").children("button").text("");
        $("#inside").children("button").css("width", "51px");
        $("#inside").children("button").css("height", "46px");
        
        studyroom_num = $(this).text().substring(4,6); // 스터디룸 번호
        sr_xy = $(this).attr("id");
        
        $.ajax({
            url: "/manage/studyroom/getStudyRoomInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {
                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").text(item.sr_seat_num);
//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").css("margin-right", 0);
                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").attr("margin", "0px");
                    if (item.activate == 0) {
                        $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                    } else $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-emerald");
                }) // each
            } // success
        }) // ajax
        
        // html에 표시할 스터디룸 번호 표시 
        document.getElementById("outside_studyroom_num").innerHTML = "스터디룸" + studyroom_num; 
        
        // 부대시설 표시 (칠판, 출입구 및 콘센트 등)
        $.ajax({
            url: "/manage/studyroom/getSRFacilityInfo",
            type: "post",
            data : {"studyroom_num":studyroom_num},
            success: function(result) {
                $(result).each(function (index, item) {//*
                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y).text(item.facility_name);
//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y).css("margin-right", 0);
                    if (item.activate == 0) {
                        $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
                    } else  $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-peter-river");
                }) // each
            } // success
        }) // ajax
	});
	
    // 처리 버튼 초기화
    function initiateBtn() {
        $("#inactivateBottom").removeAttr("disabled");
        $("#addBottom").removeAttr("disabled");
        $("#dropBottom").removeAttr("disabled");
        $("#okBottom").attr("disabled", "disabled");
        $("#cancelBottom").attr("disabled", "disabled");
        
        $("#inactivateTop").removeAttr("disabled");
        $("#addTop").removeAttr("disabled");
        $("#dropTop").removeAttr("disabled");
        $("#okTop").attr("disabled", "disabled");
        $("#cancelTop").attr("disabled", "disabled");
    };
    
    // 선택된 셀 저장 리스트 초기화
    function initiateList() {
        var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
        var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
        var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
        $("#selectedBottomTb").empty(); // 테이블 초기화 
        $("#selectedTopTb").empty(); // 테이블 초기화
    };
	
	// 처리 버튼을 클릭 후 선택된 셀 저장 리스트
	var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
	var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
	var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
	$("#selectedBottomTb").empty(); // 테이블 초기화
	$("#selectedTopTb").empty(); // 테이블 초기화
	
	// 처리 버튼 클릭시 
	$(document).on("click", ".v-small-button", function() { 
		// 해당 스터디룸 내 처리
		// bottomside의 비활성화 버튼 클릭시
	    if (this.id == "inactivateBottom") {
			alert("inactivateBottom")
			// 테이블 및 리스트 초기화
			var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
	        var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
	        var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
	        $("#selectedBottomTb").empty(); // 테이블 초기화
			
			// 버튼 처리
	        $("#inactivateBottom").attr("disabled", "disabeld");
	        $("#addBottom").attr("disabled", "disabeld");
	        $("#dropBottom").attr("disabled", "disabeld");
	        $("#okBottom").removeAttr("disabled");
	        $("#cancelBottom").removeAttr("disabled");
	        
	        $("#inactivateTop").attr("disabled", "disabled");
	        $("#addTop").attr("disabled", "disabled");
	        $("#dropTop").attr("disabled", "disabled");
	        $("#okTop").attr("disabled", "disabled");
	        $("#cancelTop").attr("disabled", "disabled");
			
			// 테이블 생성
	        var addRow = "<tr><td>스터디룸 번호</td><td>좌석 번호</td><td>현재 상태</td><td>변경 내용</td></tr>";
	        $("#selectedBottomTb").append(addRow);
	        // 처리 버튼 이름 표시 
	        document.getElementById("bottom_btn_name").innerHTML = "좌석/부대시설 비활성화"; 
	
	        
	        // 셀 선택
	//         $(document).on("click", "#inside > button", function() {
	         $("#inside > button").on("click", function () {
	            if (this.getAttribute("class") == "" ||
	            	this.getAttribute("class") == "btn v-btn v-orange") {return;} // 빈 셀 선택시 변화X  
	            
	            // 테이블에 추가하기
	            addRow = "<tr id='"+studyroom_num + "o" + this.textContent + "o" + this.id + "o"+ sr_xy +"'><td>"+studyroom_num+"</td><td>"+this.textContent+"</td>";
	            if (this.getAttribute("class") == "btn v-btn v-emerald") { // 현재 사용가능 셀 선택시
	            	selectedClassList.push(this.getAttribute("class"));
	                this.classList.remove("v-emerald");
	                addRow += "<td>사용 가능</td><td>사용 불가</td>";
	                
	            } else if (this.getAttribute("class") == "btn v-btn v-midnight-blue") { // 현재 비활성화 셀 선택시
	                selectedClassList.push(this.getAttribute("class"));
	                this.classList.remove("v-midnight-blue");
	                addRow += "<td>사용 불가</td><td>사용 가능</td>";
	                
	            } else if (this.getAttribute("class") == "btn v-btn v-peter-river") { // 현재 사용가능 시설 셀 선택시
	                selectedClassList.push(this.getAttribute("class"));
	                this.classList.remove("v-peter-river");
	                addRow += "<td>사용 가능</td><td>사용 불가</td>";
	            }
	            
	            this.classList.add("v-orange");
	            selectedList.push(studyroom_num + "o" + this.textContent + "o" + this.id + "o"+ sr_xy);
	            selectedIdList.push(this.id);
	            
	            addRow += "</tr>";
	            $("#selectedBottomTb").append(addRow);
	            
	        });   // click - #inside > button
	        
	            
	        // bottomside의 취소 버튼 클릭
		    $(document).on("click", "#cancelBottom", function() {
		            // 리스트 초기화
		            initiateList();
		            // 버튼 초기화
		            initiateBtn();
		            $("#inside").empty(); // inside 섹션부분 초기화
		            allocateStudyRoom(); // 스터디룸 배치도 바탕
		            getStudyRoomLocation(); // 스터디룸 배치도
		            
		            // 버튼 클릭 이벤트 해제
		            $("#inside > button").off("click", "*");
		            
		            // 스터디룸 번호, 처리 버튼 이름 표시 해제
		            document.getElementById("bottom_btn_name").innerHTML = ""; 
		            document.getElementById("outside_studyroom_num").innerHTML = ""; 
		            return;
		    }); // cancelBottom
		    
	        // bottomside의 확인 버튼 클릭
            $(document).on("click", "#okBottom", function() {
                if (selectedList.length < 1) {
                    alert("선택된 좌석이 없습니다. 다시 확인해 주세요")
                    return;
                }
//                 $("#okBottom").attr("type", "submit");
//                 $("#fmBottom").attr("action", "/manage/studyroom/inactivateSR_Seat?selectedList="+selectedList);
                $("#selectedListBottom").val(selectedList);
                $("#fmBottom").attr("action", "/manage/studyroom/inactivateSR_Seat");
                $("#fmBottom").submit();
            }); // okBottom
	        
	    }; // bottomside의 비활성화 버튼 클릭시
		
	    // inside의이미 선택된 셀(.v-orange) 선택시
	    $(document).on("mousedown", "#inside > .v-orange", function() {
	         alert("선택이 취소됩니다.");
	         var removeIndex = selectedIdList.indexOf(this.id); // 선택 셀의 인덱스값 확인
	         var removeRow = selectedList[removeIndex]; // 테이블에서 선택 셀의 값 확인
	         selectedList.splice(removeIndex, 1); // 배열에서 선택 셀 삭제 (스터디룸번호:좌석번호)
	         selectedIdList.splice(removeIndex, 1); // 배열에서 선택 셀 삭제 (id-좌표)
	         
	         // 테이블에서 선택 셀의 값 삭제, tr id = studyroom_num + "o" + this.textContent + "o" + this.id 
	         $('#'+removeRow).remove();
	               
	         this.classList.remove("v-orange");
	         var className = selectedClassList[removeIndex]; // 배역에서 선택 셀의 기존 클래스 확인
	         selectedClassList.splice(removeIndex, 1); // 배열에서 선택 셀 삭제 (기존 클래스네임-버튼색)
	         
	         // 이전 클래스로 되돌리기
	         if ($.isNumeric(this.textContent)) { // true면 숫자
	            if (className == "btn v-btn v-emerald") {
	                this.classList.add("v-emerald");
	            } else if (className == "btn v-btn v-midnight-blue") {
	                this.classList.add("v-midnight-blue");
	            } else if (!$.isNumeric(this.textContent)) {
	                   if (className == "btn v-btn v-peter-river") {
	                       this.classList.add("v-peter-river");
	                   } else if (className == "btn v-btn v-midnight-blue") {
	                       this.classList.add("v-midnight-blue");
	                   }
	            } // else-isNumeric
	         } // if-isNumeric
	         
	         // 등록 시도 후 선택 취소 할 경우 입력한 텍스트 삭제 및 이전 클래스("")로 되돌리기
             if (className == "btn v-btn v-sunflower") {
                 this.textContent = "";
                 this.classList.remove("v-sunflower");
                 this.classList.remove("v-btn");
                 this.classList.remove("btn");
             } // if 
	     }); // click-inside > orange 
	           
	     // bottomside의 등록 버튼
	       if (this.id == "addBottom") {
	          alert("addBottom")
	          // 테이블 및 리스트 초기화
	          var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
	          var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
	          var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
	          $("#selectedBottomTb").empty(); // 테이블 초기화
	               
	          // 버튼 처리
	          $("#inactivateBottom").attr("disabled", "disabeld");
	          $("#addBottom").attr("disabled", "disabeld");
	          $("#dropBottom").attr("disabled", "disabeld");
	          $("#okBottom").removeAttr("disabled");
	          $("#cancelBottom").removeAttr("disabled");
	          
	          $("#inactivateTop").attr("disabled", "disabled");
	          $("#addTop").attr("disabled", "disabled");
	          $("#dropTop").attr("disabled", "disabled");
	          $("#okTop").attr("disabled", "disabled");
	          $("#cancelTop").attr("disabled", "disabled");
	        	   
	          // 테이블 생성
	          var addRow = "<tr><td>스터디룸 번호</td><td>좌석번호/시설명</td><td>x 위치</td><td>y 위치</td></tr>";
	          $("#selectedBottomTb").append(addRow);
	          // 처리 버튼 이름 표시 
	          document.getElementById("bottom_btn_name").innerHTML = "좌석/부대시설 등록"; 

	          // 셀 선택
// 	          $(document).on("click", "#inside > button", function() {
	          $("#inside > button").on("click", function () {
	              if (this.getAttribute("class") == "btn v-btn v-emerald" ||
	              this.getAttribute("class") == "btn v-btn v-midnight-blue" ||
	              this.getAttribute("class") == "btn v-btn v-peter-river") {return;}  // class를 가진 셀 선택시 변화X  
	               
	              if (this.getAttribute("class") == "") { // 빈 셀 선택시
	                    this.classList.add("btn");
	                    this.classList.add("v-btn");
	                    this.classList.add("v-sunflower");
	                    selectedClassList.push(this.getAttribute("class")); // sunflower로 들어가지만 실제는 클래스 없음!!!!!!!
	              
	            	    $(this).append("<input type='text' class='inputNum' style='text-align:center'>"); // 좌석 번호 또는 부대시설 명칭 입력
	            	    
	            	    var inputNum = "";
	            	    
// 	            	    // 선택 셀에 마우스 커서
		            	$(this).children("input").bind("focus", function() { // 
// 		            	    $(this).children("input").focus(); // 마우스 커서가 안들어 오는데???????
		            	
		            	}).bind("blur", function() {
		            	     inputNum = $(this).val();
		            	     var blank = /\s/g;
		            	     while (inputNum.match(/o/) != null || inputNum.match(blank)) {
		            	    	 alert("영어 /o/나 공백은 입력할 수 없습니다. 다시 확인해주세요")
		            	    	 this.value = "";
		            	    	 return;
		            	     }
		            	     
				             var buttonId = $(this).parent(".v-sunflower").attr("id");		
				              if (inputNum != "") { // 좌석 번호 또는 시설 이름 입력
					              var idArray = buttonId.split("_");
					              addRow = "<tr id='"+studyroom_num + "o" + inputNum + "o" + buttonId + "o" + sr_xy + "'><td>"+studyroom_num+"</td><td>"+inputNum+"</td><td>"+idArray[0]+"</td><td>"+idArray[1]+"</td>";
				                       
						          $("#"+buttonId).removeClass();          
						          $("#"+buttonId).addClass("btn v-btn v-orange");
						          $("#"+buttonId).text(inputNum);
						          $("#"+buttonId).children("input").remove();
						          
					              selectedList.push(studyroom_num + "o" + inputNum + "o" + buttonId + "o" + sr_xy);
					              selectedIdList.push(buttonId);
					              
					              addRow += "</tr>";
					              $("#selectedBottomTb").append(addRow);
				              
				              } else if (inputNum == "") { // 좌석 번호 또는 시설 이름 미입력시 선택 취소 처리
				            	  $("#"+buttonId).removeClass();
				            	  $("#"+buttonId).children("input").remove();
				              }
		            	}); // bind
	              } // if-class=""
	           }) // click
	           
	            // bottomside의 확인 버튼 클릭
	            $(document).on("click", "#okBottom", function() {
	            	alert("add > ok")
	                if (selectedList.length < 1) {
	                    alert("선택된 좌석이 없습니다. 다시 확인해 주세요")
	                    return;
	                }
// 	                $("#okBottom").attr("type", "submit");
// 	                $("#fmBottom").attr("action", "/manage/studyroom/addSR_Seat?selectedList="+selectedList);
	                $("#selectedListBottom").val(selectedList);
	                $("#fmBottom").attr("action", "/manage/studyroom/addSR_Seat");
	                $("#fmBottom").submit();
	            }); // okBottom
	            
	          // bottomside의 취소 버튼 클릭
	            $(document).on("click", "#cancelBottom", function() {
// 	                    // 리스트 초기화
// 	                    selectedList = [];
// 	                    selectedIdList = [];3
// 	                    selectedClassList = [];
// 	                    // 테이블 초기화
// 	                    $("#selectedBottomTb").empty();
                        // 리스트 및 테이블 초기화
                        initiateList();
	                    // 버튼 초기화
	                    initiateBtn();
	                    $("#inside").empty(); // inside 섹션부분 초기화
	                    allocateStudyRoom(); // 스터디룸 배치도 바탕
	                    getStudyRoomLocation(); // 스터디룸 배치도
	                    
	                    // 버튼 클릭 이벤트 해제
	                    $("#inside > button").off("click", "*");
	                    
	                    // 스터디룸 번호, 처리 버튼 이름 표시 해제
	                    document.getElementById("bottom_btn_name").innerHTML = ""; 
	                    document.getElementById("outside_studyroom_num").innerHTML = ""; 
	                    return;
	            }); // cancelBottom
	            
	       }// addBottom
	       
	      // bottomside의 삭제 버튼 클릭시
	      if (this.id == "dropBottom") {
	    	  alert("dropBottom")
	            // 테이블 및 리스트 초기화
	            var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
	            var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
	            var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
	            $("#selectedBottomTb").empty(); // 테이블 초기화
	            
	            // 버튼 처리
	            $("#inactivateBottom").attr("disabled", "disabeld");
	            $("#addBottom").attr("disabled", "disabeld");
	            $("#dropBottom").attr("disabled", "disabeld");
	            $("#okBottom").removeAttr("disabled");
	            $("#cancelBottom").removeAttr("disabled");
	            
	            $("#inactivateTop").attr("disabled", "disabled");
	            $("#addTop").attr("disabled", "disabled");
	            $("#dropTop").attr("disabled", "disabled");
	            $("#okTop").attr("disabled", "disabled");
	            $("#cancelTop").attr("disabled", "disabled");
	            
	            // 테이블 생성
	            var addRow = "<tr><td>스터디룸 번호</td><td>좌석 번호</td><td>현재 상태</td><td>변경 내용</td></tr>";
	            $("#selectedBottomTb").append(addRow);
	            // 처리 버튼 이름 표시 
	            document.getElementById("bottom_btn_name").innerHTML = "좌석/부대시설 삭제"; 
	            
	            $("#inside > button").on("click", function () {
	                if (this.getAttribute("class") == "" ||
	                    this.getAttribute("class") == "btn v-btn v-orange") {return;} // 빈 셀 선택시 변화X  
	                
	                // 테이블에 추가하기
	                addRow = "<tr id='"+studyroom_num + "o" + this.textContent + "o" + this.id +"'><td>"+studyroom_num+"</td><td>"+this.textContent+"</td>";
	                if (this.getAttribute("class") == "btn v-btn v-emerald") { // 현재 사용가능 셀 선택시
	                    selectedClassList.push(this.getAttribute("class"));
	                    this.classList.remove("v-emerald");
	                    addRow += "<td>등록</td><td>삭제</td>";
	                    
	                } else if (this.getAttribute("class") == "btn v-btn v-midnight-blue") { // 현재 비활성화 셀 선택시
	                    selectedClassList.push(this.getAttribute("class"));
	                    this.classList.remove("v-midnight-blue");
	                    addRow += "<td>등록</td><td>삭제</td>";
	                    
	                } else if (this.getAttribute("class") == "btn v-btn v-peter-river") { // 현재 사용가능 시설 셀 선택시
	                    selectedClassList.push(this.getAttribute("class"));
	                    this.classList.remove("v-peter-river");
	                    addRow += "<td>등록</td><td>삭제</td>";
	                }
	                
	                this.classList.add("v-orange");
	                selectedList.push(studyroom_num + "o" + this.textContent + "o" + this.id);
	                selectedIdList.push(this.id);
	                
	                addRow += "</tr>";
	                $("#selectedBottomTb").append(addRow);
	            }) // click - #inside > button
	            
	            // bottomside의 확인 버튼 클릭
                $(document).on("click", "#okBottom", function() {
                    if (selectedList.length == 0) {
                        alert("선택된 좌석이 없습니다. 다시 확인해 주세요")
                        return;
                    } else {
	                    $.ajax({
	                        url: "/manage/studyroom/showInside",
	                        data: {"studyroom_num":studyroom_num},
	                        success: function(result) { // 버튼을 두번 눌러야 함
	                        	if (result.length > 1 || !$.isNumeric(selectedList[0].split("o")[1])) {
// 						            $("#okBottom").attr("type", "submit");
// 	                                $("#fmBottom").attr("action", "/manage/studyroom/dropSR_Seat?selectedList="+selectedList);
				                    $("#selectedListBottom").val(selectedList);
	                                $("#fmBottom").attr("action", "/manage/studyroom/dropSR_Seat");
	                                $("#fmBottom").submit();
	                                
	                        	} else {
	                                alert("최소 1개의 좌석이 필요하여 삭제가 불가합니다.") 
	                                // 클래스-버튼 색 되돌리기
	                                alert("id: #"+selectedIdList[0])
	                                $("#"+selectedIdList[0]).removeClass();
	                                $("#"+selectedIdList[0]).addClass(selectedClassList[0]);
	                                
	                                initiateBtn(); // 버튼 초기화
	                                initiateList() // 테이블 및 리스트 초기화
	                                
// 	                                // 리스트 초기화
// 	                                selectedList = [];
// 	                                selectedClassList = [];
// 	                                selectedIdList = [];
// 	                                // 테이블 초기화
// 	                                $("#selectedBottomTb").empty();
	                                
	                                
	                                
	                        	}
	                        } // success
	                    }) // ajax
	                    return; 
                    } // else
                }); // okBottom
                
              // bottomside의 취소 버튼 클릭
                $(document).on("click", "#cancelBottom", function() {
                        // 리스트 초기화
                        selectedList = [];
                        selectedIdList = [];
                        selectedClassList = [];
                        // 테이블 초기화
                        $("#selectedBottomTb").empty();
                        // 버튼 초기화
                        initiateBtn();
                        $("#inside").empty(); // inside 섹션부분 초기화
                        allocateStudyRoom(); // 스터디룸 배치도 바탕
                        getStudyRoomLocation(); // 스터디룸 배치도
                        
                        // 버튼 클릭 이벤트 해제
                        $("#inside > button").off("click", "*");
                        
                        // 스터디룸 번호, 처리 버튼 이름 표시 해제
                        document.getElementById("bottom_btn_name").innerHTML = ""; 
                        document.getElementById("outside_studyroom_num").innerHTML = ""; 
                        return;
                }); // cancelBottom
	      }; // dropBottom
	    
	      
	      
	      // 스터디룸 처리
	      // topside의 비활성화 버튼 클릭시
	      if (this.id =="inactivateTop") {
	    	  alert("inactivateTop");
	    	  
	            $("#left-bottom").hide(); // bottomside의 해당 스터디룸 배치도 숨김
	            $("#right-bottom").hide(); // bottomside의 해당 스터디룸 처리버튼 숨김
	    	// 테이블 및 리스트 초기화
	            var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
	            var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
	            var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
	            $("#selectedTopTb").empty(); // 테이블 초기화
	            
	            // 버튼 처리
	            $("#inactivateTop").attr("disabled", "disabled");
	            $("#addTop").attr("disabled", "disabeld");
	            $("#dropTop").attr("disabled", "disabeld");
	            $("#okTop").removeAttr("disabled");
	            $("#cancelTop").removeAttr("disabled");
	            
	            $("#inactivateBottom").attr("disabled", "disabled");
	            $("#addBottom").attr("disabled", "disabled");
	            $("#dropBottom").attr("disabled", "disabled");
	            $("#okBottom").attr("disabled", "disabled");
	            $("#cancelBottom").attr("disabled", "disabled");
	            
	            // 테이블 생성
	            var addRow = "<tr><td>스터디룸 번호</td><td>현재 상태</td><td>변경 내용</td></tr>";
	            $("#selectedTopTb").append(addRow);
	            // 처리 버튼 이름 표시 
	            document.getElementById("top_btn_name").innerHTML = "스터디룸 비활성화"; 
	            
	            // 스터디룸 선택
	            $("#outside > button").on("click", function () {
	            	
	            	if (this.getAttribute("class") == "btn v-btn v-concrete" ||
	            			this.getAttribute("class") == "btn v-btn v-orange"	) {return;} // 빈 셀 선택시 변화X
	            			
	            	// 스터디룸 내부 배치도 표시하기 clickOutside() 안먹힘...ㅠㅠ
	            	// inside 버튼 초기화
			        $("#inside").children("button").removeClass();
			        $("#inside").children("button").text("");
			        $("#inside").children("button").css("width", "51px");
			        $("#inside").children("button").css("height", "46px");
			        
			        var studyroom_num = $(this).text().substring(4,6); // 스터디룸 번호
			        var sr_xy = $(this).attr("id"); // 스터디룸 좌표
			        
			        $.ajax({
			            url: "/manage/studyroom/getStudyRoomInfo",
			            type: "post",
			            data : {"studyroom_num":studyroom_num},
			            success: function(result) {
			                $(result).each(function (index, item) {
			                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").text(item.sr_seat_num);
			//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").css("margin-right", 0);
			                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").attr("margin", "0px");
			                    if (item.activate == 0) {
			                        $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
			                    } else $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-emerald");
			                }) // each
			            } // success
			        }) // ajax
			        
			        
			        // html에 표시할 스터디룸 번호 표시 
			        document.getElementById("outside_studyroom_num").innerHTML = "스터디룸" + studyroom_num; 
			        
			        // 부대시설 표시 (칠판, 출입구 및 콘센트 등)
			        $.ajax({
			            url: "/manage/studyroom/getSRFacilityInfo",
			            type: "post",
			            data : {"studyroom_num":studyroom_num},
			            success: function(result) {
			                $(result).each(function (index, item) {//*
			                    $("#inside").children("#"+item.seat_x+"_"+item.seat_y).text(item.facility_name);
			//                  $("#inside").children("#"+item.seat_x+"_"+item.seat_y).css("margin-right", 0);
			                    if (item.activate == 0) {
			                        $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-midnight-blue");
			                    } else  $("#inside").children("#"+item.seat_x+"_"+item.seat_y+"").addClass("btn v-btn v-peter-river");
			                }) // each
			            } // success
			        }) // ajax - 스터디룸 내부 배치도 표시하기 clickOutside() 안먹힘...ㅠㅠ
	            			
	            	
	            	// 테이블에 추가하기
	                addRow = "<tr id='"+studyroom_num+"'><td>"+studyroom_num+"</td>"; // this.textContent.substring(4, 6)
	                if (this.getAttribute("class") == "btn v-btn v-emerald") { // 현재 사용가능 셀 선택시
	                    selectedClassList.push(this.getAttribute("class"));
	                    this.classList.remove("v-emerald");
	                    addRow += "<td>사용 가능</td><td>사용 불가</td>";
	                    
	                } else if (this.getAttribute("class") == "btn v-btn v-midnight-blue") { // 현재 비활성화 셀 선택시
	                    selectedClassList.push(this.getAttribute("class"));
	                    this.classList.remove("v-midnight-blue");
	                    addRow += "<td>사용 불가</td><td>사용 가능</td>";
	                }
	                
	                this.classList.add("v-orange");
	                selectedList.push(studyroom_num); // 스터디룸 번호
	                selectedIdList.push(this.id);
	                
	                addRow += "</tr>";
	                $("#selectedTopTb").append(addRow);
	            }) // outside > button
	            
	         // topside의 취소 버튼 클릭
	            $(document).on("click", "#cancelTop", function() {
	            	   alert("cancelTop")	
	                    // 리스트 초기화
	                    initiateList();
	                    // 버튼 초기화
	                    initiateBtn();
                        $("#outside").empty(); // inside 섹션부분 초기화
	                    allocateCenter(); // 센터 배치도 바탕
	                    getStudyRoomLocation(); // 스터디룸 배치도
	                    $("#inside").empty(); // inside 섹션부분 초기화
	                    allocateStudyRoom(); // 스터디룸 배치도 바탕
	                    
// 	                    // 버튼 클릭 이벤트 해제
// 	                    $("#inside > button").off("click", "*");
	                    
	                    // 스터디룸 번호, 처리 버튼 이름 표시 해제
	                    document.getElementById("top_btn_name").innerHTML = ""; 
	                    document.getElementById("outside_studyroom_num").innerHTML = ""; 
	                    return;
	            }); // cancelTop
	            
	            // topside의 확인 버튼 클릭
	            $(document).on("click", "#okTop", function() {
	                if (selectedList.length < 1) {
	                    alert("선택된 좌석이 없습니다. 다시 확인해 주세요")
	                    return;
	                }
// 	                $("#okTop").attr("type", "submit");
// 	                $("#fmTop").attr("action", "/manage/studyroom/inactivateSR?selectedList="+selectedList);
	                $("#selectedListTop").val(selectedList);
	                $("#fmTop").attr("action", "/manage/studyroom/inactivateSR");
	                $("#fmTop").submit();
	            }); // okTop
	    	  
	      } // inactivateTop
	      
	   // outside의 이미 선택된 셀(.v-orange) 선택시
	        $(document).on("mousedown", "#outside > .v-orange", function() {
	             alert("선택이 취소됩니다.");
	             var removeIndex = selectedIdList.indexOf(this.id); // 선택 셀의 인덱스값 확인
	             var removeRow = selectedList[removeIndex]; // 테이블에서 선택 셀의 값 확인
	             selectedList.splice(removeIndex, 1); // 배열에서 선택 셀 삭제 (스터디룸번호:좌석번호)
	             selectedIdList.splice(removeIndex, 1); // 배열에서 선택 셀 삭제 (id-좌표)
	             
	             // 테이블에서 선택 셀의 값 삭제, tr id = studyroom_num + "o" + this.textContent + "o" + this.id 
	             $('#'+removeRow).remove();
	                   
	             this.classList.remove("v-orange");
	             var className = selectedClassList[removeIndex]; // 배역에서 선택 셀의 기존 클래스 확인
	             selectedClassList.splice(removeIndex, 1); // 배열에서 선택 셀 삭제 (기존 클래스네임-버튼색)
	             
	             // 이전 클래스로 되돌리기
	             if (className == "btn v-btn v-emerald") {
	                 this.classList.add("v-emerald");
	             } else if (className == "btn v-btn v-midnight-blue") {
	                 this.classList.add("v-midnight-blue");
	             } 
	             
	             // 등록 시도 후 선택 취소 할 경우 입력한 텍스트 삭제 및 이전 클래스("")로 되돌리기
	             if (className == "btn v-btn v-sunflower") {
	                 this.textContent = "";
	                 this.classList.remove("v-sunflower");
	                 this.classList.add("v-concrete");

	                 
	             } // if 
	         }); // click-outside > orange 
	         
	         // topside의 등록 버튼
	           if (this.id == "addTop") {
	              alert("addTop")
	              
	              $("#left-bottom").hide(); // bottomside의 해당 스터디룸 배치도 숨김
                  $("#right-bottom").hide(); // bottomside의 해당 스터디룸 처리버튼 숨김
	              // 테이블 및 리스트 초기화
	              var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
	              var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
	              var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
	              $("#selectedTopTb").empty(); // 테이블 초기화
	              $("#selectedBottomTb").empty(); // 테이블 초기화
	                   
	              // 버튼 처리
	              $("#inactivateTop").attr("disabled", "disabeld");
	              $("#addTop").attr("disabled", "disabeld");
	              $("#dropTop").attr("disabled", "disabeld");
	              $("#okTop").removeAttr("disabled");
	              $("#cancelTop").removeAttr("disabled");
	              
	              $("#inactivateBottom").attr("disabled", "disabled");
	              $("#addBottom").attr("disabled", "disabled");
	              $("#dropBottom").attr("disabled", "disabled");
	              $("#okBottom").attr("disabled", "disabled");
	              $("#cancelBottom").attr("disabled", "disabled");
	                   
	              // 테이블 생성
	              var addRow = "<tr><td>스터디룸 번호</td><td>x 위치</td><td>y 위치</td></tr>";
	              $("#selectedTopTb").append(addRow);
	              // 처리 버튼 이름 표시 
	              document.getElementById("top_btn_name").innerHTML = "스터디룸 등록"; 

	              // 셀 선택
//	            $(document).on("click", "#inside > button", function() {
	              $("#outside > button").on("click", function () {
	                  if (this.getAttribute("class") == "btn v-btn v-emerald" ||
	                  this.getAttribute("class") == "btn v-btn v-midnight-blue") {return;}  // class를 가진 셀 선택시 변화X  
	                   
	                  if (this.getAttribute("class") == "btn v-btn v-concrete") { // 빈 셀 선택시
	                        this.classList.remove("v-concrete");
	                        this.classList.add("v-sunflower");
	                        selectedClassList.push(this.getAttribute("class")); // sunflower로 들어가지만 실제는 클래스 없음!!!!!!!
	                  
	                        $(this).append("<input type='text' class='inputNum' style='text-align:center'>"); // 스터디룸 번호 입력
	                        
	                        var studyroom_num = "";
	                        
//	                      // 선택 셀에 마우스 커서
	                        $(this).children("input").bind("focus", function() { // 
//	                          $(this).children("input").focus(); // 마우스 커서가 안들어 오는데???????
	                        
	                        }).bind("blur", function() {
	                             studyroom_num = $(this).val();
// 	                             while (studyroom_num.match(/o/) != null) { // alert("영어 /o/는 입력할 수 없습니다. 다시 확인해주세요")
// 	                             var blank = /\s/g;
	                             while (!$.isNumeric(studyroom_num)) { // 문자 및 공백 입력 불가   || studyroom_num.match(balnk)
	                                 alert("스터디룸 번호는 숫자만 입력해 주세요")
	                                 this.value = "";
	                                 return;
	                             } // while
	                             var buttonId = $(this).parent(".v-sunflower").attr("id");      
	                              if (studyroom_num != "") { // 스터디룸 번호 입력
	                                  var idArray = buttonId.split("__");
	                                  addRow = "<tr id='"+studyroom_num + "o" + buttonId+"'><td>"+studyroom_num+"</td><td>"+idArray[0]+"</td><td>"+idArray[1]+"</td>";
	                                       
	                                  $("#"+buttonId).removeClass();          
	                                  $("#"+buttonId).addClass("btn v-btn v-orange");
	                                  $("#"+buttonId).text(studyroom_num);
	                                  $("#"+buttonId).children("input").remove();
	                                  
	                                  selectedList.push(studyroom_num + "o" + buttonId);
	                                  selectedIdList.push(buttonId);
	                                   
	                                  addRow += "</tr>";
	                                  $("#selectedTopTb").append(addRow);
	                              
	                              } else if (studyroom_num == "") { // 좌석 번호 또는 시설 이름 미입력시 선택 취소 처리
	                                  $("#"+buttonId).removeClass();
	                                  $("#"+buttonId).addClass("btn v-btn v-concrete");
	                                  $("#"+buttonId).children("input").remove();
	                              }
	                        }); // bind
	                  } // if-class=""
	               }) // click
	               
	               // topside의 취소 버튼 클릭
	                $(document).on("click", "#cancelTop", function() {
	                       alert("cancelTop")   
	                        // 리스트 초기화
	                        initiateList();
	                        // 버튼 초기화
	                        initiateBtn();
	                        $("#outside").empty(); // inside 섹션부분 초기화
	                        allocateCenter(); // 센터 배치도 바탕
	                        getStudyRoomLocation(); // 스터디룸 배치도
	                        $("#inside").empty(); // inside 섹션부분 초기화
	                        allocateStudyRoom(); // 스터디룸 배치도 바탕
	                        
//	                      // 버튼 클릭 이벤트 해제
//	                      $("#inside > button").off("click", "*");
	                        
	                        // 스터디룸 번호, 처리 버튼 이름 표시 해제
	                        document.getElementById("top_btn_name").innerHTML = ""; 
	                        document.getElementById("outside_studyroom_num").innerHTML = ""; 
	                        return;
	                }); // cancelTop
	                
	                // topside의 확인 버튼 클릭
	                $(document).on("click", "#okTop", function() {
	                    if (selectedList.length < 1) {
	                        alert("선택된 좌석이 없습니다. 다시 확인해 주세요")
	                        return;
	                    }
// 	                    $("#okTop").attr("type", "submit");
// 	                    $("#fmTop").attr("action", "/manage/studyroom/addSR?selectedList="+selectedList);
	                    $("#selectedListTop").val(selectedList);
	                    $("#fmTop").attr("action", "/manage/studyroom/addSR");
	                    $("#fmTop").submit();
	                }); // okTop
	                
	           }// addTop
	           
	           // topside의 삭제 버튼 클릭시
	           if (this.id == "dropTop") {
	               alert("dropTop")
	               
	                 $("#left-bottom").hide(); // bottomside의 해당 스터디룸 배치도 숨김
	                 $("#right-bottom").hide(); // bottomside의 해당 스터디룸 처리버튼 숨김
	                 // 테이블 및 리스트 초기화
	                 var selectedList = []; // 선택된 좌석 번호 또는 시설 번호를 담을 리스트 - DB업데이트시 사용
	                 var selectedIdList = []; // 선택된 좌석의 Id-좌표를 담을 리스트 - 취소시 사용
	                 var selectedClassList = []; // 선택된 좌석의 기존 class-버튼색을 담을 리스트 - 취소시 사용
	                 $("#selectedTopTb").empty(); // 테이블 초기화
	                 
	                 // 버튼 처리
	                 $("#inactivateTop").attr("disabled", "disabeld");
	                 $("#addTop").attr("disabled", "disabeld");
	                 $("#dropTop").attr("disabled", "disabeld");
	                 $("#okTop").removeAttr("disabled");
	                 $("#cancelTop").removeAttr("disabled");
	                 
	                 $("#inactivateBottom").attr("disabled", "disabled");
	                 $("#addBottom").attr("disabled", "disabled");
	                 $("#dropBottom").attr("disabled", "disabled");
	                 $("#okBottom").attr("disabled", "disabled");
	                 $("#cancelBottom").attr("disabled", "disabled");
	                 
	                 // 테이블 생성
	                 var addRow = "<tr><td>스터디룸 번호</td><td>현재 상태</td><td>변경 내용</td></tr>";
	                 $("#selectedTopTb").append(addRow);
	                 // 처리 버튼 이름 표시 
	                 document.getElementById("top_btn_name").innerHTML = "스터디룸 삭제"; 
	                 
	                 $("#outside > button").on("click", function () {
	                     if (this.getAttribute("class") == "btn v-btn v-concrete" ||
	                         this.getAttribute("class") == "btn v-btn v-orange") {return;} // 빈 셀 선택시 변화X  
	                     
	                     var studyroom_num = $(this).text().substring(4,6); // 스터디룸 번호
	                         
	                     // 테이블에 추가하기
	                     addRow = "<tr id='"+studyroom_num + "o" + this.id +"'><td>"+studyroom_num+"</td>";
	                     if (this.getAttribute("class") == "btn v-btn v-emerald") { // 현재 사용가능 셀 선택시
	                         selectedClassList.push(this.getAttribute("class"));
	                         this.classList.remove("v-emerald");
	                         addRow += "<td>등록</td><td>삭제</td>";
	                         
	                     } else if (this.getAttribute("class") == "btn v-btn v-midnight-blue") { // 현재 비활성화 셀 선택시
	                         selectedClassList.push(this.getAttribute("class"));
	                         this.classList.remove("v-midnight-blue");
	                         addRow += "<td>등록</td><td>삭제</td>";
	                         
	                     }
	                     
	                     this.classList.add("v-orange");
	                     selectedList.push(studyroom_num);
	                     selectedIdList.push(this.id);
	                     
	                     addRow += "</tr>";
	                     $("#selectedTopTb").append(addRow);
	                 }) // click - #inside > button
	                 
	                 // topside의 확인 버튼 클릭
	                 $(document).on("click", "#okTop", function() {
	                     if (selectedList.length < 1) {
	                         alert("선택된 좌석이 없습니다. 다시 확인해 주세요")
	                         return;
	                     }
// 	                     $("#okTop").attr("type", "submit");
// 	                     $("#fmTop").attr("action", "/manage/studyroom/dropSR?selectedList="+selectedList);
	                     $("#selectedListTop").val(selectedList);
	                     $("#fmTop").attr("action", "/manage/studyroom/dropSR");
	                     $("#fmTop").submit();
	                 }); // okTop
	                 
	               // topside의 취소 버튼 클릭
	                 $(document).on("click", "#cancelTop", function() {
	                         // 리스트 초기화
	                         selectedList = [];
	                         selectedIdList = [];
	                         selectedClassList = [];
	                         // 테이블 초기화
	                         $("#selectedTopTb").empty();
	                         // 버튼 초기화
	                         initiateBtn();
	                         
	                         $("#outside").empty(); // inside 섹션부분 초기화
	                         allocateCenter(); // 센터 배치도 바탕
	                         getStudyRoomLocation(); // 스터디룸 배치도
	                         $("#inside").empty(); // inside 섹션부분 초기화
	                         allocateStudyRoom(); // 스터디룸 배치도 바탕
	                         
// 	                         // 버튼 클릭 이벤트 해제
// 	                         $("#inside > button").off("click", "*");
	                         
	                         // 스터디룸 번호, 처리 버튼 이름 표시 해제
	                         document.getElementById("top_btn_name").innerHTML = ""; 
	                         document.getElementById("outside_studyroom_num").innerHTML = ""; 
	                         
	                         $("#left-bottom").hide(); // bottomside의 해당 스터디룸 배치도 숨김
	                         $("#right-bottom").hide(); // bottomside의 해당 스터디룸 처리버튼 숨김
	                         return;
	                 }); // cancelTop
	           }; // dropTop
	      
	}); // 처리 버튼 클릭시



</script>
<%@ include file="../top.jsp" %>
        <div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="heading-text">
                            <h1>스터디룸 관리</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="container">
	<h3 class="v-heading v-text-heading"><span>${sessionScope.vo.name } 페이지 - 스터디룸 관리</h1></span></h3>
	<h5 style="text-align:right">현재 시각 : ${sysdate } </h5>

<div class="leftside" id="left-top">
    <div class="topside">
		<h3 class="v-heading v-text-heading"><span>센터 배치도</h1></span></h3>
	<section id="outside"></section>
	</div>

    <div class="bottomside" id="left-bottom">
		<h3  class="v-heading v-text-heading"><span id="outside_studyroom_num"></span></h3>
	<section id="inside" style="display: inline-block;"> <!-- margin-left: 100px;  -->
	</div>

</section> 
</div> <!-- leftside -->

<div class="rightside" >
    
    <div class="topside" id="right-top">
	        <h3  class="v-heading v-text-heading"><span id="top_btn_name"></span></h3>
        <section id="btnTopSection">
            <div style="text-align: center">
            <a href="/manage/studyroom/searchResult">
            <button id="searchTop" class="btn v-btn v-small-button v-second-dark" 
                style="border-color:#f5245f; color:#f5245f!important;">예약현황 조회하기</button>
            </a>
            <table id="selectedTopTb"></table>
            <button id="inactivateTop" class="btn v-btn v-btn-default v-small-button">비활성화</button>
            <button id="addTop" class="btn v-btn v-btn-default v-small-button">등록</button>
            <button id="dropTop" class="btn v-btn v-btn-default v-small-button">삭제</button>
            <form action="" method="post" id="fmTop" style="display:inline-block">
            <input type="button" id="okTop" value="확인" class="btn v-btn v-btn-default v-small-button" disabled="disabled">
            <input type="hidden" id="selectedListTop" name="selectedList">
            </form>
            <button id="cancelTop" class="btn v-btn v-btn-default v-small-button" disabled="disabled">취소</button>
            </div>
        </section>
    </div>


    <div class="bottomside" id="right-bottom">
		    <h3  class="v-heading v-text-heading"><span id="bottom_btn_name"></span></h3>
		<section id="btnBottomSection">
			<div style="text-align: center">
			<table id="selectedBottomTb"></table>
			<button id="inactivateBottom" class="btn v-btn v-btn-default v-small-button">비활성화</button>
			<button id="addBottom" class="btn v-btn v-btn-default v-small-button">등록</button>
			<button id="dropBottom" class="btn v-btn v-btn-default v-small-button">삭제</button>
	<!-- 		<button id="ok" class="btn v-btn v-btn-default v-small-button" disabled="disabled">확인</button> -->
<!-- 			</div> 수정 버튼 삭제로 이제 필요없음!!-->
<!-- 			<div style="text-align: center"> 수정 버튼 삭제로 이제 필요없음!!-->
			<form action="" method="post" id="fmBottom" style="display:inline-block">
			<input type="button" id="okBottom" value="확인" class="btn v-btn v-btn-default v-small-button" disabled="disabled">
			<input type="hidden" id="selectedListBottom" name="selectedList">
			</form>
			<button id="cancelBottom" class="btn v-btn v-btn-default v-small-button" disabled="disabled">취소</button>
			</div>
		</section>
	</div>
	
</div> <!-- rightside -->

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
    
</body>
</html>