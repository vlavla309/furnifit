<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<style>
dt.accordion {
	background-color: #FBF8EF;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 80%;
	border: 1px dotted gray;
    border-radius: 10px;
	margin-left: 100px;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}
dt.accordion.active, dt.accordion:hover { background-color: #F5F6CE; }


li { list-style-type: none; }

.box-info{
    background-color:#FBF8EF;
    border: 2px dotted #F6CECE;
    border-radius: 10px;
    height: 200px;
}

.img-size{
    width: 200px;
    height: 165px;
    margin-left: 10px;
}
</style>


<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="col-md-12">
     <h1>주문서 목록</h1><br><br>
      <div class="box box-info">
        <div class="col-md-6 text-center" >
        <div class="table-responsive" >
          <table class="table">
            <tbody>
              <tr><td><img class="img-size" alt="" src="${rSrcPath}/images/user.png"></td></tr>
            </tbody>
          </table>
          </div>
        </div>
        <div class="col-md-6" >
        <div class="table-responsive" >
          <table class="table">
            <tbody>
              <tr><td>이메일 : ${login.email}</td></tr>
              <tr><td>이름 : ${login.name}</td></tr>
              <tr><td>쿠폰 : ${couponlist.size()}개 보유</td></tr>
              <tr><td>주문내역 : ${orderlist.size()}회</td></tr>
            </tbody>
          </table>
          </div>
        </div>
      </div>
    </div><br><br><br><br>
    
    <div class="col-md-12">
      <div class="box">
          <div class="text-center" id="box">
           <c:forEach items="${orderlist}" var="list">
            <dl>
              <c:if test="${list.email == login.email}">
                <dt class="accordion">${list.orderId} / ${list.email}님의 주문목록 / ${list.regdate}
                <div class="text-right"><button type="submit" class="btn btn-default text-right"><a href="order/${list.orderId}">상세보기</a></button></div></dt>
              </c:if>
            </dl>
            </c:forEach>
          </div>
      </div>


      <div class="box">
        <div class="box-footer">
          
           <!-- Paging -->
      		<div class="text-center">
			   <ul class="pagination">
				<c:if test="${pageBuilder.isShowPrevious()}">
					<li><a href="${pageBuilder.getQueryString(pageBuilder.currentStartPage -1)}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageBuilder.currentStartPage}" end="${pageBuilder.currentEndPage}" var="pageList">
					<li
						<c:out value="${pageBuilder.params.page == pageList?'class =active':''}"/>>
						<a href="${pageBuilder.getQueryString(pageList)}">${pageList}</a>
					</li>
				</c:forEach>

				<c:if test="${pageBuilder.isShowNext()}">
					<li><a href="${pageBuilder.getQueryString(pageBuilder.currentEndPage +1)}">&raquo;</a></li>
				</c:if>
   		     </ul>
  		   </div>
          <!-- /.Paging --> 
          
        </div>
      </div>
    </div>
    <!-- /.container -->
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