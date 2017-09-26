<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>반 배치</title>
<style>
	table,th, td{
	 	border :1px solid black;
		border-collaspe: collapse;
		text-align: center; 
	} 
</style>
<link href="/manage/resources/HTML/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/style.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/streamline-icon.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-nav-menu.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-portfolio.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-blog.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-animation.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-bg-stylish.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/v-shortcodes.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/css/theme-responsive.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/plugins/owl-carousel/owl.theme.css" rel="stylesheet" />
    <link href="/manage/resources/HTML/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">

    <!-- Form Elements -->
    <link href="/manage/resources/HTML/css/v-form-element.css" rel="stylesheet" />
    

	<script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script> 
    <script src="/manage/resources/HTML/js/bootstrap.min.js"></script>
    <script src="/manage/resources/HTML/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script src="/manage/resources/HTML/js/jquery.flexslider-min.js"></script>
    <script src="/manage/resources/HTML/js/jquery.easing.js"></script>
    <script src="/manage/resources/HTML/js/jquery.fitvids.js"></script>
    <script src="/manage/resources/HTML/js/jquery.carouFredSel.min.js"></script>
    <script src="/manage/resources/HTML/js/jquery.validate.js"></script>
    <script src="/manage/resources/HTML/js/theme-plugins.js"></script>
    <script src="/manage/resources/HTML/js/jquery.isotope.min.js"></script>
    <script src="/manage/resources/HTML/js/imagesloaded.js"></script>
    <script src="/manage/resources/HTML/js/view.min.js?auto"></script>
    <script src="/manage/resources/HTML/js/theme-core.js"></script>
    <script src="/manage/resources/HTML/js/bootstrap-timepicker.js"></script>
    <script src="/manage/resources/HTML/js/bootstrap-datepicker.js"></script>
    <script src="/manage/resources/HTML/js/jquery.maskedinput.js"></script>
    <script src="/manage/resources/HTML/js/theme-form-element.js"></script>
    
    
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
	<script src="/manage/resources/js/jquery.datetimepicker.full.min.js"></script>

<script>
	$(function(){
		partyCall();
	})
	var totalSeat = 0;
	var ableSeat = 0 ;
	var roadParty = 0;
	//로딩시 파티 로딩
	function partyCall(){
		var str = "<select id = 'partyList' name ='party_num'>";
		
		
		$.ajax({
			url:"/manage/arrange/getPartyList",
			type: "get",
			datatype: "json",
			success: function(result){
				$(result).each(function(index, item){
					if(item.party_num != 0){
					str += "<option id ='party'>" + item.party_num +"</option>";
					}
				});
					str += "</select>";
					str += "<input type='button' class='btn v-btn v-btn-default' id ='partyBtn' value='선택'>";
					$("#partySelect").html(str);	
	
			}
		})
	}
	//방 불러오기
	$(document).on("click", "#partyBtn", function(){
		var arrayNum = new Array();
		var party_num = $("#partyList").val();
		roadParty = $("#partyList").val();
		var value = 0;
		var indx = 0;
		var str = "<div class='col-sm-12'>";
		//str += "<div class='container'>";
		$.ajax({
			url: "/manage/arrange/callRooms?party_num="+party_num,
			type: "get",
			success: function(result){
				$(result).each(function(index, item){
					arrayNum.push(item.num);
					str +="<div class='col-sm-3'>";
					str +="<div class='panel-body'>"
					str +="<div class='feature-box-text'><p>";
					str +="<table><caption>"+item.name+"</caption>";
					for(var i = 0 ; i < item.height ; i++){
						str +="<tr>";
						for(var j = 0 ; j < item.width ; j++){												
							str +="<td id='"+item.num+"value"+(indx++)+"'>("+i+","+j+")</td>"	
						}
						str +="</tr>";
					}
					str +="</table>";
					str +="</p></div>";
					str +="</div>";
					str +="</div>";
					indx = 0;
					
				})
				str +="</div>";
				str +="</div>";
				$("#callRooms").html(str);
				
				
				
				for(var a in arrayNum){
					checkServiceAble(arrayNum[a]);
				}
				seatInfo(party_num);
				totalSeat = 0;
				ableSeat = 0 ;
			}
		});
		
		
	})
		
	function checkServiceAble(value, party_num){

		var str = "";
		//Room_Status의 serviceable 상태 가져옴
		//Sevice 클래스태그에 hidden값 집어넣어 값을 보내 수시로 체인지 해주려고함
		$.ajax({
			url: "/manage/arrange/getRoom_Status?classRoom_num="+value,
			type: "get",
			success: function(result){			
				$(result).each(function(index, item){
					totalSeat++;
					$("#"+value+"value"+index).append("<input type='hidden' id='serviceable' name='serviceable' value="+item.serviceable+">");
	
					if(item.serviceable==1){
						$("#"+value+"value"+index).css("background-color","red");
					}else{
						ableSeat++;
						
					}
					
				})


				
				
				
			}
		})
		
	}
	
	function sleep(delay){
		var start = new Date().getTime();
		while(new Date().getTime() < start + delay);
	}
	
	
	function seatInfo(party_num){
		//입력
		sleep(200);
		var str = "<table><tr>";
		
		$.ajax({
			url:"/manage/arrange/countPartyMember?party_num="+party_num,
			type:"get",
			success:function(result){

				str += "<th>총 좌석 수</th>";
				str += "<td>"+ totalSeat +"</td>";
				str += "<tr>";
				str += "<th>사용 가능 좌석</th>";
				str += "<td>"+ ableSeat +"</td>";
				str += "<tr>";
				str += "<th>파티 수</th>";
				str += "<td>총 "+result+"명</td>";
				str += "</tr><table>";
				$("#roomInfo").html(str);
			
			}
		})

		
	}
	
	$(document).on("click","#arrange_btn",function(){
		$.ajax({
			url:"/manage/arrange/readyMember?party_num="+roadParty,
			type:"get",
			success:function(){
				alert("hello~");
			}
		})
	})
