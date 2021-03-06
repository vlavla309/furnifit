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
<!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script> -->
<!-- bootstrap-css -->
<link href="${pageContext.servletContext.contextPath }/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- Favicon -->
<link rel="shortcut icon" href="${rSrcPath }/images/favicon.ico">
<!-- // Favicon -->

<!-- font-awesome icons -->
<link href="${pageContext.servletContext.contextPath }/resources/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Arimo" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Dosis:300,400,500,600" rel="stylesheet">
<!-- //font -->
<script src="${pageContext.servletContext.contextPath }/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	/* jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	}); */
	
	var contextPath = "${contextPath}"
	var loginEmail = "${login.email}"
	var rSrcPath = "${rSrcPath}"
</script>	
<!--animate-->
<%-- <link href="${pageContext.servletContext.contextPath }/resources/css/animate.css" rel="stylesheet" type="text/css" media="all"> --%>
	<script>
		 //new WOW().init();
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
                         <c:choose>
                            <c:when test="${empty login }"> 
                              <p style="color: #A7A8AA; font-size: 13px; text-align: left; margin: 6.500px 0px 0px 197px;"><strong>Welcome to FurniFit</strong></p>
                            </c:when>
                            <c:otherwise>
                              <p style="color: #A7A8AA; font-size: 13px; margin: 6.500px 0px 0px 197px;"><strong>${login.email }님 환영합니다</strong></p>
                            </c:otherwise>
                          </c:choose>
					</div>
					<div class="top-header-right wow fadeInRight animated" data-wow-delay=".5s">
						<div class="top-header-right-info">
                          <ul>
                          <c:choose>
                            <c:when test="${empty login }"> 
                              <li><a href="${contextPath}/member/login" style="color: #A7A8AA; font-size: 13px;"><strong>Login</strong></a></li>
                              <li><a href="${contextPath}/member/register" style="color: #A7A8AA; font-size: 13px;"><strong>Sign up</strong></a></li>
                            </c:when>
                            <c:otherwise>
                              <li><a href="${contextPath}/member/logout" style="color: #A7A8AA; font-size: 13px;">Logout</a></li>
                              <li><a href="${contextPath}/mypage" style="color: #A7A8AA; font-size: 13px;">Mypage</a></li>
                            </c:otherwise>
                          </c:choose>
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
					<h1><a href="${contextPath}"><img src="${contextPath}/resources/images/logo.png" alt="" /></a></h1>
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
								<li><a href="${contextPath}" class="active">Home</a></li>
								<li><a href="${contextPath}/about">About</a></li>
								<li><a href="${contextPath}/product">Product</a></li>
								<li><a href="#" class="dropdown-toggle hvr-bounce-to-bottom" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Plan<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a class="hvr-bounce-to-bottom" href="${contextPath}/plan/writer">Write</a></li>
										<li><a class="hvr-bounce-to-bottom" href="${contextPath}/article">Board</a></li> 
									</ul>
								</li>	
								<li><a href="${contextPath}/brand">Brand</a></li>
							</ul>	
							<div class="clearfix"> </div>
						</div>	
					</nav>		
				</div>
			</div>
		</div>
	</div>
	<!-- //header -->