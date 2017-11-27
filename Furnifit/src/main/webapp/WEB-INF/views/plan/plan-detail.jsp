<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<style>
li { list-style-type: none; }
.float-right{ float: right; }
.table-font{ font-size: 18px; }
.table-text{ border-radius: 10px; }
.box-info{
    background-color:#FBF8EF;
    height: 60px;
    border-radius: 10px;
}
.img-size{
    width: 50%;
    height: 70%;
}

.btn-primary {
  color: #fff;
  background-color: black;
  border-color: black;
}
.btn-primary2 {
  color: black;
  background-color: #FBF8EF;
  border-color: #FBF8EF;
}
.btn-primary3 {
  color: black;
  background-color: #F7F8E0;
  border-color: #F7F8E0;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary.focus, .btn-primary:active,
  .btn-primary.active, .open>.dropdown-toggle.btn-primary {
  color: #fff;
  background-color: #B40404;
}
</style>

<script>

$(function() {
  // 위시리스트
  var wishbtn = $("a[name=addWishlist]");
  
  wishbtn.click(function() {
    event.preventDefault(); 
  	  var planitemid = $(this).attr('value');
    $.ajax({
      url :'${contextPath}/wishlist/'+planitemid,
      type : 'POST',
      success : function(request) {
        console.log(request);
        alert("위시리스트에 추가 되었습니다.");
        $(event.target).attr("disabled", true);	//위시리스트 추가 시 비활성화
      },
      error : function(request) {
        console.log(request);
        alert("이미 위시리스트에 있습니다.");
        $(event.target).attr("disabled", true);
      }
    })
  })
  
  
  // 삭제
  $(document).on("click", "#delbtn", function(event){
	 // alert("오오오");
  	event.preventDefault(); 
  	//var orderId = $(this).attr("href");
  	//var productId = $(this).attr("value");
  	var planitemId = $(this).attr('value')
  	alert(planitemId)
  	
   $.ajax({
        url : '${contextPath}/mypage/itemlist/'+planitemId,
        type : 'delete',
        success : function(data) {
      	 alert("배치도가 삭제되었습니다.");
      	  }
        });
    });
  
});

</script>


<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="col-md-12">
      <h1>배치도 상세보기</h1><br><br>
      <div class="box box-info">
        <div class="table-responsive">
          <table class="table">
            <tbody>
              <tr>
                <td><strong class="table-font">가로</strong></td>
                <td><input type="text" disabled class="btn form-control table-text" value="${planitemlist.width}"></td>
                <td><strong class="table-font">세로</strong></td>
                <td><input type="text" disabled class="btn form-control table-text" value="${planitemlist.height}"></td>
                <td><strong class="table-font">높이</strong></td>
                <td><input type="text" disabled class="btn form-control table-text" value="${planitemlist.length}"></td>
                <td><strong class="table-font">평수</strong></td>
                <td><input type="text" disabled class="btn form-control table-text"></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="col-md-12" style="margin-top: 30px">
      <div class="box">
        <div class="table-responsive">
          <table class="table"> 
            <tbody>
              <tr><td class="text-center"><img alt="" src="${rSrcPath}/${planitemlist.image}" class="img-size"></td></tr>
            </tbody>
          </table>
        </div>
        <div class="table-responsive">
         <h3 style="color: #8A0808;">가구목록</h3>
          <table class="table">
            <thead>
              <tr>
                <th colspan="2">상품번호</th>
                <th colspan="8">상품명</th><th></th><th></th>
              </tr>
            </thead>
            <tbody>
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
            </tbody>
          </table>
        </div>
      </div><br>
      <div class="text-center">
        <a href="${contextPath}/article/register/${planitemlist.planitemId}" class="btn btn-primary">공유</a>&nbsp;
        <a href="${contextPath}/order/${planitemlist.planitemId}" class="btn btn-primary">주문서 작성</a>
        <button type="button" class="btn btn-primary" style="margin-left: 10px" id=delbtn value="${planitemlist.planitemId}">삭제</button>
      </div>
    </div>
  </div>
  <!-- //container -->
</div>
<!-- //blog -->

<%@ include file="../include/footer.jsp"%>