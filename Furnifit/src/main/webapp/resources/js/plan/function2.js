/**
 * 
 */

function writePlan(planName){
	var plan=new Plan();

	plan.name=planName;

	editors.forEach(function(editor, key, map) {
		editor.canvas.paper.zpd('destroy'); 
		editor.canvas.paper.zpd('toggle'); 
		editor.canvas.paper.zpd('toggle'); 

		var name=editor.name;
		var width=editor.width;
		var height=editor.height;
		var length=editor.length;
		var acreage=editor.acreage;
		var image=editor.canvas.paper.toDataURL();
		var planitem=new Planitem(name, width, height, length, acreage, image);

		editor.furnitures.forEach(function(furniture){
			planitem.furnitures.push(furniture.data("productId"));
		})

		plan.planitems.push(planitem);
	});


	var jsonData = JSON.stringify(plan);
	$.ajax({
		url : contextPath + '/plan',
		type : 'post',
		data : jsonData,
		contentType: 'application/json',
		success : function(data) {
			console.log(data);
			location.href=contextPath+"/mypage/planlist";
		},
		error : function(data) {
			console.log(data)
		}
	});
}

function printPlaced(){
	var str = ""
		curEditor.furnitures.forEach(function(furniture){
			var productId=furniture.data("productId");
			var item=furnitures.get(productId);
			var id=furniture.id;
			
			str+="	<div class=\"product\">"
				str+="		<div class=\"imgWrap\">"
				str+="			<a href='"+id+"' class='placedItemBtn'><img src='" + item.imgPath+ "' /></a>"
				str+="		</div>"
				str+="	<div class=\"infoWrap\">"
				str+="			<span>"+item.name+"</span> <span>"+item.brand+"</span> <span>"+item.width+"*"+item.height+"*"+item.length +"</span> <span>"+item.price+"</span>"
				str+="		</div>"
				str+="	</div>"
		});
					
		
		$('.furnitureWrap').html(str);
}

function refreshThumbnail(){
	setTimeout(() => {
		var svgData=curEditor.canvas.paper.toDataURL();
		var id=curEditor.id;
		var imgElem=$(".planitem  a[href="+id+"] img");
		imgElem.attr("src",svgData);
	}, 1000);
}

function setFooterBtnUp(){
	$("#downBtn i").removeClass("fa-angle-double-down");
	$("#downBtn i").addClass("fa-angle-double-up");
}

function setFooterBtnDown(){
	$("#downBtn i").removeClass("fa-angle-double-up");
	$("#downBtn i").addClass("fa-angle-double-down	 ");
}