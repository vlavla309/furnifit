<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Plan Writer - FurniFit</title>

<!-- css -->
<link
	href="${pageContext.servletContext.contextPath }/resources/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.servletContext.contextPath }/resources/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${rSrcPath}/css/planwriter.css">
<link rel="stylesheet" type="text/css"
	href="${rSrcPath}/css/jquery-ui.css">


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

.pdbotton {
	padding-bottom: 15px;
}

.categorydelete, .branddelete, .branda, .categorya {
	padding: 0.5em;
	border-radius: 0.5em;
}

.paramActive {
	background: #ac3939;
	color: white !important;
}

.colorUncheck {
	display: none;
}

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	border: none;
	outline: none;
	background-color: red;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 10px;
}

#myBtn:hover {
	background-color: #555;
}

li {
	list-style: none;
	display: inline;
	margin-right: 2em;
}
</style>


<!-- Javascript -->
<script type="text/javascript" src="${rSrcPath}/js/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="${rSrcPath}/js/plan/snap.svg-min.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/snap.svg.zpd.js"></script>

<script type="text/javascript" src="${rSrcPath}/js/plan/planwriter.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/Furniture.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/function.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/eventRegist.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/eventHandler.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/Editor.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/Coordinate.js"></script>
<script type="text/javascript" src="${rSrcPath}/js/plan/calc.js"></script>

<script type="text/javascript">
	var contextPath = "${contextPath}";
	var planImgPath = contextPath + "/resources/images/plan";
	var rSrcPath = "${rSrcPath}";
	var proImgPath = "${rSrcPath}/productimg";
</script>


