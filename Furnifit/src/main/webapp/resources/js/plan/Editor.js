/**
 * 배치도 화면 클래스
 */
function Editor( ){
	this.canvas;
	this.room;
	this.furnitures;
	this.wallHorizon;
	this.wallVertical;
	this.wallNorth;
	this.wallEast;
	this.wallSouth;
	this.wallWest;
	this.scale=1;
	this.offsetX=80;
	this.offsetY=80;
	
	this.name;
	this.width;
	this.height;
	this.length;
}

/* 배치도 객체 초기화 */
Editor.prototype.init = function (id, zoomScale){
	this.canvas = Snap("#editorContainer-"+id+" .editor");
	var paper = (this.canvas).paper;
	 var applyZpd = function() {
		 paper.zpd({
			 zoomscale : zoomScale,
			 zoomThreshold: [0.4, 1.8],
			 drag: false
		 });
     };
     // Zpd 플러그인 초기화
     applyZpd();
     
     //배치된 가구리스트 집합
     this.furnitures=Snap.set();
     
     //벽 집합
     this.wallHorizon=Snap.set();
     this.wallVertical=Snap.set();
     
}

/* 배치도에 새 가구 생성 */
Editor.prototype.room = function(name,width,height,length){
	this.name=name;
	this.width=width;
	this.height=height;
	this.length=length;
	
	var x=80; //방 렌더링 시작 위치;
	var y=80; //방 렌더링 시작 위치;
	var w=width*this.scale;
	var h=height*this.scale;
	var wallWidth=14*this.scale;

	var pathStr="M"+x+" "+y;
	pathStr+=" L"+(x+w)+" "+y;
	pathStr+=" L"+(x+w)+" "+(y+h);
	pathStr+=" L"+(x)+" "+(y+h);
	pathStr+=" L"+x+" "+y;
	pathStr+=" Z";
	var path=this.canvas.path(pathStr).attr({
		"fill": "none",
		stroke: "#5D5D5D",
		strokeWidth: 0
	});
	
	
	
	var encData="data:image/png;base64,";
	var image=this.canvas.image(encData, x, y ,w, h);
	//var canvas=this.canvas;
	
	getImageBase64(planImgPath+"/floor10.jpg", function (data) {
		encData+=data;
		loop=false;
		image.attr("href", encData);
	});

	
	var horizonGradient = this.canvas.paper.gradient("l(0, 0, 0, 1)#BDBDBD-#CFCFCF-#BDBDBD");
	var verticalGradient = this.canvas.paper.gradient("l(0, 1, 1, 1)#BDBDBD-#CFCFCF-#BDBDBD");
	
	//북쪽 벽
	pathStr="M"+x+" "+y;
	pathStr+=" L"+(x+w)+" "+y;
	pathStr+=" L"+(x+w+wallWidth)+" "+(y-wallWidth);
	pathStr+=" L"+(x-wallWidth)+" "+(y-wallWidth);
	pathStr+=" L"+x+" "+y;

	this.wallNorth=this.canvas.path(pathStr);
	this.wallHorizon.push(this.wallNorth);

	//동쪽 벽
	pathStr =" M"+(x+w)+" "+y;
	pathStr+=" L"+(x+w)+" "+(y+h);
	pathStr+=" L"+(x+w+wallWidth)+" "+(y+h+wallWidth);
	pathStr+=" L"+(x+w+wallWidth)+" "+(y-wallWidth);
	pathStr+=" L"+(x+w)+" "+y;
	
	this.wallEast=this.canvas.path(pathStr);
	this.wallVertical.push(this.wallEast);
	
	//남쪽 벽
	pathStr="M"+x+" "+(y+h);
	pathStr+=" L"+(x+w)+" "+(y+h);
	pathStr+=" L"+(x+w+wallWidth)+" "+(y+h+wallWidth);
	pathStr+=" L"+(x-wallWidth)+" "+(y+h+wallWidth);
	pathStr+=" L"+x+" "+(y+h);
	
	this.wallSouth=this.canvas.path(pathStr);
	this.wallHorizon.push(this.wallSouth);
	
	
	//서쪽 벽
	pathStr="M"+x+" "+y;
	pathStr+=" L"+x+" "+(y+h);
	pathStr+=" L"+(x-wallWidth)+" "+(y+h+wallWidth);
	pathStr+=" L"+(x-wallWidth)+" "+(y-wallWidth);
	pathStr+=" L"+x+" "+y;
	
	this.wallWest=this.canvas.path(pathStr);
	this.wallVertical.push(this.wallWest);
	
	
	
	this.wallVertical.attr({
		fill : verticalGradient,
		stroke: "#666",
		strokeWidth: 0.5,
		strokeOpacity : 0.9
	});
	
	this.wallHorizon.attr({
		fill : horizonGradient,
		stroke: "#666",
		strokeWidth: 0.5,
		strokeOpacity : 0.9
	});
	
	this.room=this.canvas.g(path, image, this.wallNorth,this.wallEast,this.wallSouth,this.wallWest).addClass("room");
	this.room.click(function(){
		unSelectAll();
		select(this);
	});
	
	var bbox=path.getBBox();
	//console.log(bbox);
	var textWidth=80;
	var textHeight=15;
	var tpA=new Coordinate((bbox.cx-textWidth), (bbox.cy-textHeight));
	var tpB=new Coordinate((bbox.cx+textWidth), (bbox.cy-textHeight));
	var tpC=new Coordinate((bbox.cx+textWidth), (bbox.cy+textHeight));
	var tpD=new Coordinate((bbox.cx-textWidth), (bbox.cy+textHeight));
	
	pathStr="M"+tpA.x+" "+tpA.y;
	pathStr+=" L"+tpB.x+" "+tpB.y;
	pathStr+=" L"+tpC.x+" "+tpC.y;
	pathStr+=" L"+tpD.x+" "+tpD.y;
	pathStr+=" L"+tpA.x+" "+tpA.y;
	pathStr+=" Z";
	

	console.log(encData);
	var t1 = this.canvas.text(bbox.cx, bbox.cy, this.name);
	t1.attr({"font-size":35});
	/*console.log(t1);
	console.log(t1.node);
	console.log(t1.node.clientWidth);*/
}

