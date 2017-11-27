<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<style>
.pagination>li>a, .pagination>li>span {
  color: #353535;
  background-color: #FBF8EF;
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
  .pagination>.active>span:hover, .pagination>.active>a:focus,
  .pagination>.active>span:focus {
  z-index: 2;
  color: white;
  cursor: default;
  background-color: #8A0808; 
  border-color: #8A0808;
}

.button {
  width: 50px;
  height: 28px;
  background-color: #61210B;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;
}

.artLikecnt {
  width: 34px;
}

.button2 {
  width: 90px;
  height: 28px;
  background-color: #61210B;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;
}

.articleDiv {
  box-shadow: none !important;
}

.articleDiv2 {
  padding: 1em;
  box-shadow: 0 -1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24);
}

.label {
  padding: 2px 3px;
  min-width: 20px;
}

.label1 {
  background-color: #8A0808;
  width: 27%;
}

.label2 {
  border: hidden;
  background-color: white;
  color: #610B0B;
  font-weight: bold;
  width: 10%
}

.selectBox {
  height: 27px;
  border-radius: 10px"
}

.planDiv {
  width: 100%;
  min-height: 80px;
  display: block;
  height: 200px;
}

.planDiv img {
  width: 100%;
  height: 100%;
}

.artBoardTitle {
  font-size: 23pt;
  color: #8A4B08;
} 

.artListTitle {
  font-size: 12pt;
  color: #3B0B0B;
}
</style>
<script src="${rSrcPath}js/article_list.js"></script>
<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="blog-heading w3layouts">
      <strong><font class="artBoardTitle">공유배치도 게시판</font></strong>
      <p>회원들이 작성한 배치도를 공유할수 있는 게시판입니다.</p>
      <br> <br> <br>
      <form name="listForm" id="listForm" method="get"
        action="${contextPath }/article">
          <div class="form-inline col-md-5 col-md-offset-8">
          <span><select name="acreage" id="acreage"
            class="selectBox">
              <option value="" >평      수</option>
              <option value="xs">1 ~ 2평 (㎡)</option>
              <option value="ss">3 ~ 4평 (㎡)</option>
              <option value="mm">5 ~ 7평 (㎡)</option>
              <option value="ll">8 ~ 9평 (㎡)</option>
              <option value="xl">10 ~ 평  (㎡)</option>
          </select> <select name="sort" id="sort" class="selectBox">
              <option value="">최신순</option>
              <option value="like">추천순</option>
              <option value="view">조회순</option>
          </select></span>
        </div>
        </form>       
         <input type="hidden" name="acreage" value="${pb.params.acreage }">
        <input type="hidden" name="sort" value="${pb.params.sort}">
    </div>
    <br>
    <div class="col-md-12 information-grid pdbotton"
      data-wow-delay=".5s">
      <c:forEach items="${list}" var="article">
        <div class="information-info col-md-4 articleDiv"">
          <br>
          <div class="information-grid-info articleDiv2">
            <div class="planDiv">
              <a href="${contextPath}/article/${article.articleId}"><img
                src="${rSrcPath }/${article.planitemImg }" alt="" /></a>
            </div>
            <p>
              <a href="${contextPath}/article/${article.articleId}"><strong><font
                  class="artListTitle">${article.title }</font></strong></a> <br>
              <small>${article.regdate }</small>
            </p>
            <h3>
              <span class="label label1 ">&nbsp; <i
                class="fa fa-heart artLikecnt"></i>${article.likecnt }
              </span>&nbsp; <span class="label label2"> <i
                class="fa fa-hand-pointer-o"></i>&nbsp;&nbsp;${article.viewcnt }
              </span>
            </h3>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
  <br> <br> <br> <br>
  <div class="box-footer">
    <div class="text-center">
      <ul class="pagination">
        <c:if test="${pb.isShowPrevious()}">
          <li><a href="${pb.getQueryString(pb.currentStartPage -1)}">&laquo;</a></li>
        </c:if>
        <c:forEach begin="${pb.currentStartPage }"
          end="${pb.currentEndPage }" var="pageList">
          <li
            <c:out value="${pb.params.page == pageList ? 'class =active':''}"/>>
            <a href="${pb.getQueryString(pageList)}">${pageList}</a>
          </li>
        </c:forEach>
        <c:if test="${pb.isShowNext()}">
          <li><a href="${pb.getQueryString(pb.currentEndPage +1)}">&raquo;</a></li>
        </c:if>
      </ul>
    </div>
  </div>
  </form>
  <!-- //container -->
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>