<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${rSrcPath}css/productList.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="" id="entry-template" type="text/x-handlebars-template">
			{{#list}}
				<div class="col-md-4 information-grid pdbotton" data-wow-delay=".5s">
					<div class="information-info">
						{{#each imgs}}
							<div class="information-grid-img">
								{{#ifimg ../this.productId this.productId this.orderNo}}
										<a href="${contextPath}/product/{{../this.productId}}"><img
										src="${rSrcPath}/productimg/{{this.path}}/{{this.name}}" alt=""
										class="img-responsive" style="height: 300px; width: auto" /></a>
								{{/ifimg}}
							</div>
						{{/each}}

						<div class="information-grid-info">
							<span class="badge badge-danger">Sale 40%</span>
							<h4>
								<a href="${contextPath}/product/{{productId}}">{{name}}</a>
							</h4>
							<hr>
							<p>
								<strong>&#8361; {{price}} </strong> <br>
								{{width}} * {{length}} * {{height}} <small>(가로
									* 세로 * 높이 mm)</small>
							</p>  
							<h3>
							{{#iflogin "${login.email}"}}
    							<a href="{{productId}}" class="wishbtn"> 
									<span class="label label-danger"> 
										<i class="fa fa-heart-o" aria-hidden="true"></i>
									</span>
								</a>
							{{else}}
								{{init}}
								{{#each ../../wishlist}}
									{{#ifDoneLoop}}
										{{#ifwishlist ../../productId productId email}}
											<a href="{{../productId}}" class="wishdeletebtn"> 
												<span class="label label-danger"> <i class="fa fa-heart" aria-hidden="true"></i></span>
											</a>
										{{/ifwishlist}}
									{{/ifDoneLoop}}
								{{/each}}
								{{#ifFind}}
									<a href="{{../productId}}" class="wishbtn"> 
										<span class="label label-danger"> <i class="fa fa-heart-o" aria-hidden="true"></i></span>
									</a>
								{{/ifFind}}
							{{/iflogin}}
							</h3>
						</div>
						</a>
					</div>
				</div>
			 {{/list}}
</script>
<script src="${rSrcPath}js/productList.js"></script>

<!-- blog -->
<div class="blog">
	<!-- container -->
	<div class="container">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td colspan="2">
						<ul>
							<li>
								<div class="col-md-2">
									<select class="form-control input-sm target">
										<option value="total">정렬</option>
										<option value="height">높은가격순</option>
										<option value="low">낮은가격순</option>
										<option value="new">신상품순</option>
									</select>
								</div>
								<div class="col-md-3">
									<input type="text" class="form-control input-sm  maxlength="64"
										placeholder="카테고리 내 검색" id="keyword"/>
								</div>
								<button type="submit" class="btn btn-sm">Search</button>
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">카테고리</th>
					<td>
						<ul id = "category">
							<li><a class="categorya">전체</a></li>
							<c:forEach items="${categorylist}" var="category">
								<li><a class="categorya">${category.name}</a></li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">브랜드</th>
					<td>
						<ul id="brand">
							<c:forEach items="${brandlist}" var="brand">
								<li><a class="branda">${brand.name}</a></li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td colspan="2">
						<ul>
							<li><input type="number" id="minprice" class="price" value="0" placeholder="min price"></li>
							<li>~</li> 
							<li><input type="number"  id="maxprice" class="price" value="10000" placeholder="max price"></li>
							<li><button type="submit" class="btn btn-sm pricebtna">적용하기</button></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">사이즈</th>
					<td colspan="2">
						<ul>
							<li><input type="number" placeholder="가로" id = "w" class="size" style="width: 50px;">
							</li>
							<li>*</li>
							<li><input type="number" placeholder="세로" id="l" class="size" style="width: 50px;">
							</li>
							<li>*</li>
							<li><input type="number" placeholder="높이" id = "d" class="size" style="width: 50px;"></li>
							<li><button type="submit" class="btn btn-sm sizebtn">적용하기</button></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">색상</th>
					<td colspan="2">
						<ul id="colorul">
							<c:forEach items="${colorlist}" var="color">
								<li><a class="btn btn-default colorBtn" id ="${color.name}" style="background:${color.rgb}" aria-hidden="true" aria-label="Settings"><i class="fa fa-check  fa-lg colorUncheck"  style="color:white" aria-hidden="true"></i></a></li>
								<c:if test="${color.name == white}">
									<li><a class="btn btn-default colorBtn" id ="${color.name}" style="background:${color.rgb}" aria-hidden="true" aria-label="Settings"><i class="fa fa-check  fa-lg colorUncheck"  style="color:black" aria-hidden="true"></i></a></li>
								</c:if>
							</c:forEach>
							
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<form name ="filter" id = "filter">
			<input type="hidden" value="" name = "sort" >
			<input type="hidden" value="" name = "keyword" >
			<input type="hidden" name = "category" value="" id="cate">
			<input type="hidden" name = "minPrice" value="0" id="min">
			<input type="hidden" name = "maxPrice" value="0" id="max">
			<input type="hidden" name="maxWidth" value="0">
			<input type="hidden" name="maxLength" value="0">
			<input type="hidden" name="maxHeight" value="0">
			<input type="hidden" name = "pageSize" value = "6">
			<input type = "hidden" name = "totalsize" value="${totalsize}">
		</form>
		<div class="information-grids agile-info" id="wrapper">
			<c:forEach items="${list}" var="product">
				<div class="col-md-4 information-grid pdbotton" data-wow-delay=".5s">
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
							<h3>
								<c:choose>
									<c:when test="${empty login || login eq null }">
										<a href="${product.productId}" class="wishbtn"> <span
											class="label label-danger"> <i class="fa fa-heart-o"
												aria-hidden="true"></i></span>
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
													<a href="${product.productId}" class="wishdeletebtn"> <span
														class="label label-danger"> <i class="fa fa-heart"
															aria-hidden="true"></i>
													</span>
													</a>
													<c:set var="doneLoop" value="true" />
													<c:set var="find" value="true" />
												</c:if>
											</c:if>
										</c:forEach>
										<c:if test="${not find}">
											<a href="${product.productId}" class="wishbtn"> <span
												class="label label-danger"> <i class="fa fa-heart-o"
													aria-hidden="true"></i></span>
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
	<div class = "row">
		<div class="col-md-12">
			<div class="text-center">
				<a class="btn btn-default btn-lg" id = "add"><i class="fa fa-angle-down  fa-2x" aria-hidden="true"></i> 더보기</a>
			</div>
		</div>
	</div>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
</div>
<!-- //blog -->

<%@ include file="../include/footer.jsp"%>