/* 배치도에 새 가구 생성 */
Editor.prototype.furniture= function(x,y,target){
	//console.log(target.toString());
	var furniture;
	var width = target.width * this.scale;
	var height = target.height * this.scale;
	var length = target.length * this.scale;
	var color= target.color;
	var imgPath=planImgPath+"/"+color+"/";
	
	switch(target.category){
	case "침대":
		if(target.width>130)imgPath+="bed_big.png";
		else imgPath+="bed_small.png";
		break;
	case "선반":
		imgPath+="shelf.png";
		break;
	case "쇼파":
		if(target.width>80)imgPath+="sofa_big.png";
		else imgPath+="sofa_small.png";
		break;
	case "옷장":
		imgPath+="closet.png";
		break;
	case "책상":
		imgPath+="desk.png";
		break;
	case "식탁":
		imgPath+="kitchentable.png";
		break;
	}
	
	var rect=this.canvas.rect(x, y, width, length).attr("fill", "none");
	
	
	var encData="data:image/png;base64,";
	var image=this.canvas.image(encData, x, y , width, length);
	
	getImageBase64(imgPath, function (data) {
		encData+=data;
		image.attr("href", encData);
	});
	
	furniture=this.canvas.g(rect,image).attr({
		stroke: "#6799FF",
		strokeWidth: 0,
		class: "furniture"}
	).data("productId", target.productId).transform("");

	//클릭 이벤트 등록
	furniture.mousedown(function(){
		unSelectAll();
	});
	
	furniture.mouseup(function(){
		select(this);
	});

	//드래그 이벤트 등록
	furniture.drag(dragMove, dragStart,dragDrop);
	furniture.hover(hIn, hOut);
	this.furnitures.push(furniture);
	return furniture;
}


