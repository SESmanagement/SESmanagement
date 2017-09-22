<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부사항</title>
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<style>
.center{
margin: 0 auto;
}
</style>


<script>
	function joinPlz() {
		$
				.ajax({
					url : "/manage/group/join",
					type : "post",
					data : $("#form").serialize(),
					success : function(result) {
						if (result == 1) {
							$.confirm({
							    title: '만원',
							    content: '모든 인원이 모집되었습니다!',
							    buttons:{
							    	확인 : {
							    	btnClass: 'btn-red',
							    	action : function(){
									location.href = "/manage/group/detail?group_num=${detail.group_num}";
							    	}
							    	}
							    }
							    })
						} else if (result == 2) {
							$.confirm({
							    title: '중복가입',
							    content: '이미 가입된 멤버입니다',
							    buttons:{
							    	확인 : {
							    	btnClass: 'btn-red',
							    	action : function(){
									location.href = "/manage/group/detail?group_num=${detail.group_num}";
							    	}
							    	}
							    }
							    })
						} else {
							$.confirm({
							    title: '성공',
							    content: '가입이 성공적으로 완료되었습니다.',
							    buttons:{
							    	확인 : {
							    	btnClass: 'btn-red',
							    	action : function(){
									location.href = "/manage/group/list";
							    	}
							    	}
							    }
							    })
						}
					},
					error : function() {
						alert('에러발생!');
					}

				});
	}
</script>

</head>
<body>
	<%@ include file="../top.jsp"%>
	<div>
		<div class="v-heading-v2">
			<br>
			<br>
			<h3>${detail.group_title }</h3>
		</div>
		<table>
			<tr>
				<td>참여중인 학생</td>
				<td><c:forEach items="${gvolist }" var="gvo">
					${gvo.owner_name }
					</c:forEach></td>
			</tr>
			<tr>
				<td>소모임 만든 사람</td>
				<td>${detail.owner_name}</td>
			</tr>
			<tr>
				<td>주제</td>
				<td>${detail.content }</td>
			</tr>
			<tr>
				<td>모집기간</td>
				<td>${detail.seek_start_date }~${detail.seek_end_date }</td>
			</tr>
			<tr>
				<td>기간</td>
				<td>${detail.start_date }~${detail.end_date }</td>
			</tr>
			<tr>
				<td>모집내용</td>
				<td>
				<div class="col-sm-12">
				<textarea readonly style="border:none;" rows="10" cols="100" >${detail.content_detail }</textarea>
				</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" class="btn v-btn v-green-sea" 
					onclick="javascript:joinPlz();">가입신청</button> <button type="button" class="btn v-btn v-green-sea"
					value="이전화면으로" onclick="javascript:history.go(-1);">이전 화면으로</button></td>
			</tr>
		</table>
	</div>
	<form name="form" id="form">
		<input type="hidden" name="student_num"
			value="${sessionScope.vo.student_num}"> <input type="hidden"
			name="group_num" value="${detail.group_num }"> <input
			type="hidden" name="headcount" value="${detail.headcount }">
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>
