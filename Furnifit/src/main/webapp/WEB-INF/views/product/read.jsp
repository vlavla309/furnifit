<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${rSrcPath}css/normalize.css" />
<link rel="stylesheet" href="${rSrcPath}css/foundation.css" />
<link rel="stylesheet" href="${rSrcPath}css/demo.css" />
<script src="${rSrcPath}js/vendor/modernizr.js"></script>
<script src="${rSrcPath}js/vendor/jquery.js"></script>
<!-- xzoom plugin here -->
<script type="text/javascript" src="${rSrcPath}js/xzoom.min.js"></script>
<link rel="stylesheet" type="text/css" href="${rSrcPath}css/xzoom.css"
	media="all" />
<script src="${rSrcPath}js/setup.js"></script>


<!-- 이미지 슬라이드 -->

<link rel="stylesheet" type="text/css"
	href="${rSrcPath}css/elastislide.css" />
<link rel="stylesheet" type="text/css" href="${rSrcPath}css/custom.css" />
<script src="${rSrcPath}js/modernizr.custom.17475.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${rSrcPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${rSrcPath}js/jquerypp.custom.js"></script>
<script type="text/javascript" src="${rSrcPath}js/jquery.elastislide.js"></script>
		
<script src="${rSrcPath}js/productRead.js"></script>

<style>
.elastislide-wrapper nav span {
	position: absolute;
	background: #ddd url(${rSrcPath}/images/nav.png) no-repeat 4px 3px;
	width: 23px;
	height: 23px;
	border-radius: 50%;
	text-indent: -9000px;
	cursor: pointer;
	opacity: 0.8;
}
</style>

<!-- blog -->
<div class="blog w3layouts">
	<!-- container -->
	<div class="container">
		<div class="col-md-9 blog-top-left-grid">
			<div class="left-blog left-single">
				<div class="blog-left">
					<div class="single-left-left">
						<p>
							Posted By <a href="#">Admin</a> &nbsp;&nbsp; ${product.regdate}
							&nbsp;&nbsp; <a href="#"></a>
						</p>
					</div>
					<div class="row">
						<div class="Categories">
							<h3>${product.name}</h3>
						</div>
						<div class="large-12 column">
							<div class="xzoom-container">
								<c:forEach items="${product.imgs}" var="img">
									<c:if test="${img.orderNo==0}">
										<img class="xzoom" id="xzoom-default"
											src="${rSrcPath}/productimg/${img.path}/${img.name}"
											xoriginal="${rSrcPath}/productimg/${img.path}/${img.name}"
											title="${img.orderNo }" />
									</c:if>
								</c:forEach>
								<div class="xzoom-thumbs">
									<c:forEach items="${product.imgs}" var="img">
										<a href="${rSrcPath}/productimg/${img.path}/${img.name}">
											<img class="xzoom-gallery" width="80"
											src="${rSrcPath}/productimg/${img.path}/${img.name}"
											xpreview="${rSrcPath}/productimg/${img.path}/${img.name}"
											title="The description goes here">
										</a>
									</c:forEach>
								</div>

							</div>
						</div>
					</div>
					<div class="box">
						<div class="col-sm-12">
							<div class="form-group">
								<div class="box coupon">
									<div class="table-responsive">
										<table class="table">
											<tbody>
												<tr>
													<th>브랜드</th>
													<td>${product.brand}</td>
													<th>원산지</th>
													<td>한국</td>
												</tr>
												<tr>
													<th>색깔</th>
													<td>${product.color}</td>
													<th>규격 <a href="#" data-toggle="tooltip"
														title="규격은  W(너비) D(넓이) H(높이)로 구성되며, 원형일 경우 R(지름) H(높이)의 형태로 규격이 표시됩니다."><i
															class="fa fa-question-circle" aria-hidden="true"></i></a>
													</th>
													<td>${product.width}*${product.length}*
														${product.height}</td>
												</tr>
												<tr>
													<th>판매가</th>
													<td>${product.price}</td>
													<th>구매수량</th>
													<td><input type="number" style="width: 5em"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="blog-left-bottom">
						<P>${product.description}</P>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 blog-top-right-grid" style="">
			<div class="Categories" data-wow-delay=".5s">
				<h3>Categories</h3>
				<div class="column">
					<!-- Elastislide Carousel -->
					<ul id="carousel1" class="elastislide-list">
						<c:forEach items="${categorylist}" var="category">
							<c:forEach items="${category.imgs}" var="img">
								<li><a href="${contextPath}/product/${img.productId}"><img
										src="${rSrcPath}/productimg/${img.path}/${img.name}"
										alt="image04" style="width: 50%; height: 50%" /></a></li>
							</c:forEach>
						</c:forEach>
					</ul>
					<!-- End Elastislide Carousel -->
				</div>
			</div>
			
			<div class="Categories" data-wow-delay=".5s">
				<h3>이 가구를 사용한 배치도</h3>
				<div class="column">
					<!-- Elastislide Carousel -->
					<ul id="carousel" class="elastislide-list">
						<c:forEach items="${artlist}" var="article">
							<li><a href="${contextPath}/article/${article.articleId}"><img
									src="${rSrcPath }${article.planitemImg }" alt="image04"
									style="width: 100%" /></a></li>
						</c:forEach>
					</ul>
					<!-- End Elastislide Carousel -->
				</div>
			</div>
			
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //container -->
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>