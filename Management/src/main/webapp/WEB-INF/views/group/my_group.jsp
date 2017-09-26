<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 소모임</title>

<!-- jquery -->
<script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script>

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700|Montserrat:300,400,500,600,700,800,900|Open+Sans:300,400,400i,600,600i,700,800|Raleway:300,400,400i,500,600,700|Roboto:300,400,400i,500,700,900"
	rel="stylesheet">


<!-- Form Elements -->
<link href="/manage/resources/HTML/css/v-form-element.css"
	rel="stylesheet" />


<!-- Libs CSS -->
<link href="/manage/resources/HTML/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/style.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/streamline-icon.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-nav-menu.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-portfolio.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-blog.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-animation.css" rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-bg-stylish.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/v-shortcodes.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/css/theme-responsive.css"
	rel="stylesheet" />
<link href="/manage/resources/HTML/plugins/owl-carousel/owl.theme.css"
	rel="stylesheet" />
<link
	href="/manage/resources/HTML/plugins/owl-carousel/owl.carousel.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">


<!-- Custom CSS -->
<link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">

<script>

	//벌금내역1
	$(document).on(
			'click',
			'.cn1',
			function(e) {
				var counter = $(this).parent().parent().parent().parent()
						.parent('div').attr("id").substring(3);
				$.ajax({
					url : '/manage/group/penalty_list', 
					type : 'post',
					data : $("#penaltyform" + counter).serialize(),
					success : function(result) {
						console.log(result);
						var test = "<table><strong><tr><th class='center'>이름</th><th class='center'>벌금</th><th class='center'>날짜</th></tr></strong>"
						$.each(result, function(index, item) {
							test += "<tr><td>" + item.name + "</td><td>"
									+ item.penalty_per + "</td><td>"+item.penalty_date+"</td></tr>"
						})
						test += "</table>";
						test += "<div><div class='col-md-3'><span class='label label-success'>사용할 금액</span></div>";
						test += "<div class='col-sm-3'><input type='text' id='inputpenalty' placeholder='사용할 금액 입력'></div>";
						test += "<div class='col-md-3'>";
						test += "<button type='button' class='btn v-btn v-alizarin v-small-button'>사용함</button></div></div>";
						$.confirm({
							 boxWidth: '450px',
							  useBootstrap: false,
							 theme: 'modern',
							   animation: 'zoom',
							    closeAnimation: 'scale',
							   buttons : {
								info : {
									text : "확인",
									btnClass : 'btn-red',
									action : function() {
									}
								}
							},
							title : '<h3 class="v-heading v-center-heading"><span>벌금 이력</span></h3>',
							content : test
						})
					}
				});
			});

	//벌금내역2	
	$(document).on('click', '.cn2', function(e) {
		var counter = $(this).parent().parent().parent().parent()
				.parent('div').attr("id").substring(4);
		$.ajax({
			url : '/manage/group/penalty_list', 
			type : 'post',
			data : $("#penaltyformm" + counter).serialize(),
			success : function(result) { 
				console.log(result);
				var test = "<table><strong><tr><th>이름</th><th>벌금</th><th>날짜</th></tr></strong>"
				$.each(result, function(index, item) {
					if(item.penalty_date != ""){
						test += "<tr><td>" + item.name + "</td><td>"
								+ item.penalty_per + "</td><td>"+item.penalty_date+"</td></tr>"
					}
				})
				test += "</table>";
				test += "<div><input type='text' id='inputpenalty'><button type='button' class='btn v-btn v-alizarin'></div>";
				$.confirm({
					   theme: 'modern',
					   animation: 'zoom',
					    closeAnimation: 'scale',
					   buttons : {
						info : {
							text : "확인",
							btnClass : 'btn-red',
							action : function() {
							}
						}
					},	//button
					title : '<h3 class="v-heading v-center-heading"><span>벌금 이력</span></h3>',
					content : test
				})
			}
		});
	});

	var stgn = null;
	var date = null;

	//그룹번호랑 학생번호 가져오기
	$(document)
			.on(
					'click',
					'.stno',
					function() {
						var counter = $(this).parent().parent().parent()
								.parent().parent('div').attr("id").substring(3);
						var cldStr = '';
						cldStr += '<div class="member-calendar">';
						cldStr += '<div class="form-group">';
						cldStr += '<div class="col-md-3">';
						cldStr += '<div id="datepicker" data-plugin-datepicker data-plugin-skin="primary"></div>';
						cldStr += '</div></div></div>';
						$('.cld').empty();
						$('#cld' + counter).append(cldStr);
						$("#datepicker").datepicker();
						stgn = null;
						//변수에 저장
						stgn = {
							"student_num" : $(this).children().children('.st').val(),
							"group_num" : $(this).children().children('.gn').val()
						}
					})

	//그룹번호랑 학생번호 가져오는거 무식 2
	$(document)
			.on(
					'click',
					'.stno2',
					function() {
						var counter = $(this).parent().parent().parent()
								.parent().parent('div').attr("id").substring(4);
						var cldStr = "";
						cldStr += '<div class="member-calendar">';
						cldStr += '<div class="form-group">';
						cldStr += '<div class="col-md-3">';
						cldStr += '<div id="datepicker2" data-plugin-datepicker data-plugin-skin="primary"></div>';
						cldStr += '</div></div></div>';
						$('.cldd').empty();
						$('#cldd' + counter).append(cldStr);
						$("#datepicker2").datepicker();
						stgn = null;
						//변수에 저장
						stgn = {
							"student_num" : $(this).children().children('.st').val(),
							"group_num" : $(this).children().children('.gn').val()
						}
					})

	//달력에서 날짜 가져오는 노가다^_^
	$(document)
			.on(
					'click',
					'.day',
					function() {
						var day = this.innerHTML;
						var monthandyear = document
								.getElementsByClassName('datepicker-switch')[0].innerHTML;
						var may = monthandyear.split(" ");
						var month = may[0];
						var year = may[1];
						var month1 = {
							"January" : "01",
							"February" : "02",
							"March" : "03",
							"April" : "04",
							"May" : "05",
							"June" : "06",
							"July" : "07",
							"August" : "08",
							"September" : "09",
							"October" : "10",
							"November" : "11",
							"December" : "12"
						}
						var month2 = month1[month];
						date = year + "/" + month2 + "/" + day; //연 월 일 합친거

						penalty();
					});

	//위에 날짜랑 학생정보를 취합해서 개인 penalty 값을 가져오는 ajax를 실행!!!
	function penalty() {
		$.ajax({
			url : "/manage/group/penalty",
			type : "post",
			data : {
				"student_num" : stgn["student_num"],
				"group_num" : stgn["group_num"],
				"penalty_date" : date
			},
			success : function(result) {
				
				$.confirm({
					 animation: 'zoom',
				    closeAnimation: 'scale',
				    title: '벌금 확인',
			    content: "이 날의 벌금은 " + result + "원 입니다.",
				    buttons: {
				        확인 : function () {
					        },
				        수정: {
			            text: '수정',
			            btnClass: 'btn-red',
			            keys: ['enter', 'shift'],
			            action: function(){
			               /*여기부터 프롬프트*/
			               $.confirm({
								    title: '금액수정',
								    content: '' +
								    '<div class="form-group">' +
								    '<label>수정하실 금액을 입력해주세요</label>' +
								    '<input type="text" placeholder="금액 입력" name="penalty" class="penalty form-control" required />' +
								    '</div>',
								    buttons: {
								        formSubmit: {
								            text: '수정',
								            btnClass: 'btn-red',
								            action: function (e) {
								                var penalty = this.$content.find('.penalty').val();
								                if(!penalty){
								                    $.alert('금액을 입력해주세요');
								                    return false;
								                }
								                $.alert(penalty+'원을 입력합니다' );
								                if(result == 0){
													insert_penalty(penalty);
								                }else{
								                	modify_penalty(penalty);
								                }
								            }
								        },
								        cancel: function () {
								            //close
								        },
								    }
								});
			               /*여기까지 프롬프트*/
				            }
				        }
					    }
				});
			}
			
			
			// 			{
// 				alert(이 날의 벌금은 " + result + "원 입니다.");
// 				if (result == "0") {
// 					var penalty = prompt(date + "일자의 벌금을 입력해주세요");
// 					if (penalty != null)
// 						insert_penalty(penalty); //숫자만 입력되게 하기..ㅠㅠ (※수정해야할 거)
// 				}
// 			}
			,fail : function() {
				alert('실패');
			}
		});
	}

	//penalty 입력하는건데 조금 다른 방식으로 해야 할 것 같음!!
	function insert_penalty(penalty) {
		$.ajax({
			url : "/manage/group/insert_penalty",
			type : "post",
			data : {
				"student_num" : stgn["student_num"],
				"group_num" : stgn["group_num"],
				"penalty_date" : date,
				"penalty_per" : penalty
			},
			success : function(result, e) {
				e.preventDefault();
				if (result) {
					$.alert({
						 animation: 'zoom',
						    closeAnimation: 'scale',
						    title : "벌금등록!",
						content : "벌금 등록 성공 우히히"
						});
				} else {
					$.alert({
						 animation: 'zoom',
						    closeAnimation: 'scale',
						    title : "error!",
						content : "에러~"
						});
				}
			}
		})
	}
	
	function modify_penalty(penalty) {
		$.ajax({
			url : "/manage/group/modify_penalty",
			type : "post",
			data : {
				"student_num" : stgn["student_num"],
				"group_num" : stgn["group_num"],
				"penalty_date" : date,
				"penalty_per" : penalty
			},
			success : function(result, e) {
				e.preventDefault();
				if (result) {
					$.alert({
						 animation: 'zoom',
						    closeAnimation: 'scale',
						    title : "금액 수정",
						content : "금액 수정 성공!"
						});
				} else {
					$.alert({
						 animation: 'zoom',
						    closeAnimation: 'scale',
						    title : "error!",
						content : "에러~"
						});
				}
			}
		})
	}
	
