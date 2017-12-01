<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="${rSrcPath}css/coupon.css" />

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
                  <tr class="colorcolor">
                    <th class="textColor">serial</th>
                    <th class="textColor">할인율</th>
                    <th class="textColor">유효기간</th>
                    <th class="textColor">쿠폰상태</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${coupons}" var="coupon">
                  <tr class="fontfont">
                    <td>${coupon.serial}</td>
                    <td>${coupon.discountRate}%</td>
                    <td>${coupon.expirationDate}</td>
                    
                    <c:choose>
                      <c:when test="${coupon.status == '사용 가능'}">
                        <td class="textFont"><span class="badge badge-primary">${coupon.status}</span></td>
                      </c:when>
                      <c:when test="${coupon.status == '사용 완료'}">
                        <td class="textFont"><span id="textColor2" class="badge">${coupon.status}</span></td>
                      </c:when>
                      <c:otherwise>
                        <td class="textFont"><span class="badge badge-danger">${coupon.status}</span></td>
                      </c:otherwise>
                    </c:choose>

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