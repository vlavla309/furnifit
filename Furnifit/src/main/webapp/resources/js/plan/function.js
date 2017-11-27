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
			productList(data)
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
		str+="<a href=\""+item.productId+"\"><img src=\""+proImgPath+""+item.imgs[0].path+"/"+item.imgs[0].name+"\" /></a>"
		str+="</div>"
		str+="<div class=\"infoWrap\">" 
		str+="</div>"
		str+="<span>"+item.name+"</span> <span>"+item.brand+"</span> <span>"+item.width * item.length * item.height +"</span> <span>"+item.price+"원 </span>"
		str+="</div>"
	});
	
	$('.productWrap').html(str)
		
}

$(function() {
	
	toAjax()
	
})
