<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
	<!-- login -->
	<div class="login">
		<div class="container">
			<div class="login-body">
				<div class="login-heading w3layouts">
					<h1>Login</h1>
				</div>
				<div class="login-info">
				<form action="${pageContext.servletContext.contextPath }/member/loginAction" method="post">
						<input type="email" class="user" name="email" placeholder="Email" required>
						<input type="password" name="passwd" class="lock" placeholder="Password" required>
						
						<c:if test="${err eq 'failed'}">
						<div class="alert alert-danger" role="alert">
							<strong>로그인 실패!</strong> 이메일과 비밀번호를 확인해주세요.
						</div>
						</c:if>
						<div class="forgot-top-grids">
							<div class="forgot-grid">
								
							</div>
							<div class="forgot">
								<a href="#">Forgot password?</a>
							</div>
							<div class="clearfix"> </div>
						</div>
						<input type="submit" name="Sign In" value="Login">
						<div class="signup-text">
							<a href="signup.html">Don't have an account? Create one now</a>
						</div>
						<hr>
						<h2>or login with</h2>
						<div class="login-icons">
							<ul>
								<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#" class="google"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#" class="dribbble"><i class="fa fa-dribbble"></i></a></li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	
<%@ include file="../include/footer.jsp"%>