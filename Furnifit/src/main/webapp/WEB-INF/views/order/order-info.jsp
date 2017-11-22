<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<style>
.coupon {
  background-color: #FBF8EF;
  border: 2px dotted #F6CECE;
  border-radius: 10px;
  padding-top: 15px
}
</style>

<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="col-md-12">
      <div class="box">
          <h1>주문서 조회</h1><br>
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
                            <img src="${rSrcPath}/productimg/${img.path}/${img.name}"
                              alt="" class="img-responsive" style="height: 100px; width: auto"/>    
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
      </div>
      <div class="box">
        <h3 style="color: #8A0808;">쿠폰적용</h3><br>
          <div class="col-sm-12">
            <div class="form-group">
              <div class="box coupon">
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr><td><strong style="font-size: 18px">[가구 10% 할인쿠폰]이 적용되었습니다.</strong></td></tr>
                    </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="box-footer text-center">
          <a href="${contextPath}/mypage/order" class="btn btn-default">목록으로</a>
      </div>
      <!-- /.box -->
      <!-- /.col-md-9 -->
    </div>
    <!-- /.container -->
  </div>
  <!-- //container -->
</div>
<!-- //blog -->\
<%@ include file="../include/footer.jsp"%>
