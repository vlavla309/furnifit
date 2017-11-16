<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<style>
.align {
  text-align: center;
  border: 1px dashed;
  border-color: #F5D0A9;
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

#topbtn{
border-style:hidden; 
border-radius:10px; 
background-color: #B40404;
color: white;  
width: 60px; 
height: 29px; 
font-size: 9pt
}


</style>
<body>
	
	
	<!-- blog -->
		<div class="blog"  style="background-color: white" >
			<!-- container -->
			<div class="container" style="width: 900px; border: 2px solid; border-color: #F6E3CE; padding: 40px"  >
        
        <div class="box-footer" style="float: right">
        
         <button type="submit" id="topbtn" >MODIFY</button>
            <button type="submit"  id="topbtn">DELETE</button>
            <button type="submit"  id="topbtn" >LIST</button>

 
  </div>
  <br>

 
  
				<div class="blog-heading w3layouts" style="margin-top: 30px" >
				
				
				<!-- 여기서 내용을 채운다 -->
      
   
				
                </div>
                <div class="gallery-grids" >
                
                
               
               <table id="shareForm">
               <tr >
               <div class="alert alert-warning" role="alert">
				<strong id="shareInfo">배치도명 :</strong>&nbsp;&nbsp;<input type="text" style="width:23%;  height: 12%; background-color: transparent; font-weight:bold; border: none; font-size:11pt; color: #F7BE81;">
						</div>
               </tr>
               
               <tr>
              <div class="alert alert-warning" role="alert">
        <strong id="shareInfo">평 수 :</strong>&nbsp;&nbsp;<input id="m" type="text">x <input id="m" type="text" >x <input  id="m" type="text">
            </div>
               </tr>
               <tr>
               <div class="alert alert-warning" role="alert">
        <strong id="shareInfo">작성자 :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:23%;  height: 12%; background-color: transparent; font-weight:bold; border: none; font-size:11pt; color: #F7BE81;">
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
                <tr>
                  <th>#</th>
                  <th>상품 번호</th>
                  <th>상품명</th>
                  <th>사이트바로가기</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td colspan="2">Larry the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
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
  	<div class="row" style="margin: 0 auto">
                <div style="border: 0px; width: 100%; height: 200%; border-color: #F6E3CE; margin-left: 10%">
                  <img src="images/home.PNG" width="40%"  alt="" />
                  <img src="images/room.PNG" width="40%"  alt="" />
                </div>
              	
					</div>  
          <br>
          <br>
          <br>
          <br>

          
          <!-- 글쓸곳 -->
              <div class="row" style="text-align: center;">
                <textarea name="contents" rows="9" cols="50"
            style="border: 0px solid; resize: none; text-align: center"
            >  
                        하하
			호호
			히히
			헤헤
			헤헷
			ㅋㅋㅋ
			ㅎㅎㅎ
            </textarea>
                
          </div>  
          <br>
          <br>
          
          <button style="border-style:hidden; margin-left:42%; border-radius:5px; font-weight:bold; background-color: #DF0101;
  color: white;  width: 17%; height:40px; font-size: 13pt">좋아요♥&nbsp;<font style="font-size: 11pt">[0]</font></button>
            

          
          
          
          
          <!-- 댓글 -->
     
          <br>
          <br>
          <br>
          <form>
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
    </form>
    

 

<br/>&nbsp;<br/>
<form name="myForm" method="post" action="">
<table width="600" border="0" cellpadding="0" cellspacing="0"  align="center">
 
</table>
</form>

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