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
	// 초기 합계
  	var sum = 0;
    var price = $(".count").parent().next().next();
    for (var i = 0; i < price.length; i++) {
      sum = sum +  parseInt($(price[i]).text());
    }  
    $("#total").text(sum + "원");
	
	
  // 수량 변경에 따른 합계 & 총 합계
  $(".count").bind('keyup mouseup', function (event) {
	// 수량 * 가격
    $(event.target).parent().next().next().text( parseInt($(event.target).val())*parseInt($(event.target).parent().next().text())+"원")
   
    // 총 합계
    var sum = 0;
      var price = $(".count").parent().next().next();
      for (var i = 0; i < price.length; i++) {
        sum = sum +  parseInt($(price[i]).text());
      }  
      $("#total").text(sum + "원");   // document.getElementById("total").innerHTML = sum + "원";
      
  });
  
    
    // select 쿠폰선택
 	$("#coupon").text("적용된 쿠폰이 없습니다.");
    $("select[name=sale]").bind('change', function (event) {
 	    var rate = $(this).val();
 		var sel = document.getElementById("sel");
 	  	var selVal = sel.options[sel.selectedIndex].value;
 	  	
 		if(selVal != "---쿠폰 선택---"){
     	 $("#coupon").text(rate.split(".")[0]+"% 쿠폰이 적용되었습니다.");
     	  var sum = 0;
          var price = $(".count").parent().next().next();
          for (var i = 0; i < price.length; i++) {
          	sum = Math.floor(sum +  parseInt($(price[i]).text()) * ((100 - rate) * 0.01));
          }  
          $("#total").text(sum + "원");
 	   }else{
   		 $("#coupon").text("적용된 쿠폰이 없습니다.");
          var sum = 0;
          var price = $(".count").parent().next().next();
          for (var i = 0; i < price.length; i++) {
             sum = sum +  parseInt($(price[i]).text());
          }  
          $("#total").text(sum + "원");
   	   }
   }); 
    
    // 삭제
    $(document).on("click", ".deleteOrder", function(event){   
    	event.preventDefault(); 
    	var proId =  $(this).parent().parent().attr("value");
    	var productId = $(this).attr("value");
    	
    	alert(proId+"---"+productId)
    	
    	if(proId == productId){
    		$(".delete").remove();
    	}
    });
    
    // 위시리스트
    var wishbtn = $("a[name=addWishlist]");
    
    wishbtn.click(function() {
      event.preventDefault(); 
   	  var productid = $(this).attr('value')
   	  alert(productid)
      $.ajax({
        url :'${contextPath}/wishlist/'+productid,
        type : 'POST',
        success : function(request) {
          console.log(request);
          alert("위시리스트 성공");
        },
        error : function(request) {
          console.log(request);
          alert("이미 위시리스트에 있습니다.");
        }
      })
    })
    
 	// 주문
    $(document).on("click", "#goOrder", function(event){  
    	event.preventDefault(); 
    	var productid = $(this).attr('value');
    	alert(productid)
    	
    	//alert("주문이 완료되었습니다.");
    });
    
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
                <c:forEach items="${itemlist}" var="item">
                 <tr value="${item.productId}" class="delete">
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
                     <c:if test="${product.productId == item.productId}">
                        <td colspan="7">${product.name}</td>
                        <td><input type="number" class="count" value="${item.amount}"></td>
                        <td>${product.price}원</td>
                        <td name ="totalPrice">${product.price}원</td>
                        <td><a href="#" name="addWishlist" class="btn btn-default" value="${item.productId}">WishList</a></td>
                        <td><a href="${item.orderId}" class="deleteOrder" value="${product.productId}"><i class="fa fa-trash-o"></i></a></td>
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
                <select name=sale id=sel>
                  <option>---쿠폰 선택---</option>
                 <c:forEach items="${couponlist}" var="coupon">
                    <option value="${coupon.discountRate}" class="rate"> ${coupon.discountRate}% 할인쿠폰</option>
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
                      <tr><br><br><td><p class="text-muted"><strong>${itemlist.size()}종류의 가구를 주문합니다.</strong></p></td></tr>
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
            <button type="submit" class="btn btn-primary" id="goOrder"><a href="mypage/order" value="${product.productId}">주문하기</a></button>
        </div>
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col-md-9 -->
  </div>
  <!-- /.container -->
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>