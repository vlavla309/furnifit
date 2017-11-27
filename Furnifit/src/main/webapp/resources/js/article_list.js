$(document).ready(function() {

	var acreage = $('input[name=acreage]').val();
	var sort = $('input[name=sort]').val();
	
	$("#acreage").val(acreage).prop("selected", true);
	$("#sort").val(sort).prop("selected", true);

	$("#sort").on("change", function() {
		$("form[name=listForm]").submit();
	});

	$("#acreage").on("change", function() {
		$("form[name=listForm]").submit();
	});

});
