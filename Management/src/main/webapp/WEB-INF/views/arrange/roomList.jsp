<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의실 목록</title>
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
    
    
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
	<script src="/manage/resources/js/jquery.datetimepicker.full.min.js"></script>

<style>
	 table,th, td{
		border :1px solid black;
		border-collaspe: collapse;
		text-align: center;
	} 
</style>
<script>
	//roomList tr값의 변수
	var number = 0;
	var room = "room";
	var roomNumber = room+(number);
	var partyList ="";
	var seatNumber = 0;
	
	//강의실 전체 목록을 가지고 온다.	
	$(function() {
		getClassRoom();
		getParty();
	});
	
	
	
	//파티리스트를 가지고온다
	function getParty(){
		$.ajax({
			url:"/manage/arrange/getPartyList",
			type: "get",
			datatype: "json",
			success: function(result){
				$("#select_room_list").empty();
				$(result).each(function(index, item){
					// id ='party_num' value ='party_num'
					partyList += "<option>" + item.party_num +"</option>";
				});
			}
		})

	}
	

	
	
	//체크박스 되어있는 강의실 
	//강의실 아이디 div로 구별하는 변수 저장하기 위한 숫자
	function getClassRoom(){

			var str = "<div><h2><a href ='/manage/arrange/arrangeMemberForm'>강의실에 사람 배치하기</a><h2></div>";
			str += "<table><caption><h2>전체 강의실</h2></caption>";
			str += "<tr>";
			str += "<th>번호</th>";
			str += "<th>이름</th>";
			str += "<th>가로 좌석 수</th>";
			str += "<th>세로 좌석 수</th>";
			str += "<th>기수</th>";
			str += "</tr>";
				$.ajax({
					url:"/manage/arrange/getClassRoom",
					type: "get",
					datatype: "json",
					success: function(result){
						$("#classrooms").empty();
						$(result).each(function(index, item){
							
							str += "<tr>";
							//str += "<td><input type='checkbox' id='boxRooms' class='rooms'></td>";
							str += "<td class = 'room_number'>" + item.num + "</td>";
							str += "<td class = 'room_name'>" + item.name + "</td>";
							str += "<td class = 'room_width'>" + item.width + "</td>";
							str += "<td class = 'room_height'>" + item.height + "</td>";				
							str += "<td class = 'room_party_num'>" + item.party_num + "</td></tr>";
						});

			str += "</table>";
		
			$("#classrooms").html(str);
			}
		});
	};

	

