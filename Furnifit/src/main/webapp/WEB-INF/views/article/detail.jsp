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
.likeArt{
border-style:hidden; 
margin-left:42%; 
border-radius:5px; 
font-weight:bold; 
background-color: #DF3A01;
color: white;  
width: 18%; 
height:36px; 
font-size: 13pt;
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

.artContent{
text-align:center; 
border: 0px solid; 
font-weight: bold;
resize: none; 
border-color: #F6E3CE"
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

#topbtn{
border-style:hidden; 
border-radius:10px; 
background-color: #B40404;
color: white;  
width: 60px; 
height: 29px; 
font-size: 9pt
}
.articleImg{
width: 450px;
margin: auto;
display: block;
}

.articleImg img{
width : 100%;
height: auto;
}


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

<form role="form" >
 
 </form>  
	<!-- blog -->
		<div class="blog"  style="background-color: white" >
			<!-- container -->
			<div class="container" style="width: 900px; border: 3px solid; border-color: #F6E3CE; padding: 40px"  >
         
                  
        <div class="box-footer" style="float: right">
        <c:if test="${article.email == login.email}">
                  <a href="${contextPath }/article/update/${article.articleId}" type="button"><button type="submit" id="topbtn" class="modifyBtn" >MODIFY</button></a>
         <button type="submit"  id="topbtn" class="deleteBtn">DELETE</button>
                  </c:if>
       <button type="submit"  id="topbtn" class="listBtn">LIST</button>
         
         
  
  </div>
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
        <strong id="shareInfo">방크기 :</strong>&nbsp;&nbsp;<input readonly="readonly"  value="${planItem.length}" id="m" type="text">x <input readonly="readonly" value="${planItem.width}"  id="m" type="text" >x <input readonly="readonly"  value="${planItem.height}" id="m" type="text">
              &nbsp;&nbsp;&nbsp; <strong id="shareInfo">(&nbsp;평 수 :&nbsp;</strong><input readonly="readonly" value="${planItem.acreage}"  id="acreage" type="text"> <strong id="shareInfo">평&nbsp;)</strong>
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

                
               	<div class="row" style="margin-left: 26%">
                <div style="border: 1px ; float: left; width: 400px;  height: 260px; border-color: #B40404; padding: 10px; margin: 0 auto;">
                  <img src="images/plan.PNG" width="105%"  alt="" />
                </div>
			
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
          <div class="box box-primary"  >
        <c:forEach items="${article.images}" var="articleImg">
        <br>
        <br>
                   <div class="articleImg">
         <img  src="${rSrcPath}/articleimg/${articleImg.path}/${articleImg.name}"   >
                    </div>
                  </c:forEach>
              	</div>
          <br>
          <br>
          <br>
          <br>

          
          <!-- 글쓸곳 -->
              <div class="row" style="text-align: center;">
       
                <textarea name="content" rows="8" cols="55" readonly="readonly"
            class="artContent" 
            >${article.content }</textarea>
                
          </div>  
          <br>
          <br>
          
          <button class="likeArt">좋아요♥&nbsp;<font size="2px">[${article.likecnt }]</font></button>
   
         <br>
         <br>
         <br>

        <!-- 댓글 -->         
              <table style="width: 30px; margin: 0 auto;  text-align: center " >
                  <tr>
                    <td><input type="hidden" name=""  />
                    <textarea name="contents" rows="2" cols="100"
                     style="resize: none; border-style: solid; font-size: 11pt" 
                       >댓글을 작성해주세요.</textarea></td>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <td><input class="replybtn" type="submit" value="등록"
       	            style="width: 50px; height: 33px; font-size: 11pt"></td>
                  </tr>
            </table>

              <br/>
              <br/>

              <table width="600" border="0" cellpadding="0" cellspacing="0"  align="center">
 
              </table>
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
      
<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
  <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
  </span>
  </div>
</li>                
</script>  
   
<script>
$(document).ready(function(){
  
  var formObj = $("form[role='form']");
    
    
  $(".listBtn").bind("click", function(){
    formObj.attr("method", "get");
    formObj.attr("action", "/one/article");
    formObj.submit();
  });
  
});
</script>

<script>
        
$(".deleteBtn").on("click",function(){
     
	
    $.ajax({
      type:'delete',
      url:'${contextPath}/article/${article.articleId}',
      headers: { 
               "Content-Type": "application/json",
               "X-HTTP-Method-Override": "DELETE" },
      dataType:'text', 
      success:function(result){
      console.log("result: " + result);
      if(result == 'success'){
      alert("삭제 되었습니다.");
      $(".listBtn").trigger("click");
      

         } 
       }
    });
});
</script> 

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

       
         
      
	<!-- //blog -->
<%@ include file="../include/footer.jsp" %>

</body>