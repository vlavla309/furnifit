function rotate(target, r) {
	var cx, cy;
	if (cx == null || cy == null) {
		var bbox = target.getBBox(1);
		cx = bbox.x + bbox.width / 2;
		cy = bbox.y + bbox.height / 2;
	}
	var matrix = target.matrix;
	matrix.rotate(r, cx, cy);

	target.transform(matrix.toTransformString());
}

function translate() {

}

function scale() {

}

var once = 1;

var ajaxVal;
function toAjax() {
	if(ajaxVal)ajaxVal.abort();
	var formData = $("#filter").serialize();
	ajaxVal=$.ajax({
		url : contextPath + '/product/',
		type : 'post',
		data : formData,
		success : function(data) {
			//console.log(data)
			
			if (once == 1) {
				filter(data)
				once = 0;
				wishlist(data)
			}
			
			productList(data);
			makeFurnitureList(data);
			_showPage();
		},
		error : function(data) {
			console.log(data)
		}
	});
}

function wishlist(data) {
	var str = ""

		$.each(data.wishlist, function(i, item) {
					str+="	<div class=\"product\">"
					str+="		<div class=\"imgWrap\">"
					str+="			<a href=\"1\"><img src=\"" + proImgPath + "" + item.imgs[0].path + "/"+ item.imgs[0].name + "\" /></a>"
					str+="		</div>"
					str+="	<div class=\"infoWrap\">"
					str+="			<span>"+item.name+"</span> <span>"+item.brand+"</span> <span>"+item.width+"*"+item.height+"*"+item.length +"</span> <span>"+item.price+"</span>"
					str+="		</div>"
					str+="	</div>"			
		});
		
		$('.wishlistWrap').html(str);

}

function productList(data) {

	var str = ""
	$.each(data.list, function(i, item) {
		str += "<div class=\"product count\">"
		str += "	<div class=\"imgWrap\">"
		str += "		<a class='addFurnitureBtn' href=\"" + item.productId+ "\"><img src=\"" + proImgPath + "" + item.imgs[0].path + "/"+ item.imgs[0].name + "\" /></a>"
		str += "	</div>"
		str += "	<div class=\"infoWrap\">"
		str += "	<span><b>" + item.name + "</b></span>"
		str += "	<span>" + item.brand + "</span>";
		str += "	<span>" + item.width + " * " + item.length + " * "
				+ item.height + "</span>";
		str += "	<span>" + item.price + "원 </span>";
		str += "</div>"
		str += "</div>"
	});

	$('.productWrap').html(str)

}

function filter(data) {
	var str = ""
	// category 필터추가
	str += "<ul>"
	str += "<li><a class=\"categorya\">전체</a></li>"
	$.each(data.categorylist, function(i, item) {
		str += "<li><a class=\"categorya\">" + item.name + "</a></li>"
	});
	str += "</ul>"
	$('#category').html(str)

	// brand
	str = ""
	$.each(data.brandlist, function(i, item) {
		str += "<li><a class=\"branda\">" + item.name + "</a></li>"
	});
	$('#brand').html(str)

	str = ""
	str += "<ul>"
	// color
	$.each(data.colorlist,function(i, item) {
		console.log(item.name)
		if (item.name == "white") {
			str += "<li><a class=\"btn btn-default colorBtn\" id =\""
					+ item.name
					+ "\" style=\"background:"
					+ item.rgb
					+ "\" aria-hidden=\"true\" aria-label=\"Settings\"><i class=\"fa fa-check  fa-lg colorUncheck\"  style=\"color:black\" aria-hidden=\"true\"></i></a></li>"
		} else {
			str += "<li><a class=\"btn btn-default colorBtn\" id =\""
					+ item.name
					+ "\" style=\"background:"
					+ item.rgb
					+ "\" aria-hidden=\"true\" aria-label=\"Settings\"><i class=\"fa fa-check  fa-lg colorUncheck\"  style=\"color:white\" aria-hidden=\"true\"></i></a></li>"
		}
	});
	str += "</ul>";
	$('#colorul').html(str);

	$('.productWrap').html(str)
}

function makeFurnitureList(data) {
	$.each(data.list, function(i, item) {
		var furniture = new Furniture(item.productId, item.category, item.name,
				item.brand, item.price, item.color, item.width, item.length,
				item.height, proImgPath + "/" + item.imgs[0].path + "/"
						+ item.imgs[0].name, item.description);

		furnitures.set(Number(item.productId), furniture);
	});
	/* 테스트 */
	/*
	furnitures.forEach(function(item, key, mapObj) {
		// console.log(item.toString());
	});
	*/
}

