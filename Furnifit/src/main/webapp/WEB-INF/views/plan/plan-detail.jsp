<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${rSrcPath}css/plan-detail.css" />
<script src="${rSrcPath}js/plan-detail.js"></script>


<div class="blog">
  <div class="container">
  
    <!-- 배치도 상세보기 div-->
    <div class="col-md-12">
      <h1>배치도 상세보기</h1><br><br>
      <div class="box box-info">
      
        <!-- 방 크기 정보 -->
        <div class="table-responsive">
          <table class="table">
              <tr>
                <td><strong class="table-font">가로</strong></td>
                <td><input type="text" disabled class="btn form-control table-text" value="${planitemlist.width}"></td>
                <td><strong class="table-font">세로</strong></td>
                <td><input type="text" disabled class="btn form-control table-text" value="${planitemlist.height}"></td>
                <td><strong class="table-font">높이</strong></td>
                <td><input type="text" disabled class="btn form-control table-text" value="${planitemlist.length}"></td>
                <td><strong class="table-font">평수</strong></td>
                <td><input type="text" disabled class="btn form-control table-text" value="${planitemlist.acreage}"></td>
              </tr>
          </table>
        </div>
        <!-- /방 크기 정보 -->
        
      </div>
    </div>
    <!-- /배치도 상세보기 div-->

    <!-- 배치도 목록 리스트 div-->
    <div class="col-md-12" style="margin-top: 30px">
      <div class="box">
        <div class="table-responsive">
          <table class="table"> 
            <tr><td class="text-center"><img src="${rSrcPath}/${planitemlist.image}" class="img-size"></td></tr>
          </table>
        </div>
        <div class="table-responsive">
         <h3 style="color: #8A0808;">가구목록</h3>
         
         <!-- 테이블(상품번호, 상품명, 쇼핑몰로 가기, 위시리스트) -->
          <table class="table">
            <tr>
              <th colspan="2">상품번호</th>
              <th colspan="8">상품명</th><th></th><th></th>
            </tr>
            <c:forEach items="${prolist}" var="product">
              <tr>
                <c:forEach items="${furnilist}" var="furni">
                  <c:if test="${furni.productId == product.productId}">
                    <td colspan="2">${product.productId}</td>
                    <td colspan="8"><a href="${contextPath}/product/${product.productId}">${product.name}</a></td>
                    <td class="float-right"><a href="#" name="addWishlist" value="${furni.productId}" class="btn btn-default">WishList</a></td>
                  <c:forEach items="${brandlist}" var="brand">
                  <c:if test="${brand.name == product.brand}">
                    <td class="float-right"><a href="${brand.link}" class="btn btn-default">쇼핑몰로 가기</a></td>
                  </c:if>
                  </c:forEach>
                  </c:if>
                </c:forEach>
              </tr>
            </c:forEach>
          </table>
          <!-- /테이블(상품번호, 상품명, 쇼핑몰로 가기, 위시리스트) -->
          
        </div>
      </div><br>
      
      <!-- 공유, 주문서 작성, 삭제 버튼 -->
      <div class="text-center">
        <a href="${contextPath}/article/register/${planitemlist.planitemId}" class="btn btn-primary">공유</a>&nbsp;
        <a href="${contextPath}/order/${planitemlist.planitemId}" class="btn btn-primary">주문서 작성</a>
        <button type="button" class="btn btn-primary" style="margin-left: 10px" id=delbtn value="${planitemlist.planitemId}">삭제</button>
      </div>
      <!-- /공유, 주문서 작성, 삭제 버튼 -->
      
    </div>
    <!-- /배치도 목록 리스트 div-->
  </div>
</div>

<%@ include file="../include/footer.jsp"%>