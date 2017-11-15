<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
      body { font-family: 'Nanum Gothic Coding', serif  }
</style>	
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
  left: 50%;
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

	<!-- blog -->
		<div class="blog">
			<!-- container -->
			<div class="container">
				<div class="blog-heading w3layouts">
					<h2></h2>
				</div>
				
				<!-- 여기서 내용을 채운다 -->
                <p class="animatedtext">
                  <span>
                    Coupon Confirm
                  </span>
                </p>
                <br><br><br><br>

                <table class="table table-striped">
                  <caption></caption>
                  <thead>
                  <tr>
                    <th>serial</th>
                    <th>할인율</th>
                    <th>유효기간</th>
                    <th>쿠폰상태</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>12123</td>
                    <td>10%</td>
                    <td>17.11.01 ~ 18.03.21</td>
                    <td>모릅니다.</td>
                  </tr>
                  <tr>
                    <td>12312</td>
                    <td>데이터2</td>
                    <td>데이터3</td>
                    <td>데이터4</td>
                  </tr>
                  <c:forEach items="${coupons}" var="coupon">
                  <tr>
                    <td>${coupon.serial}</td>
                    <td>${coupon.discountRate}%</td>
                    <td>${coupon.expirationDate}</td>
                    <td><span class="badge bg-red">${coupon.status }</span></td>
                  </tr>
            </c:forEach> 
                  </tbody>
                </table>
                </div>
				<!-- 여기 까지 내요을 채운다 -->
			</div>
			<!-- //container -->
		</div>
	<!-- //blog -->
<%@ include file="../include/footer.jsp" %>