$(function() {

	/*
	 * color 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에!, 클래스 속성을 btnd로 변경한 후에 icon
	 * delete를 추가로 해준다.
	 */
	$(document).on("click",".colorBtn",	function(event) {
		event.preventDefault();
		$(this).children().first().toggleClass("colorUncheck");
		$(this).attr('class', 'btn btn-default colordelete')
		$('#filter').append("<input type =\"hidden\" name =\"colors\" value=\""+ $(this).attr('id') + "\"/>")

		toAjax();

	});

	/* 색상버튼 체크를 해제하고, 아래에 form에서 input 제거!, ajax는 추후 */
	$(document).on("click", ".colordelete", function(event) {
		event.preventDefault();
		$(this).attr('class', 'btn btn-default colorBtn')
		$(this).children().first().toggleClass("colorUncheck");
		$('#filter :input[value="' + $(this).attr('id') + '"]').remove();
		toAjax();
	});

	/* brand 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에! */
	$(document).on("click",".branda",function(event) {
		event.preventDefault();

		$(this).attr('class', 'branddelete');
		$(this).toggleClass("paramActive");
		$('#filter').append("<input type =\"hidden\" name =\"brands\" value=\""+ $(this).text() + "\"/>")
		toAjax();
	});

	/* 브랜드 버튼 체크를 해제하고, 아래에 form에서 input 제거!, ajax는 추후 */
	$(document).on("click", ".branddelete", function(event) {
		event.preventDefault();
		$(this).attr('class', 'branda');
		$('#filter :input[value="' + $(this).text() + '"]').remove();
		toAjax();
	});

	/* category 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에! */
	$(document).on("click", ".categorya", function(event) {
		event.preventDefault();
		$(".categorya").removeClass("paramActive");
		$(this).toggleClass("paramActive");
		$('#cate').val($(this).text())
		toAjax();
	});

	/* 가격 적용하기 버튼을 누르면, 조건검색 리스트에 추가됨. ajax는 추후에! */
	$(document).on("click", ".pricebtna", function(event) {
		if ($('.pricebtna').text() == '적용하기') {
			$('.pricebtna').text('취소하기')
			$('.price').attr("disabled", true);

			$('#min').val($('#minprice').val())
			$('#max').val($('#maxprice').val())

			if ($('#minprice').val() == 0)
				$('#min').val("0")
			if ($('#maxprice').val() == 0)
				$('#max').val("0")

			toAjax();
		} else {
			$('#min').val("0")
			$('#max').val("0")
			$('.pricebtna').text('적용하기')
			$(".price").removeAttr('disabled');
		}
	});

	/* 사이즈 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에! */
	/* 사이즈는 최대값만 넣을 수 있음. 최대값보다 작은 상품들을 보여줌. */
	$(document).on("click", ".sizebtn", function(event) {
		if ($('.sizebtn').text() == '적용하기') {
			$('.sizebtn').text('취소하기')
			$('.size').attr("disabled", true);

			$('input[name=maxWidth]').val($('#w').val())
			$('input[name=maxLength]').val($('#l').val())
			$('input[name=maxHeight]').val($('#d').val())

			if ($('#w').val() == 0)
				$('input[name=maxWidth]').val("0")
			if ($('#l').val() == 0)
				$('input[name=maxLength]').val("0")
			if ($('#d').val() == 0)
				$('input[name=maxHeight]').val("0")

			toAjax();
		} else {
			$('input[name=maxWidth]').val("0")
			$('input[name=maxLength]').val("0")
			$('input[name=maxHeight]').val("0")
			$('.sizebtn').text('적용하기')
			$(".size").removeAttr('disabled');
			toAjax();
		}
	});

	/* search버튼을 누르거나, 엔터버튼 누를때*/ 
	$(document).on("submit", "#searchForm", function(event) {
		event.preventDefault();
		$('input[name=keyword]').val($('#keyword').val())
		$('#keyword').val("")
		toAjax();
	});

	/* 정렬 */
	$('.target').change(function() {
		$('input[name=sort]').val($(this).val())
		toAjax();
	});

	/* 더보기 버튼을 누르면 page size가 늘어남 */
	$(document).on(	"click","#add",	function(event) {
		event.preventDefault();
		$('input[name=pageSize]').val(
				Number($('input[name=pageSize]').val()) + 6)
		var total = $('.count').length
		if (Number(total) < Number($('input[name=pageSize]').val())) {
			$('#add').remove()
		}
		toAjax();
	});

	toAjax();
});



/**
 * 화면 상단에 메시지를 출력한다, 메시지는 3초간 유지된다
 * @param type 메시지 타입
 * @param msg 메시지 내용
 * @returns
 */
var timerId;
function showMsgBar(type, msg){
	var msgBar=$("#msgBar");
	msgBar.removeClass("alert-success");
	msgBar.removeClass("alert-danger");
	msgBar.hide();
	clearTimeout(timerId);
	
	var alertType="alert-danger";
	var strongStr;
	switch(type){
	case "success":
		alertType="alert-success";
		strongStr="Success! ";
		break;
	case "fail":
		alertType="alert-danger";
		strongStr="Fail! ";
		break;
	}
	var msgStr="<strong>"+strongStr+"</strong>"+msg;
	msgBar.addClass(alertType);
	msgBar.html(msgStr);
	msgBar.show();

	timerId=setTimeout(function(){
		console.log("종료");
		msgBar.hide("fade");
	}, 3000);

}
