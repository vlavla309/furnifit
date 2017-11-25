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
  height: 105px;
}
.price{
  text-align:center;
  background-color: #FBF8EF;
  border-radius: 10px;
  height: 180px;
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
	totalSum();
	
	// 페이지 로드 시 초기 합계 (.count : 수량 / #total : 총 합계 / input[name=price] : orders의 총 합계(hidden))
	function totalSum(){
    	var sum = 0;
        var price = $(".count").parent().next().next();
        for (var i = 0; i < price.length; i++) {
          sum = sum +  parseInt($(price[i]).text());
        }  
        $("#total").text(sum + "원");
        $("input[name=price]").val(sum);
	}
	
    // 수량 변경에 따른 합계 & 총 합계 (수량 * 판매가)
    $(".count").bind('keyup mouseup', function (event) {
      $(event.target).parent().next().next().text( parseInt($(event.target).val())*parseInt($(event.target).parent().next().text())+"원")
      totalSum(); 
    });
  
    
    // Select 쿠폰선택 (select[name=discount] : 쿠폰 select)
 	$("#coupon").text("적용된 쿠폰이 없습니다.");
    
    $("select[name=discount]").bind('change', function (event) {
 	    var rate = $(this).val();  	//할인율(discountRate)

 	    var sel = document.getElementById("sel");
 	  	var selVal = sel.options[sel.selectedIndex].text;  //선택한 option의 text 
 	    var serialNum = 0;	//시리얼 번호
 	    
 		if(selVal != "---쿠폰 선택---"){
 			serialNum = selVal.split(")")[0];		//시리얼번호 split
     	 $("#coupon").html("serialNo : "+serialNum+'<br><br>'+rate.split(".")[0]+"% 쿠폰이 적용되었습니다.");
     	 $(".count").attr("disabled", true);
     	  var sum = 0;
          var price = $(".count").parent().next().next();
          for (var i = 0; i < price.length; i++) {
          	sum = Math.floor(sum +  parseInt($(price[i]).text()) * ((100 - rate) * 0.01));	//쿠폰 할인율 적용한 총 합계
          }  
          $("#total").text(sum + "원");
          
          $("input[name=price]").val(sum);
          $("input[name=useCoupones]").val(serialNum);	//orders의 사용된 쿠폰시리얼번호
          $("input[name=serial]").val(serialNum);		//offer_coupones의 시리얼번호
 	   }else{
   		 $("#coupon").text("적용된 쿠폰이 없습니다.");
   		 totalSum();
   		 $(".count").attr("disabled", false);
   		 $("input[name=price]").val(sum);
   		 $("input[name=useCoupones]").val(serialNum);
   		 $("input[name=serial]").val(serialNum);
   	   }
   }); 
    

    // 가구 삭제
	var furniCnt = ${furniList.size()};
    $(document).on("click", ".deleteOrder", function(event){   
    	event.preventDefault(); 
    	var furniProId =  $(this).parent().parent().attr("value");	//furniture 가구 고유번호
    	var productId = $(this).attr("value");	//product 가구 고유번호
    	
    	if(furniProId == productId && furniCnt != 1){
    		$("#delete").remove();
    		furniCnt = furniCnt-1;
    		if(furniCnt != 0){
    			$("#kind").html('<strong>'+furniCnt+"종류의 가구를 주문합니다."+'<strong>');
    		}else{
    			$("#kind").html('<strong>'+"주문할 가구가 없습니다."+'<strong>');
    		}
    	}else{
    		alert("1개 이상의 가구가 있어야 합니다.")
    	}
    	totalSum();
    });
    
    // 위시리스트
    var wishbtn = $("a[name=addWishlist]");
    
    wishbtn.click(function(event) {
      event.preventDefault(); 
      var furniProId =  $(this).parent().parent().attr("value");	//furniture 가구 고유번호
   	  var productId = $(this).attr('value');
      
   	  $.ajax({
        url :'${contextPath}/wishlist/'+productId,
        type : 'POST',
        success : function(request) {
          console.log(request);
          alert("위시리스트에 추가 되었습니다.");
          if(furniProId == productId){
          	$(event.target).attr("disabled", true);	//위시리스트 추가 시 비활성화
          }
        },
        error : function(request) {
          console.log(request);
          alert("이미 위시리스트에 있습니다.");
          $(event.target).attr("disabled", true);
        }
      })
    })
    
});
</script>



<form role="form" method="post">
<div class="blog">
  <div class="container">
  
  <!-- 주문서 작성 div-->
    <div class="col-md-12" >
      <div class="box">
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
                <c:forEach items="${furniList}" var="furni">
                 <tr value="${furni.productId}" id="delete">
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
                        <td><input type="number" class="count" id="${status.index}" min="1" value="1" name="amounts"></td>
                        <td>${product.price}원</td>
                        <td>${product.price}원</td>
                        <td><a href="#" name="addWishlist" class="btn btn-default" value="${furni.productId}">WishList</a></td>
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
                <select name="discount" id="sel">
                  <option selected>---쿠폰 선택---</option>
                   <c:forEach items="${couponList}" var="coupon">
                      <option value="${coupon.discountRate}" class="rate" name="discountRate">${coupon.serial}) ${coupon.discountRate}% 할인쿠폰</option>
                   </c:forEach>
                </select><br><br><input type="hidden" name="useCoupones" value="0">
                <c:forEach items="${couponList}" var="coupon">
                  <input type="hidden" name="serial" value="${coupon.serial}">
                </c:forEach>
                <div class="box coupon">
                  <div class="table-responsive" style="padding-left: 20px">
                    <table class="table">
                        <tr id="coupon"></tr>
                  </table>
                </div>
              </div>
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
                      <tr><td value="${furniList.size()}" id="kind"><strong>${furniList.size()}종류의 가구를 주문합니다.</strong></td></tr>
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