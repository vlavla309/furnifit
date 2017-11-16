<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>${title }</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Triplex Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="${pageContext.servletContext.contextPath }/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/style.css" type="text/css" media="all" />
<!--// css -->

<!-- font-awesome icons -->
<link href="${pageContext.servletContext.contextPath }/resources/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Arimo" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Dosis:300,400,500,600" rel="stylesheet">
<!-- //font -->
<script src="${pageContext.servletContext.contextPath }/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>	
<!--animate-->
<link href="${pageContext.servletContext.contextPath }/resources/css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.servletContext.contextPath }/resources/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="top-header">
			<div class="container">
				<div class="top-header-info">
					<div class="top-header-left wow fadeInLeft animated" data-wow-delay=".5s">
						<p>MORE THAN 10 NEW DESIGNS FOR YOUR HOME</p>
					</div>
					<div class="top-header-right wow fadeInRight animated" data-wow-delay=".5s">
						<div class="top-header-right-info">
                          <ul>
                          <c:choose>
                            <c:when test="${empty login }"> 
                              <li><a href="${contextPath}/member/login">Login</a></li>
                              <li><a href="${contextPath}/member/register">Sign up</a></li>
                            </c:when>
                            <c:otherwise>
                              <li><a href="${contextPath}/member/logout">Logout</a></li>
                              <li><a href="${contextPath}/mypage/mypage">Mypage</a></li>
                            </c:otherwise>
                          </c:choose>
                          </ul>
            
            
<%-- 							<ul>
								<li><a href="login.html">Login</a></li>
								<li><a href="${contextPath}/member/register">Sign up</a></li>
                                
							</ul> --%>
						</div>
						<div class="social-icons">
							<ul>
								<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a class="twitter facebook" href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a class="twitter google" href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="bottom-header navBar">
			<div class="container">
				<div class="logo wow fadeInDown animated" data-wow-delay=".5s">
					<h1><a href="index.html"><img src="${pageContext.servletContext.contextPath }/resources/images/logo.jpg" alt="" /></a></h1>
				</div>
				<div class="top-nav wow fadeInRight animated" data-wow-delay=".5s">
					<nav class="navbar navbar-default">
						<div class="container">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu						
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="index.html" class="active">Home</a></li>
								<li><a href="about.html">About</a></li>
								<li><a href="codes.html">Codes</a></li>
								<li><a href="#" class="dropdown-toggle hvr-bounce-to-bottom" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gallery<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a class="hvr-bounce-to-bottom" href="gallery1.html">Gallery1</a></li>
										<li><a class="hvr-bounce-to-bottom" href="gallery2.html">Gallery2</a></li> 
										<li><a class="hvr-bounce-to-bottom" href="icons.html">Font Icons</a></li>     												
									</ul>
								</li>	
								<li><a href="blog.html">Blog</a></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>	
							<div class="clearfix"> </div>
						</div>	
					</nav>		
				</div>
			</div>
		</div>
	</div>
	<!-- //header -->