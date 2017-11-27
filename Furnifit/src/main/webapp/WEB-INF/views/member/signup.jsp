<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
	
	
	<!-- blog -->
		<div class="blog">
			<!-- container -->
			<div class="container">
				<div class="blog-heading w3layouts">
					<h2></h2>
				</div>
        
				<!-- 여기서 내용을 채운다 -->
                <!-- login -->
                <div class="login">
                  <div class="container">
                    <div class="login-body">
                      <div class="login-heading w3layouts">
                        <h1>Sign up</h1>
                      </div>
                      <div class="login-info">
                        <form id="signupForm" action="${contextPath}/member/register" method="post">
                          <input type="text" pattern="^[a-zA-Z0-9]{0,10}@[a-zA-z]{0,8}.[a-zA-z]{0,3}$" class="user" required name="email" placeholder="Email : bangrylol@gmail.com" required="dd">
                          <input type="password" pattern="^[0-9]{4}$" required name="passwd" class="lock" placeholder="Password" onclick="openConfirmid(this.form)">
                          <input type="password" pattern="^[0-9]{4}$" name="repasswd" class="lock" placeholder="Confirm Password">
                          <input type="text" pattern="^[가-힣]{0,5}$" class="user" required name="name" placeholder="Name : 한글 5자리까지 " required="">
                          <input type="text" pattern="[0-9]{10}[0-9]$" required name="phone" class="" placeholder="Telephone : '-'는 제외하고 입력" required="">
                          <input type="submit" name="Sign In" value="Sign up">
                        </form>

                      </div>
                    </div>
                  </div>
                </div>
                <!-- //login -->
				<!-- 여기 까지 내요을 채운다 -->
				
			</div>
			<!-- //container -->
		</div>
	<!-- //blog -->
<%@ include file="../include/footer.jsp" %>