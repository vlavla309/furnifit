<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
  
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

  
  
<script type="text/javascript">
      $(document).ready(function(){
         $("#soso").load("badbad4.html")
        /* id 지정을 통해서도 가능합니다. 
         $("#header").load("header.html #navbar")
         */       
      });
</script> 

  <style>
.animatedtext {
  text-transform: uppercase;
  letter-spacing: .5em;
  display: inline-block;
  border: 4px double rgba(255, 255, 255, 0.25);
  border-width: 4px 0;
  padding: 1.5em 0em;
  position: absolute;
  top: 18%;
  left: 64%;
  width: 40em;
  margin: 0 0 0 -20em;
}
.animatedtext span {
  font: 700 4em/1 "Oswald", sans-serif;
  letter-spacing: 0;
  padding: .25em 0 .325em;
  display: block;
  margin: 0 auto;
  text-shadow: 0 0 80px rgba(255, 255, 255, 0.5);
  /* Clip Background Image */
  background: url(http://f.cl.ly/items/010q3E1u3p2Q0j1L1S1o/animated_text_fill.png) repeat-y;
  -webkit-background-clip: text;
  background-clip: text;
  /* Animate Background Image */
  -webkit-text-fill-color: transparent;
  -webkit-animation: aitf 80s linear infinite;
  /* Activate hardware acceleration for smoother animations */
  -webkit-transform: translate3d(0, 0, 0);
  -webkit-backface-visibility: hidden;
}

/* Animate Background Image */
@-webkit-keyframes aitf {
  0% {
    background-position: 0% 50%;
  }
  100% {
    background-position: 100% 50%;
  }
}
</style>

<style type="text/css">
    .juicy {
      text-align: center;
    }
    .img2 {
      border: 2px solid;
      width: 170px;
      height: 170px;
      border: 5px solid #2D2926;
      margin: 31px 31px 31px 31px;
    }
    
    #modalmodal {
      display: inline-block;
    }
    
   
    .mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}
     
    #modalLayer{display:none; position:relative;}
    #modalLayer .modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; 
    top:50%; z-index:11; background:#fff;}
    #modalLayer .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}

</style>	

	<!-- blog -->
		<div class="blog">
			<!-- container -->
			<div class="container">
				<div class="blog-heading w3layouts">
				</div>
				<!-- 여기서 내용을 채운다 -->
                <p class="animatedtext">
                  <span>
                    My Page
                  </span>
                </p>
                <br><br><br>
                
<%--                 <div class="layout">
                  <a href="${pageContext.servletContext.contextPath}"><img src="images/layout.png" /></a>
                  <a href="${pageContext.servletContext.contextPath}"><img src="images/ordersheet.png" /></a>
                  <a href="${pageContext.servletContext.contextPath}"><img src="images/management.png" /></a>
                </div>
                <div class="layout">
                  <a href="${pageContext.servletContext.contextPath}"><img src="images/coupon.png" /></a>
                  <a href="${pageContext.servletContext.contextPath}"><img src="images/wishlist.png" /></a>
                  <a href="${pageContext.servletContext.contextPath}" ><img src="images/withdraw.png" /></a>
                  </div> --%>
                  
                  <div class="juicy">
                  <a href="${contextPath}/mypage/itemlist" class="juicy"><img src="${rSrcPath}/images/layout.png"  class="img2"/></a>
                  <a href="${contextPath}/mypage/order" class="juicy"><img src="${rSrcPath}/images/ordersheet.png" class="img2"/></a>
                  <a href="${contextPath}/member/edit" class="juicy"><img src="${rSrcPath}/images/management.png" class="img2"/></a>
                  </div>
                  <div class="juicy">
                  <a href="${contextPath}/mypage/coupon" class="juicy"><img src="${rSrcPath}/images/coupon.png" class="img2"/></a>
                  <a href="${pageContext.servletContext.contextPath}" class="juicy"><img src="${rSrcPath}/images/wishlist.png" class="img2"/></a>
                  <a href="${pageContext.servletContext.contextPath}" data-toggle="modal" data-target="#myModal" class="juicy" id="modalmodal"><img src="${rSrcPath}/images/withdraw.png" class="img2"/></a>
                  </div>
                  <!-- Modal -->
                  <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-sm">
                    <!-- <div class="modal-dialog modal-lg"> -->
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">탈퇴 모달이다 제발 되라</h4>
                        </div>
                        <div class="modal-body">
                          <form id="withdraw-modal" action="" method="post">
                            <input type="password" name="passwd">
                            
                          </form>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                  <!-- <a id="soso"></a> -->
                 
                <!-- <span id="soso"></span> -->

                </div>
       </div>
      <!-- //container -->
    </div>
	<!-- //blog -->

<%@ include file="../include/footer.jsp" %>
