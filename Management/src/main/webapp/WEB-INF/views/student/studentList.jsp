<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
<style>
	table,th, td{
	/* 	border :1px solid black;
		border-collaspe: collapse;
		text-align: center; */
	} 
</style>

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
    <link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">

    <!-- Form Elements -->
    <link href="/manage/resources/HTML/css/v-form-element.css" rel="stylesheet" />
    

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

	<!-- 모달 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script>



//자동실행될 스크립트
$(function(){
	getParty();

})

function dateTimePicker(){
	$("#datetimepicker").datetimepicker();
}

//파티리스트를 가지고온다
function getParty(){
	var partyList = "기수 설정 : ";
	partyList += "<select id = 'partyList' name ='party_num'>";
	
	
	$.ajax({
		url:"/manage/arrange/getPartyList",
		type: "get",
		datatype: "json",
		success: function(result){

			$(result).each(function(index, item){
			
				partyList += "<option id ='party'>" + item.party_num +"</option>";
			});
				partyList += "</select>"
				partyList += "<input type='button' class='v-btn v-second-dark' id ='partyBtn' value='기수 검색'>";
				partyList += "<input type ='button' id ='setexamForm' class='v-btn v-second-dark' value = '전체 성적 입력'>";
				$("#partySelection").html(partyList);	
		}
	})

}





//학생목록을 가지고 온다.
function getStudentList(party_num){
	var value0 = "관리자 설정";
	
	

	
	$.ajax({
		url:"/manage/student/getStudentList?party_num="+party_num,
		type:"get",
		success:function(result){
			if(party_num != 0){
				value0 = "제 "+party_num+"기 학생 목록";
			}
			var str = "<table width='300px' border='1px' cellspacing='0' cellpadding='0'>";
			
			str += "<caption>"+value0+"</caption>";
			str += "<tr><th><input type='checkbox' id='checkAll'></th>";
			str += "<th>기수</th><th>학번</th><th>이름</th><th>성별</th></tr>";

			
			$("#getStudentList").empty();
			$(result).each(function(index, item){
				//기수, 학번, 이름, 성별
				str+="<tr class = 'memberList'><td><input type='checkbox' name='checkbox' class='checkbox' value='"+item.student_num+"'></td>";
				str+="<td id = 'party_num'>"+item.party_num+"</td>";
				str+="<td id = 'student_num'>"+item.student_num+"</td>";
				str+="<td id ='name'>"+item.name+"</td>";
				str+="<td id = 'sex'>"+item.sex+"</td>";
				str+="</tr>";
			})
			str += "</table>";
			$("#getStudentList").html(str);
		}
	})	
	
}

// 체크박스 전체 선택하기
$(document).on("click", "#checkAll", function() {
      if ($("#checkAll").is(":checked")) {
		$("input[name=checkbox]").prop("checked", true); // 전체 선택
	} else {
		$("input[name=checkbox]").prop("checked", false); // 전체 해제
	}
});



//체크박스 전체 선택하기
$(document).on("click", "#partyBtn", function() {
	getStudentList($("#partyList").val());
});

// 학생 상담 노트 만든다
$(document).on("click", ".memberList", function(){
	$(this).css("background-color","lime");
	
	
	var st_num = $(this).children("#student_num").text();
	var str = "";
	$.ajax({
		url:"/manage/student/selectStudent?student_num="+st_num,
		type:"get",
		success: function(result){
			
		
			str += "<table>";
			
			//str += "<div class= 'col-sm-5'>";
			str += "<div class='feature-box-icon small icn-holder'>";
			str += "<i class='fa fa-lightbulb-o v-icon'></i>";	
			//str += "</div>";
			str += "</div>"
			
			
			str += "<tr><th>이  름</th><td id='select_student_name'>"+result.name+"</td></tr>"
			str += "<tr><th>기 수</th><td id='select_student_party'>"+result.party_num+"</td></tr>"
			str += "<tr><th>학  번</th><td id='select_student_num'>"+result.student_num+"</td></tr>"
			student_num = result.student_num;
		//	alert(student_num);
			str += "<tr><th>생  일</th><td>"+result.birthdate+"</td></tr>"
			if(result.sex == "f"){
				str += "<tr><th>성  별</th><td>여성</td></tr>"			
			}else{
				str += "<tr><th>성  별</th><td>남성</td></tr>"
			}
			str += "<tr><th>전화번호</th><td>"+result.call+"</td></tr>"
			str += "<tr><th>휴 대 폰</th><td>"+result.phone+"</td></tr>"
			str += "<tr><th>이 메 일</th><td>"+result.email+"</td></tr>"
			str += "</table>";

			str += "<input type ='button' id ='setCounselForm' class='v-btn v-second-dark' value = '상담하기'>";
			str += "<input type ='button' id ='getCounsel' class='v-btn v-second-dark' value = '이력'>";
			
			
			str += "<input type ='button' id ='setIndivisualExamForm' class='v-btn v-second-dark' value = '성적입력'>";
			str += "<input type ='button' id ='getexam' class='v-btn v-second-dark' value = '조회'>";
			str += "<input type ='button' id ='selectStudent_cancel' class='v-btn v-second-dark' value = '취소'>";
			$("#selectStudent").html(str);
		}
	})
});

