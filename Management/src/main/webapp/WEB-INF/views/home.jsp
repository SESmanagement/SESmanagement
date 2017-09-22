<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
<script src='/manage/resources/fullcalenda/lib/moment.min.js'></script>
<script src="/manage/resources/fullcalenda/lib/jquery.min.js"></script>
<script src="/manage/resources/fullcalenda/fullcalendar.min.js"></script>
<link href="/manage/resources/fullcalenda/fullcalendar.min.css" rel="stylesheet">
<link href="/manage/resources/fullcalenda/fullcalendar.print.min.css" rel="stylesheet" media="print">
<!-- 달력 jquery 시작 -->

</head>

<!-- 달력 jquery 끝 -->
<!--  달력 css 시작 -->
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>

<!-- 달력 css끝 -->


<body>
<%@ include file="top.jsp" %>
<br>

<!-- 달력시작 -->
	<div id="calendar"></div>
<!-- 달력끝 -->

<%@ include file="footer.jsp" %>
<script>
	$(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate: '2017-09-12',
			navLinks: true, // can click day/week names to navigate views

			weekNumbers: true,
			weekNumbersWithinDays: true,
			weekNumberCalculation: 'ISO',

			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: {
		        url: '/manage/group/calendar?',
		        type: 'POST',
		        data: {
		            custom_param1: 'something',
		            custom_param2: 'somethingelse'
		        },
		        error: function() {
		            alert('there was an error while fetching events!');
		        },
		        color: 'yellow',   // a non-ajax option
		        textColor: 'black' // a non-ajax option
		    }

		});
		
	});

</script>
</body>
</html>