</script>
</head>
<body>
<%@ include file="../top.jsp" %>
<div id = "container" class="slideshow">


	<div id = "partySelect"></div>
	<!-- 기수에 따른 파티 -->
		<div>
			<br>
			<h1>배당된 강의실</h1><hr>
			<div id = "callRooms"><br>
			<p>기수를 선택하세요!!</p>
			</div>
		</div><br><br><hr>
	<div class ="row" id = "explainRoom">
		<a href="#" class="read-more-home">배치에 필요한 정보<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a>
		<div>
			<div id = "roomInfo" class ="col-sm-3"></div>
			<div id = "memberList" class ="col-sm-3">
				<div class="owl-carousel owl-theme owl-carousel-init" data-plugin-options="{&quot;items&quot;: 4, &quot;singleItem&quot;: false, &quot;pagination&quot;: true}" style="opacity: 1; display: block;">
                <div class="owl-wrapper-outer"><div class="owl-wrapper" style="width: 2916px; left: 0px; display: block; transition: all 800ms ease; transform: translate3d(0px, 0px, 0px);"><div class="owl-item" style="width: 243px;"><div class="item">
                  <figure class="animated-overlay overlay-alt"> <img alt="Nexus" src="img/static/bus-1.jpg"> <a href="portfolio-single.html" class="link-to-post"></a>
                    <figcaption>
                      <div class="thumb-info thumb-info-v2"><i class="fa fa-angle-right"></i></div>
                    </figcaption>
                  </figure>
                  <div class="v-portfolio-item-info">
                    <h3 class="v-portfolio-item-title"> <a href="portfolio-single.html" class="link-to-post">Festival Of Digital Arts</a> </h3>
                  </div>
                </div></div><div class="owl-item" style="width: 243px;"><div class="item">
                  <figure class="animated-overlay overlay-alt">
                    <div class="flexslider thumb-slider" style="height: 172.938px;">
                      <ul class="slides">
                        <li class="flex-active-slide" style="width: 100%; float: left; margin-right: -100%; position: relative; display: list-item;"> <a href="portfolio-single-fw-slides.html" class="link-to-post"> <img alt="Nexus" src="img/static/bus-2.jpg"> </a> </li>
                        <li style="width: 100%; float: left; margin-right: -100%; position: relative;"> <a href="portfolio-single-fw-slides.html" class="link-to-post"> <img alt="Nexus" src="img/static/bus-3.jpg"> </a> </li>
                      </ul>
                    <ul class="flex-direction-nav"><li><a class="flex-prev" href="#"><i class="icon-angle-left"></i>Previous</a></li><li><a class="flex-next" href="#"><i class="icon-angle-right"></i>Next</a></li></ul></div>
                  </figure>
                  <div class="v-portfolio-item-info">
                    <h3 class="v-portfolio-item-title"> <a href="portfolio-single.html" class="link-to-post">From Sketch To Full Brand</a> </h3>
                  </div>
                </div></div><div class="owl-item" style="width: 243px;"><div class="item">
                  <figure class="animated-overlay overlay-alt"> <img alt="Nexus" src="img/static/bus-4.jpg"> <a href="portfolio-single.html" class="link-to-post"></a>
                    <figcaption>
                      <div class="thumb-info thumb-info-v2"><i class="fa fa-angle-right" style="visibility: visible; opacity: 1; transition-duration: 0.3s; transform: scale(0.5) rotate(-90deg);"></i></div>
                    </figcaption>
                  </figure>
                  <div class="v-portfolio-item-info">
                    <h3 class="v-portfolio-item-title"> <a href="portfolio-single.html" class="link-to-post">Branding The Digital Age</a> </h3>
                  </div>
                
                
                
                </div></div><div class="owl-item" style="width: 243px;"><div class="item">
                  <figure class="animated-overlay overlay-alt"> <img alt="Nexus" src="img/static/bus-5.jpg"> <a href="portfolio-single.html" class="link-to-post"></a>
                    <figcaption>
                      <div class="thumb-info thumb-info-v2"><i class="fa fa-angle-right" style="visibility: visible; opacity: 1; transition-duration: 0.3s; transform: scale(0.5) rotate(-90deg);"></i></div>
                    </figcaption>
                  </figure>
                  <div class="v-portfolio-item-info">
                    <h3 class="v-portfolio-item-title"> <a href="portfolio-single.html" class="link-to-post">Connecting People &amp; Places</a> </h3>
                  </div>
                </div></div><div class="owl-item" style="width: 243px;"><div class="item">
                  <figure class="animated-overlay overlay-alt"> <img alt="Nexus" src="img/static/bus-6.jpg"> <a href="portfolio-single.html" class="link-to-post"></a>
                    <figcaption>
                      <div class="thumb-info thumb-info-v2"><i class="fa fa-angle-right"></i></div>
                    </figcaption>
                  </figure>
                  <div class="v-portfolio-item-info">
                    <h3 class="v-portfolio-item-title"> <a href="portfolio-single.html" class="link-to-post">3D Animation &amp; Graphics</a> </h3>
                  </div>
                </div></div><div class="owl-item" style="width: 243px;"><div class="item">
                  <figure class="animated-overlay overlay-alt"> <img alt="Nexus" src="img/static/bus-7.jpg"> <a href="portfolio-single.html" class="link-to-post"></a>
                    <figcaption>
                      <div class="thumb-info thumb-info-v2"><i class="fa fa-angle-right"></i></div>
                    </figcaption>
                  </figure>
                  <div class="v-portfolio-item-info">
                    <h3 class="v-portfolio-item-title"> <a href="portfolio-single.html" class="link-to-post">Web Application</a> </h3>
                  </div>
                </div></div></div></div>
                
                
                
                
                
              <div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div></div></div>
				
				<div>
					<button id="arrange_btn" >헬로~</button>
				</div>				
	
			</div>
		</div>
	</div>
	
	