$(document).on("click","#selectStudent_cancel", function(){
	$("#insertExam").empty();
	$("#insertNote").empty();
	$("#insertExam_btn").empty();
	$("#selectStudent").empty();
})
//
$(document).on("click", "#setIndivisualExamForm", function(){
		//해당위치의 div들의 값들을 다 초기화
		$("#insertExam").empty();
		$("#insertNote").empty();
		$("#insertExam_btn").empty();
		
		
		//학번을 가지고 올수 있다.
		//var party_num = $("#partyList").val();
		//선택한 학번을 가지고 올 수 있다.
		//var student_num = $("#select_student_num").text();
		//alert(party_num);
		//alert(student_num);
		
		var str ="<table><tr>"
			str += "<caption>성적 입력</caption>";
			str += "<tr><th>학번</th>"
			str += "<td id ='exam_student_num' name ='exam_student_num'>"+$("#select_student_num").text()+"</td></tr>";
			str += "<tr><th>이름</th>";
			str += "<td>"+$("#select_student_name").text()+"</td>";
			str += "<input type ='hidden' id ='exam_name' name='exam_name' value="+$("#select_student_name").text()+">";
			str += "<tr><th><select id='exam_type'>";
			str += "<option id='it_1'>IT_1</option>";
			str += "<option id='it_2'>IT_2</option>";
			str += "<option id='it_3'>IT_3</option>";
			str += "<option id='jap_1'>JAP_1</option>";
			str += "<option id='jap_2'>JAP_2</option>";
			str += "<option id='jap_3'>JAP_3</option>";
			str += "<option id='live_score'>LIVE_SCORE</option>";	
			str += "</select></th>";
			str += "<td><input type='text' id ='insert_score' name ='insert_score'></td>";
			str += "</tr>";
			str += "</table>";				
			str += "<button type='button' class='v-btn v-second-dark' id ='insertTotal_score'>등록</button>";
			str += "<button type='button' id = 'search_student_name' class='v-btn v-second-dark'>검색</button>";
			str += "<button type='button' id = 'score_cancel' class='v-btn v-second-dark'>취소</button>";
			$("#insertExam").html(str);
			
		})
	
	

$(document).on("change", "#exam_type",function(){
	//선택한 학번을 가지고 올 수 있다.
	var student_num = $("#select_student_num").text();

	$.ajax({
		url:"/manage/student/getSelectExam_Score?student_num="+student_num,
		type:"get",
		success:function(result){
			
			//성적 입력타입 넣기
			//alert($("#exam_type").val());
			
			//성적 1
			if($("#exam_type").val()=="IT_1"){
				if(result.it_1 != ""){
					$("#insert_score").attr("value", result.it_1);
				}else{
					$("#insert_score").attr("value", "값이 정해지지 않았습니다");			
				}
				
			}else if($("#exam_type").val()=="IT_2"){
				if(result.it_2 != ""){
					$("#insert_score").attr("value", result.it_2);
				}else{
					$("#insert_score").attr("value", "값이 정해지지 않았습니다");			
				}
				
			}else if($("#exam_type").val()=="IT_3"){
				if(result.it_3 != ""){
					$("#insert_score").attr("value", result.it_3);
				}else{
					$("#insert_score").attr("value", "값이 정해지지 않았습니다");			
				}
			}else if($("#exam_type").val()=="JAP_1"){
				if(result.jap_1 != ""){
					$("#insert_score").attr("value", result.jap_1);
				}else{
					$("#insert_score").attr("value", "값이 정해지지 않았습니다");			
				}
			}else if($("#exam_type").val()=="JAP_2"){
				if(result.jap_2 != ""){
					$("#insert_score").attr("value", result.jap_2);
				}else{
					$("#insert_score").attr("value", "값이 정해지지 않았습니다");			
				}
			}else if($("#exam_type").val()=="JAP_3"){
				alert(result.jap_3);
				if(result.jap_3 != ""){
					$("#insert_score").attr("value", result.jap_3);
				}else{
					$("#insert_score").attr("value", "값이 정해지지 않았습니다");			
				}
			}else if($("#exam_type").val()=="LIVE_SCORE"){
				if(result.live_score != ""){
					$("#insert_score").attr("value", result.live_score);
				}else{
					$("#insert_score").attr("value", "값이 정해지지 않았습니다");			
				}
			}else{
				alert("오류");
			}
				/* $("#it_1").attr("value",result.it_1);
	 		$("#it_2").attr("value",result.it_2);
	 		$("#it_3").attr("value",result.it_3);
	 		$("#jap_1").attr("value",result.jap_1);
	 		$("#jap_2").attr("value",result.jap_2);
	 		$("#jap_3").attr("value",result.jap_3);
	 		$("#live_score").attr("value",result.live_score);  */
		}
	})
})


