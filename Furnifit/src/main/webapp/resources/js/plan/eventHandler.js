
/*------------- 가구 클릭 이벤트 핸들러 시작!--------------*/
function select(target){
	selectedElem=target;
	
	if(selectedElem.hasClass("furniture")){
		selectedViewbox=target.parent().parent(); // 선택된 가구의 뷰박스 획득
		setFurnitureInfo();
		target.attr({strokeWidth: 4}); 
		$("#furnitureInfoWrap").show().css("display", "flex");
	}
}

function unSelectAll(){
	$("#furnitureInfoWrap").hide();
	selectedElem=null;
	curEditor.furnitures.attr({
		strokeWidth: 0 // CamelCase...
	});
}

function hIn(){
	this.attr("strokeWidth", 4);
}

function hOut(){
	if(selectedElem!=this)
		this.attr("strokeWidth", 0);
}


/*------------- 드래그 이벤트 핸들러 시작!--------------*/
function dragStart(x,y,e) {
	curEditor.canvas.paper.zpd('toggle');
	selectedViewbox=this.parent().parent(); //선택된 가구의 에디터 정보 가져오기
	origTransform = this.transform().local;//기존 트랜스폼 명령
	savedTransform = this.transform().local;//기존 트랜스폼 명령
	target=this;
	ox=0;
	oy=0;
}

function dragMove(dx, dy, x, y, e) {
	var m = selectedViewbox.transform().localMatrix; 
	mx=dx;
	my=dy;
	if(m){
		mx = dx/m.a;
		my = dy/m.d;
	};

	//드래그 대상이 벽과 충돌인지 체크
	dir = isCollisionOfWall(target.getBBox());
	var n=dir[0];
	var e=dir[1];
	var s=dir[2];
	var w=dir[3];
	//console.log(dir);

	if(n&&s)my=oy;
	else if(n){
		if(my<0)my=oy;
	}else if(s){
		if(my>0)my=oy;
	}

	if(e&&w)mx=ox;
	else if(e){
		if(mx>0)mx=ox;
	}else if(w){
		if(mx<0)mx=ox;
	}
	var pos=[mx, my];

	this.attr({transform: origTransform + (origTransform ? "T" : "t") + pos});

	ox=mx;
	oy=my;
}

function dragDrop(x,y) {
	/*adjust inside walls*/
	while(dir[0] || dir[1] || dir[2] || dir[3]){
		if(dir[0])my++;
		if(dir[1])mx--;
		if(dir[2])my--;
		if(dir[3])mx++;

		target.attr({transform: origTransform + (origTransform ? "T" : "t") + [mx, my]});
		dir = isCollisionOfWall(target.getBBox());
	}

	/*collision check*/
	var collisionFurnitures=isCollisionOfFurnitures(target);

	if(collisionFurnitures){
		console.log("겹침");
		this.attr({
			transform: savedTransform
		});
	}

	curEditor.canvas.paper.zpd('toggle');
}
/*------------- 드래그 이벤트 핸들러 끝!--------------*/

/*Collision Detect*/
function hasCollision(target, set){
	var result=false;
	var pathTarget;
	if(target.node.nodeName=="path"){
		pathTarget=target.clone();
	}else {
		pathTarget=getPath(target);
	}

	var pathSet=Snap.set();
	set.forEach(function(elem, i) {
		if(target!=elem){
			if(elem.node.nodeName=="path"){
				pathElem=elem.clone();
			}else {
				pathElem=getPath(elem);
			}
			pathSet.push(pathElem);
			var interSection=Snap.path.intersection(pathElem, pathTarget);

			if(interSection.length > 0){
				result = true;
				return;
			}
		}
	});

	//pathTarget.remove();
	//pathSet.remove();

	return result;
}
/* Check. Is Collision of Furnitures */
function isCollisionOfFurnitures(target){
	//console.log(target);
	var resultEdge=false;
	var resultPoint=false;
	var pathTarget=getPath(target);

	var vertexTarget=getVertex(target[0]);
	var pathSet=Snap.set();

	//배치도 가구들마다 충돌 체크
	curEditor.furnitures.forEach(function(elem, i) {
		console.log("fur"+i)
		if(target!=elem){
			pathElem=getPath(elem);
			pathSet.push(pathElem);

			console.log(pathElem);
			//드래그 대상의 꼭지점이 다른 가구의 영역에 포함 되는지 확인
			vertexTarget.forEach(function(pos, j) {
				if(resultPoint)return false;
				resultPoint=Snap.path.isPointInside(pathElem, pos.x, pos.y);
			});
			if(resultPoint)return;
			
			//다른가구의 꼭지점이 드래그 대상 영역에 포함되는지 확인
			var vertextElem=getVertex(elem[0]);
			vertextElem.forEach(function(pos, j) {
				if(resultPoint)return false;
				resultPoint=Snap.path.isPointInside(pathTarget, pos.x, pos.y);
			});
			if(resultPoint)return;
			
			
			var interSection=Snap.path.intersection(pathElem, pathTarget);
			//console.log(interSection);
			if(interSection.length > 0){
				resultEdge = true;
				return;
			}
		}
	});
	
	

	//pathTarget.remove();
	//pathSet.remove();

	return resultEdge || resultPoint;
}

