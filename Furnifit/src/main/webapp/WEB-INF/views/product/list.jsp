<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(document).on("click", ".wishbtn", function(event) {
		event.preventDefault();
		var wishbtn = $(this);
		var productId = $(this).attr("href");
		$.ajax({
			url : '${contextPath}/wishlist/' + productId,
			type : 'post',
			success : function(data) {
				alert("추가성공")
				wishbtn.attr('class', 'wishdeletebtn')
				wishbtn.children().children().attr('class','fa fa-heart')
			}
		});
	});
	
	
	$(document).on("click", ".wishdeletebtn", function(event) {
		event.preventDefault();
		var wishdeletebtn = $(this);
		var productId = $(this).attr("href");
		$.ajax({
			url : '${contextPath}/wishlist/' + productId,
			type : 'DELETE',
			success : function(data) {
				alert("삭제성공")
				wishdeletebtn.attr('class', 'wishbtn')
				wishdeletebtn.children().children().attr('class','fa fa-heart-o')
			}
		});
	});
</script>

<style>
.information-grid-info {
	height: 250px;
}

button {
	height: 25px;
}

li {
	list-style: none;
	display: inline;
	margin-right: 2em;
}

table, th, td {
	border: 1px solid #FBF8EF;
}

table {
	width: 80%;
	padding: 0px;
}

th {
	background: #FBF8EF;
	text-align: center;
	width: 15%;
}

#search {
	float: right;
	margin-top: 9px;
	width: 250px;
}

.search {
	padding: 5px 0;
	width: 230px;
	height: 30px;
	position: relative;
	left: 10px;
	float: left;
	line-height: 22px;
}

.pdbotton {
	padding-bottom: 15px;
}
</style>

<script>
	$(function() {
		$("#color1").css("background", "#7bbe72");
		$("#color2").css("background", "#642EFE");

	});
</script>

<!-- blog -->
<div class="blog">
	<!-- container -->
	<div class="container">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>카테고리 내 검색</th>
					<td>
						<ul>
							<li>
								<div class="col-md-3">
									<input type="text" class="form-control input-sm" maxlength="64"
										placeholder="Search" />
								</div>
								<button type="submit" class="btn btn-sm">Search</button>
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">카테고리</th>
					<td>
						<ul>
							<li>침대</li>
							<li>의자</li>
							<li>책상</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">브랜드</th>
					<td>
						<ul>
							<li>일룸</li>
							<li>까사미아</li>
							<li>동서가구</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td colspan="2">
						<ul>
							<li>~6만원</li>
							<li>6만원~24만원</li>
							<li>24~</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">사이즈</th>
					<td colspan="2">
						<ul>
							<li><input type="text" placeholder="가로" style="width: 50px;">
							</li>
							<li>*</li>
							<li><input type="text" placeholder="세로" style="width: 50px;">
							</li>
							<li>*</li>
							<li><input type="text" placeholder="높이" style="width: 50px;"></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">색상</th>
					<td colspan="2">
						<ul>
							<li><button id="color1" class="btn"></button></li>
							<li><button id="color2" class="btn"></button></li>
							<li><button id="color3" class="btn"></button></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="information-grids agile-info" id="wrapper">
			<c:forEach items="${list}" var="product">
				<div class="col-md-4 information-grid pdbotton" data-wow-delay=".5s">
					<div class="information-info">
						<c:forEach items="${product.imgs}" var="img">
							<div class="information-grid-img">
								<c:if
									test="${product.productId == img.productId  && img.orderNo==0}">
									<a href="${product.productId}"><img
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
							<h3>
								<c:choose>
									<c:when test="${empty login || login eq null }">
										<a href="${product.productId}" class="wishbtn"> 
											<span class="label label-danger"> <i class="fa fa-heart-o" aria-hidden="true"></i></span>
										</a>
									</c:when>
									<c:otherwise>
										<!-- 로그인을 하면 -->
										<c:set var="doneLoop" value="false" />
										<c:set var="find" value="false" />
										<c:forEach items="${wishlist}" var="wish" varStatus="status">
											<c:if test="${not doneLoop}">
												<c:if
													test="${(wish.productId==product.productId)&&(wish.email==login.email)}">
													<a href="${product.productId}" class="wishdeletebtn">
														<span class="label label-danger"> 
															<i class="fa fa-heart" aria-hidden="true"></i>
														</span>
													</a>
													<c:set var="doneLoop" value="true" />
													<c:set var="find" value="true" />
												</c:if>
											</c:if>
										</c:forEach>
										<c:if test="${not find}">
											<a href="${product.productId}" class="wishbtn">
												<span class="label label-danger"> <i class="fa fa-heart-o" aria-hidden="true"></i></span>
											</a>
										</c:if>
									</c:otherwise>
								</c:choose>
							</h3>
						</div>
						</a>
					</div>
				</div>
			</c:forEach>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //container -->
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>