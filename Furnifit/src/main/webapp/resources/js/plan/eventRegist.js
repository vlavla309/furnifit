$( document ).ready(function(){
	$("#saveBtn").on("click", function(){
		savePlanFile();
	});
	
	$("#resetBtn").on("click", function(){
		alert("미구현ㅎㅎ");
	});

	$("#clockwiseRotateBtn").on("click", function(){
		var r=45;
		if(selectedElem){
			rotate(selectedElem, r);
			var dir = isCollisionOfWall(selectedElem.getBBox());
			var collisionFurnitures=isCollisionOfFurnitures(target);
			if(dir[0]||dir[1]||dir[2]||dir[3]||collisionFurnitures){
				showMsgBar("fail","주위의 다른 사물 혹은 벽과 충돌합니다.");
				rotate(selectedElem, -r);
			}
			refreshThumbnail();
		}
	});

	$("#counterclockwiseRotateBtn").on("click", function(){
		var r=-45;
		if(selectedElem){
			if(selectedElem.hasClass("furniture")){
				rotate(selectedElem, r);
				var dir = isCollisionOfWall(selectedElem.getBBox());
				var collisionFurnitures=isCollisionOfFurnitures(target);
				if(dir[0]||dir[1]||dir[2]||dir[3]||collisionFurnitures){
					showMsgBar("fail","회전 실패, 주위의 다른 사물 혹은 벽과 충돌합니다.");
					console.log("벽이나 주변 사물과 충돌되어 회전 불가");
					rotate(selectedElem, -r);
				}
				refreshThumbnail();
			}
			
		}
	});

	$("#deleteBtn").on("click", function(){
		console.log("가구 삭제");
		if(selectedElem){
			if(selectedElem.hasClass("furniture")){
				curEditor.furnitures.exclude(selectedElem);
				console.log(selectedElem);
				selectedElem.remove();
				selectedElem=null;
				refreshThumbnail();
			}
			unSelectAll();
			printPlaced();
		}
	});


	$("#searchToggleBtn").on("click", function(){
		$("#searchWrap").toggle();
	});


	$(document).on("click", ".addFurnitureBtn",function(e){
		e.preventDefault();
		var pid=Number($(this).attr("href"));
		var fur=furnitures.get(pid);
		if(fur&&curEditor){
			//curEditor.startPlace(fur);
			curEditor.furniture(curEditor.offsetX, curEditor.offsetY, fur);
			showMsgBar("success","가구가 추가되었습니다.");
			printPlaced();
			refreshThumbnail();
		}else{
			showMsgBar("fail","먼저 배치도를 추가해 주세요.");
		}
	});
	
	$(document).on("click", ".placedItemBtn",function(e){
		e.preventDefault();
		var targetId=$(this).attr("href");
		curEditor.furnitures.forEach(function(furniture){
			var id=furniture.id;
			if(id==targetId){
				unSelectAll();
				select(furniture);
				return false;
			}
		});
	});
	
	
	$(document).on("click", "#downBtn a",function(e){
		e.preventDefault();
		var furVal=$("#furnitureInfoWrap").css("display");
		if(furVal=="inline-flex"){
			$("#furnitureInfoWrap").hide();
			setFooterBtnUp();
		}else {
			$("#furnitureInfoWrap").show().css("display", "inline-flex");
			setFooterBtnDown();
		}
	});
	
	
	$(document).on("mouseenter mouseleave", ".planitem", function(){
		$(this).children(".removeBtn").toggle();
	});
	
	$(document).on("click", ".planitem .removeBtn a", function(){
		var id=$(this).attr("href");
		delPlanItem(id);
	});
	
});