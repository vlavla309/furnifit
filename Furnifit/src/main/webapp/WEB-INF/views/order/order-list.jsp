<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${rSrcPath}css/order-list.css" />
<script src="${rSrcPath}js/order-list.js"></script>


<div class="blog">
  <div class="container">
  
  <!-- 주문서 목록 div-->
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
    <!-- /주문서 목록 div-->
    
    <!-- 목록 리스트 div-->
    <div class="col-md-12">
      <div class="box">
          <div class="text-center" id="box">
           <c:forEach items="${orderlist}" var="list">
            <dl>
              <c:if test="${list.email == login.email}">
                <dt class="accordion">${list.orderId} / ${list.email}님의 주문목록 / ${list.regdate}
                  <div class="text-right"><a href="${contextPath}/order/${list.orderId}" class="btn btn-default">상세보기</a></div>
                </dt>
              </c:if>
            </dl>
            </c:forEach>
          </div>
      </div>

      <div class="box">
        <div class="box-footer">
          
           <!-- 페이징 -->
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
          <!-- /페이징 --> 
          
        </div>
      </div>
    </div>
    <!-- /목록 리스트 div-->
  </div>
</div>

<%@ include file="../include/footer.jsp"%>