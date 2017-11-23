<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<style>
.align {
  text-align: center;
  border: 1px dashed;
  border-color: #F5D0A9;
}
.align2 {
  text-align: center;
}

.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
}

#acreage{
width:4%;  
height: 14%; 
background-color: transparent; 
font-weight:bold; 
border: none; 
font-size:11pt; 
color: #F7BE81;
text-align: center;
}




button.accordion {
    background-color: #8A0808;
    color: white;
    cursor: pointer;
    padding: 5px;
    width: 15%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 13px;
    transition: 0.4s;
    border-radius: 8px;
}

button.accordion.active, button.accordion:hover {
    background-color: #F6E3CE; 
    border: 2;
}

div.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    
}

.button {
  width: 100px;
  height: 38px;
  background-color: #8A0808;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;
}

.artTitle{
text-align:center; 
font-weight:bold; 
width: 55%; 
height: 40px; 
border: 1px solid #F5D0A9;
}

.artContent{
text-align:center; 
font-weight: bold;
resize: none; 
border: 1px solid;
border-color: #F5D0A9;
}

.button2 {
  width: 50px;
  height: 25px;
  background-color: #8A0808;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;
}
#shareForm tr td{
padding: 3px;
}
#shareInfo{
color: #DF0101;
font-size: 9pt;
}

#m{
width:10%;  
height: 14%; 
background-color: transparent; 
font-weight:bold; 
border: none; 
font-size:11pt; 
color: #F7BE81;
text-align: center;
}

ul.dropdown-menu {
    top: 1.5cm;
}
#shareReply{
color: 
}

.replybtn {
  width: 60px;
  height: 23px;
  background-color: #61210B;
  color: white;
  border: 2;
  border-style: hidden;
  margin-left: 10%
}

#replyth{
color: #DF0101;
font-size: 12pt;
}

#deletebtn{
background-color :white;
color: #B40404;
border-style: hidden;
font-weight: bold;
width: 45px; 
height: 25px; 
font-size: 12pt;
box-shadow: none;
}

.topbtn{
border-style:hidden; 
border-radius:10px; 
background-color: #B40404;
color: white;  
width: 60px; 
height: 29px; 
font-size: 9pt
}
.articleImg{
width: 150px;
margin: auto;
display: block;
}

.articleImg img{
width : 100%;
height: auto;
}

.button3{
  width: 80px;
  height: 28px;
  background-color: #61210B;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;

</style>
    <style type="text/css">
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
      }
     .show{
       position:relative;
       max-width: 1200px; 
       max-height: 800px; 
       overflow: auto;       
     } 
    
    </style>
<body>

<!-- hidden -->
  
    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
     <img id="popup_img">
    </div>
   
    <form id='registerForm' role="form">
    <input type="hidden" value="${pageContext.servletContext.contextPath }" name="path" id ="path">
   <!-- blog -->
      <div class="blog"  style="background-color: white" >
         <!-- container -->
      
         <div class="container" style="width: 900px; border: 3px solid; border-color: #F6E3CE; padding: 40px"  >
        
  <br>

 
  
            <div class="blog-heading w3layouts" style="margin-top: 30px" >
            
            
            <!-- 여기서 내용을 채운다 -->
      
   
            
                </div>
                <div class="gallery-grids" >
                
                
               
               <table id="shareForm">
               <tr >
               <div class="alert alert-warning" role="alert">
            <strong id="shareInfo">배치도명 :</strong>&nbsp;&nbsp;<input type="text" readonly="readonly"  value="&nbsp;${planItem.name}" style="width:23%;  height: 12%; background-color: transparent; font-weight:bold; border: none; font-size:11pt; color: #F7BE81;">
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
        <strong id="shareInfo">작성자 :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input readonly="readonly"  value="${login.email}"  type="text" style="width:23%;  height: 12%; background-color: transparent; font-weight:bold; border: none; font-size:11pt; color: #F7BE81;">
            </div>
               </tr>
               <tr>
                               </tr>
               
               </table>
               <br>
              
                
                
                
                <!-- 배치도 이미지 -->
                <br>

                <div class="planimgDiv" >
        <img src="${rSrcPath }/${planItem.image}" style="width:100%;"  alt="" />
                    </div>
  
  <!-- 자세히보기-가구목록  -->
<br>
<button class="accordion" class="col-md-2" style="margin-left: 60%; margin-top: 10px">&nbsp;자세히보기 ▼</button>


    <div class="bs-docs-example wow fadeInUp animated panel" data-wow-delay=".5s" style="background-color: white">
            <table class="table table-hover">
              <thead>
                <tr >
                  <th class="align2">상품번호</th>
                  <th class="align2">상품명</th>
                  <th class="align2">상품가격</th>
                  <th class="align2">사이트바로가기</th>
                </tr>
              </thead>
               <c:forEach var="product" items="${product}" >
              <tbody style="text-align: cennter">
                
                <tr>
                  <td class="align2">${product.productId }</td>
                  <td class="align2">${product.name }</td>
                  <td class="align2">${product.price }</td>
                  <td class="align2">${product.brand }</td>
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
              <div class="row" style="text-align: center;">
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