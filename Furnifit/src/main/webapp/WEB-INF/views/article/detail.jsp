<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${rSrcPath}css/article_detail.css" />
<script src="${rSrcPath}js/article_detail.js"></script>
<body>
<!-- hidden -->
<input type="hidden" name="likeEmail" value="${likes.email }">
<input type="hidden" name="articleId" value="${article.articleId}">
<input type="hidden" name="likeCnt" value="${article.likecnt}">
 
<form role="form" >
</form>  
   <!-- blog -->
      <div class="blog"   >
         <!-- container -->
         <div class="container artContainer" >            
          <div class="box-footer artBoxFooter" >
        <c:if test="${article.email == login.email}">
           <a href="${contextPath }/article/update/${article.articleId}" type="button"><button type="submit" id="topbtn" class="modifyBtn" >MODIFY</button></a>
         <button type="submit"  id="topbtn" class="deleteBtn">DELETE</button>
        </c:if>
          <button type="submit"  id="topbtn" class="listBtn">LIST</button>      
          </div>
        <br>
           <div class="blog-heading w3layouts"  >
           </div>
           <!-- 배치도 내용 -->
                <div class="gallery-grids" >           
               <table id="shareForm">
               <tr >
               <div class="alert alert-warning" role="alert">
            <strong id="shareInfo">배치도명 :</strong>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"  value="&nbsp;${planItem.name}" class="artPlanitemName">
                  </div>
               </tr>             
               <tr>
              <div class="alert alert-warning" role="alert">
        <strong id="shareInfo">방크기 :</strong>&nbsp;<input readonly="readonly"  value="${planItem.length}" id="m" type="text">x <input readonly="readonly" value="${planItem.width}"  id="m" type="text" >x <input readonly="readonly"  value="${planItem.height}" id="m" type="text">
              &nbsp;&nbsp;&nbsp; <strong id="shareInfo">(&nbsp;평 수 :&nbsp;</strong><input readonly="readonly" value="${planItem.acreage}"  id="acreage" type="text"> <strong id="shareInfo">평&nbsp;)</strong>
            </div>
               </tr>
               <tr>
               <div class="alert alert-warning" role="alert">
        <strong id="shareInfo">작성자 :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input readonly="readonly"  value="${article.email}"  type="text" class="artPlanitemEmail" >
            </div>
               </tr>        
               </table>
               <br>
               <br>            
               <br>
               <br>
          <!-- 배치도 이미지 -->
               <div class="planimgDiv" >
                  <img src="${rSrcPath }/${planItem.image}"  alt="" />
               </div>
          <!-- 자세히보기-가구  -->
                <br>
          <div class="grid_3 grid_5 wow fadeInUp animated" data-wow-delay=".5s">
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
              <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a class="" href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">가구목록</a></li>
                <li role="presentation"><a class="" href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">후 기</a></li>                
              </ul>            
              <!-- 가구목록 상세 -->            
              <div id="myTabContent" class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                 <table class="table table-hover table1" >
              <thead>
                <tr >
                  <th class="align3"><font class="fFont">상품</font></th>
                  <th class="align3"><font class="fFont">상품명</font></th>
                  <th class="align3"><font class="fFont">상품가격</font></th>
                  <th class="align3"><font class="fFont">링크</font></th>
                </tr>
              </thead>
               <c:forEach var="product" items="${product}" >
              <tbody class="furnitureTbody">               
                <tr>
                  <td class="align2">
                  <c:forEach items="${product.imgs}" var="img">
                  <div class="artPrdImg">
          <img src="${rSrcPath}/productimg/${img.path}/${img.name}"/>
                  </div>                
                </c:forEach></td>
                  <td class="align2">${product.name }</td>
                  <td class="align2">${product.price }</td>
                  <td class="align2"><a href="${product.link }"><button type="button" class="artLink" >바로가기</button></a></td>
                </tr>              
              </tbody>
               </c:forEach>
            </table>
                </div>
                <!-- 후기 상세 -->
               <br>
               <br>
                <div role="tabpanel"  class="tab-pane fade artReview" id="profile" aria-labelledby="profile-tab">               
                <div class="box box-primary"  >
                <br>
                   <c:forEach items="${article.images}" var="articleImg">       
                  <div class="articleImg row">
                     <img id="reviewImg"  src="${rSrcPath}/articleimg/${articleImg.path}/${articleImg.name}"   >
                  </div>      
                    </c:forEach>
                 </div>
                 <br>
                 <br>
                   <div class="row artContent"  role="alert" >       
                <textarea name="content" rows="10" cols="45" readonly="readonly">${article.content }</textarea>               
                   </div>        
                </div>                                           
               </div>
              </div>
            </div>
          </div>         
          <button type="button" class="likeArt" id="like" name="like">좋아요♥&nbsp;<font size="3%">[${article.likecnt }]</font></button>
          <button type="button" disabled="disabled" class="likeArt2" id="alreadyLike" name="like">&nbsp;좋아요&nbsp;ν&nbsp;<font size="3%" id="likeCount">&nbsp;&nbsp;&nbsp;[${article.likecnt }]</font></button>            
          <br>
          <br>
          <br>
          <!-- 댓글 -->         
              <table style="width: 30px; margin: 0 auto;  text-align: center " >
                  <tr>
                    <td><input type="hidden" name=""  />
                    <textarea name="contents" rows="2" cols="100"
                     style="resize: none; border-style: solid; font-size: 11pt" 
                       >댓글을 작성해주세요.</textarea></td> n&nbsp;&nbsp;&nbsp;&nbsp;
                     <td><input class="replybtn" type="submit" value="등록"
                      style="width: 50px; height: 33px; font-size: 11pt"></td>
                  </tr>
            </table>
            <br/>
            <br/>           
            <br/>
   <table width="780" border="0" cellpadding="0" cellspacing="0" align="center">
     <tr><td width="600" colspan="2" height="3" bgcolor="#B40404"></td></tr> 
     <tr height="25">
      <td width="50%" align="left" style="color:#B40404;  font-weight: bold">&nbsp;&nbsp;보라보라얍</td>
      <td width="50%" align="right" style="color:#B40404;  font-weight: bold" >2017.11.13&nbsp;<input id="deletebtn" type="button" value="삭제"
       ></td>
     </tr>
     <tr><td width="600" colspan="2" height="1" bgcolor="#B40404"></td></tr>
     <tr height="60">
      <td align="left" style="padding: 5px 5px 5px 5px; color:#585858;  font-weight: bold" valign="top">
                 하이루 방가루
      </td>
     </tr>
     <tr><td width="600" colspan="2" height="3" bgcolor="#B40404"></td></tr>
   </table>    
 </div>
</div>
</div>            
   <!-- //blog -->
<%@ include file="../include/footer.jsp" %>
</body>