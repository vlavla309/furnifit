<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<script src="${rSrcPath}js/article_list.js"></script>
<link rel="stylesheet" href="${rSrcPath}css/article_list.css" />
<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
    <div class="blog-heading w3layouts">
      <strong><font class="artBoardTitle">공유배치도 게시판</font></strong>
      <p>회원들이 작성한 배치도를 공유할수 있는 게시판입니다.</p>
      <br> <br> <br>
        <form name="listForm" id="listForm" method="get" action="${contextPath }/article">
         <div class="form-inline col-md-5 col-md-offset-8">
          <span><select name="acreage" id="acreage" class="selectBox">
                  <option value="">평  수</option>
                  <option value="xs">1 ~ 2평 (㎡)</option>
                  <option value="ss">3 ~ 4평 (㎡)</option>
                  <option value="mm">5 ~ 7평 (㎡)</option>
                  <option value="ll">8 ~ 9평 (㎡)</option>
                  <option value="xl">10 ~ 평  (㎡)</option>
                </select> 
                <select name="sort" id="sort" class="selectBox">
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
        <div class="information-info col-md-4 articleDiv">
          <br>
          <div class="information-grid-info articleDiv2">
            <div class="planDiv">
              <a href="${contextPath}/article/${article.articleId}">
                <img src="${rSrcPath }/svg/plan/${article.planitemImg }" alt="" /></a>
            </div>
            <p>
              <a href="${contextPath}/article/${article.articleId}">
                <strong><font class="artListTitle">${article.title }</font></strong></a> 
            <br>
                  <small>${article.regdate }</small>
            </p>
            <h3>
              <span class="label artlabel artlabel1 ">&nbsp; 
                <i class="fa fa-heart artLikecnt"></i>${article.likecnt }
              </span>&nbsp; 
              <span class="label artlabel artlabel2"> 
                <i class="fa fa-hand-o-up"></i>&nbsp;&nbsp;${article.viewcnt }
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
        <c:forEach begin="${pb.currentStartPage }" end="${pb.currentEndPage }" var="pageList">
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