$(document).on("click","#setCounselForm", function(){
	$("#insertExam").empty();
	$("#insertNote").empty();
	$("#insertExam_btn").empty();
	
	var select_party = $("#select_student_party").text();
	var select_name = $("#select_student_name").text();
//	alert(select_party);
//	alert(select_name);
	var str = "<form class='special-contact-form'>";
	
	
	str += "<div class='col-sm-12'>";
	str += "<div class='v-heading-v2'>";
	str += "<h1 style='text-align: right;'>    SCIT "
			+select_party+"기<br></h1>     <h2 style='text-align: right;'>"
			+select_name+"</h2><br>";
	str += "</div>";
	str += "</div>";
	
	
	
	
	
	//str += "<label>"+$("#select_student_name")+"상담하기</label>"
	
	
	
	str += "<div calss ='row-3'>";
	
	str += "<div calss ='col-sm-6'>";	
		str += "<div class='input-group'>";
			str += "<div class ='col-sm-11'>";				
			str += "</div>"
		str += "</div>"	
	str += "</div>";
	
	

	str += "<input type='text' id ='datepicker' data-plugin-datepicker class='form-control' placeholder='상담 날짜'>";
	str += "<div>"
	//click modal open
	str += "<input type='text' class='form-control' id='hate_student_insert_text' data-toggle='modal' data-target='#myModal' name='hate_student_num' placeholder='싫어하는 사람'>";
	str += "<input type = 'hidden' id ='hate_student_num'>";
	//modal
	str += "<div class='modal fade' id='myModal' role='dialog'>";
    str += "<div class='modal-dialog'>";
	
   	//Modal content
    str += "<div class='modal-content'>";
    str += "<div class='modal-header'>";
    str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
    str += "<h2 class='modal-title'>SCIT " +select_party+"기 "+select_name+"</h2>"
    str += "</div>"
    str += "<div class='modal-body'>";
	
    str += "<div class='col-sm-12'>";
	str += "<div class='v-heading-v2'>";
	str += "<h3>이 름 검 색</h3><br>";
	str += "<div>"
	str += "<input type = 'text' id = 'hate_student_name' name ='hate_student_name' class = 'form-control' placeholder='이름을 입력하세요'>";

	str += "<div id='search_btn'>";
	str += "<input type = 'button' class='v-btn v-second-dark' id = 'hate_student_name_btn' value = '검색'>";
//	str += "<input type = 'button' class='v-btn v-second-dark' disabled='disabled' id = 'hate_student_name_cancel_btn' value = '취소'>";
	str += "</div>"
	str += "</div>";
	
	
	
	str += "</div>";
	str += "</div>";
    
	
	//헤이트 학생 검색 등록
 	str += "<div>";
	str += "<div class = 'select_hate_student'></div>";
    str += "<div class = 'search_hate_student'></div>";
    str += "</div>";
    
    str += "</div>";
    str += "<div class='modal-footer' data-dismiss='modal' id='decideResult'>"
    str += "<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>";
    str += "</div>";
    str += "</div>";
    str += "</div>";
	str += "</div>";


	
	str += "<textarea class='form-control' rows='3' id='special_note' name='special_note' placeholder='특이사항...'></textarea>"

	
	
	str += "<div id='col-sm-12'>"
	str += "<input type='button' id = 'advice_insert' class='v-btn v-second-dark' value ='Send'>";
	str += "<input type='button' id = 'advice_cancel' class='v-btn v-second-dark' value ='Cancel'>";
	str += "</div>"
	str += "</div></form>";

	$("#insertNote").html(str);
	$('#datepicker').datepicker();
	
})


	$(document).on("click", "#hate_student_name_btn", function(){
		var party_num = $("#select_student_party").text();
		var name = $("#hate_student_name").val();
		var str ="<table><tr>";
		str += "<td>학번</td><td>이름</td><td>생일</td><td>이메일</td>";
	 	$.ajax({
			url: "/manage/student/selectHateStudent",
			type: "post",
			data: {"party_num":party_num,"name":name},
			success: function(result){
				$(result).each(function(index, item){
					str += "<tr id ='selectHateStudent' >";
					str += "<th id ='selectHateStudentNum'>"+item.student_num+"</th>";
					str += "<th id ='selectHateStudentName'>"+item.name+"</th>";
					str += "<th id ='selectHateStudentBirthdate'>"+item.birthdate+"</th>";
					str += "<th id ='selectHateStudentEmail'>"+item.email+"</th>";
					str += "</tr>"
				});
				str += "</table>";
				$(".search_hate_student").html(str);
			}
		})		
	})
	
	$(document).on("click", "#selectHateStudent", function(){
		var HateNum = $("#selectHateStudentNum").text();
		var HateName = $("#selectHateStudentName").text();
		if(confirm(HateName+"("+HateNum+")가 맞습니까?")){
			var str0 = "<p id=>"+HateName+"("+HateNum+")을 선택했습니다.";
			$(".select_hate_student").html(str0);
			$("#hate_student_name_btn").attr("disabled","disabled");
		
			
			//$("#hate_student_name_cancel_btn").removeAttr("disabled");
			//버튼작업
			/* var btn_str = "<input type = 'button' class='v-btn v-second-dark' id = 'hate_student_name_btn' value = '검색'>";
			btn_str += "<input type = 'button' class='v-btn v-second-dark' id = 'hate_student_name_cancel_btn' value = '취소'>";
			
			$("#search_btn").html(btn_str); */
			
			/* $("#hate_student_name").text(HateNum);
			$("#hate_student_name").attr("readonly","readonly");
			$("#hate_student_num").attr("value",HateNum); */
			var str = "<button type='button' id = 'modal_ok_result' class='btn btn-default'>OK</button>";
 			str += "<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>"
			$("#decideResult").html(str);
			
			
			
		}
	})
	
	//모달창 입력값누르고 오키오키
	$(document).on("click", "#modal_ok_result", function(){
		//$("#hate_student_name").attr
		
	//	$("#hate_student_insert_text").attr("readonly", "readonly");
		$("#hate_student_insert_text").val($("#selectHateStudentName").text()+"("+$("#selectHateStudentNum").text()+")");
		$("#hate_student_num").val($("#selectHateStudentNum").text());
		//	$("#modal_ok_result").attr("data-dismiss","modal");
	})
	
	//상담창 등록
	$(document).on("click", "#advice_insert", function(){
		
		var advice_date = $("#datepicker").val();
		var student_number = $("#select_student_num").text();
		var hate_student_num = $("#hate_student_num").val();
		var special_note = $("#special_note").val();

		/* 		alert(advice_date);
		alert(student_number);
		alert(hate_student_num);
		alert(special_note);  */
		
		var target={
			"advice_date":advice_date, 
			"student_number":student_number, 
			"special_note":special_note,
			"hate_student_num":hate_student_num, 
		}
 		$.ajax({
			url:"/manage/student/adviceInsert",
			type:"post",
			data: target,
			success: function(result){
				alert ("등록 성공했습니다");
				$("#insertNote").empty();
				$("#insertExam_btn").empty();
			}
		})
 	})
 	
 	$(document).on("click", "#advice_cancel", function(){
 		alert("취소합니다");
 		$("#insertNote").empty();
 		$("#insertExam_btn").empty();
 	})
	
	
	
	//성적입력
	$(document).on("click", "#setexamForm", function(){
		var party_num = $("#select_student_party").text();
		var str = "<table width='300px' border='1px' cellspacing='0' cellpadding='0'>";
		str += "<caption>성적 입력</caption>";
		str += "<th>학번</th><th>이름</th>";
		str += "<th><select id='exam_type'>";
		str += "<option>IT_1</option>";
		str += "<option>IT_2</option>";
		str += "<option>IT_3</option>";
		str += "<option>JAP_1</option>";
		str += "<option>JAP_2</option>";
		str += "<option>JAP_3</option>";
		str += "<option>LIVE_SCORE</option>";	
		str += "</select></th>";
		str += "</tr>";
		
		$("#insertExam").empty();
		$("#insertNote").empty();
		
		$.ajax({
			url:"/manage/student/getStudentList?party_num="+party_num,
			type:"get",
			success:function(result){
				$(result).each(function(index, item){
					//학번, 이름, 성적입력
					str+="<tr>";
					str+="<td id ='exam_student_num' name ='exam_student_num'>"+item.student_num+"</td>";
					//str+="<input type ='hidden' id ='exam_student_num' name ='exam_student_num' value="+item.student_num+">";
					str+="<td>"+item.name+"</td>";
					str+="<input type ='hidden' id ='exam_name' name='exam_name' value="+item.name+">";
					
					str+="<td><input type='text' id ='insert_score' name ='insert_score'></td>";
					str+="</tr>";
					
				
			})
				str += "</table>";				
				$("#insertExam").html(str);
				var str0 = "<button type='button' class='v-btn v-second-dark' id ='insertTotal_score'>등록</button>";
				str0 += "<button type='button' id = 'search_student_name' class='v-btn v-second-dark'>검색</button>"
				str0 += "<button type='button' id = 'score_cancel' class='v-btn v-second-dark'>취소</button>"
 				$("#insertExam_btn").html(str0);
			}
		})
	})
	
	
		//점수 입력창 제거
		$(document).on("click", "#score_cancel", function(){
 			$("#insertExam").empty();
 			$("#insertExam_btn").empty();
 		})
 		
 		
 		
 		
 		//시험성적 등록
 		//1. 전체성적이 입력이 안되면 입력이 안되었다고 표시
 		//2. 성적 입력값이 숫자가 아니면 숫자를 입력하라고 표시
 		//3. 성적의 입력값이 100을 넘을수 없고 0이 될수 없다.
 		$(document).on("click", "#insertTotal_score", function(){
 			
 			//시험종류 
 			var typeExam = $("#exam_type").val();
			alert("시험종류 : " + typeExam);
 			
			//변수 
			//var length = document.getElementsByName("exam_student_num");
			
			var student_num = document.getElementsByName("exam_student_num");
 			alert("학번 : "+student_num[0].textContent);
			
			//시험성적
 			var examScoreArr = [];
			
 			
 			
 			for(var i = 0 ; i < student_num.length ; i++){
 				var check = document.getElementsByName("insert_score")[i].value;
 				
 				//alert(i+"번째");
 				//alert("시험점수 : " + Number(check)); 
 				
 				
 				//입력 값이 없을 때 더 이상 실행하지 않는다.
 				if(check == ""){
 					alert("값을 입력하세요");
 					return false;
 				}
 				
 				//성적값이 100을 넘어가면 더 이상 실행하지 않는다.
 				if(Number(check)>100){
 					alert("성적을 100이하로 입력하세요");
 					return false;
 				}
 				
 				//입력 값이 숫자가 아닐 때 더 이상 실행하지 않는다.
 				if(Number(check)=="NaN"){
 					alert("숫자를 입력하세요");
 					return false;
 				}
 		
 				examScoreArr.push(Number(check));
 			}
 			
 			//시험친 사람의 학번
 			var student_numArr = []; 			
 			for(var i = 0 ; i < student_num.length ; i++){	
 				student_numArr.push(Number(student_num[i].textContent));
 			}
 			
 			//데이터 보낼껄 집어넣는다
 			var target = {"typeExam":typeExam, "examScoreArr":examScoreArr, "student_numArr":student_numArr}
 			$.ajax({
 				url:"/manage/student/insertExamTotal",
 				type:"post",
 				data: target,
 				success: function(result){
 					alert("hello");
 				}
 			})
 			
 			
  		
 			
 			
 		})
	
	

</script>
</head>
<body>
	<div class="container">
		
		<div id ="partySelection"></div><br>
		<div class="col-sm-5" id ="getStudentList" style="width:350px; height:440px; overflow:auto"></div>
		<div class ='row'>
		<div class="col-sm-3" id ="selectStudent"></div>
		<div class="col-sm-3" id ="insertNote"></div>
		<div>
			<div class="col-sm-5" id ="insertExam" style="width:350px; height:440px; overflow:auto"></div>
			<div id="insertExam_btn" style="text-align: center;"></div>
		</div>
		</div>
	</div>
	
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
    
    
   
</body>
</html>