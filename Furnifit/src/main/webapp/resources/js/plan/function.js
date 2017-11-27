function rotate(target, r){
	var cx, cy;
	if (cx == null || cy == null) {
        var bbox = target.getBBox(1);
        cx = bbox.x + bbox.width / 2;
        cy = bbox.y + bbox.height / 2;
    }
	var matrix= target.matrix;	
	matrix.rotate(r,cx,cy);
	
	target.transform(matrix.toTransformString());
}

function translate(){
	
}

function scale(){
	
}


function toAjax(){
    
	var formData = $("#filter").serialize();
    console.log(formData);
    $.ajax({
		url : contextPath+'/product/',
		type : 'post',
		data : formData,
		success : function(data) {
			console.log(data)
			/*console.log(data.list[0].imgs[0].name)*/
			/*console.log(data.list[0].productId)*/
			productList(data);
			makeFurnitureList(data);
		},
		error: function(data) {
			console.log(data)
		}
	
	});

}

function productList(data){
	str =+ ""
	$.each(data.list, function(i, item) {
		str+="<div class=\"product\">"
		str+="	<div class=\"imgWrap\">"
		str+="<a class='addFurnitureBtn' href=\""+item.productId+"\"><img src=\""+proImgPath+""+item.imgs[0].path+"/"+item.imgs[0].name+"\" /></a>"
		str+="</div>"
		str+="<div class=\"infoWrap\">" 
		str+="</div>"
		str+="<span>"+item.name+"</span> <span>"+item.brand+"</span> <span>"+item.width * item.length * item.height +"</span> <span>"+item.price+"원 </span>"
		str+="</div>"
	});
	$('.productWrap').html(str)
}


function makeFurnitureList(data){
	$.each(data.list, function(i, item) {
		var furniture=new Furniture(item.productId,
									item.category,
									item.name,
									item.brand,
									item.price,
									item.color,
									item.width,
									item.length,
									item.height,
									proImgPath+"/"+item.imgs[0].path+"/"+item.imgs[0].name);

		furnitures.set(Number(item.productId), furniture);
	});
	
	/*테스트*/
	furnitures.forEach(function(item, key, mapObj){
		console.log(item.toString());
	});
		
}

$(function() {
	
	toAjax()
	
})
