<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<style></style>
<style>
.align {
  text-align: center;
  border: 1px dashed;
  border-color: #F5D0A9;
}
.nav-tabs > li > a{
margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
    background-color: #B40404;
    color: white;
    font-weight: bold;
}
.align2 {
  text-align: center;
}
.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus{
color: white;
font-weight: bold;
cursor: default;
background-color: #F5D0A9;
border: 0px solid;
border-bottom-color: transparent;
}

.nav-tabs > li > a:hover{
border-color: #FBF8EF;
background-color: #F7F2E0;
}


.align3 {
  text-align: center;

}



.contentDiv{
margin:auto; 
width: 630px;
border-color: white;
border-radius: 10px;
}
.artPrdImg{
	width: 80px;
	min-height: 30px;
	display: block;
	height: 70px;
    margin: auto;
}
.artPrdImg img{
width: 100%;
height: 100%;
}
.artLink{
width: 100px;
color: black;
background-color: transparent;
box-shadow: none;
border: 0px solid;
}

.likeArt{
border-style:hidden; 
margin-left:42%; 
border-radius:5px; 
font-weight:bold; 
background-color: #DF013A;
color: white;  
width: 15%; 
height:36px; 
font-size: 13pt;
}

.likeArt2{
border-style:hidden; 
margin-left:42%; 
border-radius:5px; 
font-weight:bold; 
background-color: #F79F81;
color: white;  
width: 17%; 
height:36px; 
font-size: 13pt;
}

button.accordion {
    background-color: #8A0808;
    color: white;
    cursor: pointer;
    padding: 5px;
    width: 12%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 13px;
    transition: 0.4s;
    border-radius: 8px;
}

.fFont{
font-size: 13pt;
}
.table1{
border-color: black;
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
.nav-tabs{
border-bottom: 0px solid;
}

.artContent{
text-align:center; 
border: 0px solid;
resize: none; 
background-color: white;
font-size: 11pt;
color: black;
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
width: 400px;
margin: auto;
display: block;
}


.articleImg img{
width : 100%;
height: auto;
}
.artContainer{
width: 900px; 
border: 3px solid; 
border-color: #F6E3CE; 
padding: 40px;
}

.artPlanitemName{
width:23%;  
height: 12%; 
background-color: transparent; 
font-weight:bold; 
border: none; 
font-size:11pt; 
color: #F7BE81;
}
.artPlanitemEmail{
width:23%;  
height: 12%; 
background-color: transparent; 
font-weight:bold; 
border: none; 
font-size:11pt; 
color: #F7BE81;
}

.planimgDiv img{
width: 100%;
}

.furnitureList{
background-color: white;
}
.artBoxFooter{
float: right;
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
            
            
            <!-- 여기서 내용을 채운다 -->
            
                </div>
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
        <strong id="shareInfo">작성자 :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input readonly="readonly"  value="${login.email}"  type="text" class="artPlanitemEmail" >
            </div>
               </tr>
               <tr>
                               </tr>
               
               </table>
               <br>
              
                
                
                
                <!-- 배치도 이미지 -->
                <br>

                
                     
        <br>
        <br>
        
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
              <tbody style="text-align: cennter">
                
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
               
                <div role="tabpanel" style="border: 1px solid" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                
                <div class="box box-primary"  >
                <br>
        <c:forEach items="${article.images}" var="articleImg">
        
                  <div class="articleImg row">
        <a class="img2" href="${rSrcPath}/articleimg/${articleImg.path}/${articleImg.name}"><img  src="${rSrcPath}/articleimg/${articleImg.path}/${articleImg.name}"   ></a>
                    </div>      
                    </c:forEach>
                 </div>
                 <br>
                 <br>
                   <div class="row" style="margin-left: 240px" role="alert" >       
                <textarea name="content" rows="10" cols="45" readonly="readonly"
            class="artContent" 
            >${article.content }</textarea>
                
          </div> 
        
                </div>
               
                               
                </div>
              </div>
            </div>
          </div>

          
          <button type="button" class="likeArt" id="like" name="like">좋아요♥&nbsp;<font size="3%">[${article.likecnt }]</font></button>
           <button type="button" disabled="disabled" class="likeArt2" id="alreadyLike" name="like">&nbsp;추천됨&nbsp;ν<font size="3%" id="likeCount">&nbsp;&nbsp;&nbsp;[${article.likecnt }]</font></button>
   
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
var abc = 0;

$(document).ready(function(){
  
  var formObj = $("form[role='form']");
    
    
  $(".listBtn").bind("click", function(){
    formObj.attr("method", "get");
    formObj.attr("action", "/one/article");
    formObj.submit();
  });
  

  if(!"${likes.email}"){
	 $("#alreadyLike").hide();
  }else{
	 $("#like").hide();
    
  }
  
  $("#like").on("click", function(){
  		
	  to_ajax();
  });
  
  function to_ajax(){
	  var articleId = "${article.articleId}";
	  var email = "${login.email}";
	  var likecnt = "${article.likecnt}"
	
	  $.ajax({
        type:'post',
        url:'${contextPath}/like',
        headers: { 
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST" },
        dataType:'text',
        data: JSON.stringify({articleId:articleId, email:email, likecnt:likecnt}),
        success:function(result){
          console.log("result: " + result);
          if(result == 'success'){
             alert("추천완료!");
             $("#like").hide();
             $("#alreadyLike").show();
             $("#likeCount").text("${article.likecnt +1}");
    	
          }
        }
     });
  }
  
 
  
  $('.img2').bind('click', function(event){  //one은 한번만 실행된다.(확대 한번.)
      var $target = $(this); // $(event.target);
      
      $target.width($target.width()*2);  // 나누기는 축소
      $target.height($target.height()*2);
      
       abc++;
       
      if(abc>2){
          $('.img2').unbind(); 
      }
      
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
<script>
var acc2 = document.getElementsByClassName("accordion2");
var i;

for (i = 0; i < acc2.length; i++) {
    acc2[i].onclick = function(){
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