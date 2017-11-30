/**
 * 가구 도메인
 */

function Furniture(id,category,name,brand,price,color,width,length,height, imgPath, description){
	this.productId=id;  // 테이블 column :  product_id 
	this.category=category;  // 선반, 쇼파, 식탁, 옷장, 책상, 침대
	this.name = name; //상품명 
	this.brand = brand;  //일룸, 까사미아, 이케아
	this.price = price; //상품가격 
	this.color =color;  //black, white, braun , walnut, green
	this.width = width; //가로
	this.height = height; //세로
	this.length = length; //높이
	this.imgPath = imgPath; //상품 사진
	this.description = description;
}

Furniture.prototype.toString = function (){
	return "Furniture ["+this.productId+", "
	+this.category+", "
	+this.name+", "
	+this.brand+", "
	+this.price+", "
	+this.width+", "
	+this.height+", "
	+this.length+", "
	+this.imgPath+", "
	+"]";
}