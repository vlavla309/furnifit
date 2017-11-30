/**
 * 배치도 화면 클래스
 */
function Editor(){
	this.id;
	this.canvas;
	this.room;
	this.furnitures;
	
	this.wallWidth=14;
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
	this.acreage;
	
}

/* 배치도 객체 초기화 */
Editor.prototype.init = function (id, zoomScale){
	this.id=id;
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
     
 	this.originZpdMatrix=paper.zpd('save');
     
     //배치된 가구리스트 집합(화면);
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
	this.acreage=getAcreage(width, height); 
		
	var x=80; //방 렌더링 시작 위치;
	var y=80; //방 렌더링 시작 위치;
	var w=width*this.scale;
	var h=height*this.scale;
	var wallWidth=this.wallWidth*this.scale;

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
	
	getImageBase64(planImgPath+"/floor16.jpg", function (data) {
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
	var t1 = this.canvas.text(bbox.cx, bbox.cy, this.name+"("+this.acreage+"평)");
	t1.attr({"font-size":28});
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
	case "쇼파":case "소파":
		if(target.width>80)imgPath+="sofa_big.png";
		else imgPath+="sofa_small.png";
		break;
	case "옷장":
		imgPath+="closet.png";
		break;
	case "책상":
		imgPath+="desk1.png";
		break;
	case "식탁":
		imgPath+="kitchentable.png";
		break;
	case "의자":
		imgPath+="chair.png";
		break;
		
	}
	
	var rect=this.canvas.rect(x, y, width, height).attr("fill", "none");
	
	
	var encData="data:image/png;base64,";
	var image=this.canvas.image(encData, x, y , width, height);
	
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

/* 배치도에 새 가구 생성 위치 잡기 */
Editor.prototype.startPlace= function(target){
	var width = target.width * this.scale;
	var height = target.height * this.scale;
	
	var rect=this.canvas.rect(0, 0, width, height).attr({
		fill:"none",
		stroke: "#6799FF",
		strokeWidth: 4
		}); 
	 var dx,dy;
	this.canvas.paper.mousemove(function(ev, x, y){
		var m = rect.parent().parent().transform().localMatrix; 
		mx=ev.offsetX-(width/2);
		my=ev.offsetY-(height/2);
		
		if(m){
			m=m.invert();
			mx=m.x(mx,my);
			my=m.y(mx,my);
		};
		rect.attr({x:mx, y:my})
		dx=mx;
		dy=my;
	});
	this.room.unclick();
	var canvas=this;
	this.room.click(function(){
		var furniture=canvas.furniture(dx,dy,target);
		
		curEditor.room.unclick();
		curEditor.room.click(function(){
			unSelectAll();
			select(this);
		});
		
		rect.remove();
		printPlaced();
	});
	
	

}
