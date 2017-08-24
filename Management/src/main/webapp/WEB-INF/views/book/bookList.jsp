<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
<script src="resources/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	if("${empty cnt}"=='true'){
		location.href="bookList";
	}
	$("#showNum").change(function(){
		location.href="bookList?searchType="+$("#searchType option:selected").val()+"&searchValue="+$("#searchValue").val()+"&showNum="+$("#showNum option:selected").text();
	});
	
	$("#searchBtn").click(function(){
		location.href="bookList?searchType="+$("#searchType option:selected").val()+"&searchValue="+$("#searchValue").val()+"&showNum="+$("#showNum option:selected").text();
	});
});
</script>
</head>
<body>
<div id="bookList">
	<div id="top"></div>
	<div id="searchBox">
		<select id="searchType">
			<option value="title" ${searchType=='title' ? 'selected' : '' }>제목</option>
			<option value="publisher" ${searchType=='publisher' ? 'selected' : '' }>출판사</option>
			<option value="author" ${searchType=='author' ? 'selected' : '' }>저자</option>
			<option value="status" ${searchType=='status' ? 'selected' : '' }>대출가능</option>
		</select>
		<input type="text" id="searchValue" value="${searchValue}"/>
		<input type="button" id="searchBtn" value="검색"/>
		<select id="showNum">
			<option ${showNum==3 ? 'selected' : '' }>3</option>
			<option ${showNum==5 ? 'selected' : '' }>5</option>
			<option ${showNum==7 ? 'selected' : '' }>7</option>
			<option ${showNum==10 ? 'selected' : '' }>10</option>
		</select>개 씩 표시
	</div>
	<!-- 페이징 출력 -->
	<div id="navigator">
		<a href="bookList?currentPage=${navi.currentPage-navi.pagePerGroup}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">◁◁  </a>
		<a href="bookList?currentPage=${navi.currentPage-1}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">◀</a>
		
		<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">  
			<c:if test="${page eq navi.currentPage}">
				<span style="color:red;font-weight:bolder;font-size:1em">${page}</span>
			</c:if>
			<c:if test="${page ne navi.currentPage}">
				<a href="bookList?currentPage=${page}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">${page}</a>
			</c:if>
		</c:forEach>
		
		<a href="bookList?currentPage=${navi.currentPage+1}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}"> ▶</a>
		<a href="bookList?currentPage=${navi.currentPage+navi.pagePerGroup}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">  ▷▷</a>
	</div>
	<div id="list">
		<table>
			<tr>
				<th>이미지</th>
				<th>제목</th>
				<th>출판사</th>
				<th>저자</th>
				<th>대출가능</th>
			</tr>
			 <c:if test="${not empty booklist}">
				 <c:forEach var="book" items="${booklist}"> 
					<tr>
						<td><a href="bookDetail?num=${book.num}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}"><img src="downloadBook?num=${book.num}"></a></td>
						<td><a href="bookDetail?num=${book.num}&searchType=${searchType}&searchValue=${searchValue}&showNum=${showNum}">${book.title}</a></td>
						<td>${book.publisher}</td>
						<td>${book.author}</td>
						<td>${book.status}</td>
					</tr>
				</c:forEach> 
			</c:if>
		</table>
	</div>
	<a href="#top"><input type="button" value="맨위로"></a>
</div>
</body>
</html>	