/*  	$(document).on("click",".service", function(){
 		 
 		var classRoom_num = (this).attr("id");
		$.ajax({
			url:"/manage/arrange/changeServiceAble?classRoom_num="+classRoom_num,
			type :"get",
			success: alert("성공")
		}) 
	}); */
	
 	$(document).on("click", ".service", function(){
 		
 		//강의실 번호
 		var value0 = $(this).children("#classRoom_num").val();
 		//좌석번호
 		var value1 = $(this).attr("id");
 		//사용가능여부  -> 0:사용가능  1:사용불가능
 		var value2 = $(this).children("#serviceable").val();
 		 	
 		 if(confirm("좌석상태를 변경하시겠습니까?")){
			$.ajax({
				url:"/manage/arrange/changeServiceAble",
				type:"post",
				data:{"classRoom_num":value0, "seat":value1, "serviceable":value2},
				success: function(result){
					clickRoomName1(temp);
					clickRoomName2(temp);
				
					 		
				}
					
			})
		}
		
	})
	
	function clickRoomName1(info){
		var num = info.siblings(".room_number").text();	
		var nameTemps = info.text();
		var width = info.siblings(".room_width").text();
		var height = info.siblings(".room_height").text();
		var party_num = info.siblings(".room_party_num").text();
		var viewTable = "";
		//임시 변수
		var temp = "";
		
		$.ajax({
			url:"/manage/arrange/selectRoom?num="+num,
			type:"get",
			success: function(result){
				if(result.width!=""){
				viewTable += "<table><caption>"+nameTemps+"</caption>";
				var index = 0;
		 		for(var i = 0 ; i < result.height ; i++){
					viewTable += "<tr>";
					for(var j = 0 ; j < result.width ; j++){
						viewTable += "<td class='service' name='service' id='"+(index++)+"'>("+i+","+j+")";
						viewTable += "<input type='hidden' id='classRoom_num' value='"+num+"'></td>";
					}
					viewTable += "</tr>";					
				} 
	
				
		 		
				//Room_Status의 serviceable 상태 가져옴
				//Sevice 클래스태그에 hidden값 집어넣어 값을 보내 수시로 체인지 해주려고함
				$.ajax({
					url: "/manage/arrange/getRoom_Status?classRoom_num="+num,
					type: "get",
					success: function(result2){
						$(result2).each(function(indx, item){
							$("#"+indx).append("<input type='hidden' id='serviceable' name='serviceable' value="+item.serviceable+">");
								if(item.serviceable==1){
									$("#"+indx).css("background-color","red");
								}
							
						})								
					}
				})
			 		
				viewTable +="</table>";
				$("#select_room").html(viewTable);
			}else{
				viewTable += "강의실 방이 없습니다.";
				$("#select_room").html(viewTable);
			}
			}
		})
	}
		
	function clickRoomName2(info){
			var num = info.siblings(".room_number").text();	
			var nameTemps = info.text();
			var width = info.siblings(".room_width").text();
			var height = info.siblings(".room_height").text();
			var party_num = info.siblings(".room_party_num").text();

			
			var str = "<table><tr>";
			str += "<th>번호</th>";
			str += "<th>이름</th>";
			str += "<th colspan='2'>가로 좌석</th>";
			str += "<th colspan='2'>세로 좌석</th>";
			str += "<th colspan='2'>기수</th>";
			str += "</tr><tr>";
			str += "<td>"+num+"</td>";
			str += "<input type = 'hidden' name = 'num' value = '"+num+"'>";
			str += "<input type = 'hidden' name = 'classroom_num' value = '"+num+"'>";
			str += "<td>"+nameTemps+"</td>";
			str += "<input type = 'hidden' name = 'name' value = '"+nameTemps+"'>";
			str += "<td>"+width+"</td>";
			str += "<td><input type = 'text' name = 'width'></td>";
			str += "<td>"+height+"</td>";
			str += "<td><input type = 'text' name = 'height'></td>";
			str += "<td>"+party_num+"</td>";
			str += "<td><label class = 'partyNum' for = partyList>";
			str += "<select id = 'partyList' name ='party_num'>";
			str += partyList;
			str += "</tr><tr><td colspan = 8><input type ='submit' id='insertSeat' value = '변경' ></td>";
			str += "</select></label></tr></table>";
				$("#select_room_list").html(str);		
	}
	
	
	$(document).on("click", '.room_name', function(){
		temp = $(this);
		clickRoomName1(temp);
		clickRoomName2(temp);

		});
	

	$(document).on("click", "#updateRooms", function(){
		var check_width = $('input[name=width]').val();
		var check_height = $('input[name=height]').val();
		
		
		if(check_width.length <1){
			alert("세로 좌석 수를 입력하세요");
			return false;
		}
	
		if(check_width != typeof(number)){
			alert("세로 좌석에 정확한 데이터를 입력하세요");
			return false;
		}
		
		if(check_height.length <1){
			alert("세로 좌석 수를 입력하세요");
			return false;
		}
		
		if(check_height != typeof(number)){
			alert("세로 좌석에 정확한 데이터를 입력하세요");
			return false;
		}
		

	}); 


	
	
	
</script>
</head>
<body>
	<div class="container">	
	
	<div id="classrooms" class="col-sm-5"></div><div class="col-sm-6" id = "select_room" ></div>
	<div class="v-spacer col-sm-6 v-height-small"></div>
	<form action="/manage/arrange/updateRoom" id="select_room_list" class="col-sm-7"  method="post"></form>
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
