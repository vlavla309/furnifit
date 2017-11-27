<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${rSrcPath}css/article_detail.css" />
<script src="${rSrcPath}js/article_detail.js"></script>
<%-- <script src="${rSrcPath}js/article_detail_reply.js"></script> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.js"></script>


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
                     <a data-fancybox="gallery" href="${rSrcPath}/articleimg/${articleImg.path}/${articleImg.name}"><img src="${rSrcPath}/articleimg/${articleImg.path}/${articleImg.name}" style="width: 50px"></a>
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
          
          <!-- 댓글 아래에 modify 버튼이 있는데 그 버튼의 모달 -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="content" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 

<!-- 댓글 입력 폼 -->
<br><br>
 <div class="row">
    <div class="col-md-12">

      <div class="box box-success">
        <div class="box-header">
          <h3 class="replyWriter"><span><strong>댓글&nbsp쓰기</strong></span></h3>
        </div>
        <div class="box-body">
          <label for="exampleInputEmail1"></label>
          <input class="form-control" type="hidden" id="newReply" value="${Reply.email}">
          <label for="exampleInputEmail1" id="exampleEmail">Email</label> 
          <input class="form-control" type="text" placeholder="로그인이 필요합니다" readonly id="newEmail" value="${login.email}">
          <br>
          <label for="exampleInputEmail1" id="exampleComment">Comment</label> 
          <input class="form-control" type="text" placeholder="회원만 등록하실 수 있습니다." id="newContent">
          <label for="exampleInputEmail1"></label>
          <input type='hidden' name='articleId' id='newArticleId' value="${article.articleId}">
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
        </div>
      </div>
      <br>
      <hr class="dunggul" style="border: solid 4px #f70940;">

<!-- 입력한 댓글들은 이곳에 출력된다. -->
<div id="replies">
</div>

<script src="${rSrcPath}js/article_detail_reply.js"></script>

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>  

<!-- //blog -->
<%@ include file="../include/footer.jsp" %>
</body>