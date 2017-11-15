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
                        <h1>Modify</h1>
                      </div>
                      <div class="login-info">
                        <form id="editSignupForm" action="member/edit" method="post">
                          <input type="text" class="user" value="${login.email}"name="email" placeholder="Email" readonly="readonly" required="">
                          <input type="password" name="passwd" class="lock" placeholder="Password">
                          <input type="password" name="passwd" class="lock" placeholder="Confirm Password">
                          <input type="text" name="name" class="user" placeholder="Name" required="">
                          <input type="text" name="phone" class="" placeholder="Telephone" required="">
                          <input type="submit" name="Modify" value="Confirmation">
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