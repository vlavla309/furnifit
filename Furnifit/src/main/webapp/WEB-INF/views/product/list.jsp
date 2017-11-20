<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
 
.information-grid-info {
	height: 250px;
}

.colorBtn {
	border: 1px solid #dadada;
	height: 30px;
	width: 30px;
}


.colordelete {
	border: 1px solid #dadada;
	height: 30px;
	width: 30px;
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

.branddelete, .branda, .categorya{
padding:0.5em;
border-radius: 0.5em;
}

.paramActive{
background:	#ac3939;
color:white!important;
}

.colorUncheck{
display:none;
}
</style>

<script>
	$(function() {

		/* color 버튼을 color 테이블에서 불러들임 */
		<c:forEach items="${colorlist}" var="color">
			str = "<li><a class=\"btn btn-default colorBtn\" id =\"${color.name}\" style=\"background:${color.rgb}\" aria-hidden=\"true\" aria-label=\"Settings\"><i class=\"fa fa-check  fa-lg colorUncheck\"  style=\"color:white\" aria-hidden=\"true\"></i></a></li>"
			if("${color.name}"=="white"){
				str = "<li><a class=\"btn btn-default colorBtn\" id =\"${color.name}\" style=\"background:${color.rgb}\" aria-hidden=\"true\" aria-label=\"Settings\"><i class=\"fa fa-check  fa-lg colorUncheck\"  style=\"color:black\" aria-hidden=\"true\"></i></a></li>"
			}
			$('#colorul').append(str);
		</c:forEach>

		/* 브랜드 테이블에있는 데이터 불러들임 */
		<c:forEach items="${brandlist}" var="brand">
			$('#brand').append("<li><a class=\"branda\">${brand.name}</a></li>");
		</c:forEach>

		/* 카테고리 테이블 데이터 불러들임 */
		<c:forEach items="${categorylist}" var="category">
			$('#category').append("<li><a class=\"categorya\">${category.name}</a></li>");
		</c:forEach>
		
		/* color 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에!, 클래스 속성을 btnd로 변경한 후에 icon delete를 추가로 해준다. */
		$(document).on("click", ".colorBtn", function(event) {
			event.preventDefault();
			$(this).children().first().toggleClass("colorUncheck");
			$(this).attr('class','btn btn-default colordelete')
			$('#filter').append("<input type =\"text\" name =\"color\" value=\""+$(this).attr('id')+"\"/>")
			
		});
		
		/* 색상버튼 체크를 해제하고, 아래에 form에서  input 제거!, ajax는 추후 */
		$(document).on("click", ".colordelete", function(event) {
			event.preventDefault();
			$(this).attr('class','btn btn-default colorBtn')
			$(this).children().first().toggleClass("colorUncheck");
			alert($(this).attr('id'))
			$('#filter :input[value="'+$(this).attr('id')+'"]').remove();
		});

		/* brand 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에! */
		$(document).on(	"click", ".branda",function(event) {
			event.preventDefault();
			$(this).attr('class','branddelete')
			$(this).toggleClass("paramActive");
		});
		
		$(document).on(	"click", ".branddelete",function(event) {
			event.preventDefault();
			$(this).attr('class','branda')
		});
		
		/* category 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에! */
		$(document).on(	"click", ".categorya",function(event) {
			event.preventDefault();
			$(".categorya").removeClass("paramActive");
			$(this).toggleClass("paramActive");
		});
		
		
		/* 위시리스트를 누르면, 저장이되고 버튼의 클래스 속성을 변경한다. 또한 비어있는 하트를 채워진 하트로 바꿈. */
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
					wishbtn.children().children().attr('class', 'fa fa-heart')
				}
			});
		});

		/* 위시리스트를 버튼을 다시 누르면, 삭제가되고, 클래스 속성을 변경한다. 하트 아이콘을 비워져있는 아이콘으로 변경한다.*/
		$(document).on(	"click", ".wishdeletebtn",	function(event) {
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

	});
</script>
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
								<div class="col-md-3">
									<input type="text" class="form-control input-sm" maxlength="64"
										placeholder="카테고리 내 검색" />
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
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">브랜드</th>
					<td>
						<ul id="brand">
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
						<ul id="colorul">
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<form name ="filter" id = "filter">
		
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
</div>
<!-- //blog -->
<%@ include file="../include/footer.jsp"%>