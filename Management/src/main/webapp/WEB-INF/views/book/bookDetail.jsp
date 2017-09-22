<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK DETAIL</title>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

<link rel="stylesheet" href="/resources/comment/style.css"> <!-- comment -->

<script src="/resources/jquery-3.2.1.min.js"></script>


<!-- ahfmrpTdj -->
<style>

</style>
</head>
<body>
<script>

$(function(){
	
	if($(".status").text()=='연체'){
		$(this).text().css('color','red');
	}
	
	$("#apply").click(function(){
		var result = confirm("대출 하시겠습니까?");
		if(result){
			$.ajax({
				url: "borrowApply"
				, method : "get"
				, data : {"booknum": "${book.num}", "mem_num": "${vo.num}"}
				, dataType : "text"
				, success : function(resp){
					if(result) {
						alert('대출 신청이 정상적으로 처리되었습니다')
					$("#apply").hide();
					} else{
						alert('대출실패');	
					}
				} 
			});
		}
	});
});	
	

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
    <form method="post">
       <p class="p_class">
          <input id="radio1" type="radio" name="radio_rate" value="5">
            <label for="radio1">&#9786;</label>
          <input id="radio2" type="radio" name="radio_rate" value="4">
            <label for="radio2">&#9786;</label>
          <input id="radio3" type="radio" name="radio_rate" value="3">
            <label for="radio3">&#9786;</label>
          <input id="radio4" type="radio" name="radio_rate" value="2">
            <label for="radio4">&#9786;</label>
          <input id="radio5" type="radio" name="radio_rate" value="1">
            <label for="radio5">&#9786;</label>
      </p>
        <textarea name="rate_comment" class="comment_area" placeholder="Leave your comment here"></textarea><br>
          <input type="submit" name="rating_submit" value="입력">
    </form>
  </div>
  
		
		<!-- comment -->
  <!-- comment -->
  
</body>
</html>