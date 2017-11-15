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

<style>

.box {
  width: 1140px;
  height: 700px;
  border-radius: 5px;
  box-shadow: 0 2px 30px rgba(0, 0, 0, 0.2);
  background: #fbfcee;
  position: relative;
  overflow: hidden;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}

.wave {
  opacity: .4;
  position: absolute;
  top: 3%;
  left: 50%;
  background: #fcfcf9;     /* #0af; */
  width: 500px;
  height: 500px;
  margin-left: -250px;
  margin-top: -250px;
  -webkit-transform-origin: 50% 48%;
          transform-origin: 50% 48%;
  border-radius: 43%;
  -webkit-animation: drift 3000ms infinite linear;
          animation: drift 3000ms infinite linear;
}

.wave.-three {
  -webkit-animation: drift 5000ms infinite linear;
          animation: drift 5000ms infinite linear;
}

.wave.-two {
  -webkit-animation: drift 7000ms infinite linear;
          animation: drift 7000ms infinite linear;
  opacity: .1;
  background: yellow;
}

.box:after {
  content: '';
  display: block;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: -webkit-linear-gradient(top, #ee88aa, rgba(221, 238, 255, 0) 80%, rgba(255, 255, 255, 0.5));
  background: linear-gradient(to bottom, #ee88aa, rgba(221, 238, 255, 0) 80%, rgba(255, 255, 255, 0.5));
  z-index: 11;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}
/* 
.title {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  z-index: 1;
  line-height: 300px;
  text-align: center;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  color: white;
  text-transform: uppercase;
  font-family: 'Playfair Display', serif;
  letter-spacing: .4em;
  font-size: 24px;
  text-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
  text-indent: .3em;
}

@-webkit-keyframes drift {
  from {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  from {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

@keyframes drift {
  from {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  from {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}
*/

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
<!--                 
		        <div class='box'>
		          <div class='wave -one'></div>
		  		<div class='wave -two'></div>
		  		<div class='wave -three'></div>
 -->
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