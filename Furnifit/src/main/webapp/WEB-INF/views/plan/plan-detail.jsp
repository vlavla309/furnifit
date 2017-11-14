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
                <td><input type="text" class="btn form-control table-text"></td>
                <td><strong class="table-font">세로</strong></td>
                <td><input type="text" class="btn form-control table-text"></td>
                <td><strong class="table-font">높이</strong></td>
                <td><input type="text" class="btn form-control table-text"></td>
                <td><strong class="table-font">평수</strong></td>
                <td><input type="text" class="btn form-control table-text"></td>
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
              <tr><td class="text-center"><img alt="" src="images/10.jpg" class="img-size"></td></tr>
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
              <tr>
                <td colspan="2"><img alt="" src="/uploadphoto/${item.productImage }">001</td>
                <td colspan="8" value="${item.productCode }">침대</td>
                <td class="float-right"><button type="submit" class="btn btn-primary2">쇼핑몰로 가기</button></td>
                <td class="float-right"><button type="submit" class="btn btn-primary3">WISHLIST</button></td>
              </tr>
              <tr>
                <td colspan="2"><img alt="" src="/uploadphoto/${item.productImage }">002</td>
                <td colspan="8" value="${item.productCode }">옷장</td>
                <td class="float-right"><button type="submit" class="btn btn-primary2">쇼핑몰로 가기</button></td>
                <td class="float-right"><button type="submit" class="btn btn-primary3">WISHLIST</button></td>
              </tr>
              <tr>
                <td colspan="2"><img alt="" src="/uploadphoto/${item.productImage }">003</td>
                <td colspan="8" value="${item.productCode }">책상</td>
                <td class="float-right"><button type="submit" class="btn btn-primary2">쇼핑몰로 가기</button></td>
                <td class="float-right"><button type="submit" class="btn btn-primary3">WISHLIST</button></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div><br>
      <div class="text-center">
        <button type="submit" class="btn btn-primary">공유</button>
        <button type="submit" class="btn btn-primary"
          style="margin-left: 10px">주문서 작성</button>
        <button type="submit" class="btn btn-primary"
          style="margin-left: 10px">삭제</button>
      </div>
    </div>
  </div>
  <!-- //container -->
</div>
<!-- //blog -->


<script>
  $(function() {
    //첫번째 dd를 제외한 나머지 dd는 숨김
    $("dd:not(:first)").css("display", "none");

    //클릭시 해당 내용 보여주기
    $("dl dt").click(function() {
      if ($("+dd", this).css("display") == "none") {
        $("dd").slideUp("slow");
        $("+dd", this).slideDown("slow");
        $("dt").removeClass("selected");
        $(this).addClass("selected");
      }
    }).mouseover(function() {
      $(this).addClass("over");
    }).mouseout(function() {
      $(this).removeClass("over");
    });
  });
</script>

<%@ include file="../include/footer.jsp"%>