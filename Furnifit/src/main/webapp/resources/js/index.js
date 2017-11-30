$(document).ready(function(){
	
	to_ajax();
	
});

		/* ajax실행 함수  */
		function to_ajax(){
	        $.ajax({
				url : contextPath+'/product/',
				type : 'post',
				data : "sort=new&category=전체&pageSize=4",
				dataType : 'json',
				success :function(data){
					console.log(data);	
					var str = "";
					
					var proImgPath = rSrcPath+"/productimg";
					
					$.each(data.list,function(index,item){
				             
		            	
					    
				        str += "<div class='col-md-4 information-grid wow fadeInLeft animated indexPrdInline' data-wow-delay='.5s' >";
				        str += "<div class='information-info' >";
				        str += "<div class='information-grid-img'>";
				        str += "<a class='indexPrdA' href=\""+contextPath+'/product/'+item.productId+"\">";
				        str += "<img src= \"" + proImgPath + "" + item.imgs[0].path + "/"+ item.imgs[0].name + "\" /></a>";
				        str += "</div>"; 
				        str += "<div class='information-grid-info indexPrdPadding' >";   
				        str += "<h4 class='indexPrdName'>"+item.name+"</h4>";
				        str += "<hr class='indexPrdHr'>";     
				        str += " <p class='indexPrdBrand'>"+item.brand+"</p>";     
				        str += "</div>";
				        str += "</div>";
				        str += "</div>";
				        
				        
				        
				        
				        		
	                
					});
					$("#prdList").html(str);
				    
				}
				
			});
		}
		
		
	
		
		
		
	
		
		