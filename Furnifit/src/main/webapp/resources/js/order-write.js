$(function() {
	calculateSum();
	
	// 페이지 로드 시 초기 합계 (.count : 수량 / #total : 총 합계 / input[name=price] : orders의 총 합계(hidden))
	function calculateSum(){
 	   	$(".count").each(function(i, item){
 	   		var subPrice = $(item).val()* $(item).parent().attr("value");	//합계
 	   		//alert("subPrice"+subPrice)
 	   		$(item).parent().next().next().text(subPrice);
 	   		//console.log($(item).parent().next().next().attr("value", subPrice));
 	   		//alert(subPrice)
 	   		//$("#a").text(subPrice + "원");
 	   	});
 	    
 	    var sum=0;
 	    $(".subPrice").each(function(i, item){
 	    	sum += Math.floor(Number($(item).attr("value")));
 	    });
 	    alert(sum)
	    var rate = (100-$("select[name=discount]").val())/100;	//할인율
	    var totalPrice = sum * rate;		//총 합계
	
	    
	    $("#total").text(totalPrice + "원");
	    $("input[name=price]").val(totalPrice);
	}
	
    // 수량 변경에 따른 합계 & 총 합계 (수량 * 판매가)
    $(".count").bind('change', function (event) {
    	calculateSum();
    });
  
    // Select 쿠폰선택 (select[name=discount] : 쿠폰 select)
    $("#coupon").text("적용된 쿠폰이 없습니다.");
    $("select[name=discount]").bind('change', function (event) {
    	calculateSum();
    	
 	   
   }); 
    

    // 가구 삭제
    var furniCnt = $("#kind").attr('class');
    $(document).on("click", ".deleteOrder", function(event){   
    	event.preventDefault(); 
    	var furniProId =  $(this).parent().parent().attr("value");	//furniture 가구 고유번호
    	var productId = $(this).attr("value");	//product 가구 고유번호
    	
    	var tr = $(this).parent().parent();	//삭제시 지울 tr
    	
    	if(furniProId == productId && furniCnt != 1){
    		tr.remove()
    		furniCnt = furniCnt-1;
    		if(furniCnt != 0){
    			$("#kind").html('<strong>'+furniCnt+"종류의 가구를 주문합니다."+'<strong>');
    		}else{
    			$("#kind").html('<strong>'+"주문할 가구가 없습니다."+'<strong>');
    		}
    	}else{
    		alert("1개 이상의 가구가 있어야 합니다.")
    	}
    	calculateSum();
    });
    
    
    // 위시리스트
    var wishbtn = $("a[name=addWishlist]");
    
    wishbtn.click(function(event) {
      event.preventDefault(); 
      var furniProId =  $(this).parent().parent().attr("value");	//furniture 가구 고유번호
   	  var productId = $(this).attr('value');
      
   	  $.ajax({
        url :'${contextPath}/wishlist/'+productId,
        type : 'POST',
        success : function(request) {
          console.log(request);
          alert("위시리스트에 추가 되었습니다.");
          if(furniProId == productId){
          	$(event.target).attr("disabled", true);	//위시리스트 추가 시 비활성화
          }
        },
        error : function(request) {
          console.log(request);
          alert("이미 위시리스트에 있습니다.");
          $(event.target).attr("disabled", true);
        }
      })
    })
    
});