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
                <c:forEach items="${list}" var="item">
                  <tr>
                    <td colspan="2">
                        <c:forEach items="${imglist}" var="img">
              <c:if test="${product.productId == img.productId}">
                <img src="${pageContext.servletContext.contextPath}/resources/productimg/${img.path}/${img.name}"
                  alt="" class="img-responsive" style="height: 300px; width: auto"/>
              </c:if>
                 </c:forEach>
                    </td>
                    <td colspan="7">가구가구</td>
                    <td>333</td>
                    <td>11111</td>
                    <td><span name="totalPrice">10000원</span></td>
                  </tr>
                </c:forEach>
              </tbody>
              <tfoot>
                <tr>
                  <th colspan="10" class="text-center" style="color: red;"><h3>총 합계</h3></th>
                  <th colspan="2" class="text-left"><span id="total"><h3>20000원</h3></span></th>
                </tr>
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
          <button type="submit" class="btn btn-primary" style="height: 40px">목록으로</button>
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
