<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
</head>
<body>
<script> 
 	if("${result}"=="true") alert("처리 완료");
 	else if("${result}"=="false") alert("처리 실패");
	
 	function pageProc(currentPage, searchCondition, searchKeyword) {
		location.href="/manage/book/getBoardList?currentPage=" + currentPage + "&searchCondition=" + searchCondition + "&searchKeyword=" + searchKeyword;
 	}
</script>
	<h1>[ BookList ]</h1>
	<table>
		<tr>
			<td id="boardSearch" colspan="4">
			<form action="/manage/book/getBookList" method="get">
				<select name="searchCondition">
					<option value="TITLE" selected="selected">제목</option>
					<option value="AUTHOR">저자</option>
					<option value="publisher">출판사</option>
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</form>
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
		</tr>
		<c:forEach items="${getBookList}" var="vo">
		<tr>
			<td class="center">${vo.book_num}</td>
			<td class="center">${vo.id}</td>
			<td id="title"><a href="/manage/book/read?book_num=${vo.book_num}">${vo.title}</a></td>
		</tr>
		</c:forEach>
		<tr>
			<td id="navigator" colspan="5">
				<a href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, '${searchCondition}', '${searchKeyword}')">◁◁ </a> &nbsp;&nbsp;
				<a href="javascript:pageProc(${navi.currentPage - 1}, '${searchCondition}', '${searchKeyword}')">◀</a> &nbsp;&nbsp;
			
				<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
					<c:if test="${counter == navi.currentPage}"><b></c:if>
						<a href="javascript:pageProc(${counter}, '${searchCondition}', '${searchKeyword}')">${counter}</a>&nbsp;
					<c:if test="${counter == navi.currentPage}"></b></c:if>
				</c:forEach>
				&nbsp;&nbsp;
				<a href="javascript:pageProc(${navi.currentPage + 1}, '${searchCondition}', '${searchKeyword}')">▶</a> &nbsp;&nbsp;
				<a href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, '${searchCondition}', '${searchKeyword}')">▷▷</a>
			</td>
		</tr>
	</table>
</body>
</html>
