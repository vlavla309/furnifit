<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<script src="${rSrcPath}js/signup.js"></script>
<!-- <script>
 
    // 아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    // 아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $('.user').val();
        $.ajax({
            data : {
            	email : inputed
            },
            url : contextPath+'/member/checkSignup/',
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $(".signupbtn").prop("disabled", false);
                    $(".signupbtn").css("background-color", "#8A0808");
                    $("#checkEmail").css("background-color", "#B0F6AC");
                    idCheck = 0;
                } else if (data == '0') {
                	$(".signupbtn").prop("disabled", false);
                	$(".signupbtn").css("background-color", "#8A0808");
                    $("#checkEmail").css("background-color", "#B0F6AC");
                } else if (data == '1') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkEmail").css("background-color", "#FFCECE");
                } 
            }
        });
    }
    </script> -->
    
<!-- 	
  Modal
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> -->


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
                        <form id="signupForm" name="f" method="post" action="${contextPath}/member/register" onsubmit="return sendSignup();">
                          <input type="text" class="user" required name="email" id="checkEmail" placeholder="Email" oninput="checkId()" required="">

                          <input type="password" required name="passwd" class="lock" placeholder="Password" required>
                          <input type="password" name="repasswd" class="lock" placeholder="Confirm Password" required>
                          <input type="text" pattern="^[가-힣]{2,5}$" class="user" required name="name" placeholder="Name : 한글 2자리 ~ 5자리 ">
                          <input type="text" pattern="[0-9]{10}[0-9]$" required name="phone" class="" placeholder="Telephone : '-'는 제외하고 입력">
                          <input type="submit" name="Sign In" value="Sign up"></input>
                          <!-- <button type="button" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
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