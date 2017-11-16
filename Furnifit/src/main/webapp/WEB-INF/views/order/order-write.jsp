<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<style>
input[type="radio"]:not(old){ margin-left: 20px; }
select{width: 200px; height: 30px}
.coupon{
  background-color: #FBF8EF;
  border: 2px dotted #F6CECE;
  border-radius: 10px;
  padding-top: 15px;
  height: 70px;
}
.price{
  text-align:center;
  background-color: #FBF8EF;
  border-radius: 10px;
  height: 250px;
}

.count{
  width: 20%; 
  text-align: right; 
  border-radius: 5px; 
  border:1px dotted black;
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

<script>

$(function() {
  
  // 수량에 따른 합계 & 총 합계
  $(".count").bind('keyup mouseup', function (event) {
    $(event.target).parent().next().next().text( parseInt($(event.target).val())*parseInt($(event.target).parent().next().text())+"원")
  
    var sum = 0;
      var price = $(".count").parent().next().next();
      for (var i = 0; i < price.length; i++) {
        sum = sum +  parseInt($(price[i]).text());
      }  
      $("#total").text(sum + "원");   // document.getElementById("total").innerHTML = sum + "원";
  });
  
  var sum = 0;
    var price = $(".count").parent().next().next();
    for (var i = 0; i < price.length; i++) {
      sum = sum +  parseInt($(price[i]).text());
    }  
    $("#total").text(sum + "원");
    
    
  // select 쿠폰선택
    $("select[name=sale]").bind('change', function (event) {
        $("#coupon").text($("select[name=sale]").val().split(".")[0]+"이 적용되었습니다.");
        });
    
    
    // 삭제
    $(document).on("click", ".deleteOrder", function(event){   
    	event.preventDefault(); 
    	var orderId = $(this).attr("href");
    	var productId = $(this).attr("value");
    	
     $.ajax({
          url : 'order/'+orderId+'/'+productId,
          type : 'delete',
          success : function(data) {
        	  alert("성공");
          }
      });
    });
   
    
    // 주문하기
   	/*$("#goOrder").click(function() {
   		$(this).attr('href', "orquantityquantityderitem_create.leaf?product_code=" + codes + "&quantity="+ quantitys);
   		
   		$.ajax({
			url :$.ajax({
				url : "/mypage/order/{orderId}",
				data : {
					'type' : 'BUY',
					'content' : codes
				},
				success : function(msg) {
					console.log(msg);
				}
			}) 
		})
   	})*/
});



</script>



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
                  <th colspan="7">가구명</th>
                  <th>수량</th>
                  <th>판매가</th>
                  <th>합계</th>
                  <th>위시리스트</th>
                  <th>삭제</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${list}" var="item">
                  <tr>
                    <td colspan="2">
                        <c:forEach items="${product.imgs}" var="img">
                          <c:if test="${item.productId == img.productId && img.orderNo==0}">
                            <img src="${rSrcPath}/productimg/${img.path}/${img.name}"
                              alt="" class="img-responsive" style="height: 100px; width: auto"/>    
                          </c:if>
                         </c:forEach>
                    </td>
                    
                    <c:set var="doneLoop" value="false"/>
                    <c:forEach items="${prolist}" var="product">
                     <c:if test="${not doneLoop}">
                     <c:if test="${product.productId == item.productId}">
                        <td colspan="7">${product.name}</td>
                        <td><input type="number" class="count" name="quantity" value="${item.amount}"></td>
                        <td>${product.price}원</td>
                        <td name ="totalPrice">${product.price}원</td>
                        <td><button type="submit" class="btn btn-primary2">wishList</button></td>
                        <td><a href="${item.orderId}" class="deleteOrder" value="${item.productId}"><i class="fa fa-trash-o"></i></a></td>
                       <c:set var="doneLoop" value="true"/>
                      </c:if>
                    </c:if>
                    </c:forEach>
                    
                    
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
                <select name=sale>
                 <c:forEach items="${couponlist}" var="coupon">
                    <option> ${coupon.discountRate}% 할인쿠폰</option>
                 </c:forEach>
                </select><br><br>
                <div class="box coupon">
                  <div class="table-responsive" style="margin-left: 20px">
                    <table class="table">
                      <tbody>
                        <tr id="coupon"></tr>
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
                      <tr><br><br><td><p class="text-muted"><strong>${list.size()}개의 가구를 주문합니다.</strong></p></td></tr>
                      <tr><td style="color: red"><h3>총 합계</h3></td></tr>
                      <tr><td><h3><span id="total">원</span></h3></td></tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="box-footer text-center">
            <button type="submit" class="btn btn-primary" id="goOrder">주문하기</button>
        </div>
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col-md-9 -->
  </div>
  <!-- /.container -->
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>