<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript" src="/manage/resources/js/jquery-3.2.1.min.js"></script>
<title>주소등록창</title>
<script>
	function submitAddr(){
		var address2 = $("#address2").val();
		opener.document.infor.zip.value = "${zip}";
		opener.document.infor.addr1.value = "${address}";
		opener.document.infor.addr2.value = address2;
		self.close();
	}
</script>


</head>
<body>

(우편번호: ${zip})<br>
${address}<br>
<input type="text" id="address2" name="address2" placeholder="나머지 주소를 입력해주세요">
<input type="button" value="주소등록" onclick="submitAddr()">

</body>
</html>