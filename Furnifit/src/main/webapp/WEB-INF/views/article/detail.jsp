<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- 댓글 입력과 댓글 결과값 사이에 구분선이 있는데 구분선 양쪽 끝을 부드럽게 처리하는 코드 -->    
<style>
.dunggul { 
  border-top-left-radius: 0.7em; 
  border-top-right-radius: 0.7em; 
  border-bottom-right-radius: 0.7em; 
  border-bottom-left-radius: 0.7em; 
}
</style>

<!-- '좋아요'라는 버튼 아래에 댓글 쓰기라는 글자가 있는데 그 글자를 입체적으로 표현 -->
<style>
h3 {
  /* margin: 20px; */
  font-family: 'Paytone One', sans-serif;
  color: #202020;
  text-transform: uppercase;
  letter-spacing: -2px;
}
h3 span {
  display: block;
  margin: 11px 0 17px 0;
  font-size: 31px;
  line-height: 80px;
  color: #0c0e96;
  text-shadow: 0 6.36px 8.896px #c4b59d,0 -2px 1px #fff;
  letter-spacing: -4px;
}
</style>

<!-- 댓글 입력 폼들을 입체적으로 만드는 코드 -->
<style>
li {
  list-style:none;
}
#newEmail {
  box-shadow: 1px 1px 1px #EFEFF3;
}
#newContent {
  box-shadow: 1px 1px 1px #EFEFF3;
}
#replyAddBtn {
  box-shadow: 1px 1px 1px #EFEFF3;
}
#exampleEmail {
  box-shadow: 1px 1px 1px #EFEFF3;
}
#exampleComment {
  box-shadow: 1px 1px 1px #EFEFF3;
}
</style>


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
          <h3><span><strong>댓글&nbsp쓰기</strong></span></h3>
          <br>
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
      <hr class="dunggul" style="border: solid 4px #1523C3;">

<!-- 입력한 댓글들은 이곳에 출력된다. -->
<div id="replies">
</div>

<!-- 댓글들이 처음 출력되는 코드 -->
<script>
var articleId = ${article.articleId}
/* var reply_id = $("#newReply_id"); */
console.log(articleId);

(getList = function getAllList() {
$.getJSON("/one/reply/all/" + articleId, function(data) {
  var str = "";
  
  $(data).each(
      function() {
        str += "<li class='replyLi' data-rno=" + this.reply_id + ">"
        	/* + "<data-rno="+this.reply_id+"class='replyLi'>" */
        	+"<i class='fa fa-comments bg-blue'></i>"
        	+"<div class='timeline-time'>"
        	+"<span class='time'>"
        	+"<span class='fa fa-clock-o' style='margin-left:84%'>" + " " + "<span style='font-size:12px';>" + this.regdate + "</span>" + "</span>"
        	+"</span>"
        	+"<div class='timeline-header' style='font-size: 14px;'>" + this.email + "</div>"
            + "<br>" + "<div class='timeline-body'><strong>" + this.content + "</strong>" + "</div>" + "<br><br>"
            + "<div class='timeline-footer'>" + "<a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#modifyModal'>Modify</a>"
            + "</div>"
            + "</li>"
            + "<hr>";
      });
  $("#replies").html(str);
  });
});
getList();

/* 무한 스크롤링 코드 */
$(window).scroll(function() {
    console.log($(window).scrollTop());
    console.log($(window).height());
    console.log($(document).height());

    var scrollHeight = $(window).scrollTop() + $(window).height();
    var documentHeight = $(document).height();
    console.log(scrollHeight + ":" + documentHeight);

    // 스크롤이 끝까지 내려가면 window 객체의 scrollTop 속성과 height 속성을 합한 값이
    // document 높이와 같아진다.
    if (scrollHeight >= documentHeight - 100) { //브라우저 마다 미세한 차이 발생으로 -100

    	var reply_id = $(".replyLi:last").attr("data-rno");
    	var articleId = ${article.articleId};

        $.ajax({
            url: "/PlanWriter/reply/infiniteScrollDown",
            data: {
                reply_id : reply_id,
                articleId : articleId
            },
            dataType: "json",
            success: function(data) {
            	console.log(data);
                var output = "";
                $(data).each(
                	      function() {
                    output += "<li class='replyLi' data-rno=" + this.reply_id + ">"
                	/* + "<data-rno="+this.reply_id+"class='replyLi'>" */
                	+"<i class='fa fa-comments bg-blue'></i>"
                	+"<div class='timeline-time'>"
                	+"<span class='time'>"
                	+"<span class='fa fa-clock-o' style='margin-left:84%'>" + " " + "<span style='font-size:12px';>" + this.regdate + "</span>" + "</span>"
                	+"</span>"
                	+"<div class='timeline-header' style='font-size: 14px;'>" + this.email + "</div>"
                    /* + this.reply_id + ":" + this.content + ":" + this.email + ":" + this.regdate + "<br>" */
                    /* + "<button>MOD</button></li>";  */
                    /* + "<span class='timeline-body'></span>" */
                    + "<br>" + "<div class='timeline-body'><strong>" + this.content + "</strong>" + "</div>" + "<br><br>"
                    + "<div class='timeline-footer'>" + "<a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#modifyModal'>Modify</a>"
                    + "</div>"
                    + "</li>"
                    + "<hr>";
                });
                $("#replies:last").append(output);
            }
        });
    }
});

