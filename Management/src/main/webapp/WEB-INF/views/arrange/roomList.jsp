<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의실 목록</title>
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
	$(function () {
		getClassRoom();

		//파티리스트를 가지고온다
		$.ajax({
			url:"/manage/arrange/getPartyList",
			type: "get",
			datatype: "json",
			success: function(result){
			//	$("#select_room_list").empty();
				$(result).each(function(index, item){
					// id ='party_num' value ='party_num'
					partyList += "<option>" + item.party_num +"</option>";
				});
			}
		})
	});
	
	
	
	//체크박스 되어있는 강의실 
	//강의실 아이디 div로 구별하는 변수 저장하기 위한 숫자
	function getClassRoom(){

			var str = "<table><tr>";
			str += "<th>강의실 번호</th>";
			str += "<th>강의실 이름</th>";
			str += "<th>강의실 가로 좌석 수</th>";
			str += "<th>강의실 세로 좌석 수</th>";
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

			//넘버 초기화
			number = 0; 
			$("#classrooms").html(str);
			}
		});
	};
	
	$(document).on("click", '.room_name', function(){
		var num = $(this).siblings(".room_number").text();	
		var nameTemps = $(this).text();
		var width = $(this).siblings(".room_width").text();
		var height = $(this).siblings(".room_height").text();
		var party_num = $(this).siblings(".room_party_num").text();
		var viewTable = "";
		
		viewTable += "<table><caption>"+$(this).text()+"</caption>"
		
		for(var i = 0 ; i < width ; i++){
			viewTable +="<tr>";
			for(var j = 0 ; j < height ; j++){
				viewTable +="<td>("+i+", "+j+")</td>";
			}
			viewTable +="</tr>";
		}
		
		
		$("#select_room").html(viewTable);
		
		
		
		//<input type = 'text' name = 'party_num'>
		var str = "<table><tr>";
		str += "<th>강의실 번호</th>";
		str += "<th>강의실 이름</th>";
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
	<form><br><br>
	<div class = "happy" id="classrooms" style="float: left"><div style="float: right;">hello&nbsp;&nbsp;&nbsp;&nbsp;</div></div><div class ="happy" id = select_room ></div>
	</form><br><br><br><br>
	<form action="/manage/arrange/updateRoom" id="select_room_list" method="post">
	</form>
	
</body>
</html>