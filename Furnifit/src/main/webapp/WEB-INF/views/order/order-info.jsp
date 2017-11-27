<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${rSrcPath}css/order-info.css" />


<div class="blog">
  <div class="container">
  
    <!-- 주문서 조회 div-->
    <div class="col-md-12">
      <div class="box">
          <h1>주문서 조회</h1><br>
          
          <!-- 테이블(가구img, 가구명, 수량, 판매가, 합계) -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th colspan="2">가구이미지</th>
                  <th colspan="7">가구명</th>
                  <th>수량</th>
                  <th>판매가</th>
                  <th>합계</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${itemlist}" var="item">
                 <tr>
                    <td colspan="2">
                     <c:forEach items="${imglist}" var="img">
                          <c:if test="${item.productId == img.productId && img.orderNo==0}">
                            <img src="${rSrcPath}/productimg/${img.path}/${img.name}" class="img-responsive" style="height: 100px; width: auto"/>    
                          </c:if>
                         </c:forEach>
                    </td>
                    <c:set var="doneLoop" value="false"/>
                     <c:forEach items="${prolist}" var="product">
                     <c:if test="${not doneLoop}">
                       <c:if test="${item.productId == product.productId}">
                          <td colspan="7">${product.name}</td>
                          <td>${item.amount}</td>
                          <td>${product.price}원</td>
                          <td>${item.amount * product.price}원</td>
                         <c:set var="doneLoop" value="true"/>
                        </c:if>
                      </c:if>
                   </c:forEach>
                  </tr>
                </c:forEach>
              </tbody>
              <tfoot>
              <c:forEach items="${pricelist}" var="price">
                <tr>
                  <th colspan="10" class="text-center" style="color: red;"><h3>총 합계</h3></th>
                  <th colspan="2" class="text-left"><span id="total"><h3>${price.price}원</h3></span></th>
                </tr>
                </c:forEach>
              </tfoot>
            </table>
          </div>
          <!-- 테이블(가구img, 가구명, 수량, 판매가, 합계) -->
          
      </div>
      
      <!-- 쿠폰적용 div -->
      <div class="box">
        <h3 style="color: #8A0808;">쿠폰적용</h3><br>
          <div class="col-sm-12">
            <div class="form-group">
            
              <!-- 적용된 쿠폰 띄우기 -->
              <div class="box coupon">
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr>
                      <c:choose>
                        <c:when test="${coupon.discountRate == null}">
                        <td><strong style="font-size: 18px">적용된 쿠폰이 없습니다.</strong></td>
                      </c:when>
                      <c:otherwise>
                        <td><strong style="font-size: 18px">serialNo : ${coupon.serial}<br> [${coupon.discountRate}% 할인쿠폰]이 적용되었습니다.</strong></td>
                      </c:otherwise>
                      </c:choose>
                      </tr>
                    </tbody>
                </table>
              </div>
            </div>
            <!-- /적용된 쿠폰 띄우기 -->
            
          </div>
        </div>
      </div>
      <!-- /쿠폰적용 div -->
      
      <div class="box-footer text-center">
          <a href="${contextPath}/mypage/order" class="btn btn-default">목록으로</a>
      </div>
    </div>
    <!-- /주문서 조회 div-->
    
  </div>
</div>

<%@ include file="../include/footer.jsp"%>
