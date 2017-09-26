<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK DETAIL</title>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->


<script src="resources/jquery-3.2.1.min.js"></script>


<!-- ahfmrpTdj -->
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,100);

.ratingCard h2{
  font-weight: 100;
  text-align: center;
  font-size: 2.3em;
}
.ratingCard{
  padding: 40px;
  width: 270px;
  background-color: #F7F7F7;
  margin: 100px auto 10px;
  border-radius: 10px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
}
input[type="radio"] {
  display: none;
}
label{
  color: grey;
  text-shadow: 1px 1px 1px #c9c9c9;
  font-size: 25px;
}

form p {
  text-align: center;
  font-size: 20px;
}
form input[type="submit"]{
  width: 100%;
  height: 36px;
  display: block;
  position: relative;
  border: 0px;
  color: #fff;
  background-color: #4d90fe;
}
.comment_area{
  width: 100%;
	height: 100px;
	background: #fff;
	display: block;
	border: 1px solid #d9d9d9;
 	border-top: 1px solid #c0c0c0;
 	box-sizing: border-box;
  -moz-box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 5px;
  padding: 10px;
}
.p_class{
  direction: rtl;
  unicode-bidi: bidi-override;
}
form input[type="submit"]:hover{
  border: 0px;
  text-shadow: 0 1px rgba(0, 0, 0, 0.3);
  background-color: #357ae8;
  cursor: pointer;
}

label:hover, label:hover ~ label {
  color: orange;
  cursor:pointer;
}

input[type="radio"]:checked ~ label {
  color: orange;
}
.comment_area:hover{
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
<script>
$(function(){
	
	if($(".status").text()=='연체'){
		$(this).text().css('color','red');
	}
	
	$("#apply").click(function(){
		var result = confirm("대출신청 하시겠습니까?");
		if(result){
			$.ajax({
				url: "borrowApply"
				, method : "get"
				, data : {"booknum": "${book.num}", "mem_num": "${vo.student_num}"}
				, dataType : "text"
				, success : function(resp){
					alert(resp);
					$("#apply").hide();
				}
				
			});
		}
	});
	
	//reply
	$("#btnWrite").click(function(){
		
		var boardnum=$("#num").val(); 		
		var text=$("#textWrite").val();
		$.ajax({
		 	url : "replyWrite"
		 	, method : "post"
		 	, data : {"num" : "${reply.num}", "text" : text, "student_num" : "${vo.student_num}"}
			, dataType : "text"
			, success : function(resp){
				alert(resp);
				init();
				$("#textWrite").val("");
			}
			, error : function(e){
				alert(JSON.stringify(e));
			}
		});
	});
	
	
});
	

function init(){
	$.ajax({
		url : "replyList"
		, method : "get"
		, data : "num="+ $("#num").val()
		, dataType : "json"
		, success : replylist
		
	});
}

</script>
	<div id="wrapper">
		<table>
				<td>
					<table id="bookDetail">
						<tr>
							<h2>도서정보</h2>
						</tr>
						<tr>
							<td rowspan="4"><img src="downloadBook?num=${book.num}" /></td>
							<td>제목</td>
							<td>${book.title}</td>
						</tr>
						<tr>
							<td>출판사</td>
							<td>${book.publisher}</td>
						</tr>
						<tr>
							<td>저자</td>
							<td>${book.author}</td>
						</tr>
						<tr>
							<td>대출가능</td>
							<td class="status">${book.status}
								<c:if test="${not empty vo && book.status!='N'}">
									<input type="button" value="대출신청" id="apply">
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="3">${book.content}</td>
						</tr>
						<tr>
							<td><a href="bookList?searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}"><input type="button" value="목록으로"></a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		 <div class="ratingCard">
    <h2>Comment</h2>
    		<!-- action을 써주세요 -->
<!--     <form action="replyWrite" method="post">  -->
<!--        <p class="p_class"> -->
<!--           <input id="radio1" type="radio" name="radio_rate" value="5"> -->
<!--             <label for="radio1">&#9786;</label> -->
<!--           <input id="radio2" type="radio" name="radio_rate" value="4"> -->
<!--             <label for="radio2">&#9786;</label> -->
<!--           <input id="radio3" type="radio" name="radio_rate" value="3"> -->
<!--             <label for="radio3">&#9786;</label> -->
<!--           <input id="radio4" type="radio" name="radio_rate" value="2"> -->
<!--             <label for="radio4">&#9786;</label> -->
<!--           <input id="radio5" type="radio" name="radio_rate" value="1"> -->
<!--             <label for="radio5">&#9786;</label> -->
<!--       </p> -->
<table>
<tr>
<!--         <textarea name="rate_comment" id="textWrite" class="comment_area" ></textarea><br> -->
   <textarea name="text" id="textWrite" name ="text" class="comment_area" ></textarea><br>
          <input type="button" id="btnWrite" name="rating_submit" value="입력">
</tr>
</table>
<!--     </form> -->

	<div id="replydisplay"> </div>
  
		
		<!-- comment -->
  <!-- comment -->
  
</body>
</html>
