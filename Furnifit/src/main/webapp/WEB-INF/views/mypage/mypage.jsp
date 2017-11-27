<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- header -->
<%@ include file="../include/header.jsp" %>
  
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${rSrcPath}css/mypage.css" />

	<!-- blog -->
		<div class="blog">
			<!-- container -->
			<div class="container">
				<div class="blog-heading w3layouts">
				</div>
				<!-- My Page 글씨에 애니메이션 효과 -->
                <p class="animatedtext">
                  <span>
                    My Page
                  </span>
                </p>
                <br><br><br>
      
      <!-- 배치도 관리, 주문서 조회, 회원정보 관리, 쿠폰 조회, 위시리스트, 회원 탈퇴 배치 및 링크 설정 -->
      <div class="juicy">
        <a href="${contextPath}/mypage/planlist" class="juicy"><img src="${rSrcPath}/images/layout.png"  class="img2"/></a>
        <a href="${contextPath}/mypage/order" class="juicy"><img src="${rSrcPath}/images/ordersheet.png" class="img2"/></a>
        <a href="${contextPath}/member/edit" class="juicy"><img src="${rSrcPath}/images/management.png" class="img2"/></a>
      </div>
      <div class="juicy">
        <a href="${contextPath}/mypage/coupon" class="juicy"><img src="${rSrcPath}/images/coupon.png" class="img2"/></a>
        <a href="${contextPath}/wishlist" class="juicy"><img src="${rSrcPath}/images/wishlist.png" class="img2"/></a>
        <a href="" data-toggle="modal" data-target="#myModal" class="juicy" id="modalmodal"><img src="${rSrcPath}/images/withdraw.png" class="img2"/></a>
      </div>
      
      <!-- 탈퇴 이미지를 누르면 나오는 모달 -->
      <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
        <!-- <div class="modal-dialog modal-lg"> -->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title"><strong>탈퇴 하시겠습니까?</strong></h4>
            </div>
            <div class="modal-body">
              <form id="withdraw-modal" action="ghgh" method="post">
                <input type="password" class="form-control" placeholder="비밀번호 입력" name="passwd" id="passwd">
                <input type="hidden" name="email" id="email" value="${login.email}">
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger-color" data-dismiss="modal">확인</button>
            </div>
          </div>
        </div>
      </div>
    </div>


    </div>
    </div>
    </div>

<!-- footer -->
<%@ include file="../include/footer.jsp" %>
