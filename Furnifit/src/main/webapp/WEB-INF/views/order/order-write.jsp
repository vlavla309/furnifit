<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${rSrcPath}css/order-write.css" />
<script src="${rSrcPath}js/order-write.js"></script>




<div id="myModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="content" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 




<form role="form" method="post">
<div class="blog">
  <div class="container">
  
  <!-- 주문서 작성 div-->
    <div class="col-md-12" >
      <div class="box">
          <h1>주문서 작성</h1><br>
          <!-- 테이블(가구img, 가구명, 수량, 판매가, 합계, 위시리스트, 삭제) -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th colspan="2">가구이미지</th>
                  <th colspan="7">가구명</th>
                  <th>수량</th>
                  <th>판매가</th>
                  <th>합계</th>
                  <th>위시리스트</th>
                  <th>삭제</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${furniList}" var="furni">
                 <tr value="${furni.productId}">
                    <td colspan="2">
                        <c:forEach items="${imgList}" var="img">
                          <c:if test="${furni.productId == img.productId && img.orderNo==0}">
                            <img src="${rSrcPath}/productimg/${img.path}/${img.name}"
                              alt="" class="img-responsive" style="height: 100px; width: auto"/>    
                          </c:if>
                         </c:forEach>
                    </td>
                    <c:set var="doneLoop" value="false"/>    
                    <c:forEach items="${proList}" var="product" varStatus="status">
                     <c:if test="${not doneLoop}">
                     <c:if test="${product.productId == furni.productId}">
                        <input type="hidden" name="productIds" id="${status.index}" value="${furni.productId}">
                        <td colspan="7">${product.name}</td>
                        <td value="${product.price}"><input type="number" class="count" id="${status.index}" min="1" value="1" name="amounts" ></td>
                        <td>${product.price}원</td>
                        <td class="subPrice">${product.price}원</td>
                        <td><a href="#" name="addWishlist" class="btn btn-default" value="${product.productId}" data-target="#myModal" >WishList</a></td>
                        <td><a href="#" class="deleteOrder" value="${product.productId}"><i class="fa fa-trash-o"></i></a></td>
                       <c:set var="doneLoop" value="true"/>
                      </c:if>
                    </c:if>
                    </c:forEach>
                  </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /테이블(가구img, 가구명, 수량, 판매가, 합계, 위시리스트, 삭제) -->

         </div>
      </div>
      <!-- /주문서 작성 div -->

      <!-- 쿠폰적용 div -->
      <div class="col-md-9">
        <div class="box">
          <h3 style="color: #8A0808;">쿠폰적용</h3><br>
            <div class="col-sm-12">
              <div class="form-group">
                <label for="firstname">쿠폰 상세정보&nbsp;</label>
                
                <!-- 쿠폰 옵션 선택 -->
                <select name="discount" id="sel">
                  <option selected value="0">---쿠폰 선택---</option>
                   <c:forEach items="${couponList}" var="coupon">
                      <option value="${coupon.discountRate}" class="rate" name="discountRate">${coupon.serial}) ${coupon.discountRate}% 할인쿠폰</option>
                   </c:forEach>
                </select><br><br>
                <!-- /쿠폰 옵션 선택 div -->
                <input type="hidden" name="useCoupones" value="0">
                   <c:forEach items="${couponList}" var="coupon">
                  <input type="hidden" name="serial" value="${coupon.serial}">
                </c:forEach>
                
                <!-- 선택한 쿠폰 띄우기 -->
                <div class="box coupon">
                  <div class="table-responsive" style="padding-left: 20px">
                    <table class="table">
                        <tr id="coupon"></tr>
                  </table>
                </div>
              </div>
              <!-- /선택한 쿠폰 띄우기 -->
              
            </div>
          </div>
        </div>
      </div>
      <!-- /쿠폰적용 div -->
      
      <!-- 총 합계 div -->
      <div class="col-md-3" id="checkout" style="padding-top: 30px">
        <div class="box">
          <div class="col-sm-12">
            <div class="form-group">
              <div class="box price">
                <div class="table-responsive">
                <input type="hidden" name="email" value="${login.email}">
                  <table class="table" style="margin-top: 10px">
                      <tr><td class="${furniList.size()}" id="kind"><strong>${furniList.size()}종류의 가구를 주문합니다.</strong></td></tr>
                      <tr><td style="color: red"><h3>총 합계</h3></td></tr>
                      <tr><td><h3><span id="total">원</span><input type="hidden" name="price"></h3></td></tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="box-footer text-center">
          <button type="submit" class="btn btn-default">주문하기</button>
        </div>
      </div>
      <!-- /총 합계 div -->
      
    </div>
  </div>
</form>

<%@ include file="../include/footer.jsp"%>