var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    } 
}


$(function(){
	
	var articleId = $('input[name=articleId]').val(); 

	$("#modifyBtn").on("click",function(){
		 event.preventDefault();
	   
		 var that = $("#registerForm");
		 
	    var str = "";
	    $(".uploadedList .delbtn").each(
	        function(index) {
	          str += "<input type='hidden' name='files[" + index
	              + "]' value='" + $(this).attr("href")
	              + "'> ";
	    });
	    
		 that.append(str);
		 
		 to_ajax();
		 });
		 
		
	    function to_ajax(){
	    var formData = $("#registerForm").serialize();
	    console.log(formData);
	    
	    $.ajax({ 
	      type:'post',
	      url: contextPath+'/article/'+articleId,
	      data: formData,  
	      success:function(result){
	        console.log("result: " + result);
	        if(result == 'success'){
	          alert("수정 되었습니다.");
	          location.href= contextPath+'/article/'+articleId;
	      		  }
	  		  }
	      });
		}


	});


$(".uploadedList").on("click", ".delbtn", function(event){
    event.preventDefault(); 
    $(this).parent().parent().parent().remove();
});

