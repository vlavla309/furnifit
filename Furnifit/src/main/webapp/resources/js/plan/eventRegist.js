$( document ).ready(function(){
	$("#saveBtn").on("click", function(){
		unSelectAll();
		//var data=curEditor.canvas.paper.toDataURL();
		var data=curEditor.canvas.paper.outerSVG();
 
		console.log(data);
		
		var $form = $('<form></form>');
	     $form.attr('action', '/one/plan/test');
	     $form.attr('method', 'post');
	     $form.appendTo('body');
	     
	     //var svg = $('<input type="hidden" value="'+data+'" name="data">');
	     //console.log(svg);
	     $form.append(data);
	     //$form.submit();
	});

	$("#crtBtn").on("click", function(){
		console.log(curEditor.offsetX+" "+curEditor.offsetY);
		curEditor.furniture(curEditor.offsetX, curEditor.offsetY,"bed", 2039);
	});

	$("#clockwiseRotateBtn").on("click", function(){
		var r=45;
		if(selectedElem){
			rotate(selectedElem, r);
			var dir = isCollisionOfWall(selectedElem.getBBox());
			var collisionFurnitures=isCollisionOfFurnitures(target);
			if(dir[0]||dir[1]||dir[2]||dir[3]||collisionFurnitures){
				showMsgBar("fail","주위의 다른 사물 혹은 벽과 충돌합니다.");
				console.log("벽이나 주변 사물과 충돌되어 회전 불가");
				rotate(selectedElem, -r);
			}
		}
	});

	$("#counterclockwiseRotateBtn").on("click", function(){
		var r=-45;
		if(selectedElem){
			rotate(selectedElem, r);
			var dir = isCollisionOfWall(selectedElem.getBBox());
			var collisionFurnitures=isCollisionOfFurnitures(target);
			if(dir[0]||dir[1]||dir[2]||dir[3]||collisionFurnitures){
				showMsgBar("fail","회전 실패, 주위의 다른 사물 혹은 벽과 충돌합니다.");
				console.log("벽이나 주변 사물과 충돌되어 회전 불가");
				rotate(selectedElem, -r);
			}
		}
	});

	$("#deleteBtn").on("click", function(){
		console.log("가구 삭제");
		if(selectedElem){
			curEditor.furnitures.exclude(selectedElem);
			console.log(selectedElem);
			selectedElem.remove();
			selectedElem=null;
		}
		unSelectAll();
	});


	$("#searchToggleBtn").on("click", function(){
		$("#searchWrap").toggle();
	});


	$(document).on("click", ".addFurnitureBtn",function(e){
		e.preventDefault();
		var pid=Number($(this).attr("href"));
		var fur=furnitures.get(pid);
		curEditor.furniture(curEditor.offsetX, curEditor.offsetY, fur);
		showMsgBar("success","가구가 추가되었습니다.");
	});
});