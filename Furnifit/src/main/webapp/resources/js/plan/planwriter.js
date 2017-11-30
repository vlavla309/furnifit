/**
 */
var ZOOM_SCALE=0.2; //0.2배씩


var selectedElem; //현재 선택된 엘레먼트
var planCount=1; //작성중인 배치도 ID 시퀀스
var editors; //작성중인 배치도 편집기 목록
var curEditor; //현재 작성중인 배치도 편집기
var furnitures;  //로드된 상품 목록\

$( function() {
	//초기화!!!
	editors= new Map();
	furnitures = new Map();
	
	// 새 배치도 작성폼 다이얼로그 
	var newPlanDlg = $( "#newPlanForm" ).dialog({
		autoOpen: false,
		modal: true,
		buttons: {
			Add: function() {
				var planid=addPlanItem();
				selectPlan(planid);
				refreshThumbnail();
				$( this ).dialog( "close" );
			},
			Cancel: function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			form[ 0 ].reset();
		}
	});

	// AddTab form: calls addTab function on submit and closes the dialog
	var form = newPlanDlg.find( "form" );

	// 새 배치도 작성폼 버튼
	$( "#newPlanBtn" ).button().on( "click", function() {
		newPlanDlg.dialog( "open" );
	});

	// 배치도 목록 화면 영역 토글 버튼 이벤트 처리
	$("#leftToggleBtn").on("click", function() {
		//$("#planitemsTabs").toggle("fold", "linear", changeDirection(this));
		$("#planitemTabs").toggle(changeDirection(this));
		//$("#planitemTabs").toggle("slide", { direction: "left" }, changeDirection(this));
	});
	
	
	//배치도 리스트 항목 버튼 이벤트 처리
	$("#planitems").on("click", ".planitem a",function(evt){
		evt.preventDefault();
		var pid=$(this).attr("href");
		$(".editorContainer").removeClass("active");
		$("#editorContainer-"+pid).addClass("active");
		
		var id=parseInt(pid)
		curEditor=editors.get(id);
		printPlaced();
	});
	
	
	$( function() {
	    $( "#rightTabs" ).tabs();
	  } );
	
	// 상품 카테고리 탭 영역 토글 버튼 이벤트처리
	$( "#rightToggleBtn" ).on( "click", function() {
		$( "#rightTabs" ).toggle(changeDirection(this));
	});
	/*----------------------상품 카테고리 탭 끝!!!----------------------*/
	
	/*상품 검색 ui 아코디언*/
	$( "#searchAccodian" ).accordion({
		heightStyle: "content",
		collapsible: true,
		icons: false,
		beforeActivate:function(e,ui){
			console.log("아코디언ㅎㅎㅎ");
			console.log(ui.newHeader);
			console.log(ui.oldHeader);
			
			ui.newHeader.children().toggleClass("fa-angle-double-down fa-angle-double-up");
			ui.oldHeader.children().toggleClass("fa-angle-double-down fa-angle-double-up");
			//ui.newHeader.children().addClass("fa-angle-double-down");

		}
	});
	
	
	
	// 새 배치도 작성 등록 폼 다이얼로그 
	var writePlanDlg = $( "#writePlanForm" ).dialog({
		autoOpen: false,
		modal: true,
		buttons: {
			Add: function() {
				unSelectAll();
				writePlan();
				$( this ).dialog( "close" );
			},
			Cancel: function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			form[ 0 ].reset();
		}
	});

	$("#writeBtn").on("click", function(){
		if(editors.size<1){
			showMsgBar("fail","작성 중인 배치도 항목이 존재하지 않습니다.");
			return false;
		}
		writePlanDlg.dialog( "open" );
	});
	
} );

function changeDirection(target) {
	var val = $(target).children();
	val.toggleClass("fa-angle-double-right");
	val.toggleClass("fa-angle-double-left");
}


function addPlanItem(){
	var id=planCount++;
	
	var planName=$("#planName").val();
	var planWidth=Number($("#planWidth").val());
	var planHeight=Number($("#planHeight").val());
	var planLength=Number($("#planLength").val());
	
	
	var planitemThumbStr="<li><div class='planitem' id='planitem-"+id+"'><div class='removeBtn'>";
	planitemThumbStr+="<a href='"+id+"'><i class='fa fa-times' aria-hidden='true'></i></a>";
	planitemThumbStr+="</div><div class='imgWrap'><a href='"+id+"'>"
	planitemThumbStr+="<img src='#' art='"+planName+"'>";
	planitemThumbStr+="</a></div>";
	planitemThumbStr+="<div class='nameWrap'><span>"+planName+"<span></div>";
	planitemThumbStr+="</div></li>";
	$("#planitems").append(planitemThumbStr);
	

	var planStr="<div id='editorContainer-"+id+"' class='editorContainer'>";
	planStr +="<svg width='"+(planWidth+160+28)+"' height='"+(planHeight+160+28)+"'>";
	planStr +="<g class='editor'>";
	planStr +="</g>";
	planStr +="</svg>";
	
	$("#editorWrap").append(planStr);
	
	var editor=new Editor();
	editor.init(id, ZOOM_SCALE);
	editors.set(id, editor);
	var width=$("#planWidth").val();
	var height=$("#planHeight").val();
	var length=$("#planLength").val();
	
	editor.room(planName,width, height, length);
	return id;
}

function delPlanItem(id){
	editors.delete(parseInt(id));
	curEditor=null;
	printPlaced();
	$("#editorContainer-"+id).remove();
	$("#planitem-"+id).remove();
}

function selectPlan(id){
	$(".planitem .imgWrap a[href="+id+"]").trigger("click");
}

function setFurnitureInfo(){
	var productId=Number(selectedElem.data("productId"));
	var furniture=furnitures.get(productId);
	//console.log(furniture.toString());
	$("#furnitureInfoWrap .imgWrap a").attr("href", contextPath+"/product/"+furniture.productId);
	$("#furnitureInfoWrap .imgWrap a img").attr("src", furniture.imgPath);
	$("#furnitureInfoWrap .infoWrap .category").text(furniture.category);
	$("#furnitureInfoWrap .infoWrap .name").html("<strong>"+furniture.name+"</strong>");
	$("#furnitureInfoWrap .infoWrap .brand").text(furniture.brand);
	$("#furnitureInfoWrap .infoWrap .size").text(furniture.width+"*"+furniture.height+"*"+furniture.length +"(가로*세로*높이)");
	$("#furnitureInfoWrap .descWrap .description").text(furniture.description);
	
}