</div>


















	<script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script> 
    <script src="/manage/resources/HTML/js/bootstrap.min.js"></script>
    <script src="/manage/resources/HTML/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script src="/manage/resources/HTML/js/jquery.flexslider-min.js"></script>
    <script src="/manage/resources/HTML/js/jquery.easing.js"></script>
    <script src="/manage/resources/HTML/js/jquery.fitvids.js"></script>
    <script src="/manage/resources/HTML/js/jquery.carouFredSel.min.js"></script>
    <script src="/manage/resources/HTML/js/jquery.validate.js"></script>
    <script src="/manage/resources/HTML/js/theme-plugins.js"></script>
    <script src="/manage/resources/HTML/js/jquery.isotope.min.js"></script>
    <script src="/manage/resources/HTML/js/imagesloaded.js"></script>
    <script src="/manage/resources/HTML/js/view.min.js?auto"></script>
    <script src="/manage/resources/HTML/js/theme-core.js"></script>
    <script src="/manage/resources/HTML/js/bootstrap-timepicker.js"></script>
    <script src="/manage/resources/HTML/js/bootstrap-datepicker.js"></script>
    <script src="/manage/resources/HTML/js/jquery.maskedinput.js"></script>
    <script src="/manage/resources/HTML/js/theme-form-element.js"></script>
</body>
</html>
