<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${rSrcPath}css/article_register.css" />
<body>
<!-- hidden -->
<input type="hidden" value="${pageContext.servletContext.contextPath }" name="path" id ="path"> 
   
   <!-- blog -->
      <div class="blog" > 
         <!-- container --> 
         <div class="container artContainer2">
            <form id='registerForm' role="form" method="post" action="${contextPath}/article">
              <input type="hidden" name="planitemId" value="${planItem.planitemId}">
                <div class="blog-heading w3layouts artHead" >              
                </div>
                  <div class="gallery-grids" >
                    <table id="shareForm">
                     <tr>
                      <div class="alert alert-warning" role="alert">
                        <strong id="shareInfo">배치도명 :</strong>&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"  value="${planItem.name}" class="artPlanitemName2">
                      </div>
                     </tr>               
                     <tr>
                      <div class="alert alert-warning" role="alert">
                       <strong id="shareInfo">평 수 :</strong>&nbsp;&nbsp;<input id="m" readonly="readonly"  value="${planItem.length}" type="text">x <input id="m" readonly="readonly" value="${planItem.width}" type="text" >x <input  id="m" readonly="readonly"  value="${planItem.height}" type="text">
                        &nbsp;&nbsp;&nbsp; <strong id="shareInfo">(&nbsp;평 수 :&nbsp;</strong><input readonly="readonly" value="${planItem.acreage}"  id="acreage" type="text"> <strong id="shareInfo">평&nbsp;)</strong>
                      </div>
                     </tr>
                     <tr>
                       <div class="alert alert-warning" role="alert">
                        <strong id="shareInfo">작성자 :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" name="email"  value="${login.email}"  class="artPlanitemName2">
                          </div>
                     </tr>
                    </table>
                    <br>
                    <br>
            <!-- 배치도 이미지 -->               
                    <div class="planimgDiv" >
                      <img src="${rSrcPath }/svg/plan${planItem.image}"  alt="" />
                    </div>        
                  </div>  
            <!-- 자세히보기-가구목록  -->
                    <br>
                      <button type="button" class="accordion" class="col-md-2">&nbsp;자세히보기 ▼</button>
                        <div class="bs-docs-example wow fadeInUp animated panel furnitureList" data-wow-delay=".5s" >
                          <table class="table table-hover">
                           <thead>
                            <tr>
                              <th class="align2">상품</th>
                              <th class="align2">상품명</th>
                              <th class="align2">상품가격</th>
                              <th class="align2">링크</th>
                            </tr>
                           </thead>
                          <c:forEach var="product" items="${product}" >
                           <tbody style="text-align: cennter">              
                             <tr>
                               <td class="align2"> 
                                 <c:forEach items="${product.imgs}" var="img">
                                   <div class="artPrdImg">
                                     <img src="${rSrcPath}/productimg/${img.path}/${img.name}"/>
                                   </div>                
                                 </c:forEach>
                               </td>
                               <td class="align2">${product.name }</td>
                               <td class="align2">${product.price }</td>
                               <td class="align2"><a href="${product.link }"><button type="button" class="artLink2" >바로가기</button></a></td>
                             </tr>              
                            </tbody>
                           </c:forEach>
                          </table>
                       </div>
                        <br>
                        <br>
                        <br>
                        <br>            
                        <br>
                        <br>
                <!-- 파일첨부할곳 -->
                        <p>
                          <div class="form-group">
                            <label for="exampleInputEmail1">File DROP Here</label>
                              <div class="fileDrop">
                              </div>
                          </div>
                        <div class="box-footer">
                          <div>
                            <hr>
                          </div>
                            <ul class="mailbox-attachments clearfix uploadedList">
                            </ul>
                        <br>
                        <br>
                        <br>
                        <br>      
                  <!-- 글쓸곳 -->
                        <div class="row" style="text-align: center;">
                          <input type="text" name="title" class="artTitle2" required="required" placeholder="&nbsp;&nbsp;&nbsp;제목을 입력해주세요.">
                            <p>
                            <br>
                            <textarea name="content" rows="8" cols="55" class="artContent"  required="required" placeholder="&nbsp;&nbsp;&nbsp;글을 작성해주세요."></textarea>                
                        </div>  
                        <br>
                        <br>
                          <div class="artRegisterBtn" >         
                            <button type="submit" class="button3">저장하기</button>
                              <a href="${contextPath }/mypage/itemlist/${planItem.planitemId}"><button type="button" class="button3" onclick="article/list.jsp">취소</button></a>
                          </div>        
                    </div> 
               </form>
            </div>
         </div>              
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/artupload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
  <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
  <a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw  fa-times "></i></a>
  </span>
  </div>
</li>                
</script>
<script type="text/javascript">
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    }
}
</script>
<script>
  var template = Handlebars.compile($("#template").html());

  $(".fileDrop").on("dragenter dragover", function(event) {
    event.preventDefault();
  });

  $(".fileDrop").on("drop", function(event) {
    event.preventDefault();

    var files = event.originalEvent.dataTransfer.files;

    var file = files[0];

    var formData = new FormData();

    formData.append("file", file);

    $.ajax({
      url : '${pageContext.servletContext.contextPath }/uploadajaxart',
      data : formData,
      dataType : 'text',
      processData : false,
      contentType : false,
      type : 'POST',
      success : function(data) {
        var fileInfo = getFileInfo(data);

        var html = template(fileInfo);

        $(".uploadedList").append(html);
      }
    });
  });

  $("#registerForm").submit(
      function(event) {
        event.preventDefault();

        var that = $(this);

        var str = "";
        $(".uploadedList .delbtn").each(
            function(index) {
              str += "<input type='hidden' name='files[" + index
                  + "]' value='" + $(this).attr("href")
                  + "'> ";
            });

        that.append(str);

        that.get(0).submit();
        alert("글이 등록되었습니다.");
      });

  $(".uploadedList").on("click", ".delbtn", function(event) {

    event.preventDefault();

    var that = $(this);

    $.ajax({
      url : "${pageContext.servletContext.contextPath }/deletefileart",
      type : "post",
      data : {
        fileName : $(this).attr("href")
      },
      dataType : "text",
      success : function(result) {
        if (result == 'deleted') {
          that.closest("li").remove();
        }
      }
    });
  });
</script>
      
   <!-- //blog -->
<%@ include file="../include/footer.jsp" %>

</body>