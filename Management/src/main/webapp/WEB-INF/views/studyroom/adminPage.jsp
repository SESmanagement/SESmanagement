<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸  관리</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
	<link rel="stylesheet" href="/manage/resources/css/style.css" />
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
	
<style type="text/css">
 	[class="sr"] { 
 		position:relative; 
 		border:1px; 
 		border-style:solid; 
 		padding:10px; 
 		width:100px; 
 		height:50px; 
 		display: inline-block;
 	}
 	
 	div.mouseView { 
 		padding:10px; 
 		width:300px; 
 		position:absolute; 
 		border:2px solid #ccc; 
 		font-size:12px; 
 		background-color:#fafafa; 
 	}
 	
 	[class=section] {
 		display: inline;
 		border: 1px solid #ff0000;
 		padding: 10px;
 		width: auto;
 		height: 3000px;
 	}
 	
</style>
</head>
<body>
<script>
	// 현재 DB에 저장되어 있는 스터디룸 배치하기 (room_x , room_y)
	$(function(){

	});
	
</script>
<%@ include file="../top.jsp" %>
<br>
<h1>현재 시각 : ${sysdate } </h1>
<h1>${sessionScope.vo.name } 페이지 </h1>
<br>

<div id="roomSection">

<div class="sr" id="51"></div><div class="sr" id="52"></div><div class="sr" id="53"></div><div class="sr" id="54">
</div><div class="sr" id="55"></div><div class="sr" id="56"></div><div class="sr" id="57"></div>
<br>
<div class="sr" id="41"></div><div class="sr" id="42"></div><div class="sr" id="43"></div><div class="sr" id="44">
</div><div class="sr" id="45"></div><div class="sr" id="46"></div><div class="sr" id="47"></div>
<br>
<div class="sr" id="31"></div><div class="sr" id="32"></div><div class="sr" id="33"></div><div class="sr" id="34">
</div><div class="sr" id="35"></div><div class="sr" id="36"></div><div class="sr" id="37"></div>
<br>
<div class="sr" id="21"></div><div class="sr" id="22"></div><div class="sr" id="23"></div><div class="sr" id="24">
</div><div class="sr" id="25"></div><div class="sr" id="26"></div><div class="sr" id="27"></div>
<br>
<div class="sr" id="11"></div><div class="sr" id="12"></div><div class="sr" id="13"></div><div class="sr" id="14">
</div><div class="sr" id="15"></div><div class="sr" id="16"></div><div class="sr" id="17"></div>
<br>

<!-- <div class="sr" id="5" onmouseover="showInside(5)">스터디룸5</div> 		 <div class="sr" id="10" onmouseover="showInside(10)">스터디룸10</div><br> -->
<!-- <div class="sr" id="4" onmouseover="showInside(4)">스터디룸4</div>  	     <div class="sr" id="9" onmouseover="showInside(9)">스터디룸9</div><br> -->
<!-- <div class="sr" id="3" onmouseover="showInside(3)">스터디룸3</div> 		 <div class="sr" id="8" onmouseover="showInside(8)">스터디룸8</div><br> -->
<!-- <div class="sr" id="2" onmouseover="showInside(2)">스터디룸2</div> 		 <div class="sr" id="7" onmouseover="showInside(7)">스터디룸7</div><br> -->
<!-- <div class="sr" id="1" onmouseover="showInside(1)">스터디룸1</div>  		 <div class="sr" id="6" onmouseover="showInside(6)">스터디룸6</div><br> -->
</div>


</body>
</html>