<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
<!-- Current Page CSS -->
<link href="/manage/resources/HTML/plugins/rs-plugin/css/settings.css" rel="stylesheet" />
<link href="/manage/resources/HTML/plugins/rs-plugin/css/custom-captions.css" rel="stylesheet" />

<!-- Custom CSS -->
<link rel="stylesheet" href="/manage/resources/HTML/css/custom.css">
</head>
</head>

<body>
	<%@ include file="top.jsp"%>
	<br>

	<div id="container">

		<!--Set your own slider options. Look at the v_RevolutionSlider() function in 'theme-core.js' file to see options-->
		<div class="home-slider-wrap fullwidthbanner-container">
			<div class="v-rev-slider" data-slider-options='{ "startheight":750 }'>
				<ul>
					<!-- SLIDE  -->
					<li data-transition="fade" data-slotamount="7"
						data-masterspeed="1000">
						<!-- MAIN IMAGE --> <img src="/manage/resources/HTML/img/slider/slide1-rev2.jpg"
						alt="fullslide6" data-bgposition="center top" data-bgfit="cover"
						data-bgrepeat="no-repeat"> <!-- LAYERS --> <!-- LAYER NR. 1 -->
						<div
							class="tp-caption light_heavy_70_shadowed lfb ltt tp-resizeme main-home"
							data-x="center" data-hoffset="0" data-y="250" data-voffset="0"
							data-speed="600" data-start="800" data-easing="Power4.easeOut"
							data-splitin="none" data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">We
							are Creative</div> <!-- LAYER NR. 2 -->
						<div class="tp-caption light_medium_30 lfb ltt tp-resizeme"
							data-x="center" data-hoffset="0" data-y="330" data-voffset="0"
							data-speed="600" data-start="900" data-easing="Power4.easeOut"
							data-splitin="none" data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">
							Lorem ipsum dolor sit amet consectetur adipisicing <br>
							elitsed eiusmod tempor enim minim
						</div>
						<div class="tp-caption lfb ltt stb" data-x="center"
							data-hoffset="0" data-y="400" data-voffset="0" data-speed="500"
							data-start="1700" data-easing="Circ.easeInOut"
							data-splitin="none" data-splitout="none" data-elementdelay="0"
							data-endelementdelay="0" data-endspeed="500">
							<a href='#' class="btn v-btn v-second-light">Learn MORE</a>
						</div>
					</li>
					<li data-transition="fade" data-slotamount="7"
						data-masterspeed="600"><img alt="Nexus"
						src="/manage/resources/HTML/img/slider/slider6.jpg" data-bgposition="center top"
						data-bgfit="cover" data-bgrepeat="no-repeat">
						<div
							class="tp-caption lfb light_heavy_70_shadowed stb white-color no-line"
							data-x="center" data-hoffset="0" data-y="250" data-voffset="0"
							data-speed="800" data-start="600" data-easing="Circ.easeInOut"
							data-splitin="none" data-splitout="none" data-elementdelay="0"
							data-endelementdelay="0" data-endspeed="600"
							style="z-index: 2; line-height: 60px;">CREATIVE DIGITAL
							AGENCY</div>
						<div class="tp-caption v-caption-h1 lfb st center" data-x="center"
							data-hoffset="0" data-y="330" data-voffset="0" data-speed="700"
							data-start="1100" data-easing="Circ.easeInOut"
							data-splitin="none" data-splitout="none" data-elementdelay="0"
							data-endelementdelay="0" data-endspeed="600">
							Lorem ipsum dolor sit amet consectetur adipisicing elitsed <br>
							eiusmod tempor enim minim
						</div>
						<div class="tp-caption lfb stb" data-x="center" data-hoffset="0"
							data-y="400" data-voffset="0" data-speed="700" data-start="1700"
							data-easing="Circ.easeInOut" data-splitin="none"
							data-splitout="none" data-elementdelay="0"
							data-endelementdelay="0" data-endspeed="600">
							<a href='#' class="btn v-btn v-second-light">FIND OUT MORE</a>
						</div> <!--<div class="v-slider-overlay overlay-colored"></div>--></li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<!-- Libs --> 

<script src="/manage/resources/HTML/js/jquery-3.1.1.min.js"></script> 
<script src="/manage/resources/HTML/js/bootstrap.min.js"></script> 
<script src="/manage/resources/HTML/js/jquery.flexslider-min.js"></script> 
<script src="/manage/resources/HTML/js/jquery.easing.js"></script> 
<script src="/manage/resources/HTML/js/jquery.fitvids.js"></script> 
<script src="/manage/resources/HTML/js/jquery.carouFredSel.min.js"></script> 
<script src="/manage/resources/HTML/js/jquery.validate.js"></script> 
<script src="/manage/resources/HTML/js/theme-plugins.js"></script> 
<script src="/manage/resources/HTML/js/jquery.isotope.min.js"></script> 
<script src="/manage/resources/HTML/js/imagesloaded.js"></script> 
<script src="/manage/resources/HTML/js/view.min.js?auto"></script> 
<script src="/manage/resources/HTML/plugins/rs-plugin/js/jquery.themepunch.tools.min.js"></script> 
<script src="/manage/resources/HTML/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script> 
<script src="/manage/resources/HTML/js/theme-core.js"></script>
	
	
</body>
</html>