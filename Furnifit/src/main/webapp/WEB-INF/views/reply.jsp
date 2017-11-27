<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="include/header.jsp" %>
<style>
.align {
  text-align: center;
  border: 1px dashed;
  border-color: #F5D0A9;
}
.align2 {
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
  
    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
     <img id="popup_img">
    </div>
	
	
	<!-- blog -->
		<div class="blog"  style="background-color: white" >
			<!-- container -->
			<div class="container" style="width: 900px; border: 3px solid; border-color: #F6E3CE; padding: 40px"  >
        
        <div class="box-footer" style="float: right">
        
         <button type="submit" class="topbtn" id="modifyBtn" >MODIFY</button>
            <button type="submit"  class="topbtn" id="deleteBtn">DELETE</button>
            <button type="submit"  class="topbtn" id="listBtn">LIST</button>

 
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
        <strong id="shareInfo">평 수 :</strong>&nbsp;&nbsp;<input readonly="readonly"  value="${planItem.length}" id="m" type="text">x <input readonly="readonly" value="${planItem.width}"  id="m" type="text" >x <input readonly="readonly"  value="${planItem.height}" id="m" type="text">
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


<div class="bs-docs-example wow fadeInUp animated panel" data-wow-delay=".5s" style="background-color: #F7F2E0">
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

<!-- 파일첨부할곳 -->


          <div class="box box-primary"  >
        <c:forEach items="${article.images}" var="articleImg">
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
              <br>
                <textarea name="content" rows="6" cols="62" readonly="readonly"
            class="artContent" 
            >${article.content }</textarea>
                
          </div>  
          <br>
          <br>
          
          <button style="border-style:hidden; margin-left:42%; border-radius:5px; font-weight:bold; background-color: #DF0101;
  color: white;  width: 17%; height:40px; font-size: 13pt">좋아요♥&nbsp;<font style="font-size: 11pt">[0]</font></button>
        
<!--  
<script>
$(document).ready(function(){
  
  var formObj = $("form[role='form']");
  
  console.log(formObj);
  
  $("#modifyBtn").on("click", function(){
    formObj.attr("action", "/article/modifyPage");
    formObj.attr("method", "get");    
    formObj.submit();
  });
  
/*  $("#removeBtn").on("click", function(){
    formObj.attr("action", "/sboard/removePage");
    formObj.submit();
  }); */

  
  $("#deleteBtn").on("click", function(){
    
   /* var replyCnt =  $("#replycntSmall").html();
    
    if(replyCnt > 0 ){
      alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
      return;
    } */
    
    var arr = [];
    $(".uploadedList li").each(function(index){
       arr.push($(this).attr("data-src"));
    });
    
    if(arr.length > 0){
      $.post("/deleteAllFiles",{files:arr}, function(){
        
      });
    }
    
    formObj.attr("action", "/article/deletePage");
    formObj.submit();
  }); 
  
  $("#listBtn ").on("click", function(){
    formObj.attr("method", "get");
    formObj.attr("action", "/article/list");
    formObj.submit();
  });
  
    
  
}); -->
</script>
<%-- 
<table class="table table-bordered">
  <tr class="scrollLocation">
    <th style="width: 10px">replyId</th>
    <th>email</th>
    <th>content</th>
    <th>regdate</th>
    <!-- <th style="width: 40px">VIEWCNT</th> -->
  </tr>
  <c:forEach items="${entity }" var="Replies">
    <tr class="listToChange">
      <td class="scrolling" data-bno="${Replies.reply_id }">${Replies.reply_id }</td>
      <td><a href='/board/read?bno=${Replies.bno }'>${Replies.title }</a></td>
      <td>"${Replies.email }"</td>
      <td>${Replies.content }</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${Replies.regdate }" /></td>
      <td><span class="badge bg-red">${Replies.viewcnt }</span></td>
    </tr>
  </c:forEach>
</table>
 --%>
<!-- 
<script>
	$.ajax({
		type:'delete',
		url:'/reply/' + reply_id,
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "DELETE" },
		datatype:'text',
		success:function(result) {
			console.log("result: " + result);
			if(result == 'SUCCESS') {
				alert("삭제 되었습니다.");
				getPage("/reply/"+article_id+"/"+replyPage);
			}
	}});
</script>

 -->
<ul id="replies">
</ul>


<script>
function getAllList() {
	
	var article_id = 2;
	$.getJSON("/one/reply/all/" + article_id, function(data) {
		
		var str = "";
		console.log(data.length);
		
		$(data).each(
				function() {
					str += "<li data-reply_id='"+this.reply_id+"' class='replyLi'>"
						+ this.reply_id + ":" + this.content
						+ "</li>";
				});
		
		$("#replies").html(str);
	});
}
</script>
<div class="row">
    <div class="col-md-12">

      <div class="box box-success">
        <div class="box-header">
          <h3 class="box-title">ADD NEW REPLY</h3>
        </div>
        <div class="box-body">
          <label for="exampleInputEmail1">Writer</label> 
          <input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter"> 
          <label for="exampleInputEmail1">Reply Text</label> 
          <input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">

        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
        </div>
      </div>
<script>
$("#replyAddBtn").on("click",function(){
	 
	 var replyerObj = $("#newReplyWriter");
	 var replytextObj = $("#newReplyText");
	 var replyer = replyerObj.val();
	 var replytext = replytextObj.val();
	
	  
	  $.ajax({
			type:'post',
			url:'/reply/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({article_id:article_id, replyer:replyer, replytext:replytext}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/reply/"+article_id+"/");
					replyerObj.val("");
					replytextObj.val("");
				}
		}});
});

</script>







 <%--          
          <!-- 댓글 -->
    
          <br>
          <br>
          <br>
          <form id="replyForm" action="${contextPath}/reply" method="post">
          <table style="width: 30px; margin: 0 auto;  text-align: center " >
          <tr>
          
          <textarea name="contents" rows="2" cols="100" style="resize: none; border-style: solid; font-size: 11pt">
			</textarea></td>
            &nbsp;&nbsp;&nbsp;&nbsp;
        <td><input class="replybtn" type="submit" value="등록"
          style="width: 50px; height: 33px; font-size: 11pt"></td>

      </tr>
     
    </table>
    </form> 
    
<br/>&nbsp;<br/> --%>
<!-- 
<form name="myForm" method="post" action="">
<table width="600" border="0" cellpadding="0" cellspacing="0"  align="center">
 
</table>
</form>
 -->
<br/>
<%-- 
<c:forEach items="${replies}" var="reply">
<table width="780" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr><td width="600" colspan="2" height="3" bgcolor="#B40404"></td></tr>
    
    <tr height="25">
            <td width="50%" align="left" style="color:#B40404;  font-weight: bold">&nbsp;&nbsp;${replies.email }</td>
            <td width="50%" align="right" style="color:#B40404;  font-weight: bold" >${replies.regdate}&nbsp;<input id="deletebtn" type="button" value="삭제"></td>
    </tr>
    </tr>
    <tr><td width="600" colspan="2" height="1" bgcolor="#B40404"></td></tr>
        <tr height="60">
            <td align="left" style="padding: 5px 5px 5px 5px; color:#585858; font-weight: bold" valign="top">${replies.content}</td>
        </tr>
    <tr><td width="600" colspan="2" height="3" bgcolor="#B40404"></td></tr>

</table>  
</c:forEach> 





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
   --%>

       
         
      
	<!-- //blog -->







<%@ include file="include/footer.jsp" %>

</body>