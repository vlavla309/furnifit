<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<style>
.button {
  width: 50px;
  height: 28px;
  background-color: #61210B;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;
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
  
.articleDiv{
box-shadow: none!important;
}
.articleDiv2{
 padding: 1em;
 box-shadow: 0 -1px 3px rgba(0,0,0,.12), 0 1px 2px rgba(0,0,0,.24);
}
.label {
   padding: 2px 3px;
    min-width: 20px;
}
.label1{
    background-color: #DF0101;
    min-width: 30px;
    display: inline-block;
}
.label2{
    border: hidden;
    background: white;
    color: black;
    font-size: 10pt;
}
</style>


<!-- blog -->
<div class="blog">
  <!-- container -->
  <div class="container">
  <form name="listForm" class="form-inline" role="form" method="get">
    <div class="blog-heading w3layouts">

      <strong><font style="font-size: 23pt; color: #8A4B08">공유배치도
          게시판</font></strong>
      <p>회원들이 작성한 배치도를 공유할수 있는 게시판입니다.</p>
      <div class="form-inline col-md-2 col-md-offset-10">
        <br> <select
          style=" width: 80px; height: 27px; border-radius: 10px">
          <option value="">정렬</option>
          <option value="">최신순</option>
          <option value="">추천순</option>
          <option value="">조회순</option>
        </select>
      </div>
    </div>
    <br> <br><br>

    <div class="col-md-12 information-grid pdbotton" data-wow-delay=".5s">
      <c:forEach items="${list}" var="article">
        <div class="information-info col-md-4 articleDiv" ">
          <br>
          <div class="information-grid-info articleDiv2" >
            <img src="images/room.PNG" width="105%" alt="" />
            <p>
              <a href="${contextPath}/article/${article.articleId}"><strong><font style="font-size: 12pt; color: #3B0B0B">${article.title }</font></strong></a>
              <br> <small>${article.regdate }</small>
            </p>
            <h3>
              <span class="label label1" >&nbsp;<i
                class="fa fa-heart " aria-hidden="true"></i>&nbsp;&nbsp;${article.likecnt }
              </span>&nbsp; <span class="label label2"><i
                class="fa fa-eye " aria-hidden="true"></i>&nbsp;&nbsp;${article.viewcnt }</span>
            </h3>
           
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
  <br> <br> <br> <br>
  <!-- 검색 -->
  
    <div style="text-align: center;" class="form-inline">
      <select class="form-control" >
        <option value="">작성자</option>
        <option value="">제목</option>
        <option value="">평수</option>
      </select> <input type="text" class="form-control" >
      <button type="submit" class="button">검색</button>
      <input type="button" class="button2" value="전체보기">
    </div>
  </form>
  <!-- //container -->
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>