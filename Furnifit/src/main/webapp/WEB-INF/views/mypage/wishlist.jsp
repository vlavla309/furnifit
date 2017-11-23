<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${rSrcPath}css/productList.css" />
<script>
	$(function() {
		$(document).on("click", ".wishdeletebtn", function(event) {
			event.preventDefault();
			var wishdeletebtn = $(this);
			var productId = $(this).attr("href");
			$.ajax({
				url : '${contextPath}/wishlist/' + productId,
				type : 'DELETE',
				success : function(data) {
					alert("삭제성공")
					wishdeletebtn.parent().parent().parent().parent().remove()
				},
				error : function(data) {
					console.log(data)
				}
			});
		});
	});
</script>
<!-- blog -->
<div class="blog">
	<!-- container -->
	<div class="container">

		<div class="col-md-12">
			<div class="box">
				<h1>위시리스트</h1>
				<div class="information-grids agile-info" id="wrapper">
					<c:forEach items="${wishlist}" var="wish">
						<c:forEach items="${list}" var="product">
							<c:if test="${product.productId == wish.productId}">
								<div class="col-md-4 information-grid pdbotton"
									data-wow-delay=".5s">
									<div class="information-info">
										<c:forEach items="${product.imgs}" var="img">
											<div class="information-grid-img">
												<c:if
													test="${product.productId == img.productId  && img.orderNo==0}">
													<a href="${contextPath}/product/${product.productId}"><img
														src="${rSrcPath}/productimg/${img.path}/${img.name}" alt=""
														class="img-responsive" style="height: 300px; width: auto" /></a>
												</c:if>
											</div>
										</c:forEach>
	
										<div class="information-grid-info">
											<span class="badge badge-danger">Sale 40%</span>
											<h4>
												<a href="${contextPath}/product/${product.productId}">${product.name}</a>
											</h4>
											<hr>
											<p>
												<strong>&#8361; ${product.price} </strong> <br>
												${product.width} * ${product.length} * ${product.height} <small>(가로
													* 세로 * 높이 mm)</small>
											</p>
											<div class="box" style="text-align: center;">
												<c:forEach items="${brandlist}" var="brands">
													<c:if test="${product.brand == brands.name}">
														<a href="${brands.link}" class="btn btn-default">쇼핑몰로
															가기</a>
													</c:if>
												</c:forEach>
												<a href="${product.productId}"
													class="btn btn-default wishdeletebtn">삭제</a>
											</div>
										</div>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
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