<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset='utf-8' />
<script src="/manage/resources/fullcalenda/lib/moment.min.js"></script>
<script src="/manage/resources/fullcalenda/lib/jquery.min.js"></script>
<script src="/manage/resources/fullcalenda/fullcalendar.min.js"></script>
<link href="/manage/resources/fullcalenda/fullcalendar.min.css" rel="stylesheet">
<link href="/manage/resources/fullcalenda/fullcalendar.print.min.css" rel="stylesheet" media="print">

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
    
	    /* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	    position: relative;
	    background-color: #fefefe;
	    margin: auto;
	    padding: 0;
	    border: 1px solid #888;
	    width: 80%;
	    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	    -webkit-animation-name: animatetop;
	    -webkit-animation-duration: 0.4s;
	    animation-name: animatetop;
	    animation-duration: 0.4s
	}
	
	/* Add Animation */
	@-webkit-keyframes animatetop {
	    from {top:-300px; opacity:0} 
	    to {top:0; opacity:1}
	}
	
	@keyframes animatetop {
	    from {top:-300px; opacity:0}
	    to {top:0; opacity:1}
	}
	
	/* The Close Button */
	.close {
	    color: white;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
	
	.modal-header {
	    padding: 2px 16px;
	    background-color: #5cb85c;
	    color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	    padding: 2px 16px;
	    background-color: #5cb85c;
	    color: white;
	}
	
	input[type=checkbox] {  
        display: none;  
    }
    
    input[type=checkbox] + label{
        display: inline-block;  
        cursor: pointer;  
        position: relative;  
        padding-left: 25px;  
        margin-right: 15px;  
        font-size: 13px;
    }
    
    input[type=checkbox] + label:before {     
        content: "";  
        display: inline-block;  
      
        width: 20px;  
        height: 20px;  
      
        margin-right: 10px;  
        position: absolute;  
        left: 0;  
        bottom: 1px;  
        background-color: #ccc;  
        border-radius: 2px; 
        box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
    }
    input[type=checkbox]:checked + label:before { 
        content: "\2713";  /* 체크모양 */
        text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
        font-size: 18px; 
        font-weight:800; 
        color: #fff;  
        background: #5cb85c; /* #f5245f */
        text-align: center;  
        line-height: 18px;  
    }

</style>
</head>
<body>

<script>

// 캘린더 불러오기
    $(document).ready(function() {
        var today = "20"+'${sysdate}'.substring(0,8);

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay,listWeek'
            },          
            defaultDate: today, // '2017-09-12',
            navLinks: true, // can click day/week names to navigate views
            
            weekNumbers: true,
            weekNumbersWithinDays: true,
            weekNumberCalculation: 'ISO',
            
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            eventSources: [

                // your event source
                {
                    url: '/manage/myPage/getEvent',
                    type: 'POST',
                    data: {"student_num": '${student_num}'},
                    success: function(result) {
//                      $(result).each(function(index, item) {
                            
//                      }); // each
                    },
                    error: function() {
                        alert('there was an error while fetching events!');
                    },
//                     color: 'yellow',   // a non-ajax option
//                     textColor: 'black' // a non-ajax option
                }
                // any other sources...
            ],
            
            timeFormat: 'H(:mm)', // uppercase H for 24-hour clock
            
            
            // 등록된 일정 출력
            eventRender: function (event, element) {
                element.attr('href', 'javascript:void(0);');
                element.click(function() {
                    $("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
                    $("#endTime").html(moment(event.end).format('MMM Do h:mm A'));
                    $("#eventInfo").html(event.description);
                    $("#eventLink").attr('href', event.url);
                    $("#eventContent").show({ modal: true, title: event.title, width:350}); // dialog
                }); //element.click
                
//                 var el = element.html();
//                 element.html("<div style='width:90%; float:left;'>" +  el + "</div><div style='text-align:right;' class='close'><span class='glyphicon glyphicon-trash'></span></div>");
    
                element.find('.close').click(function(){
                 if(!confirm("Delete event?")){
                   return false;
                 }else{
                 var id = event.id;
                 $.post('<?= base_url() ?>calendar/delete_alert',
                 {
                    id:id
                 },
                 function(data){
                  if(data == 1)
                    alert('Successfully deleted');
                  else
                    alert('Error deleted');  
                 });
                  $("#fullcalendar").fullCalendar('removeEvents', event.id);
      }         
  });             
            }, // eventRender
            
            // 날짜 빈 공간 클릭시 개인 일정 등록
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectHelper: true,
                select: function(start, end) {
//                     var title = prompt('Event Title:'); // 여기에 모달창을 띄워서 입력을 받자!
                    
                    addEvent(); // 일정 등록 창(modal) 띄우기 - css 나중에 하기!!!!
                    
                    // 날짜 포맷  변경
                    var start_date = moment(start).format('YYYY/MM/DD HH:mm:SS');
                    var end_date = moment(end).format('YYYY/MM/DD HH:mm:SS');
                    
                    // 하루종일(checkAllDay)에 체크했을 경우
                    $(document).on("click", "#checkAllDay", function() {
                    	if ($("#checkAllDay").is(":checked")) {
                            $("#startDate").val(start_date);
                            $("#endDate").val(end_date);
						} else if (!$("#checkAllDay").is(":checked")) {
							 $("#startDate").val("");
							 $("#endDate").val("");
						}
                    });
                    
                    // 이벤트 시간 입력
                    $("#startDate").datetimepicker({
                        format: "yyyy-mm-dd hh:ii P",
                        showMeridian: true,
                        autoclose: true,
                        todayBtn: true,
                        initialDate: new Date(start_date)
                    });
                    
                    $("#endDate").datetimepicker({
                        format: "yyyy-mm-dd hh:ii P",
                        showMeridian: true,
                        autoclose: true,
                        todayBtn: true,
                        initialDate: new Date(end_date)
                    });
                    
                    
                    var title = "";
                    var memo = "";
                    var constraint = "";
                    var backgroundColor = "";
                    var source = "";
                    var student_num = "${vo.student_num}";
                    
                    $("#addBtn").on("click", function() {
	                    title = $("#title").val();
	                    memo = $("#memo").val();
	                    start_dt = $("#startDate").val();
                        end_dt = $("#endDate").val();
                        
                        alert("start: "+startDate+", end: "+endDate)
	                    
	                    // 관리자일 경우에만
	                    if (student_num == 1) {
		                    var constraintList = [];
		                    $(".checkbox").each(function (index, item) {
		                        if ($(item).is(":checked")) { // 체크된 내역
		                        	constraintList.push($(item).val());
		                        } // if
		                    }) // each
		                    
		                    // 두 개의 기수가 모두 체크되어 있을 경우, constraint = 99 (all)
		                    if (constraintList.length == 2) constraint = 99;
		                    else constraint = constraintList[0];
		                    
		                    if ($("#option").val() != null && $("#option").val() == 'announcement') {
		                    	source = "내부/공지사항";
		                    	backgroundColor = "#5cb85c"; // 내부/공지사항
		                    }
		                    else if ($("#option").val() != null && $("#option").val() == 'session') {
		                    	source = "외부/설명회";
		                    	backgroundColor = "#cdf441"; // 외부/설명회
		                    }
		                    else if ($("#option").val() != null && $("#option").val() == 'exam') {
		                    	source = "평가/시험";
		                    	backgroundColor = "#fdffbc";    // 평가/시험
		                    }
	                    }// if
	                    
	                    if (title) { // title값은 필수임!!!!!!!! 
	                        var form = document.createElement("form");
	                        form.setAttribute("method", "post");
	                        form.setAttribute("action", "/manage/myPage/addEvent");
	                        
	                            var hidden1 = document.createElement("input");
	                            hidden1.setAttribute("type", "hidden");
	                            hidden1.setAttribute("name", "title");
	                            hidden1.setAttribute("value", title);
	                            form.appendChild(hidden1);
	                            
	                            var hidden2 = document.createElement("input");
	                            hidden2.setAttribute("type", "hidden");
	                            hidden2.setAttribute("name", "start");
	                            hidden2.setAttribute("value", start_dt);
	                            form.appendChild(hidden2);
	                            
	                            var hidden3 = document.createElement("input");
	                            hidden3.setAttribute("type", "hidden");
	                            hidden3.setAttribute("name", "end");
	                            hidden3.setAttribute("value", end_dt);
	                            form.appendChild(hidden3);
	                            
	                            var hidden4 = document.createElement("input");
	                            hidden4.setAttribute("type", "hidden");
	                            hidden4.setAttribute("name", "memo");
	                            hidden4.setAttribute("value", memo);
	                            form.appendChild(hidden4);
	                            
	                            var hidden6 = document.createElement("input");
	                            hidden6.setAttribute("type", "hidden");
	                            hidden6.setAttribute("name", "student_num");
	                            hidden6.setAttribute("value", student_num);
	                            form.appendChild(hidden6);
	                            
	                         // 관리자일 경우에만
	                            if (student_num == 1) {
		                            var hidden5 = document.createElement("input");
		                            hidden5.setAttribute("type", "hidden");
		                            hidden5.setAttribute("name", "constraint");
		                            hidden5.setAttribute("value", constraint);
		                            form.appendChild(hidden5);
		                            
		                            
		                            var hidden7 = document.createElement("input");
		                            hidden7.setAttribute("type", "hidden");
		                            hidden7.setAttribute("name", "backgroundColor");
		                            hidden7.setAttribute("value", backgroundColor);
		                            form.appendChild(hidden7);
		                            
		                            var hidden8 = document.createElement("input");
		                            hidden8.setAttribute("type", "hidden");
		                            hidden8.setAttribute("name", "source");
		                            hidden8.setAttribute("value", source);
		                            form.appendChild(hidden8);
	                            }
	                            
	                        document.body.appendChild(form);
	                        form.submit();
	                    } else {
	                    	  alert("제목을 입력해 주세요.")
	                    }
                    }); // #addBtn-click

//                     var eventData;
//                     if (title) { // title값은 필수임!!!!!!!!
//                         eventData = {
//                             title: title,
//                             start: start,
//                             end: end,
//                             memo: memo,
//                             constraint: constraint,
                      
//                         }; // eventData
                        
//                         $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
//                     } // if
                    
//                     $('#calendar').fullCalendar('unselect');
                }, // select
                
                eventClick:function(event) {
                    if(event.url) {
                        alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
                        window.open(event.url);
                        return false;
                    }
                },
                
                editable: true,
                eventLimit: true, // allow "more" link when too many events
        });
    });
    
    // 이벤트 등록 모달창 띄우기
    function addEvent() {
    	// Get the modal
        var modal = document.getElementById('myModal');
        
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
        
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        
        // When the user clicks on the button, open the modal 
        $(function() {
            $("#title").val("");
            $("#memo").val("");
            $("#startDate").val("");
            $("#endDate").val("");
            $(".checkbox").each(function (index, item){
                $(item).prop("checked", false); // 체크박스 초기화
            }) // each
            modal.style.display = "block";
        })
        
     // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        } 
    }   
  
    $('#calendar').fullCalendar({ 
    	events: [ 
    		// events here 
    	], 
    	editable: true, 
    	eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc) { 
    		alert( 
    				event.title + " was moved " + 
    				dayDelta + " days and " + 
    				minuteDelta + " minutes."
    		);
    		
    		if (allDay) { 
    			alert("Event is now all-day"); 
    		}else{ 
    			alert("Event has a time-of-day"); 
    		} 
    		
    		if (!confirm("Are you sure about this change?")) { 
    			revertFunc(); 
    		}
    	}
    });
    
    // 이벤트 등록시 시간 선택
