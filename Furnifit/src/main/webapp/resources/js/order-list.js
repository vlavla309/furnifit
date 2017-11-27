$(function() {
	// 아코디언 (order-list, plan-manage 사용)
	$("dd:not(:first)").css("display", "none");		//첫번째 dd를 제외한 나머지 dd는 숨김
	
	$("dl dt").click(function() {					//클릭시 해당 내용 보여주기
		if ($("+dd", this).css("display") == "none") {
			$("dd").slideUp("slow");
			$("+dd", this).slideDown("slow");
			$("dt").removeClass("selected");
			$(this).addClass("selected");
		}
	}).mouseover(function() {
		$(this).addClass("over");
	}).mouseout(function() {
		$(this).removeClass("over");
	});
});