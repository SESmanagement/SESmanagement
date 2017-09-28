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
        width: 40%;
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
    
    .modal-header {
        padding: 5px 30px!important;
        background-color: #5cb85c;
        color: white;
    }
    
    .modal-footer {
        padding: 5px 30px!important;
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
    
    table {
        margin-left: auto;
        margin-right: auto;
        text-align: left;
    }
    
    table input[type=text] {
        border: none;
        background-color: #e5fce5!important;
    }
    
    table textarea {
        border: none;
        background-color: #e5fce5!important;
    }

    aside [class=fc-event] {
        line-height: 20px;
        width: 100px;
        border: 1px solid;
    }

</style>
</head>
<body>

<script>

// 캘린더 불러오기
    $(document).ready(function() {
        var today = "20"+'${sysdate}'.substring(0,8);

        var calendar = $('#calendar').fullCalendar({
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
            {
             url: '/manage/myPage/getEvent',
             type: 'post',
             data: {"student_num": '${student_num}'},
                success: function(result) {
	                 var eventArray = [];
	                 $(result).each(function(index, item) {
	                     eventArray.push({
	                            title: item.title,
	                            start: item.start,
	                            end: item.end,
	                            allDay: item.allDay,
	                            id: item.id,
	                            student_num: item.student_num,
	                            className: item.className,
	                            editable: item.editable,
	                            reference: item.reference,
	                     });
	                  }) // each

//                     $('#calendar').fullCalendar( 'addEventSource', result);         
//                     $('#calendar').fullCalendar( 'refetchEvents' );
//                     $('#calendar').fullCalendar( 'removeEventSources', result);
//                  $('#calendar').fullCalendar('renderEvents', eventArray, true);
             }, // success
            } // events   ,
            
            ],
            
            
            // drop 처리
            droppable: true,
            eventDrop: function(event, delta, revertFunc, jsEvent, ui, view) {
                $('.draggable').data('event', { title: event.id }); // event.title
                
                if (confirm("일정을 정말 변경하시겠습니까?")) {
                    // 날짜 포맷  변경
                    var start_date = moment(event.start).format('YYYY/MM/DD HH:mm:SS');
                    var end_date = moment(event.end).format('YYYY/MM/DD HH:mm:SS');
                    
                    $.ajax({
                        url: "/manage/myPage/modifyEventDrag",
                        type: "post",
                        data: {"start":start_date, "end":end_date, "id":event.id, "student_num":event.student_num},
                        success: function(result) {
                            if (result == "true") alert("수정이 완료되었습니다.");
                            else alert("수정에 실패했습니다.");
                            location.href = "/manage/myPage/mySchedule";
                        } // success
                    }); // ajax
                } else  revertFunc();
            }, // eventDrop
            
            // Resize 처리
            eventResize: function(event, delta, revertFunc) {
                if (confirm("정말 시간을 변경하시겠습니까?")) {
                    // 날짜 포맷  변경
                    var start_date = moment(event.start).format('YYYY/MM/DD HH:mm:SS');
                    var end_date = moment(event.end).format('YYYY/MM/DD HH:mm:SS');
                    
                    $.ajax({
                        url: "/manage/myPage/modifyEventDrag",
                        type: "post",
                        data: {"end":end_date, "id":event.id, "student_num":event.student_num},
                        success: function(result) {
                            if (result == "true") alert("수정이 완료되었습니다.");
                            else alert("수정에 실패했습니다.");
                            location.href = "/manage/myPage/mySchedule";
                        } // success
                    }); // ajax
                    
                } else revertFunc();

            }, // eventResize
            
            timeFormat: 'H(:mm)', // uppercase H for 24-hour clock
            
            // 날짜 빈 공간 클릭시 일정 등록
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectHelper: true,
                select: function(start, end) {
                    var modal = addEvent(); // 일정 등록 창(modal) 띄우기 - css 나중에 하기!!!!
                    
                    // 날짜 포맷  변경
                    var start_date = moment(start).format('YYYY/MM/DD HH:mm:SS');
                    var end_date = moment(end).format('YYYY/MM/DD HH:mm:SS');
                    
                    // 클릭된 날짜 입력
                    $("#startDate").val(start_date);
                    $("#endDate").val(end_date);
                    
                    // 하루종일(checkAllDay)에 체크했을 경우
                    $(document).on("click", "#checkAllDay", function() {
                        if ($("#checkAllDay").is(":checked")) {
                            $("#startDate").val(start_date.substring(0, 10) + " 00:00:00");
                            $("#endDate").val(end_date.substring(0, 10) + " 00:00:00");
                        } else if (!$("#checkAllDay").is(":checked")) {
                            $("#startDate").val("");
                            $("#endDate").val("");
                        }
                    });
                    
                    // 이벤트 시간 입력
                    $("#startDate").datetimepicker({
                        format : 'Y/m/d H:i',
                        value : start_date,
                        onShow : function() {
                            this.setOptions({
                                maxDate : $('#endDate').val() ? $('#endDate').val() : false,
                                maxTime : $('#endDate').val().substring(11, 16) ? $('#endDate').val().substring(11, 16) : false,
                            })
                        },
                        timepicker : true
                    });
                    
                    $("#endDate").datetimepicker({
                    	format : 'Y/m/d H:i',
                    	value : end_date,
                        onShow : function() {
                            this.setOptions({
                                minDate : $('#startDate').val() ? $('#startDate').val() : false,
                                minTime : $('#startDate').val().substring(11, 16) ? $('#startDate').val().substring(11, 16) : false
                            })
                        },
                        timepicker : true
                    });
                    
                    var title = "";
                    var memo = "";
                    var constraint = "";
                    var backgroundColor = "";
                    var reference = "";
                    var student_num = parseInt("${vo.student_num}");
                    
                    $("#addBtn").on("click", function() {
                        title = $("#title").val();
                        memo = $("#memo").val();
                        start_dt = $("#startDate").val();
                        end_dt = $("#endDate").val();
                        
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
                            else if (constraintList.length == 1) constraint = constraintList[0];
                            else constraint = 0;
                            
                            // 공식 이벤트 구분
                            if (constraint != 0) {
                                if (constraintList.length != 0 && $("#option option:selected").val() == '') {
                                    alert("공식이벤트 구분을 선택해 주세요");
                                    $(".checkbox").prop("checked", false);
                                    constraintList.empty();
                                    reference = "";
                                    backgroundColor = "";
                                    return;
                                } 
                                else if ($("#option option:selected").val() != null && $("#option option:selected").val() == 'announcement') {
                                    reference = "내부/공지사항";
                                    backgroundColor = "#5cb85c"; // 내부/공지사항
                                }
                                else if ($("#option option:selected").val() != null && $("#option option:selected").val() == 'session') {
                                    reference = "외부/설명회";
                                    backgroundColor = "#cdf441"; // 외부/설명회
                                }
                                else if ($("#option option:selected").val() != null && $("#option option:selected").val() == 'exam') {
                                    reference = "평가/시험";
                                    backgroundColor = "#fdffbc";    // 평가/시험
                                } 
                            }  
                            // if-#option
                        } // if-관리자
                        
                        // 개인 일정에 경우, 값이 없는 아래 3개에 디폴트값 넣어주기
                        if (constraint == '') constraint = 0;
                        if (backgroundColor == '') backgroundColor = null;
                        if (reference == '') reference = null;
                        
                        if (title && start_dt && end_dt) { // title값은 필수임!!!!!!!! 
                            $.ajax({
                                url: "/manage/myPage/addEvent",
                                type: "post",
                                data: {
                                        "title":title, "start":start_dt, "end":end_dt, "memo":memo, "student_num":student_num,
                                        "constraint":constraint, "backgroundColor":backgroundColor,
                                        "reference":reference
                                        },
                                success: function() {
                                    location.href = "/manage/myPage/mySchedule";
                                }, // success
                                error: function() {
                                    alert('등록실패??? 왜????');
                                }
                            }); // ajax
                        
                            modal.style.display = "none";
                        } else {
                              alert("제목과 일정을 입력해 주세요.")
                              calendar.fullCalendar('unselect');
                        }
                        
                    }); // #addBtn-click
                }, // select
                
                eventClick:function(event) {
                    // 해당 이벤트의 id
                    var id = event.id;
                    
                    // 본인 작성 이벤트일 경우에는 수정/삭제버튼 확인 가능
                    $("#writerArea").css("visibility", "");
                    if ("${vo.student_num}" == event.student_num) {
                        $("#writerArea").css("visibility", "visibility");
                    } else $("#writerArea").css("visibility", "hidden");
                    
                    // Get the modal
                    var modal = document.getElementById('clickModal');
                    
                    // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];
                    
                    // When the user clicks on the button, open the modal 
                    $(function() {
                        var title = event.title.split(":")[0];
                        var memo = event.memo;
                        var start_date = moment(event.start).format('YYYY/MM/DD HH:mm:SS');
                        var end_date = moment(event.end).format('YYYY/MM/DD HH:mm:SS');
                        var id = event.id;
                        var reference = event.reference;
                        
                        $("#eventTitle").val(title);
                        $("#eventMemo").val(memo);
                        $("#eventStart").val(start_date);
                        $("#eventEnd").val(end_date);
                        $("#eventId").val(id); // hidden
                        $("#eventReference").val(reference); // hidden
                        
                        if (event.constraint != 0) {
                            if (event.constraint == 99) {
                                $("#eventFormal").val("전체-"+event.reference);
                            } else {
                                $("#eventFormal").val(event.constraint+"기-"+event.reference);
                            }
                        } else $("#eventFormal").val("개인")
                        
                        // 수정 불가 처리
                        $("#eventTitle").attr("readOnly", true);
                        $("#eventMemo").attr("readOnly", true);
                        $("#eventStart").attr("readOnly", true);
                        $("#eventEnd").attr("readOnly", true);
                        
                        // 이벤트 클릭시 버튼의 이전 상태가 확인/취소 일 경우 -> 수정/삭제 버튼으로 변경
                        $("button").each(function(index, item) {
                        	if (item.id == "okBtn") {
                        		item.id = "modifyBtn";
                        		item.textContent = "수정";
                        		$("#okBtn").off("click");
                        	}
                        	if (item.id == "cancelBtn") {
                                item.id = "deleteBtn";
                                item.textContent= "삭제";
                                $("#cancelBtn").off("click");
                        	}
                        });
                        
                        // 이벤트 클릭시 수정->공식이벤트 구분부분 숨김
                        $("#adminArea1").empty();
                        $("#adminArea2").empty();
                        
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
                    } // window.onclick
                    
                    $("#modifyBtn").on("click", function() {
                        $("#deleteBtn").off("click"); // 삭제버튼 이벤트 삭제
                        if (event.reference != null && event.reference.includes("SRR")) {
	                         alert("수정이 불가합니다. 스터디룸 예약 페이지에서 확인하세요");
	                         modal.style.display = "none";
	                         return;
                        };
                        
                        if (event.reference != null && event.reference.includes("GR")) {
                            alert("수정이 불가합니다. 소모임 페이지에서 확인하세요");
                            modal.style.display = "none";
                            return;
                       };
                       
                       if (event.reference != null && event.reference.includes("BR")) {
                           alert("수정이 불가합니다. 도서대여 페이지에서 확인하세요");
                           modal.style.display = "none";
                           return;
                      };
                        
                        // 각 텍스트 태그 수정 가능 상태로 변경
                        $("#eventTitle").attr("readOnly", false);
                        $("#eventMemo").attr("readOnly", false);
                        $("#eventStart").attr("readOnly", false);
                        $("#eventEnd").attr("readOnly", false);
                        
                        // 수정/삭제 버튼 -> 확인/취소 버튼으로 변경
                        $("#modifyBtn").attr("id", "okBtn");
                        $("#okBtn").text("확인");
                        $("#deleteBtn").attr("id", "cancelBtn");
                        $("#cancelBtn").text("취소");
                        
                        // 이벤트 시간 입력
                        $("#eventStart").datetimepicker({
                            timepicker : true
                        });
                        
                        $("#eventEnd").datetimepicker({
                            format : 'Y/m/d H:i',
                            onShow : function() {
                                this.setOptions({
                                    minDate : $('#eventStart').val() ? $('#eventStart').val() : false,
                                    minTime : $('#eventStart').val().substring(11, 16) ? $('#eventStart').val().substring(11, 16) : false
                                })
                            },
                            timepicker : true
                        });
                        
                        // 공식 이벤트인 경우
                        if ($("#eventFormal").val() != '개인') {
                            if ("${vo.student_num}" == 1) { // 관리자만 수정 가능
                                $("#adminArea1").empty();
                                $("#adminArea2").empty();
                                var addRow1 = "";
                                var addRow2 = "";
                                addRow1 += "공식이벤트 여부";
                                addRow2 += "<input type='checkbox' class='checkboxEvent' id='modifyFirst' value='33'><label for='modifyFirst'>33기</label>";
                                addRow2 += "<input type='checkbox' class='checkboxEvent' id='modifySecond' value='34'><label for='modifySecond'>34기</label>";
                                addRow2 += "<select id='option_modify'>";
                                addRow2 += "<option value=''>---선택---</option>";
                                addRow2 += "<option value='announcement'>내부/공지사항</option>";
                                addRow2 += "<option value='session'>외부/설명회</option>";
                                addRow2 += "<option value='exam'>평가/시험</option>";
                                addRow2 += "</select>";
                                $("#adminArea1").append(addRow1);
                                $("#adminArea2").append(addRow2);
                                
                                var constraintList_modify = [];
                                // 기존 기수 체크내역 표시하기
                                if ($("#eventFormal").val().substring(0, 2) == "33") {
                                    $("#modifyFirst").prop("checked", true);
                                    constraintList_modify.push($("#modifyFirst").val());
                                } else if ($("#eventFormal").val().substring(0, 2) == "34") {
                                    $("#modifySecond").prop("checked", true);
                                    constraintList_modify.push($("#modifySecond").val());
                                } if ($("#eventFormal").val().substring(0, 2) == "전체") {
                                    $("#modifyFirst").prop("checked", true);
                                    $("#modifySecond").prop("checked", true);
                                    constraintList_modify.push($("#modifyFirst").val());
                                    constraintList_modify.push($("#modifySecond").val());
                                }
                                
                                // 기존 레퍼런스 체크내역 표시하기
                                if ($("#eventFormal").val().split("-")[1] == "내부/공지사항") {
                                    $("#option_modify").val("announcement");
                                } else if ($("#eventFormal").val().split("-")[1] == "외부/설명회") {
                                    $("#option_modify").val("session");
                                } else if ($("#eventFormal").val().split("-")[1] == "평가/시험") {
                                    $("#option_modify").val("exam");
                                }
                                
                             // 새로 체크된 기수 내역 constraintList_modify 배열에 담기
                                $(document).on("click", ".checkboxEvent", function() {
                                    if (constraintList_modify.indexOf(this.value) != -1) {
                                        var index = constraintList_modify.indexOf(this.value);
                                        constraintList_modify.splice(index, 1);
                                    } else constraintList_modify.push(this.value);
                                });
                                
                             var optionValue_modify = $("#option_modify").val();
                             // 새로 체크된 옵션 내역 #option_modify에 담기
                             $(document).on("click", "#option_modify", function() {
                            	 optionValue_modify = $("#option_modify").val();
                             });
                            
                            } else { // 관리자가 아닌 경우
                                alert("수정 권한이 없습니다.");
                                modal.style.display = "none";
                                return;
                            }
                        } // #eventFormal-if
                        
                        // 수정 > 확인 버튼 누르기
                        $("#okBtn").click(function(event) {
                         // db로 보낼 이벤트 수정 내역
                            var title = $("#eventTitle").val();
                            var memo = $("#eventMemo").val();
                            var start_dt = $("#eventStart").val();
                            var end_dt = $("#eventEnd").val();
                            var student_num = "${vo.student_num}";
                            var id = $("#eventId").val(); // hidden
                            var constraint = "";
                            var backgroundColor = "";
                            var reference = "";
                            
                            // 관리자일 경우에만
                            if (student_num == 1) {
                                    
                                    // 두 개의 기수가 모두 체크되어 있을 경우, constraint = 99 (all)
                                    if (constraintList_modify.length == 2) constraint = 99;
                                    else if (constraintList_modify.length == 1) constraint = constraintList_modify[0];
                                    else constraint = 0;
                                    
                                    // 공식 이벤트 구분
                                    if (constraint != 0) {
                                        if (optionValue_modify == '') {
                                            alert("공식이벤트 구분을 선택해 주세요");
                                            $(".checkboxEvent").prop("checked", false);
                                            constraintList_modify.empty();
                                            optionValue_modify.empty();
                                            reference = "";
                                            backgroundColor = "";
                                            return;
                                        } 
                                        else if (optionValue_modify != null && optionValue_modify == 'announcement') {
                                            reference = "내부/공지사항";
                                            backgroundColor = "#5cb85c"; // 내부/공지사항
                                        }
                                        else if (optionValue_modify != null && optionValue_modify == 'session') {
                                            reference = "외부/설명회";
                                            backgroundColor = "#cdf441"; // 외부/설명회
                                        }
                                        else if (optionValue_modify != null && optionValue_modify == 'exam') {
                                            reference = "평가/시험";
                                            backgroundColor = "#fdffbc";    // 평가/시험
                                        } 
                                    else {
                                        reference = "";
                                        backgroundColor = "";
                                    }
                                   } // constraint != 0
                            }// if-관리자
                            
                            // 개인 일정에 경우, 값이 없는 아래 3개에 디폴트값 넣어주기
                            if (constraint == '') constraint = 0;
                            if (backgroundColor == '') backgroundColor = null;
                            if (reference == '') reference = null;
                            
                            if (title && start_dt && end_dt) { // title값은 필수임!!!!!!!! 
                                $.ajax({
                                    url: "/manage/myPage/modifyEvent",
                                    type: "post",
                                    data: {
                                        "title":title, "start":start_dt, "end":end_dt, "memo":memo, "student_num":student_num,
                                        "constraint":constraint, "backgroundColor":backgroundColor,
                                        "reference":reference, "id":id
                                        },
                                    success: function() {
                                        location.href = "/manage/myPage/mySchedule";
                                    } // success
                                }); // ajax
                                
                                modal.style.display = "none"; // 창 닫기
                            
                            } else {
                                  alert("제목과 일정을 입력해 주세요.")
                                  calendar.fullCalendar('unselect');
                            }
                        }); // click-#okBtn
                        
                        // 수정 > 취소 버튼 누르기
                        $("#cancelBtn").click(function(event) {
                            var cancelAnswer = confirm("수정을 취소하시겠습니까?");
                            if(cancelAnswer) modal.style.display = "none";
                            else return;
                        }); // click-#cancelBtn
                    }); // modifyBtn
                    
                    
                    // 클릭한 이벤트 삭제하기
                    $("#deleteBtn").on("click", function() {
                       // 스터디룸 삭제 불가 처리
                       if (event.reference != null && event.reference.includes("SRR")) {
                    	   alert("삭제가 불가합니다. 스터디룸 예약 페이지에서 확인하세요");
                           modal.style.display = "none";
                           return;
                      };
                      // 소모임삭제 불가 처리
                      if (event.reference != null && event.reference.includes("GR")) {
                          alert("삭제가 불가합니다. 소모임 페이지에서 확인하세요");
                          modal.style.display = "none";
                          return;
                     };
                     
                     // 도서대여 불가 처리
                     if (event.reference != null && event.reference.includes("BR")) {
                         alert("삭제가 불가합니다. 도서대여 페이지에서 확인하세요");
                         modal.style.display = "none";
                         return;
                    };
                        
                        var answer = confirm("정말로 삭제하시겠습니까?");
                        if (answer) location.href="/manage/myPage/deleteEvent?id="+$("#eventId").val()+"&student_num=${vo.student_num}";
                        else return;
                    }); // click-#deleteBtn
                    
                }, // eventClick
    
                editable: true,
                eventLimit: true // allow "more" link when too many events
        });
    }); // ready
    
    
    // 이벤트 등록 모달창 띄우기
    function addEvent() {
        // Get the modal
        var modal = document.getElementById('addModal');
        
        // Get the button that opens the modal
//         var btn = document.getElementById("myBtn");
        
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        
        // When the user clicks on the button, open the modal 
        $(function() {
            $("#title").val("");
            $("#memo").val("");
            $("#startDate").val("");
            $("#endDate").val("");
            $("checkAllDay").prop("checked", false);
            $(".checkbox").each(function (index, item){
                $(item).prop("checked", false); // 체크박스 초기화
            }) // each
            
            // 이벤트 클릭시 수정/삭제 버튼 -> 확인/취소 버튼으로 변경
            $("#okBtn").attr("id", "modifyBtn");
            $("#modifyBtn").val("수정");
            $("#cancelBtn").attr("id", "deleteBtn");
            $("#deleteBtn").val("삭제");
            // 이벤트 클릭시 수정->공식이벤트란 hide
            $("#adminArea1").empty();
            $("#adminArea1").hide();
            $("#adminArea2").empty();
            $("#adminArea2").hide();
            
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
        return modal;
    }; // addEvent   
    
    // 이벤트 클릭시 이벤트 정보를 보여주는 모달창 띄우기
    function clickEvent(event) {
        // Get the modal
        var modal = document.getElementById('clickModal');
        
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        
        // When the user clicks on the button, open the modal 
        $(function(event) {
            $("#eventTitle").val($(event).title);
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
    }; // clickEvent 
  

    
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

         <!--Article-->
             <article class="col-sm-9">
                 <div class="post-info clearfix">
                    <!-- 달력시작 -->
                    <div id="divCalendar">
                        <div id="calendar"></div>
                    </div>
                 </div>
             </article>

            <!--Right Sidebar-->
            <aside class="sidebar right-sidebar col-sm-3">
                <section class="widget v-search-widget clearfix">
	                <div class="v-heading-v2 h5" style="display: inline-block">
	                    <h4>일정 색상 구분</h4>
	                </div>
	                <div style="text-align:justify;">
		                <div style="display: inline-block;">
			                <div class="fc-event" style="background-color:#f5245f;">스터디룸</div>
		                    <div class="fc-event" style="background-color:#ffb5ad; color:#1b0266; border:1px solid white;">소모임</div>
		                    <div class="fc-event" style="background-color:#f48342;">33기 공지</div>
		                    <div class="fc-event" style="background-color:#1aaaad;">34기 공지</div>
		                    <div class="fc-event" style="background-color:#7405ba;">전체 공지</div>
		                </div>
		                <div style="display: inline-block;">
		                    <div class="fc-event">개인 일정</div>
		                    <div class="fc-event" style="background-color:#4286f4;">도서 대여요청</div>
		                    <div class="fc-event" style="background-color:#002666;">도서 대여중</div>
		                    <div class="fc-event" style="background-color:#a7b4cc;">도서 반납완료</div>
		                    <div class="fc-event" style="background-color:#ff2626;">도서 연체중</div>
	                    </div>
                    </div>
                </section>
            </aside>
</div> <!-- 컨테이너 -->


<!-- modal -->
<div id="addModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <span class="close"> [ x ] </span> <!-- &times; --> 
        <h2><i class="fa fa-calendar-plus-o"></i>  일정 등록하기</h2>
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
                    <td><textarea id="memo" rows="3" cols="40"></textarea></td>
                </tr>
                <tr>
                    <td>시간</td>
                    <td>
                        <div class="input-daterange input-group" id="inputDate">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="start" id="startDate">
                            <span class="input-group-addon">to</span>
                            <input type="text" class="form-control" name="end" id="endDate">
                            <span class="add-on"><i class="icon-remove"></i></span>
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                        <input type="checkbox" class="checkboxAllDay" id="checkAllDay"><label for="checkAllDay">하루종일</label>
                   </td>
                </tr>
             
             <!-- 관리자 메뉴 -->
             <c:if test="${vo.student_num == 1 }">
                <tr>
                    <td>공식이벤트 여부</td>
                    <td>
                        <input type="checkbox" class="checkbox" id="first" value="33"><label for="first">33기</label>
                        <input type="checkbox" class="checkbox" id="second" value="34"><label for="second">34기</label>
                        <select id="option">
<!--                             <option value=''>---선택---</option> -->
                            <option value='announcement'>내부/공지사항</option>
                            <option value='session'>외부/설명회</option>
                            <option value='exam'>평가/시험</option>
                        </select>
                    </td>
                </tr>
            </c:if>
           
           </table>
      </div>
      <div class="modal-footer">
            <button type="button" id="addBtn" data-dismiss="modal" class="btn btn-success pull-left"><i class='fa fa-pencil'></i>  등록</button>
            <button type="reset" id="addReset" data-dismiss="modal" class="btn btn-success pull-right"><i class='fa fa-undo'></i>  취소</button>
      </div>
       </form>
    </div>
    
<div id="clickModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <span class="close"> [ x ]</span> <!-- &times; -->
        <h2><i class="fa fa-calendar-check-o"></i>  이벤트 정보</h2>
      </div>
      <div class="modal-body" id="clickModalBody">
           <table id="eventInfo">
                <tr>
                    <td>제목</td>
                    <td>
                        <input type="text" id="eventTitle" readonly>
                        <input type="hidden" id="eventId">
                        <input type="hidden" id="eventReference">
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea id="eventMemo" rows="3" cols="40" readonly></textarea></td>
                </tr>
                <tr>
                    <td>시간</td>
                    <td>
                        <div class="input-daterange input-group" data-plugin-datepicker>
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="start" id="eventStart" readonly>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="form-control" name="end" id="eventEnd" readonly>
                        </div>
                   </td>
                </tr>
                <tr>
                    <td>구분</td>
                    <td><input type="text" id="eventFormal" readonly></td>
                </tr>
                <tr>
                    <td><div id="adminArea1"><!-- 공식이벤트 여부 수정 --></div></td>
                    <td><div id="adminArea2"><!-- 공식이벤트 여부 수정 셀렉트박스 --></div></td>
                </tr>   
           </table>
      </div>
      <div class="modal-footer">
         <div id="writerArea">
               <button type="button" id="modifyBtn" data-dismiss="modal" class="btn btn-success pull-left"><i class="fa fa-spinner"></i>  수정</button>
               <button type="button" id="deleteBtn" data-dismiss="modal" class="btn btn-success pull-right"><i class="fa fa-trash"></i>  삭제</button>
         </div>
      </div>
    </div>
    
</div>

<!--// BACK TO TOP // -->
    <div id="back-to-top" class="animate-top"><i class="fa fa-angle-up"></i></div>
    
    <!-- datetimepicker -->
    <link rel="stylesheet" href="/manage/resources/date/jquery.datetimepicker.css" />
    <script src="/manage/resources/js/jquery.datetimepicker.full.min.js"></script>

 <%@ include file="../footer.jsp" %>
 
 <script src="/manage/resources/HTML/js/bootstrap.min.js"></script>
 
</body>
</html>
