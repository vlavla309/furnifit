<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<script src="${rSrcPath}js/editSignup.js"></script>
	
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
                        <form id="editSignupForm" name="f" method="post" action="${contextPath}/member/edit" onsubmit="return sendEditSignup();">
                          <input type="text" class="user" value="${login.email}" name="email" readonly="readonly" required="">
                          <input type="password" required name="passwd" class="lock" placeholder="Password">
                          <input type="password" required name="repasswd" class="lock" placeholder="Confirm Password">
                          <input type="text" pattern="^[가-힣]{2,5}$" required name="name" value="${login.name}" class="user" placeholder="Name : 한글 2자리 ~ 5자리" required="">
                          <input type="text" pattern="[0-9]{10}[0-9]$" required name="phone" value="${login.phone}" class="" placeholder="Telephone : '-'는 제외하고 입력" required="">
                          <input type="submit" id="btnUpdate" name="Modify" value="Confirmation">
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