// 댓글을 등록하는 코드
$("#replyAddBtn").on("click", function() {
	var email = $("#newEmail").val();
	var content = $("#newContent").val();
	var articleId  = $("#newArticleId").val();

  $.ajax({
    type : 'post',
    url : '/PlanWriter/reply',
    headers : {
      "Content-Type" : "application/json",
      "X-HTTP-Method-Override" : "POST"},
    dataType : 'text',
    data : JSON.stringify({
    	email : email,
    	content : content,
    	articleId : articleId,
    	}),
    success : function(result) {
      console.log("result: " + result);
      if (result == 'SUCCESS') {
        alert("등록 되었습니다.");
        getList();
        $('#newContent').val("")
      }
    }
  });
});

// 댓글 수정, 삭제할 때 데이터를 모달에 제공한다.
$("#replies").on("click", ".replyLi", function(event){
	
	var reply = $(this);
	
	$("#content").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
	console.log(content)	
});

// 댓글을 삭제하는 코드
$("#replyDelBtn").on("click", function() {

  var reply_id = $(".modal-title").html();
  var content = $("#content").val();

  var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;  // 유효성 검사이다. 이메일을 이용하여 회원만 삭제하도록 한다.                                                    
																		//#newEmail이 비어 있는지 안 비어있는지로 확인할 수도 있지만 나중에 비회원도 댓글을
  if ( !RegexEmail.test($.trim($("#newEmail").val())) ) { 				// 달 수 있게 변경될 수도 있어서 위와 같이 했다.              
        alert("로그인 후 이용해주시기 바랍니다.");                      
  		return false;
  } else {
    $.ajax({
      type : 'delete',
      url : '/PlanWriter/reply/' + reply_id,
      headers : {
        "Content-Type" : "application/json",
        "X-HTTP-Method-Override" : "DELETE"
      },
      dataType : 'text',
      success : function(result) {
        console.log("result: " + result);
        if (result == 'SUCCESS') {
          alert("삭제 되었습니다.");
          $("#modDiv").hide("slow");
          getList();
        }
      }
    });
  }
});

// 댓글을 수정하는 코드
$("#replyModBtn").on("click",function(){
    
    var reply_id = $(".modal-title").html();
    var content = $("#content").val();
    
    var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;  // 유효성 검사이다. 이메일을 이용하여 회원만 수정하도록 한다.
  																		  //#newEmail이 비어 있는지 안 비어있는지로 확인할 수도 있지만 나중에 비회원도 댓글을	
    if ( !RegexEmail.test($.trim($("#newEmail").val())) ) { 			  // 달 수 있게 변경될 수도 있어서 위와 같이 했다.
		alert("로그인 후 이용해주시기 바랍니다.");
		return false;
	} else {
      $.ajax({
        type:'put',
        url:'/PlanWriter/reply/'+ reply_id,
        headers: { 
              "Content-Type": "application/json",
              "X-HTTP-Method-Override": "PUT" },
        data:JSON.stringify({content:content}), 
        dataType:'text', 
        success:function(result){
          console.log("result: " + result);
          if(result == 'SUCCESS'){
            alert("수정 되었습니다.");
             $("#modDiv").hide("slow");
            getList();
          }
      }});
	}
});   

</script>
</div>
</div>
</div>
</div>
</div>

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