<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<style>
input[type="radio"]:not(old){ margin-left: 20px; }
.coupon{
  background-color: #FBF8EF;
  border: 2px dotted #F6CECE;
  border-radius: 10px;
  padding-top: 15px
}
.price{
  text-align:center;
  background-color: #FBF8EF;
  border-radius: 10px;
  height: 250px;
}

.btn-primary {
  color: #fff;
  background-color: black;
  border-color: black;
}
.btn-primary2 {
  color: #fff;
  background-color: #B40404;
  border-color: #B40404;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary.focus, .btn-primary:active,
  .btn-primary.active, .open>.dropdown-toggle.btn-primary {
  color: #fff;
  background-color: #B40404;
}
</style>


<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="col-md-12" >
      <div class="box">
        <form method="post" action="order-address.leaf">
          <h1>주문서 작성</h1><br>
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>선택</th>
                  <th colspan="2">가구이미지</th>
                  <th colspan="7">가구명</th>
                  <th>수량</th>
                  <th>판매가</th>
                  <th>합계</th>
                  <th>위시리스트</th>
                  <th>가구삭제</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${list}" var="item">
                  <tr>
                    <td><input id="${item.orderId}" type="checkbox" checked></td>
                    <td colspan="2">가구이미지</td>
                    <td colspan="7">가구명</td>
                    <td>${item.amount}</td>
                    <td>5000원</td>
                    <td><span name="totalPrice">10000원</span></td>
                    <td><button type="submit" class="btn btn-primary2">wishList</button></td>
                    <td><a href="order/${item.orderId}" name="order_delete"><i class="fa fa-trash-o"></i></a></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </form>
        </div>
      </div>

      <div class="col-md-9">
        <div class="box">
          <h3 style="color: #8A0808;">쿠폰적용</h3><br>
            <div class="col-sm-12">
              <div class="form-group">
                <label for="firstname">쿠폰 상세정보&nbsp;</label>
                <select style="width: 200px; height: 30px">
                  <option>가구 10% 할인쿠폰</option>
                  <option>가구 20% 할인쿠폰</option>
                  <option>가구 30% 할인쿠폰</option>
                  <option>가구 40% 할인쿠폰</option>
                  <option>가구 50% 할인쿠폰</option>
                </select><br><br>
                <div class="box coupon">
                  <div class="table-responsive">
                    <table class="table">
                      <tbody>
                        <tr><td><input type="radio" name="chk_info" value="sale10"> 가구 10% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale20"> 가구 20% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale30"> 가구 30% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale40"> 가구 40% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale50"> 가구 50% 할인쿠폰</td></tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div><br><br>
     
      <div class="col-md-3" id="checkout" style="margin-top: 100px">
        <div class="box">
          <div class="col-sm-12">
            <div class="form-group">
              <div class="box price">
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr><br><br><td><p class="text-muted"><strong>2개의 가구를 주문합니다.</strong></p></td></tr>
                      <tr><td style="color: red"><h3>총 합계</h3></td></tr>
                      <tr><td><h3>40000원</h3></td></tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="box-footer text-center">
            <button type="submit" class="btn btn-primary">주문하기</button>
        </div>
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col-md-9 -->
  </div>
  <!-- /.container -->
<!-- //blog -->
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<style>
input[type="radio"]:not(old){ margin-left: 20px; }
.coupon{
  background-color: #FBF8EF;
  border: 2px dotted #F6CECE;
  border-radius: 10px;
  padding-top: 15px
}
.price{
  text-align:center;
  background-color: #FBF8EF;
  border-radius: 10px;
  height: 250px;
}

.btn-primary {
  color: #fff;
  background-color: black;
  border-color: black;
}
.btn-primary2 {
  color: #fff;
  background-color: #B40404;
  border-color: #B40404;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary.focus, .btn-primary:active,
  .btn-primary.active, .open>.dropdown-toggle.btn-primary {
  color: #fff;
  background-color: #B40404;
}
</style>


<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="col-md-12" >
      <div class="box">
        <form method="post" action="order-address.leaf">
          <h1>주문서 작성</h1><br>
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th colspan="2">가구이미지</th>
                  <th colspan="6">가구명</th>
                  <th>수량</th>
                  <th>판매가</th>
                  <th>합계</th>
                  <th>위시리스트</th>
                </tr>
              </thead>
              <tbody>
                  <c:choose>
                  <c:otherwise>
                    <c:forEach items="${list}" var="item">
                      <tr>
                        <td colspan="2">가구이미지</td>
                        <td colspan="7">가구명</td>
                        <td>${item.amount }</td>
                        <td>5000원</td>
                        <td><span name="totalPrice">10000원</span></td>
                      </tr>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
                </tbody>
              </table>
            </div>
          </form>
        </div>
      </div>

      <div class="col-md-9">
        <div class="box">
          <h3 style="color: #8A0808;">쿠폰적용</h3><br>
            <div class="col-sm-12">
              <div class="form-group">
                <label for="firstname">쿠폰 상세정보&nbsp;</label>
                <select style="width: 200px; height: 30px">
                  <option>가구 10% 할인쿠폰</option>
                  <option>가구 20% 할인쿠폰</option>
                  <option>가구 30% 할인쿠폰</option>
                  <option>가구 40% 할인쿠폰</option>
                  <option>가구 50% 할인쿠폰</option>
                </select><br><br>
                <div class="box coupon">
                  <div class="table-responsive">
                    <table class="table">
                      <tbody>
                        <tr><td><input type="radio" name="chk_info" value="sale10"> 가구 10% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale20"> 가구 20% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale30"> 가구 30% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale40"> 가구 40% 할인쿠폰</td></tr>
                        <tr><td><input type="radio" name="chk_info" value="sale50"> 가구 50% 할인쿠폰</td></tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div><br><br>
     
      <div class="col-md-3" id="checkout" style="margin-top: 100px">
        <div class="box">
          <div class="col-sm-12">
            <div class="form-group">
              <div class="box price">
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr><br><br><td><p class="text-muted"><strong>2개의 가구를 주문합니다.</strong></p></td></tr>
                      <tr><td style="color: red"><h3>총 합계</h3></td></tr>
                      <tr><td><h3>40000원</h3></td></tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="box-footer text-center">
            <button type="submit" class="btn btn-primary">주문하기</button>
        </div>
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col-md-9 -->
  </div>
  <!-- /.container -->
<!-- //blog -->
>>>>>>> f84c1c3b056425bca1975289fe719346a3af98c0
<%@ include file="../include/footer.jsp"%>