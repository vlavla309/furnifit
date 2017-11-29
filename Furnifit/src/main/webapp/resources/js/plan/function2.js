/**
 * 
 */

function writePlan(){
	var plan=new Plan();

	editors.forEach(function(editor, key, map) {
		var name=editor.name;
		var width=editor.width;
		var height=editor.height;
		var length=editor.length;
		var acreage=editor.acreage;

		var planitem=new Planitem(name, width, height, length, acreage);
		plan.planitems.push(planitem);
	});


	var jsonData = JSON.stringify(plan);
	console.log(jsonData);
	$.ajax({
		url : contextPath + '/plan',
		type : 'post',
		data : jsonData,
		dataType: 'json',
		contentType: 'application/json',
		mimeType: 'application/json',
		success : function(data) {
			console.log(data)
		},
		error : function(data) {
			console.log(data)
		}
	});
}