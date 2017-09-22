<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="resources/jquery-3.2.1.min.js"></script> -->
<script>
$(function(){
	//목록 불러오기
	$.ajax({
		url : "/manage/book/appliedList"
		, method : "get"
		, dataType : "json"
		, success : reservedList
	});
	
	$("#adminSearchBtn").click(function(){
		var searchTarget={"adminSearchType" : $("#adminSearchType option:selected").val(),
						  "adminSearchValue" : $("#adminSearchValue").val()};
	 	$.ajax({
			url : "/manage/book/appliedList"
			, method : "get"
			, data : searchTarget
			, dataType : "json"
			, success : reservedList
			, error : function(e){alert(JSON.stringify(e))}
		});
		 
	});
});

//처음에 리스트 불러오기
function reservedList(resp){
	var temp="<table><tr><th>책 제목</th><th>신청자</th><th>액션</th></tr>";
	$.each(resp, function(index, item){
		temp+="<tr>";
		temp+="<td>"+item.title+"</td>"
		temp+="<td>"+item.name+"</td>"
		temp+="<input type='button' value='승인' data-num="+item.num+" class='OK'>"
		temp+="<input type='button' value='반려' data-num="+item.num+" class='NO'></td>";
		temp+="</tr>";
	});
	temp+="</table>"
	$("#reservedList").html(temp);
	
	
	//승인 버튼을 클릭했을 때
	$(".OK").click(function(){
		var removetr = $(this).parent().parent();
		var daysOfLend =$(this).parent().children('.daysOfLend').find('option:selected').text();
		var result=confirm("승인하시겠습니까?");
		if(result){
			var target = {"num" : $(this).data("num"), "daysOfLend" : daysOfLend}
			$.ajax({
				url : "/manage/book/lend"
				, method : "GET"
				, data : target
				, dataType : "text"
				, success : function(resp){
					alert(resp);
					removetr.remove();
				}
				, error : function(e){
					alert("ERROR==>"+JSON.stringify(e));
				}
			});
		}
	});
}
</script>
</head>
<body>
	<div id="wrapper">
		<table>
			<tr>
				<td >${vo.name}로그인중</td>
				<td>대출 신청 목록</td>
				<td id="todayDate"></td>
			</tr>
		</table>
	</div>
	<div id="search">
		<form action="applyList" method="POST">
			<table>
				<tr>
					<td>
					<select id="adminSearchType">
						<option value="title">책 제목</option>
						<option value="name">신청자</option>
					</select>
					</td>
					<td><input type="text" id="adminSearchValue" name="adminSearchValue"></td>
					<td><input type="button" id="adminSearchBtn" value="검색하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="reservedList"></div>
</body>
</html>