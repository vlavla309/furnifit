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
<!-- hammer plugin here -->
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<link type="text/css" rel="stylesheet" media="all"
	href="${rSrcPath}fancybox/source/jquery.fancybox.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="${rSrcPath}magnific-popup/css/magnific-popup.css" />
<script type="text/javascript"
	src="${rSrcPath}fancybox/source/jquery.fancybox.js"></script>
<script type="text/javascript"
	src="${rSrcPath}magnific-popup/js/magnific-popup.js"></script>
<script src="${rSrcPath}js/foundation.min.js"></script>
<script src="${rSrcPath}js/setup.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
<style>
.coupon {
	border: 2px dotted #F6CECE;
	border-radius: 10px;
}

th{
	color: #9E1616;
}

</style>
<!-- blog -->
<div class="blog w3layouts">
	<!-- container -->
	<div class="container">
		<div class="col-md-8 blog-top-left-grid">
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
								<c:forEach items="${imglist}" var="img">
									<c:if test="${img.orderNo==0}">
										<img class="xzoom" id="xzoom-default" 
											src="${rSrcPath}/productimg/${img.path}/${img.name}"
											xoriginal="${rSrcPath}/productimg/${img.path}/${img.name}" title = "${img.orderNo }"/>
									</c:if>	
								</c:forEach>
								<div class="xzoom-thumbs">
									<c:forEach items="${imglist}" var="img">
										<a href="${rSrcPath}/productimg/${img.path}/${img.name}">
											<img class="xzoom-gallery" width="80" src="${rSrcPath}/productimg/${img.path}/${img.name}" xpreview="${rSrcPath}/productimg/${img.path}/${img.name}"
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
														title="규격은  W(너비) D(넓이) H(높이)로 구성되며, 원형일 경우 R(지름) H(높이)의 형태로 규격이 표시됩니다."><i class="fa fa-question-circle"
															aria-hidden="true"></i></a>
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
		<div class="col-md-4 blog-top-right-grid">
			<div class="Categories" data-wow-delay=".5s">
				<h3>Categories</h3>
				<ul>
					<li><a href="#">Phasellus sem leo, interdum quis risus</a></li>
					<li><a href="#">Nullam egestas nisi id malesuada aliquet </a></li>
					<li><a href="#"> Donec condimentum purus urna venenatis</a></li>
					<li><a href="#">Ut congue, nisl id tincidunt lobor mollis</a></li>
					<li><a href="#">Cum sociis natoque penatibus et magnis</a></li>
					<li><a href="#">Suspendisse nec magna id ex pretium</a></li>
				</ul>
			</div>
			<div class="Categories" data-wow-delay=".5s">
				<h3>Archive</h3>
				<ul class="marked-list offs1">
					<li><a href="#">May 2016 (7)</a></li>
					<li><a href="#">April 2016 (11)</a></li>
					<li><a href="#">March 2016 (12)</a></li>
					<li><a href="#">February 2016 (14)</a></li>
					<li><a href="#">January 2016 (10)</a></li>
					<li><a href="#">December 2016 (12)</a></li>
					<li><a href="#">November 2016 (8)</a></li>
					<li><a href="#">October 2016 (7)</a></li>
					<li><a href="#">September 2016 (8)</a></li>
					<li><a href="#">August 2016 (6)</a></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //container -->
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>