//     $(function() {
//         if ($(".checkbox > #checkAllDay").is(":checked")) {
//         	alert("allDay")
// //         	$("#startDate").val()
// //         	$("#endDate").attr("disabled", true);
//         } 
// //         else {
// //             $("#startDate").attr("disabled", "");
// //             $("#endDate").attr("disabled", "");
// //         }
//     });
</script>

<%@ include file="../top.jsp" %>

<div class="v-page-heading v-bg-stylish v-bg-stylish-v1">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="heading-text">
                    <h1>My Schedule</h1>
                </div>
            </div>
        </div>
    </div>
</div>
        
<div class="container">
     <h5 style="text-align:right">현재 시각 : ${sysdate }</h5>
     <h5 style="text-align:right">${vo.name} 님 : ${vo.student_num}</h5>
     
         <!--Article-->
             <article class="col-sm-9">
                 <div class="post-info clearfix">
					<!-- 달력시작 -->
					<div id="divCalendar">
					    <div id="calendar"></div>
					</div>
                 </div>
             </article>
</div>


<!-- modal -->
<div id="myModal" class="modal">

    <!-- Modal content -->
	<div class="modal-content">
	  <div class="modal-header">
	    <span class="close">&times;</span>
	    <h2>개인 일정 등록하기</h2>
	  </div>
	  <div class="modal-body">
	    <form>
	       <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" id="title" required="required"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><input type="text" id="memo"></td>
                </tr>
                <tr>
                    <td>시간</td>
                    <td>
                         <input type="checkbox" class="checkboxAllDay" id="checkAllDay"><label for="checkAllDay">하루종일</label>
                    </td>
                    <td>
                        <div id="inputDate" class="input-append date form_datetime" data-date=""> <!-- 2012-12-21T15:25:00Z -->
						    <input id="startDate" size="16" type="text" value="" readonly >
						    to
						    <input id="endDate" size="16" type="text" value="" readonly >
						    <span class="add-on"><i class="icon-remove"></i></span>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
                    </td>
                    
                </tr>
             
             <!-- 관리자 메뉴 -->
             <c:if test="${vo.student_num == 1 }">
                <tr>
                    <td>공식이벤트 여부</td>
                    <td>
                        <input type="checkbox" class="checkbox" id="first" value="33"><label for="first">33기</label>
                        <input type="checkbox" class="checkbox" id="second" value="34"><label for="second">34기</label>
                    </td>
                    <td>
                        <select id='option'>
                            <option value='announcement'>내부/공지사항</option>
                            <option value='session'>외부/설명회</option>
                            <option value='exam'>평가/시험</option>
                        </select>
                    </td>
                </tr>
            </c:if>
	       
	       </table>
		    <input type="button" value="등록" id="addBtn" data-dismiss="modal">
		    <input type="reset" value="취소" id="addReset" data-dismiss="modal">
	   </form>
	  </div>
	  <div class="modal-footer">
	    <h3>Modal Footer</h3>
	  </div>
	</div>

</div>


<!--// BACK TO TOP // -->
    <div id="back-to-top" class="animate-top"><i class="fa fa-angle-up"></i></div>
    
        <!-- datetimepicker -->
    <link rel="stylesheet" href="/manage/resources/date2/bootstrap-datetimepicker.css" />
    <script src="/manage/resources/date2/bootstrap-datetimepicker.js"></script>

 <%@ include file="../footer.jsp" %>
</body>
</html>