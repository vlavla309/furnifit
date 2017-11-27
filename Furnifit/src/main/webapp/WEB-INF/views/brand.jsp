<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="include/header.jsp"%>

<link rel="stylesheet" href="${rSrcPath}css/plan-manage.css" />


<div class="blog">
  <div class="container">
  
  <!-- 브랜드 div-->
    <div class="col-md-3">
      <h1>가구 브랜드</h1><br><br>
      <div class="box box-info">
        <h4 class="text-center" style="padding-top: 10px;"><strong>내 정보</strong></h4>
        <div class="table-responsive">
          <table class="table text-center">
              <tr><td><img class="img-size" src="${rSrcPath}/images/user.png"></td></tr>
          </table>
          <table class="table text-left">
              <tr><td>이메일 : </td></tr>
              <tr><td>이름 :</td></tr>
              <tr><td>배치도 작성내역 : </td>
              </tr>
          </table>
        </div>
      </div>
    </div><br><br><br><br>
    <!-- /배치도 관리 div-->

  </div>
</div>

<%@ include file="include/footer.jsp"%>