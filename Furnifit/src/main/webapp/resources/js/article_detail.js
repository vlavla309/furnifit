


$(document).ready(function(){

	var formObj = $("form[role='form']");
	var articleId = $('input[name=articleId]').val(); 
	var likeEmail = $('input[name=likeEmail]').val();
    
    
  $(".listBtn").bind("click", function(){
    formObj.attr("method", "get");
    formObj.attr("action", "/one/article");
    formObj.submit();
  });
  

  if(!likeEmail){
	 $("#alreadyLike").hide();
  }else{
	 $("#like").hide();
    
  }
  
  $("#like").on("click", function(){
  		
	  to_ajax();
  });
  
  function to_ajax(){
	  var likecnt = $('input[name=likeCnt]').val();
	  likecnt = Number(likecnt);
	  var articleId = $('input[name=articleId]').val(); 
	
	  $.ajax({
        type:'post',
        url: contextPath+'/like',
        headers: { 
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST" },
        dataType:'text',
        data: JSON.stringify({articleId:articleId, email:loginEmail, likecnt:likecnt}),
        success:function(result){
          console.log("result: " + result);
          if(result == 'success'){
             alert("추천완료!");
             $("#like").hide();
             $("#alreadyLike").show();
             $("#likeCount").text("["+(likecnt+1)+"]");
    	
          }
        }
     });
  }
  
 
  $(".deleteBtn").on("click",function(){
	 
      $.ajax({
        type:'delete',
        url: contextPath+'/article/'+articleId,
        headers: { 
                 "Content-Type": "application/json",
                 "X-HTTP-Method-Override": "DELETE" },
        dataType:'text', 
        success:function(result){
        console.log("result: " + result);
        if(result == 'success'){
        alert("삭제 되었습니다.");
        $(".listBtn").trigger("click");
        

           } 
         }
      });
  });
   
});