function isCollisionOfWall(target){
	var north;
	var east;
	var south;
	var west;

	var bbox=curEditor.wallNorth.getBBox();
	north =Snap.path.isBBoxIntersect(bbox, target);

	bbox=curEditor.wallEast.getBBox();
	east =Snap.path.isBBoxIntersect(bbox, target);

	bbox=curEditor.wallSouth.getBBox();
	south =Snap.path.isBBoxIntersect(bbox, target);

	bbox=curEditor.wallWest.getBBox();
	west =Snap.path.isBBoxIntersect(bbox, target);

	return [north, east, south, west];	

	if(north && east && south && west)return "none";
	else if(east && south && west)return "n";
	else if(north && south && west)return "e";
	else if(north && east && west)return "s";
	else if(north && east && south)return "w";

	return "both";
}


/* Get Path by Element*/
function getPath(target){
	var shape=target.node.nodeName;
	var path;
	if(shape=="path"){
		path=target;
	}else if(shape=="rect"){
		path=rect2Path(target);
	}else if(shape=="g"){
		path=g2Path(target);
	}

	return path;
}

/*--- Element 2 Path ------*/
//사각형을 Path로 변환
function rect2Path(target){
	var m=target.transform().localMatrix;
	var x=Number(target.attr("x"));
	var y=Number(target.attr("y"));
	var w=Number(target.attr("width"));
	var h=Number(target.attr("height"));

	var posA=new Coordinate(m.x(x,y), m.y(x,y));
	var posB=new Coordinate(m.x(x+w,y), m.y(x+w,y));
	var posC=new Coordinate(m.x(x+w,y+h), m.y(x+w,y+h));
	var posD=new Coordinate(m.x(x,y+h), m.y(x,y+h));

	var pathStr="M"+posA.x+" "+posA.y;
	pathStr+=" L"+posB.x+" "+posB.y;
	pathStr+=" L"+posC.x+" "+posC.y;
	pathStr+=" L"+posD.x+" "+posD.y;
	pathStr+=" L"+posA.x+" "+posA.y;
	pathStr+=" Z";
	
	var path=curEditor.canvas.path(pathStr).attr({
		//stroke:"#888",
		fill : "none"
	});

	return path;
}

//g(가구)를 Path로 변환
function g2Path(target){
	var m=target.transform().localMatrix;
	target=target[0];
	var x=Number(target.attr("x"));
	var y=Number(target.attr("y"));
	var w=Number(target.attr("width"));
	var h=Number(target.attr("height"));

	var posA=new Coordinate(m.x(x,y), m.y(x,y));
	var posB=new Coordinate(m.x(x+w,y), m.y(x+w,y));
	var posC=new Coordinate(m.x(x+w,y+h), m.y(x+w,y+h));
	var posD=new Coordinate(m.x(x,y+h), m.y(x,y+h));

	var pathStr="M"+posA.x+" "+posA.y;
	pathStr+=" L"+posB.x+" "+posB.y;
	pathStr+=" L"+posC.x+" "+posC.y;
	pathStr+=" L"+posD.x+" "+posD.y;
	pathStr+=" L"+posA.x+" "+posA.y;
	pathStr+=" Z";

	var path=curEditor.canvas.path(pathStr).attr({
		//stroke:"#888",
		fill : "none"
	});

	return path;
}

//사각형 꼭지점 네 좌표 반환
function getVertex(target){
	var m=target.parent().transform().localMatrix;
	var x=Number(target.attr("x"));
	var y=Number(target.attr("y"));
	var w=Number(target.attr("width"));
	var h=Number(target.attr("height"));

	var posA=new Coordinate(m.x(x,y), m.y(x,y));
	var posB=new Coordinate(m.x(x+w,y), m.y(x+w,y));
	var posC=new Coordinate(m.x(x+w,y+h), m.y(x+w,y+h));
	var posD=new Coordinate(m.x(x,y+h), m.y(x,y+h));
	
	return [posA, posC, posB, posD];
}