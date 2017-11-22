<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>


<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">

    <div class="col-md-12">
      <div class="box">
        <h1>위시리스트</h1>

        <div class="information-grids agile-info" id="wrapper">
        
          <div class="col-md-4 information-grid pdbotton" data-wow-delay=".5s">
            <div class="information-info">
              <div class="information-grid-img"><img class="img-size" style="height: 300px;" src="${rSrcPath}/images/10.jpg"></div>
              <div class="information-grid-info">
                <span class="badge badge-danger">Sale 40%</span>
                <h4>상품명</h4>
                <hr>
                <p>
                  <strong>&#8361; 100000 </strong> <br> 100 * 50 * 70 <small>(가로 * 세로 * 높이 mm)</small>
                </p><br>
                <div class="box" style="text-align: center;">
                  <a href="#" class="btn btn-default">쇼핑몰로 가기</a>
                  <a href="#" class="btn btn-default">삭제</a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="clearfix"></div>
        </div>
        
      </div>
      <!-- //container -->
    </div>
  </div>
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>