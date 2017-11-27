$(function() {
	totalSum();
	
	// 페이지 로드 시 초기 합계 (.count : 수량 / #total : 총 합계 / input[name=price] : orders의 총 합계(hidden))
	function totalSum(){
    	var sum = 0;
        var price = $(".count").parent().next().next();
        for (var i = 0; i < price.length; i++) {
          sum = sum +  parseInt($(price[i]).text());
        }  
        $("#total").text(sum + "원");
        $("input[name=price]").val(sum);
	}
	
	
    // 수량 변경에 따른 합계 & 총 합계 (수량 * 판매가)
    $(".count").bind('keyup mouseup', function (event) {
      $(event.target).parent().next().next().text( parseInt($(event.target).val())*parseInt($(event.target).parent().next().text())+"원")
      totalSum(); 
    });
  
    
    // Select 쿠폰선택 (select[name=discount] : 쿠폰 select)
 	$("#coupon").text("적용된 쿠폰이 없습니다.");
    
    $("select[name=discount]").bind('change', function (event) {
 	    var rate = $(this).val();  	//할인율(discountRate)

 	    var sel = document.getElementById("sel");
 	  	var selVal = sel.options[sel.selectedIndex].text;  //선택한 option의 text 
 	    var serialNum = 0;	//시리얼 번호
 	    
 		if(selVal != "---쿠폰 선택---"){
 			serialNum = selVal.split(")")[0];		//시리얼번호 split
     	 $("#coupon").html("serialNo : "+serialNum+'<br><br>'+rate.split(".")[0]+"% 쿠폰이 적용되었습니다.");
     	 $(".count").attr("disabled", true);		//수량 비활성화
     	  var sum = 0;
          var price = $(".count").parent().next().next();
          for (var i = 0; i < price.length; i++) {
          	sum = Math.floor(sum +  parseInt($(price[i]).text()) * ((100 - rate) * 0.01));	//쿠폰 할인율 적용한 총 합계
          }  
          $("#total").text(sum + "원");
          
          $("input[name=price]").val(sum);
          $("input[name=useCoupones]").val(serialNum);	//orders의 사용된 쿠폰시리얼번호
          $("input[name=serial]").val(serialNum);		//offer_coupones의 시리얼번호
 	   }else{
   		 $("#coupon").text("적용된 쿠폰이 없습니다.");
   		 totalSum();
   		 $(".count").attr("disabled", false);
   		 $("input[name=price]").val(sum);
   		 $("input[name=useCoupones]").val(serialNum);
   		 $("input[name=serial]").val(serialNum);
   	   }
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
    	totalSum();
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