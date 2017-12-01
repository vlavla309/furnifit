/**
 * 
 */

function writePlan(){
	var planName=$( "#writePlanForm #planGroupName" ).val();
	var plan=new Plan();

	plan.name=planName;

	editors.forEach(function(editor, key, map) {
		editor.canvas.paper.zpd('destroy'); 
		editor.canvas.paper.zpd('toggle'); 
		editor.canvas.paper.zpd('toggle'); 
		
		var viewWidth=parseInt(editor.width)+parseInt(editor.wallWidth*2);
		var viewHeight=parseInt(editor.height)+parseInt(editor.wallWidth*2);
		
		var ULCx=curEditor.offsetX-editor.wallWidth;
		var ULCy=curEditor.offsetY-editor.wallWidth;
		
		var clone=editor.canvas.paper.clone();
		clone.attr({
			width:viewWidth,
			height:viewHeight,
			viewBox: ULCx+" "+ULCy+" "+viewWidth+" "+viewHeight});

		var name=editor.name;
		var width=editor.width;
		var height=editor.height;
		var length=editor.length;
		var acreage=editor.acreage;
		var image=clone.toDataURL();
		clone.remove();
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

function savePlanFile(){
	if(curEditor){
		curEditor.canvas.paper.zpd('destroy'); 
		curEditor.canvas.paper.zpd('toggle'); 
		curEditor.canvas.paper.zpd('toggle'); 
		var width=parseInt(curEditor.width)+parseInt(curEditor.wallWidth*2);
		var height=parseInt(curEditor.height)+parseInt(curEditor.wallWidth*2);

		var ULCx=curEditor.offsetX-curEditor.wallWidth;
		var ULCy=curEditor.offsetY-curEditor.wallWidth;
		var UUwidth =width;
		var UUheight=height;
		var clone=curEditor.canvas.paper.clone();
		clone.attr({
			width:width,
			height:height,
			viewBox: ULCx+" "+ULCy+" "+UUwidth+" "+UUheight});
		clone.remove();
		
		var planitem=new Planitem(
				curEditor.name, 
				curEditor.width, 
				curEditor.height,
				curEditor.length,
				curEditor.acreage,
				clone.toDataURL()
				);
		
		var jsonData = JSON.stringify(planitem);
		$.ajax({
			url : contextPath + '/plan/file',
			type : 'post',
			data : jsonData,
			contentType:'application/json',
			success : function(data) {
				console.log(data);
				window.location.assign(contextPath+"/plan/download?filename="+data);
			},
			error : function(data) {
				console.log(data);
				showMsgBar("fail","배치도 이미지 다운로드에 실패하였습니다.");
			}
		});
	}else {
		showMsgBar("fail","먼저 배치도를 추가해 주세요.");
	}
}

function printPlaced(){
	var str = "";
		if(curEditor){
			console.log("있음?");
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
		}
	
		$('.furnitureWrap').html(str);
}

function refreshThumbnail(){
	setTimeout(function() {
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