<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${rSrcPath}css/productList.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="entry-template" type="text/x-handlebars-template">
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




<script>

/* handlebar image if문 */
Handlebars.registerHelper('ifimg', function(listProductId, imgProductId, orderNo, options) {
	console.log("ifimg : "+listProductId, imgProductId, orderNo)
	if(listProductId === imgProductId && orderNo ===0) {
	    return options.fn(this);
	  }
	  return options.inverse(this);
});

/* handlebar wishlist에서 로그인한 사용자 구분하는 if문 */
Handlebars.registerHelper('iflogin', function(login, options) {
	console.log("iflogin : " + login)
	if(login == null || login == "") {
	    console.log("로그인 아님!!");
		return options.fn(this);
	  }
	  return options.inverse(this);
	  
});

/* 로그인한 사용자마다 wishlist 구분 */
Handlebars.registerHelper('ifwishlist', function(listProductId, ProductId, wishlistEmail, options) {
	console.log(listProductId, ProductId, wishlistEmail);
	if(listProductId === ProductId && wishlistEmail === "${login.email}") {
		console.log("ifwishlist 성공? 제발------listProductId : "+ listProductId+" "+ ProductId+" : "+ wishlistEmail)
		doneLoop = true;
		find = true;
		return options.fn(this);
	 }
	  return options.inverse(this);
	  
});

/* break */
Handlebars.registerHelper('ifDoneLoop', function(options) {
	console.log("ifDoneLoop --> doneLoop :" + doneLoop)
	if(!doneLoop) {
	    return options.fn(this);
	 }
	  return options.inverse(this);
	  
});

Handlebars.registerHelper('ifFind', function(options) {
	console.log("ifFind --> find : " + find)
	if(!find) {
	    return options.fn(this);
	  }
	  return options.inverse(this);
});

Handlebars.registerHelper('init', function(options) {
	doneLoop = false;
	find = false;
    return ""; 
});

var doneLoop = false;
var find = false;

	$(function() {
			
		/* color 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에!, 클래스 속성을 btnd로 변경한 후에 icon delete를 추가로 해준다. */
		$(document).on("click", ".colorBtn", function(event) {
			event.preventDefault();
			
			$(this).children().first().toggleClass("colorUncheck");
			$(this).attr('class','btn btn-default colordelete')
			$('#filter').append("<input type =\"text\" name =\"colors\" value=\""+$(this).attr('id')+"\"/>")
			
			to_ajax();
			
		});
		
		/* 색상버튼 체크를 해제하고, 아래에 form에서  input 제거!, ajax는 추후 */
		$(document).on("click", ".colordelete", function(event) {
			event.preventDefault();
			$(this).attr('class','btn btn-default colorBtn')
			$(this).children().first().toggleClass("colorUncheck");
			$('#filter :input[value="'+$(this).attr('id')+'"]').remove();
			to_ajax();
		});
		
		
		/* brand 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에! */
		$(document).on(	"click", ".branda",function(event) {
			event.preventDefault();
			$(this).attr('class','branddelete')
			$(this).toggleClass("paramActive");
			$('#filter').append("<input type =\"text\" name =\"brands\" value=\""+$(this).text()+"\"/>")
			to_ajax();
		});

		/* 브랜드 버튼 체크를 해제하고, 아래에 form에서  input 제거!, ajax는 추후 */
		$(document).on(	"click", ".branddelete",function(event) {
			event.preventDefault();
			$(this).attr('class','branda')
			$('#filter :input[value="'+$(this).text()+'"]').remove();
			to_ajax();
		});
		
		/* category 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에! */
		$(document).on(	"click", ".categorya",function(event) {
			event.preventDefault();
			$(".categorya").removeClass("paramActive");
			$(this).toggleClass("paramActive");
			$('#cate').val($(this).text())
			to_ajax();
		});
		
		/* 가격 적용하기 버튼을 누르면, 조건검색 리스트에 추가됨. ajax는 추후에! */
		$(document).on("click", ".pricebtna",function(event) {
			if($('.pricebtna').text()=='적용하기'){
				$('.pricebtna').text('취소하기')
				$('.price').attr("disabled", true);
				
				$('#min').val($('#minprice').val())
				$('#max').val($('#maxprice').val())
				
				if($('#minprice').val() == 0) $('#min').val("0")
				if($('#maxprice').val() == 0) $('#max').val("0")
				
				to_ajax();
			}else{
				$('.pricebtna').text('적용하기')
				$(".price").removeAttr('disabled');
			}
		});
		
		/* 사이즈 버튼을 누르면  조건검색 리스트에 추가됨. ajax는 추후에! */
		/* 사이즈는 최대값만 넣을 수 있음. 최대값보다 작은 상품들을 보여줌. */
		$(document).on("click", ".sizebtn",function(event) {
			if($('.sizebtn').text()=='적용하기'){
				$('.sizebtn').text('취소하기')
				$('.size').attr("disabled", true);
				
				$('input[name=maxWidth]').val($('#w').val())
				$('input[name=maxLength]').val($('#l').val())
				$('input[name=maxHeight]').val($('#d').val())
				
				if($('#w').val() == 0) $('input[name=maxWidth]').val("0")
				if($('#l').val() == 0) $('input[name=maxLength]').val("0")
				if($('#d').val() == 0) $('input[name=maxHeight]').val("0")
				
				to_ajax();
			}else{
				$('.sizebtn').text('적용하기')
				$(".size").removeAttr('disabled');
				to_ajax();
			}
		});
		
		/* search버튼을 누르면, 검색! ajax는 추후에  */
		$(document).on("click", ".btn-sm",function(event) {
			$('input[name=keyword]').val($('#keyword').val())
			to_ajax();
		});
		
		$('.target').change(function() {
			$('input[name=sort]').val($(this).val())
			to_ajax();
		});
		
		
		//핸들바 템플릿 가져오기
		var source = $("#entry-template").html(); 

		//핸들바 템플릿 컴파일
		var template = Handlebars.compile(source);

		/* ajax실행 함수  */
		function to_ajax(){
	        var formData = $("#filter").serialize();
	        console.log(formData);
	        $.ajax({
				url : '${contextPath}/product/',
				type : 'post',
				data : formData,
				success : function(data) {
					console.log(data)
					var html = template(data);
					$('.information-grids').empty();
					$('.information-grids').append(html);
				},
				error: function(data) {
					console.log(data)
				}
			
			});
		
		}
		
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
				},
				error : function(data){
					console.log(data)
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
				},
				error : function(data){
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
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td colspan="2">
						<ul>
							<li>
								<div class="col-md-2">
									<select class="form-control input-sm target">
										<option value="total">전체</option>
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
			<input type="text" name = "sort" value="">
			<input type="text" name = "keyword" value="">
			<input type="text" name = "category" value="" id="cate">
			<input type="text" name = "minPrice" value="0" id="min">
			<input type="text" name = "maxPrice" value="0" id="max">
			<input type="text" name="maxWidth" value="0">
			<input type="text" name="maxLength" value="0">
			<input type="text" name="maxHeight" value="0">
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