</script>

<%@ include file="../top.jsp"%>
</head>
<body>

	<!-- 토글창 시작 -->
	<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="v-heading-v2">
				<br> <br>
				<h3>내가 모임장인 소모임</h3>
			</div>
			<!-- 모임장인 소모임 토글 시작 -->
			<div class="panel-group" id="Div1">
				<c:forEach items="${myvolist }" var="myvo" varStatus="status">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse"
									data-parent="#Div1" href="#Div${status.count + 1}"> <!-- 제목 넣는 곳 -->
									<c:if test="${myvo.end <0}"><strike>소모임명 : ${myvo.group_title}</strike> <span class="label label-success">종료된 소모임</span></c:if>
								<c:if test="${myvo.end >= 0 && myvo.dday >= 0}">소모임명 : ${myvo.group_title}		</c:if>
								<c:if test="${myvo.dday<0 }">소모임명 : ${myvo.group_title} <span class="label label-warning">미시작</span></c:if>
								</a>
							</h3>
						</div>
						<!-- 내용 넣는 곳 -->
						<div id="Div${status.count+1}" class="accordion-body collapse">
							<div class="panel-body low">
								<!-- circle charts 시작 -->
								<div class="tab-pane fade active in" id="circle-charts">
									<div class="col-sm-4">
										<div class="v-circle-chart v-circle-x chart-center"
											data-linewidth="15" data-percent="0"
											data-animatepercent="${myvo.percent }" data-size="170"
											data-barcolor="#F15F5F" data-trackcolor="#e4e4e4">
											<c:if test="${myvo.end < 0 }">
												<span>100 %</span>
											</c:if>
											<c:if test="${myvo.end >= 0 }">
												<span>${myvo.percent } %</span>
											</c:if>
										</div>
										<br>
										<h3>${myvo.start_date }~${myvo.end_date }</h3>
										<c:if test="${myvo.dday < 0 }"><h5>소모임 시작까지 ${myvo.dday }일 남았습니다.</h5></c:if>
										<c:if test="${myvo.dday >= 0 }"><h5>시작한 지 ${myvo.dday }일 지났고 
										<c:if test="${myvo.end < 0 }"> 끝났다!!</c:if>
										<c:if test="${myvo.end >= 0 }">${myvo.end }일 남았다!!</c:if></h5></c:if>
									</div>
								</div>

								<!-- circle chart 끝 -->
								<div>
									<div class="col-sm-4">
										<c:forEach items="${pgvolist }" var="pgvo">
											<c:if test="${pgvo.group_num == myvo.group_num}">
												<div class="v-counter">
													<div class="count-number cn1" data-from="0"
														data-to="${pgvo.penalty }" data-speed="1200"
														data-refresh-interval="25">${pgvo.penalty}</div>
													<div class="count-divider">
														<span style="width: 50px;"></span>
													</div>
													<h3 class="v-counter-text" style="opacity: 1; bottom: 0px;">
														모인 벌금</h3>
												</div>
											</c:if>
										</c:forEach>
										<div class="v-center">
											<h3 class="v-heading v-center-heading">
												<span>참여자</span>
											</h3>
											<c:forEach items="${gjvolist }" var="gjvo">
												<c:if test="${gjvo.group_num == myvo.group_num }">
													<button type="button" class="btn v-btn v-alizarin stno">
														${gjvo.name }
														<form id="penaltyform${status.count+1 }">
															<input type="hidden" class="st" name="student_num"
																value="${gjvo.student_num }"> <input
																type="hidden" class="gn" name="group_num"
																value="${gjvo.group_num }">
														</form>
													</button>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<!-- 캘린더시작 -->
								<div class="cld col-md-4" id="cld${status.count + 1}"></div>
								<!-- 캘린더끝 -->
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 토글 끝 -->


			<!-- 내가 팀원으로 들어가 있는 소모임 -->
			<div class="v-heading-v2">
				<br> <br>
				<h3>내가 팀원으로 들어가 있는 소모임</h3>
			</div>
			<!-- 토글 시작 -->
			<div class="panel-group" id="Divv1">
				<c:forEach items="${gvolist}" var="gvo" varStatus="status">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse"
									data-parent="#Divv1" href="#Divv${status.count + 1 }"> <!-- 제목 넣는 곳 -->
						<c:if test="${gvo.end <0}"><strike>소모임명 : ${gvo.group_title}</strike> <span class="label label-success">종료된 소모임</span></c:if>								
						<c:if test="${gvo.end >= 0 && gvo.dday >= 0}">소모임명 : ${gvo.group_title}		</c:if>
						<c:if test="${gvo.dday<0 }">소모임명 : ${gvo.group_title} <span class="label label-warning">미시작</span></c:if>
							</a></h3>
						</div>
						<!-- 내용 넣는 곳 -->
						<div id="Divv${status.count + 1 }" class="accordion-body collapse">
							<div class="panel-body">
								<!-- circle charts 시작 -->
								<div class="tab-pane fade active in" id="circle-charts">
									<div class="col-sm-4">
										<div class="v-circle-chart v-circle-x chart-center"
											data-linewidth="15" data-percent="0"
											data-animatepercent="${gvo.percent }" data-size="170"
											data-barcolor="#F15F5F" data-trackcolor="#e4e4e4">
											<c:if test="${gvo.end <= 0 }">
												<span>100 %</span>
											</c:if>
											<c:if test="${gvo.end > 0 }">
												<span>${gvo.percent } %</span>
											</c:if>
										</div>
										<br>
										<h3>${gvo.start_date }~${gvo.end_date }</h3>
										<c:if test="${gvo.dday < 0 }"><h5>소모임 시작까지 ${gvo.dday }일 남았습니다.</h5></c:if>
										<c:if test="${gvo.dday >= 0 }"><h5>시작한 지 ${gvo.dday }일 지났고 
										<c:if test="${gvo.end < 0 }"> 끝났다!!</c:if>
										<c:if test="${gvo.end >= 0 }">${gvo.end }일 남았다!!</c:if></h5></c:if>
									</div>
								</div>
								<!-- circle chart 끝 -->
								<div>
									<div class="col-sm-4">
										<c:forEach items="${pgvolist }" var="pgvo">
											<c:if test="${pgvo.group_num == gvo.group_num}">
												<div class="v-counter">
													<div class="count-number cn2" data-from="0"
														data-to="${pgvo.penalty }" data-speed="1200"
														data-refresh-interval="25">${pgvo.penalty }</div>
													<div class="count-divider">
														<span style="width: 50px;"></span>
													</div>
													<h3 class="v-counter-text" style="opacity: 1; bottom: 0px;">
														모인 벌금</h3>
												</div>
											</c:if>
										</c:forEach>
										<div class="v-center">
											<h3 class="v-heading v-center-heading">
												<span>참여자</span>
											</h3>
											<c:forEach items="${gjvolist }" var="gjvo">
												<c:if test="${gjvo.group_num == gvo.group_num }">
													<button type="button" class="btn v-btn v-alizarin stno2">
														${gjvo.name } 
														<form id="penaltyformm${status.count+1 }">
														<input type="hidden" name="student_num" class="st"
															value="${gjvo.student_num }"> <input
															type="hidden" name="group_num" class="gn" value="${gjvo.group_num }">
													</form></button>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<!-- 캘린더시작 -->
								<div class="cldd col-md-4" id="cldd${status.count + 1}"></div>
								<!-- 캘린더끝 -->
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>


	<%@ include file="../footer.jsp"%>


	<!-- Libs -->

	<script src="/manage/resources/HTML/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.flexslider-min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.easing.js"></script>
	<script src="/manage/resources/HTML/js/jquery.fitvids.js"></script>
	<script src="/manage/resources/HTML/js/jquery.carouFredSel.min.js"></script>
	<script src="/manage/resources/HTML/js/jquery.validate.js"></script>
	<script src="/manage/resources/HTML/js/jquery.isotope.min.js"></script>
	<script src="/manage/resources/HTML/js/imagesloaded.js"></script>
	<script src="/manage/resources/HTML/js/view.min.js?auto"></script>

	<script src="/manage/resources/HTML/js/bootstrap-timepicker.js"></script>
	<script src="/manage/resources/HTML/js/bootstrap-datepicker.js"></script>
	<script src="/manage/resources/HTML/js/jquery.maskedinput.js"></script>
	<script src="/manage/resources/HTML/js/theme-form-element.js"></script>
</body>
</html>