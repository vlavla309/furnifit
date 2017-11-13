<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>product register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="${pageContext.servletContext.contextPath }/resources/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />

<script
	src="${pageContext.servletContext.contextPath }/resources/js/jquery-1.11.1.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>

<script>
	var template = Handlebars.compile($("#template").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;
		alert(files)

		var file = files[0];

		var formData = new FormData();

		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});

	$("#registerForm").submit(
			function(event) {
				event.preventDefault();

				var that = $(this);

				var str = "";
				$(".uploadedList .delbtn").each(
						function(index) {
							str += "<input type='hidden' name='files[" + index
									+ "]' value='" + $(this).attr("href")
									+ "'> ";
						});

				that.append(str);

				that.get(0).submit();
			});

	$(".uploadedList").on("click", ".delbtn", function(event) {

		event.preventDefault();

		var that = $(this);

		$.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("href")
			},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					that.closest("li").remove();
				}
			}
		});
	});
</script>
<body>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">REGISTER PRODUCT</h3>
					</div>
					<!-- /.box-header -->

					<form id='registerForm' role="form" method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="category">category</label> <select name="category">
									<option value="선반">선반</option>
									<option value="쇼파">쇼파</option>
									<option value="식탁">식탁</option>
									<option value="옷장">옷장</option>
									<option value="책상">책상</option>
									<option value="침대">침대</option>
								</select>
							</div>

							<div class="form-group">
								<label for="name">product name</label> <input type="text"
									name="name" class="form-control"
									placeholder="Enter product name...">
							</div>

							<div class="form-group">
								<label for="brand">brand</label> <input type="text" name="brand"
									class="form-control" placeholder="Enter brand...">
							</div>

							<div class="form-group">
								<label for="price">price</label> <input type="text" name="price"
									class="form-control" placeholder="Enter price...">
							</div>

							<div class="form-group">
								<label for="color">color</label> <select name="color">
									<option value="black">black</option>
									<option value="white">white</option>
									<option value="braun">braun</option>
									<option value="walnut">walnut</option>
									<option value="green">green</option>
								</select>
							</div>

							<div class="form-group">
								<label for="width">width</label> <input type="text" name="width"
									class="form-control" placeholder="Enter width...">
							</div>

							<div class="form-group">
								<label for="lenght">lenght</label> <input type="text"
									name="lenght" class="form-control"
									placeholder="Enter lenght....">
							</div>

							<div class="form-group">
								<label for="height">height</label> <input type="text"
									name="height" class="form-control"
									placeholder="Enter height...">
							</div>

							<div class="form-group">
								<label for="description">description</label>
								<textarea class="form-control" name="description" rows="3"
									placeholder="description..."></textarea>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">File DROP Here</label>
								<div class="fileDrop"></div>
							</div>
						</div>

						<!-- /.box-body -->

						<div class="box-footer">
							<div>
								<hr>
							</div>

							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>

							<button type="submit" class="btn btn-primary">Submit</button>

						</div>
					</form>


				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>


<%@include file="../include/footer.jsp"%>
