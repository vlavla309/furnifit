<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

  <h2>Ajax Test Page</h2>
  
  <ul id="replies">
  </ul>
  <!-- jQuery 2.1.4 -->
  <script src="${rSrcPath }/jquery-1.11.1.min.js"></script>
  <script>
	var reply_id = 10;

	$.getJSON("/reply/all/" + reply_id, function(data) {
		
		var str = "";
  		console.log(data.length);
  		
  		$(data).each (
  				function() {
  					str += "<li data-article_id='"+this.article_id+"' class='replyLi'>"
  						+ this.article_id + ":" + this.content
  						+ "</li>";
  		});
  		
  		$("#replies").html(str);
  	});
</script>
9
</body>
</html>