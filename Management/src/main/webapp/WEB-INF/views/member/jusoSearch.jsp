<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript" src="/manage/resources/js/jquery-3.2.1.min.js"></script>

<script>
function getAddr(){
	alert('가긴했냐');
	// AJAX 주소 검색 요청
	$.ajax({
		url:"/manage/add/getAddrApi.do"									// 고객사 API 호출할 Controller URL
		,type:"get"
		,data:$("#form").serialize() 								// 요청 변수 설정
		,dataType:"json"	
		// 데이터 결과 : JSON
		,success:function(jsonStr){		// jsonStr : 주소 검색 결과 JSON 데이터
			$("#list").html("");									// 결과 출력 영역 초기화
			var errCode = jsonStr.results.common.errorCode; 		// 응답코드
			var errDesc = jsonStr.results.common.errorMessage;		// 응답메시지
			if(errCode != "0"){ 									// 응답에러시 처리
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr!= null){
					makeListJson(jsonStr);							// 결과 JSON 데이터 파싱 및 출력
					pageMake(jsonStr);
				}
			}
		}
		,error: function(xhr,status, error){
			alert("에러발생");										// AJAX 호출 에러
		}
	});
}


//페이지 이동
function goPage(pageNum){
	document.form.currentPage.value=pageNum;
	getAddr();
}


//부모창으로 주소 이동
function goParent(roadAddr, zip){
	location.href="/manage/add/address?addr="+roadAddr+"&zip="+zip;
}




function pageMake(jsonStr){ 
	var total = jsonStr.results.common.totalCount; // 총건수 
	var pageNum = document.form.currentPage.value;// 현재페이지
	var paggingStr = "";
	if(total < 1){
	}else{
		var PAGEBLOCK=document.form.countPerPage.value;		//페이지 당 출력 할 결과 row 수
		var pageSize=document.form.countPerPage.value;		//페이지 당 출력 할 결과 row 수
		var totalPages = Math.floor((total-1)/pageSize) + 1;	
		var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;	  
			if( firstPage <= 0 ) firstPage = 1;			
		var lastPage = parseInt(firstPage)-1+parseInt(PAGEBLOCK) ;	
			if( lastPage > totalPages ) lastPage = totalPages;				
		var nextPage = lastPage+1 ;	//	다음목록 페이지는 마지막페이지+1 
		var prePage = firstPage-10 ;		// 전 목록으로 가는거는 첫번째 글 -10개 전 글로
			if( firstPage > PAGEBLOCK ){
				paggingStr +=  "<a href='javascript:goPage("+prePage+");'>◁</a>  " ;
			}		
		for( i=firstPage; i<=lastPage; i++ ){	//해당 목록 내의 첫페이지부터 마지막 페이지까지 반복
			if( pageNum == i )		//만약 현재페이지가 i와 같다면 볼드처리
				paggingStr += "<a style='font-weight:bold;color:blue;font-size:15px;' href='javascript:goPage("+i+");'>" + i + "</a>  ";
			else	//아니라면 그냥 출력
				paggingStr += "<a href='javascript:goPage("+i+");'>" + i + "</a>  ";
		}		
		if( lastPage < totalPages ){	//만약 마지막 페이지가 총목록수보다 작다면
			paggingStr +=  "<a href='javascript:goPage("+nextPage+");'>▷</a>";
		}		
		$("#pageApi").html(paggingStr);
	}	
}

function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	htmlStr +="<tr>";
	htmlStr +="<th> 도로명 주소 </th>";
	htmlStr +="<th> 지번정보 </th>";
	htmlStr +="<th> 우편번호 </th>";
	htmlStr += "</tr>"
	// jquery를 이용한 JSON 결과 데이터 파싱
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td><a href='javascript:goParent(\""+this.roadAddr+"\","+"\"" +this.zipNo+"\");'>"+this.roadAddr+"</td>"; //도로명주소(참고항목 제외)
		htmlStr += "<td>"+this.jibunAddr+"</td>";	//지번정보
		htmlStr += "<td>"+this.zipNo+"</td>";		//우편번호
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	// 결과 HTML을 FORM의 결과 출력 DIV에 삽입
	$("#list").html(htmlStr);
}
</script>
<title>주소검색</title>
</head>
<body>
<form name="form" id="form" method="get" onsubmit="return false">
  <input type="hidden" name="currentPage" value="1"/>				<!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
  <input type="hidden" name="countPerPage" value="10"/>		<!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->		
  <input type="hidden" name="resultType" value="json"/> 			<!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
  <input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE3MDgyMTExNDc0MDIzODk4"/>		<!-- 요청 변수 설정 (승인키) -->  
  <input type="text" name="keyword" placeholder="동을 입력해주세요" id="keyword" onkeydown="javascript:if(event.keyCode==13) {getAddr();}" value=""/>				<!--요청 변수 설정 (키워드)  -->
  <input type="button" onclick="getAddr();" value="주소검색하기"/>
  <div id="list">   <!-- 검색 결과 리스트 출력 영역 --> </div>
	<div class="paginate" id="pageApi"></div>	
	<!-- 엔터로도 검색처리 되게 처리해야함 -->
</form>
</body>
</html>