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
                        <form id="editSignupForm" action="${contextPath}/member/edit" method="post">
                          <input type="text" class="user" value="${login.email}" name="email" readonly="readonly" required="">
                          <input type="password" pattern="^[0-9]{4}$" required name="passwd" class="lock" placeholder="Password" onclick="openConfirmid(this.form)">
                          <input type="password" pattern="^[0-9]{4}$" required name="repasswd" class="lock" placeholder="Confirm Password">
                          <input type="text" pattern="^[가-힣]{0,5}$" required name="name" value="${login.name}" class="user" placeholder="Name : 한글 5자리까지" required="">
                          <input type="text" pattern="[0-9]{10}[0-9]$" required name="phone" class="" placeholder="Telephone : '-'는 제외하고 입력" required="">
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