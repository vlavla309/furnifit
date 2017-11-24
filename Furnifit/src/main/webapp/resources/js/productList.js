/* handlebar image if문 */
Handlebars.registerHelper('ifimg', function(listProductId, imgProductId, orderNo, options) {
	if(listProductId === imgProductId && orderNo ===0) {
	    return options.fn(this);
	  }
	  return options.inverse(this);
});

/* handlebar wishlist에서 로그인한 사용자 구분하는 if문 */
Handlebars.registerHelper('iflogin', function(login, options) {
	if(login == null || login == "") {
		return options.fn(this);
	  }
	  return options.inverse(this);
	  
});

/* 로그인한 사용자마다 wishlist 구분 */
Handlebars.registerHelper('ifwishlist', function(listProductId, ProductId, wishlistEmail, options) {
	if(listProductId === ProductId && wishlistEmail === "${login.email}") {
		doneLoop = true;
		find = true;
		return options.fn(this);
	 }
	  return options.inverse(this);
	  
});

/* break */
Handlebars.registerHelper('ifDoneLoop', function(options) {
	if(!doneLoop) {
	    return options.fn(this);
	 }
	  return options.inverse(this);
	  
});

Handlebars.registerHelper('ifFind', function(options) {
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


//When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

var doneLoop = false;
var find = false;

	$(function() {
		
		/* color 버튼을 누르면 조건검색 리스트에 추가됨. ajax는 추후에!, 클래스 속성을 btnd로 변경한 후에 icon delete를 추가로 해준다. */
		$(document).on("click", ".colorBtn", function(event) {
			event.preventDefault();
			
			$(this).children().first().toggleClass("colorUncheck");
			$(this).attr('class','btn btn-default colordelete')
			$('#filter').append("<input type =\"hidden\" name =\"colors\" value=\""+$(this).attr('id')+"\"/>")
			
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
			$('#filter').append("<input type =\"hidden\" name =\"brands\" value=\""+$(this).text()+"\"/>")
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
				$('#min').val("0")
				$('#max').val("0")
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
				$('input[name=maxWidth]').val("0")
				$('input[name=maxLength]').val("0")
				$('input[name=maxHeight]').val("0")
				$('.sizebtn').text('적용하기')
				$(".size").removeAttr('disabled');
				to_ajax();
			}
		});
		
		/* search버튼을 누르면, 검색! ajax는 추후에  */
		$(document).on("click", ".btn-sm",function(event) {
			$('input[name=keyword]').val($('#keyword').val())
			$('#keyword').val("")
			to_ajax();
		});
		
		/* 정렬 */
		$('.target').change(function() {
			$('input[name=sort]').val($(this).val())
			to_ajax();
		});
		
		/* 더보기 버튼을 누르면 page size가 늘어남*/
		$(document).on("click", "#add",function(event) {
			event.preventDefault();
			$('input[name=pageSize]').val(Number($('input[name=pageSize]').val())+ 6)
			var total = $('input[name = totalsize').val()
			if(Number(total)<=Number($('input[name=pageSize]').val())){
				$('#add').remove()
			}
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
				url : contextPath+'/product/',
				type : 'post',
				data : formData,
				success : function(data) {
					console.log(data)
					$('input[name=keyword]').val("")
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
				url : contextPath+'/wishlist/' + productId,
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
				url : contextPath+'/wishlist/' + productId,
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