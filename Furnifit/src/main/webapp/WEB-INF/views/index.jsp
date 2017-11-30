<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/header.jsp" %>
<%@ page session="true" %>
<link href="${rSrcPath}css/testCss.css" rel="stylesheet"> 
<link href="${rSrcPath}css/index.css" rel="stylesheet"> 

<!-- bxSlider CSS file -->
<link href="${rSrcPath }css/jquery.bxslider.css" rel="stylesheet" />

<style>
.indexLogo{
vertical-align: middle;
margin-left: 210px;
width: 65%;
padding-top: 10px;
}


.indexPrd{
background-color: white;
}

.indexPrdNew{

font-weight: bold;
padding-top: 40px;
}

.prdList{
border: 1px solid #D8D8D8;
}

.indexArtA{
display: block;
width: fit-content;
margin: auto;
}

.indexShadow{
box-shadow: 0px 1px 10px 0px #d0d0d0;
}

.indexArtA img{
    background-color: white;
    width: 100%;
    height: 100%;
    max-width: 320px;
    max-height: 350px;
}


</style>
<body >
  <!-- banner -->
  <div class="banner">
      <div class="slider">
        <div class="border"></div>
        <script src="${rSrcPath }js/responsiveslides.min.js"></script>
        <script>
            // You can also use "$(window).load(function() {"
            $(function () {
            // Slideshow 4
              $("#slider3").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                  $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                  $('.events').append("<li>after event fired.</li>");
                }
               });        
            });
        </script>
        <div  id="top" class="callbacks_container-wrap">
          <ul class="rslides" id="slider3">
            <li>
              <div class="slider-info">
                <h3 class="wow fadeInRight animated" data-wow-delay=".5s">
Design Virtual Furniture Layout</h3>
                <p class="wow fadeInLeft animated" data-wow-delay=".5s">당신이 원하는 방을 디자인할수 있습니다.</p>
                <div class="more-button wow fadeInRight animated" data-wow-delay=".5s">
                  <a href="single.html">About out services</a>
                </div>
              </div>
            </li>
          
          </ul>
        </div>
        
      </div>
  </div>
 
  
  <!-- //banner -->
  

  <!-- 상품목록리스트 -->
  <div class="information w3lagile indexPrd" >
    <h2 class="indexPrdNew">NEW ARRIVAL</h2>
     <br> 
      <ul class="bxslider" style="">
        <c:forEach items="${prdList}" var="product">
          <li style="border: 1px solid; padding: 20px; border-color: #D8D8D8">
            <c:forEach items="${product.imgs}" var="img">
               <c:if test="${img.orderNo == 0 }">
                  <div class='information-grid-img'>
                    <a href="${contextPath}/product/${product.productId}">
                      <img class="indexPrdImg" src="${rSrcPath}/productimg/${img.path}/${img.name}" alt=""/>
                    </a>
                  </div>
                </c:if> 
              </c:forEach>   
             <p style="font-weight: bold; font-size: 18pt; color: #8A0808">${product.name }</p>
             <hr style="border-color: black">
             <p style="font-weight: bold">&#8361; ${product.price }</p>   
             <p>${product.brand }</p>              
          </li>       
        </c:forEach>   
      </ul>
      <img src="${rSrcPath }images/logo3.PNG" class="indexLogo">
      <div class="clearfix"> </div>  
  </div>
  <!-- 상품목록리스트(여기까지) -->

  
  <!-- bxSlider Javascript file -->
  <script src="${rSrcPath }js/jquery-3.1.1.min.js"></script>
<script src="${rSrcPath }js/jquery.bxslider.js"></script>
<script>
  $(document).ready(function(){
    $('.bxslider').bxSlider({
      mode: 'horizontal',
      moveSlides: 1,
      slideMargin: 40,
      infiniteLoop: true,
      slideWidth: 660,
      minSlides: 4,
      maxSlides: 4,
      speed: 800,
    });
  });
</script>

  
  
  <!-- 공유게시판 리스트 -->
	<div class="information w3lagile" style="background-color: white" >
		<div class="container">
		  <div class="information-grids agile-info">
      <!-- 여기서부터 FOR문 -->
              <c:forEach items="${artList }" var="article">
				<div class="col-md-4 information-grid wow fadeInLeft animated" data-wow-delay=".5s" style="padding: 50px">
					<div class="information-info indexShadow"  style="background-color: white">
						<div class="information-grid-img">
                           <a class="indexArtA" href="${contextPath}/article/${article.articleId}">                       
							<img src="${rSrcPath }/svg/plan/${article.planitemImg}"  alt="" /></a> 
						</div>                      
						<div class="information-grid-info">
							<font style="font-size: 15pt">${article.title }</font>
							<p>${article.content }</p>
						</div>
					</div>
				</div>
              </c:forEach>
        <!-- 여기까지 FOR문 -->	
			  <div class="clearfix"> </div>
			</div>
		</div>
	</div>
  <!-- 공유게시판 리스트 여기까지 -->
  
  
<!-- footer -->
  <div class="footer agileits">
    <div class="container">
      <div class="footer-grids w3l-agile">
        <div class="col-md-3 footer-nav agile-w3layouts wow fadeInLeft animated" data-wow-delay=".5s">
          <h4>Navigation</h4>
          <ul>
            <li><a href="about.html">About</a></li>
            <li><a href="gallery1.html">Gallery</a></li>
            <li><a href="blog.html">Blog</a></li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-5 footer-nav agile-w3layouts wow fadeInUp animated" data-wow-delay=".5s">
          <h4>Newsletter</h4>
          <p>Nunc non feugiat quam, vitae placerat ipsum. Cras at felis congue, volutpat neque eget</p>
          <form action="#" method="post">
            <input type="email" id="mc4wp_email" name="email" placeholder="Enter your email here" required="">
            <input type="submit" value="Subscribe">
          </form>
        </div>
        <div class="col-md-4 footer-nav agile-w3layouts wow fadeInRight animated" data-wow-delay=".5s">
          <h4>Latest News</h4>
          <div class="news-grids">
            <div class="news-grid">
              <h6>09/01/2016 : <a href="single.html">Cras at felis congue</a></h6>
              <h6>13/07/2016 : <a href="single.html">Volutpat neque eget</a></h6>
              <h6>13/02/2016 : <a href="single.html">Agittis tellus ut dictum</a></h6>
              <h6>28/11/2016 : <a href="single.html">Habitant morbi et netus</a></h6>
              <h6>19/01/2016 : <a href="single.html">pellentesque habitant morbi</a></h6>
              <h6>23/02/2016 : <a href="single.html">Maecenas volutpat lacus</a></h6>
            </div>
          </div>
        </div>
        
      </div>
      <div class="copyright w3l wow fadeInUp animated" data-wow-delay=".5s">
        <p>© 2017 Triplex . All Rights Reserved . Design by <a href="http://w3layouts.com/">W3layouts</a></p>
      </div>
    </div>
  </div>
  <!-- //footer -->
</body> 
</html>