<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${rSrcPath}css/article_modify.css" />

<body>

<!-- hidden -->
  
    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
     <img id="popup_img">
    </div>
   
    <form id='registerForm' role="form">
    <input type="hidden" value="${pageContext.servletContext.contextPath }" name="path" id ="path">
   <!-- blog -->
      <div class="blog" >
         <!-- container -->
      
         <div class="container artContainer"  >
        
  <br>

 
  
            <div class="blog-heading w3layouts"  >
            
            
            <!-- 여기서 내용을 채운다 -->
      
   
            
                </div>
                <div class="gallery-grids" >
                
                
               
               <table id="shareForm">
               <tr >
               <div class="alert alert-warning" role="alert">
            <strong id="shareInfo">배치도명 :</strong>&nbsp;&nbsp;<input type="text" readonly="readonly"  value="&nbsp;${planItem.name}" class="artPlanitemName">
                  </div>
               </tr>
               
               <tr>
              <div class="alert alert-warning" role="alert">
        <strong id="shareInfo">방크기 :</strong><input readonly="readonly"  value="${planItem.length}" id="m" type="text">x <input readonly="readonly" value="${planItem.width}"  id="m" type="text" >x <input readonly="readonly"  value="${planItem.height}" id="m" type="text">
             &nbsp;&nbsp; <strong id="shareInfo">(&nbsp;평&nbsp;&nbsp;수  :&nbsp;</strong><input readonly="readonly" value="${planItem.acreage}"  id="acreage" type="text"> <strong id="shareInfo">평&nbsp;)</strong>
            </div>
               </tr>
               <tr>
               <div class="alert alert-warning" role="alert">
        <strong id="shareInfo">작성자 :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input readonly="readonly"  value="${login.email}"  type="text"  class="artPlanitemEmail" >
            </div>
               </tr>
               <tr>
                               </tr>
               
               </table>
               <br>
              
                
                
                
                <!-- 배치도 이미지 -->
                <br>

                <div class="planimgDiv" >
        <img src="${rSrcPath }/${planItem.image}"  alt="" />
                    </div>
  
  <!-- 자세히보기-가구목록  -->
<br>
<button type="button" class="accordion" class="col-md-2 artDetailView" >&nbsp;자세히보기 ▼</button>


    <div class="bs-docs-example wow fadeInUp animated panel furnitureList" data-wow-delay=".5s" >
            <table class="table table-hover">
              <thead>
                <tr >
                  <th class="align2">상품번호</th>
                  <th class="align2">상품명</th>
                  <th class="align2">상품가격</th>
                  <th class="align2">링크</th>
                </tr>
              </thead>
               <c:forEach var="product" items="${product}" >
              <tbody style="text-align: cennter">
                
                <tr>
                  <td class="align2">${product.productId }</td>
                  <td class="align2">${product.name }</td>
                  <td class="align2">${product.price }</td>
                  <td class="align2"><a href="${product.link }"><button type="button" class="artLink" >바로가기</button></a></td>
                </tr>
               
              </tbody>
               </c:forEach>
            </table>
            
             
          </div>
          <br>
          <br>
          <br>
          <br>
          
<!-- 파일첨부할곳 -->

 <p>
    <div class="form-group">
              <label for="exampleInputEmail1">File DROP Here</label>
              <div class="fileDrop"></div>
            </div>
          </div>

          <!-- /.box-body -->

          <div class="box-footer">
            <div>
              <hr>
            </div>


            <ul class="mailbox-attachments clearfix uploadedList">
                    <c:forEach items="${article.images}" var="articleImg">
                   <div class="articleImg">
                   <li>
  <span class="mailbox-attachment-icon has-img"><img na src="${rSrcPath}/articleimg/${articleImg.path}/${articleImg.name}"></span>
  <div class="mailbox-attachment-info">
  <a href="${articleImg.path}/${articleImg.name}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw  fa-times "></i></a>
  </span>
  </div>
</li> 
                    </div>
                  </c:forEach>
            </ul>

          <br>
          <br>
          <br>
          <br>



          <div class="box box-primary"  >

                 </div>
          <br>
          <br>
          <br>
          <br>

          
          <!-- 글쓸곳 -->
              <div class="row modifyContent">
                   <input type="text" value="${article.title }" name="title" class="artTitle" >
              <p>
              <br>
              <br>
                <textarea name="content" rows="8" cols="55" 
            class="artContent" 
            >${article.content }</textarea>
                
          </div>  
          <br>
          <br>
                <br>     
  
  
            <div style="margin-left: 40%" class="buttonList">
          
                <button type="submit" class="button3" id="modifyBtn">저장하기</button>
                <a href="${contextPath }/article/${article.articleId}"><button type="button" class="button3" id="cancelBtn" >취소</button></a>
          </div>
       
            </div>
       
        
         </div>
      </div>
      </form>
<script>
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
$(function(){

$("#modifyBtn").on("click",function(){
	 event.preventDefault();
   
	 var that = $("#registerForm");
	 
    var str = "";
    $(".uploadedList .delbtn").each(
        function(index) {
          str += "<input type='hidden' name='files[" + index
              + "]' value='" + $(this).attr("href")
              + "'> ";
    });
    
	 that.append(str);
	 
	 to_ajax();
	 });
	 
	
    function to_ajax(){
    var formData = $("#registerForm").serialize();
    console.log(formData);
    
    $.ajax({ 
      type:'post',
      url:'${contextPath}/article/${article.articleId}',
      data: formData,  
      success:function(result){
        console.log("result: " + result);
        if(result == 'success'){
          alert("수정 되었습니다.");
          location.href='${contextPath}/article/${article.articleId}';
      		  }
  		  }
      });
	}


});


   
   
</script>

                
               <script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/artupload.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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



</script>
<script>
$(".uploadedList").on("click", ".delbtn", function(event){
     event.preventDefault(); 
     $(this).parent().parent().parent().remove();
});
</script>
  

       
         
      
   <!-- //blog -->
<%@ include file="../include/footer.jsp" %>

</body>