</head>
<body>
	<div id="wrap">
		<!-- header 시작 -->
		<div id="header">
			<nav id="headerNav">
				<div id="headerLogo">
					<a href="#"><strong>FurniFit</strong></a>
				</div>
				<div id="headerMenuWrap">
					<ul id="headerMenuLeft">
						<li><a id=saveBtn href="#">저장</a></li>
						<li><a href="#">menu2</a></li>
						<li><a id=crtBtn href="#">침대하나</a></li>
					</ul>
					<ul id="headerMenuRight">
						<li class="exit"><a href="#"><strong>EXIT </strong><i class="fa fa-sign-in" aria-hidden="true"></i></a></li>
					</ul>
				</div>

			</nav>

			<!-- left sidebar 시작 -->
			<div class="sidebar">
				<div id="leftSidebarWrap">
					<div class="sidemenu">
						<div id="planitemTabs">
							<ul id="planitems">
								<!-- 샘플 ㅎㅎ -->
								<!-- <li><div class='planitem'><a href='1'>내방</a></div></li> -->
							</ul>
							<!-- <button id="newPlanBtn">Add Plan</button> -->
							<a href="#" id="newPlanBtn"><img
								src="${rSrcPath }/images/plan/plus.png" width=50px;></a>
						</div>
						<div id="leftToggle">
							<button id="leftToggleBtn"  class="sideToggleBtn"><i class="fa fa-angle-double-left" aria-hidden="true"></i></button>
						</div>
					</div>
				</div>
			</div>
			<!-- left sidebar 끝	 -->

			<!-- right sidebar 시작 -->
			<div class="sidebar">
				<div id="rightSidebarWrap">
					<div class="sidemenu">
						<div id="rightToggle">
							<button id="rightToggleBtn" class="sideToggleBtn"><i class="fa fa-angle-double-right" aria-hidden="true"></i></button>
						</div>
						<div id="rightTabs">
							<ul>
								<li><a href="#tabs-1">가구목록</a></li>
								<li><a href="#tabs-2">찜목록</a></li>
								<li><a href="#tabs-3">배치목록</a></li>
							</ul>
							<!-- 상품 목록 -->
							<div id="tabs-1" class="tabContent">
								<div id="searchTab">
									<button type="button" id="searchToggleBtn">
									Search
									<i class="fa fa-search" aria-hidden="true"></i>
									</button>
									<div id="searchWrap">
										<div id="searchKeyword">
											<div class="col-lg-12 in-gp-tb">
												<div class="input-group">
													<input type="text" class="form-control"
														placeholder="Search for..."> 
														<span class="input-group-btn">
															<button class="btn btn-default" type="button">Search</button>
														</span>
												</div>
												<!-- /input-group -->
											</div>
										</div>
										<div id="searchAccodian">
											<h3>
												카테고리 <i class="fa fa-plus" aria-hidden="true"></i>
											</h3>
											<div>
												<ul id="category"></ul>
											</div>
											<h3>브랜드</h3>
											<div>
												<ul id="brand"></ul>
											</div>
											<h3>색상</h3>
											<div>
												<ul id="colorul"></ul>
											</div>
											<h3>가격</h3>
											<div id="price">
												<ul>
													<li><input type="number" id="minprice" class="price"
														value="0" placeholder="min price"></li>
													<li>~</li>
													<li><input type="number" id="maxprice" class="price"
														value="10000" placeholder="max price"></li>
													<li><button type="submit" class="btn btn-sm pricebtna">적용하기</button></li>
												</ul>
											</div>
											<h3>사이즈</h3>
											<div id="size">
												<ul>
													<li><input type="number" placeholder="가로" id="w"
														class="size" style="width: 50px;"></li>
													<li>*</li>
													<li><input type="number" placeholder="세로" id="l"
														class="size" style="width: 50px;"></li>
													<li>*</li>
													<li><input type="number" placeholder="높이" id="d"
														class="size" style="width: 50px;"></li>
													<li><button type="submit" class="btn btn-sm sizebtn">적용하기</button></li>
												</ul>
											</div>
										</div>

										<form name="filter" id="filter">
											<input type="hidden" value="" name="sort"> <input
												type="hidden" value="" name="keyword"> <input
												type="hidden" name="category" value="" id="cate"> <input
												type="hidden" name="minPrice" value="0" id="min"> <input
												type="hidden" name="maxPrice" value="0" id="max"> <input
												type="hidden" name="maxWidth" value="0"> <input
												type="hidden" name="maxLength" value="0"> <input
												type="hidden" name="maxHeight" value="0"> <input
												type="hidden" name="pageSize" value="6">
										</form>
									</div>
								</div>
								<div class="productWrap">
									<!-- 상품 목록 -->
									<!-- 상품 항목  시작-->
									<!-- 상품 항목  끝-->

								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="text-center">
											<a class="btn btn-default" id="add"><i
												class="fa fa-angle-down" aria-hidden="true"></i> 더보기</a>
										</div>
									</div>
								</div>
							</div>



							<!-- 위시리스트 목록 -->
							<div id="tabs-2" class="tabContent">

								<form name="wishlist" id="wishlistparam">
									<input type="hidden" value="" name="pageSize"> 
									<input type="hidden" name="maxHeight" value="0"> 
								</form>

								<div class="wishlistWrap">
									<!-- 상품 목록 -->
									<div class="product">
										<div class="imgWrap">
											<a href="1"><img src="images/small_bed.png" /></a>
										</div>
										<div class="infoWrap">
											<span>상품명</span> <span>브랜드</span> <span>200x200x200</span> <span>100000원</span>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="text-center">
											<a class="btn btn-default" id="add"><i
												class="fa fa-angle-down" aria-hidden="true"></i> 더보기</a>
										</div>
									</div>
								</div>

							</div>

							<!-- 배치 목록 -->
							<div id="tabs-3" class="tabContent">
								<div class="furnitureWrap">
									<!-- 상품 목록 -->
									<div class="product">
										<div class="imgWrap">
											<a href="1"><img src="images/bed.png" /></a>
										</div>
										<div class="infoWrap">
											<span>상품명</span> <span>브랜드</span> <span>200x200x200</span> <span>100000원</span>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- right sidebar 끝-->
			
			<div id="msgBar" class="alert"></div>
			
		</div>
		<!-- header 끝 -->

		<!-- content 시작 -->
		<div id="content">
			<div id="editorWrap">

				<!-- 샘플 ㅎㅎ -->
				<!-- <div id="editorContainer-1" class="editorContainer active">
			<svg width="100%" height="100%">
				<g class="editor">
				</g>
			</svg>
			</div> -->
			</div>
		</div>
		<!-- content 끝 -->


		<!-- footer 시작 -->
		<div id="footer">
			<div id="furnitureInfoWrap">
				<div class="imgWrap">
					<a href="#" target="_blank"><img src="" /></a>
				</div>
				<div class="infoWrap">
					<span class="category">카테고리</span> 
 					<span class="name">상품명</span> 
 					<span class="brand">브랜드</span> 
 					<span class="size">200x200x200</span>
				</div>
				<div class="controlWrap">
					<ul>
						<li><a href="#" id="clockwiseRotateBtn"><img src="${contextPath }/resources/images/plan/rotate.png" alt="시계방향 회전"></a></li>
 						<li><a href="#" id="counterclockwiseRotateBtn"><img src="${contextPath }/resources/images/plan/counterRotate.png" alt="시계반대방향 회전"></a></li>
 						<li><a href="#" id="deleteBtn"><img src="${contextPath }/resources/images/plan/trash.png" alt="삭제"></a></li>
  					
					</ul>
				</div>
			</div>
		</div>
		<!-- footer 끝 -->

		<!-- 새 배치도 추가 폼 -->
		<div id="newPlanForm" title="새 배치도 추가">
			<form>
				<fieldset class="ui-helper-reset">
					<label for="tab_title">배치도이름</label><br> <input type="text"
						name="planName" id="planName" placeholder='배치도 이름을 입력해주세요'
						class="ui-widget-content ui-corner-all" required> <br>
					<br> <label for="tab_title">방의 크기</label><br> <input
						type="number" name="planWidth" id="planWidth"
						placeholder='방의 가로길이를 입력해주세요'
						class="ui-widget-content ui-corner-all" required> <input
						type="number" name="planHeight" id="planHeight"
						placeholder='방의 세로길이를 입력해주세요'
						class="ui-widget-content ui-corner-all" required> <input
						type="number" name="planLength" id="planLength"
						placeholder='방의 높이를 입력해주세요'
						class="ui-widget-content ui-corner-all" required>
				</fieldset>
			</form>
		</div>
		<!-- 새 배치도 추가 폼 -->
	</div>

</body>
</html>