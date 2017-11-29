/**
 * 배치도 항목 도메인
 */
function Planitem(name, width, height, length, acreage, image){
	this.planitemId;
	this.planId;
	this.name=name;
	this.width=width;
	this.height=height;
	this.length=length;
	this.acreage=acreage;
	this.image=image;
	this.furnitures=new Array();
}

