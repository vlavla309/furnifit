$(function() {
  // 위시리스트
  var wishbtn = $("a[name=addWishlist]");
  
  wishbtn.click(function() {
    event.preventDefault(); 
  	  var planitemid = $(this).attr('value');
    $.ajax({
      url : contextPath+'/wishlist/'+planitemid,
      type : 'POST',
      success : function(request) {
        console.log(request);
        alert("위시리스트에 추가 되었습니다.");
        $(event.target).attr("disabled", true);	//위시리스트 추가 시 비활성화
      },
      error : function(request) {
        console.log(request);
        alert("이미 위시리스트에 있습니다.");
        $(event.target).attr("disabled", true);
      }
    })
  })
  
  // 삭제
  $(document).on("click", "#delbtn", function(event){
	 // alert("오오오");
  	event.preventDefault(); 
  	//var orderId = $(this).attr("href");
  	//var productId = $(this).attr("value");
  	var planitemId = $(this).attr('value')
  	alert(planitemId)
  	
   $.ajax({
        url : '${contextPath}/mypage/itemlist/'+planitemId,
        type : 'delete',
        success : function(data) {
      	 alert("배치도가 삭제되었습니다.");
      	  }
        });
    });
});