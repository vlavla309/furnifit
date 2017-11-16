<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.button {
  width: 50px;
  height: 28px;
  background-color: #61210B;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;
}

.button2 {
  width: 90px;
  height: 28px;
  background-color: #61210B;
  color: white;
  border: 2;
  border-style: hidden;
  border-radius: 10px;
}


</style>
	
	
	<!-- blog -->
		<div class="blog">
			<!-- container -->
			<div class="container">
				<div class="blog-heading w3layouts">
					
					<strong><font style="font-size: 23pt; color: #8A4B08">공유배치도 게시판</font></strong>
					<p>회원들이 작성한 배치도를 공유할수 있는 게시판입니다.</p>
                      <div class="form-inline" ><br>
                <select style="margin-left: 600px; width: 80px; height: 27px; border-radius: 10px" >
                  <option value="">정렬</option>
                  <option value="">최신순</option>
                  <option value="">추천순</option>
                  <option value="">조회순</option>
                </select>
              </div>
				</div>
      
            
            <div class="information-grid-info">
              <span class="badge badge-danger">Sale 40%</span>
              <h4><a href="${contextPath}/product/${product.productId}">${product.name}</a></h4>
              <hr>
              <p>
                <strong>&#8361; ${product.price} </strong> <br>
                ${product.width} * ${product.length} * ${product.height} <small>(가로
                  * 세로 * 높이 mm)</small>
              </p>
              <h3>
                <span class="label label-danger"><i class="fa fa-heart"
                  aria-hidden="true"></i></span>
              </h3>
              <!-- <span class="label label-danger"><i class="fa fa-heart-o" aria-hidden="true"></i></span> -->
            </div>
  
        
          <!-- 검색 -->
          <br>
          <br>
          <br>
          <br>
       <form name="search" class="form-inline" role="form" method="get">
    <div style="text-align: center;">
      <select class="form-control">
        <option value="">작성자</option>
        <option value="">제목</option>
        <option value="">평수</option>
      </select> <input type="text" class="form-control" 
        required>
      <button type="submit" class="button">검색</button>
      <input type="button" class="button2" 
        value="전체보기">

    </div>


  </form>
        
			</div>
			<!-- //container -->
		</div>
	<!-- //blog -->
<%@ include file="../include/footer.jsp" %>