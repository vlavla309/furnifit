	$(function() {
		$(document).on("click", ".wishdeletebtn", function(event) {
			event.preventDefault();
			var wishdeletebtn = $(this);
			var productId = $(this).attr("href");
			$.ajax({
				url : contextPath+'/wishlist/' + productId,
				type : 'DELETE',
				success : function(data) {
					alert("삭제성공")
					wishdeletebtn.parent().parent().parent().parent().remove()
				},
				error : function(data) {
					console.log(data)
				}
			});
		});
	});