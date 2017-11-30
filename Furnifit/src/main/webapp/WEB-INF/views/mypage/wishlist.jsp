<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${rSrcPath}css/productList.css" />
<script src="${rSrcPath}js/wishlist.js"></script>
<!-- blog -->
<div class="blog">
	<!-- container -->
	<div class="container">

		<div class="col-md-12">
			<div class="box">
				<h1>위시리스트</h1>
				<div class="information-grids agile-info" id="wrapper">
					<c:forEach items="${wishlist}" var="wish">
						<div class="col-md-4 information-grid pdbotton"
							data-wow-delay=".5s">
							<div class="information-info">
								<c:forEach items="${wish.imgs}" var="img">
									<div class="information-grid-img">
										<c:if test="${img.orderNo==0}">
											<a href="${contextPath}/product/${wish.productId}"><img
												src="${rSrcPath}/productimg/${img.path}/${img.name}" alt=""
												class="img-responsive" style="height: 300px; width: auto" /></a>
										</c:if>
									</div>
								</c:forEach>

								<div class="information-grid-info">
									<span class="badge badge-danger">Sale 40%</span>
									<h4>
										<a href="${contextPath}/product/${wish.productId}">${wish.name}</a>
									</h4>
									<hr>
									<p>
										<strong>&#8361; ${wish.price} </strong> <br>
										${wish.width} * ${wish.length} * ${wish.height} <small>(가로
											* 세로 * 높이 mm)</small>
									</p>
									<div class="box" style="text-align: center;">
										<a href="${wish.link}" class="btn btn-default"> 쇼핑몰로 가기</a> <a
											href="${wish.productId}"
											class="btn btn-default wishdeletebtn">삭제</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="clearfix"></div>
				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pb.isShowPrevious()}">
								<li><a href="${pb.getQueryString(pb.currentStartPage -1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pb.currentStartPage }"
								end="${pb.currentEndPage }" var="pageList">
								<li
									<c:out value="${pb.params.page == pageList?'class =active':''}"/>>
									<a href="${pb.getQueryString(pageList)}">${pageList}</a>
								</li>
							</c:forEach>

							<c:if test="${pb.isShowNext()}">
								<li><a href="${pb.getQueryString(pb.currentEndPage +1)}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
			</div>

		</div>
		<!-- //container -->
	</div>
</div>
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>