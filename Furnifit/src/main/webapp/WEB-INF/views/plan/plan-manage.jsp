<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<style>
dt.accordion {
	background-color: #FBF8EF;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 80%;
	border: none;
	margin-left: 100px;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

dt.accordion.active, dt.accordion:hover {
	background-color: #F6CECE;
}

dt.accordion:after {
	content: '\002B';
	color: #777;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

dt.accordion.active:after {
	content: "\2212";
}

li {
	list-style-type: none;
}

.box-info {
	background-color: #FBF8EF;
	border: 2px dotted #F6CECE;
	border-radius: 10px;
}

.img-size {
	width: 200px;
	height: 150px;
	margin-left: 10px;
}
</style>


<script>

  $(function() {
	// 아코디언
    $("dd:not(:first)").css("display", "none");	// 첫번째 dd를 제외한 나머지 dd는 숨김

    $("dl dt").click(function() {				//클릭시 해당 내용 보여주기
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



<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="col-md-3">
      <h1>배치도 관리</h1>
      <br>
      <br>
      <div class="box box-info">
        <h4 class="text-center" style="padding-top: 10px;">
          <strong>내 정보</strong>
        </h4>
        <div class="table-responsive">
          <table class="table text-center">
            <tbody>
              <tr>
                <td><img class="img-size" alt=""
                  src="${rSrcPath}/images/user.png"></td>
              </tr>
            </tbody>
          </table>
          <table class="table text-left">
            <tbody>
              <tr>
                <td>이메일 : ${login.email}</td>
              </tr>
              <tr>
                <td>이름 : ${login.name}</td>
              </tr>
              <tr>
                <td>쿠폰 : ${couponlist.size()}개 보유</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <br>
    <br>
    <br>
    <br>

    <div class="col-md-9">
      <div class="box">
        <form method="post" action="order-address.leaf">
          <div class="text-center" id="box">
            <c:forEach items="${planlist}" var="plan">
              <dl>
                <dt class="accordion">${plan.planId}/
                  ${plan.email}님의 배치도 / ${plan.regdate}</dt>
                <dd>
                  <ul>
                    <li><c:forEach items="${itemlist}" var="item">
                          <c:if test="${item.planId == plan.planId}">
                            <a href="${contextPath}/mypage/itemlist/${item.planitemId}" value="${item.planitemId}">${item.name}</a><br>
                          </c:if>
                      </c:forEach></li>
                  </ul>
                </dd>
              </dl>
            </c:forEach>
          </div>
        </form>
      </div>

      <div class="box">
        <div class="box-footer">
          <div class="text-center">
            <ul class="pagination">
              <li class="disabled"><a href="#"
                aria-label="Previous">«</a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#" aria-label="Next">»</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- /.container -->
  </div>
  <!-- //container -->
</div>
<!-- //blog -->

<%@ include file="../include/footer.jsp"%>