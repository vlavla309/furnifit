<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${rSrcPath}css/plan-manage.css" />
<script src="${rSrcPath}js/order-list.js"></script>


<div class="blog">
  <div class="container">
  
  <!-- 배치도 관리 div-->
    <div class="col-md-3">
      <h1>배치도 관리</h1><br><br>
      <div class="box box-info">
        <h4 class="text-center" style="padding-top: 10px;"><strong>내 정보</strong></h4>
        <div class="table-responsive">
          <table class="table text-center">
              <tr><td><img class="img-size" src="${rSrcPath}/images/user.png"></td></tr>
          </table>
          <table class="table text-left">
              <tr><td>이메일 : ${login.email}</td></tr>
              <tr><td>이름 : ${login.name}</td></tr>
              <tr><td>배치도 작성내역 : ${planlist.size()}회</td>
              </tr>
          </table>
        </div>
      </div>
    </div><br><br><br><br>
    <!-- /배치도 관리 div-->

    <!-- 목록 리스트 div-->
    <div class="col-md-9">
      <div class="box">
        <form method="post" action="order-address.leaf">
          <div class="text-center" id="box">
            <c:forEach items="${planlist}" var="plan">
              <dl>
               <c:if test="${plan.email == login.email}">
                <dt class="accordion">${plan.planId} / ${plan.email}님의 배치도 / ${plan.regdate}</dt>
                <dd><ul><li>
                  <c:forEach items="${itemlist}" var="item">
                      <c:if test="${item.planId == plan.planId}">
                        <a href="${contextPath}/mypage/itemlist/${item.planitemId}" value="${item.planitemId}">${item.name}</a><br>
                      </c:if>
                  </c:forEach>
                </li></ul></dd>
               </c:if>
              </dl>
            </c:forEach>
          </div>
        </form>
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