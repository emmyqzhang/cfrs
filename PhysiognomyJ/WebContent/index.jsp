<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./Home/bootstrap.min.css" rel="stylesheet">
<link href="./Home/style2.css" rel="stylesheet">
<link href="./Home/style-ie.css" rel="stylesheet">
<link id="hli-style-css" href="./Home/style.css" rel="stylesheet"
	type="text/css" media="all">
<link id="ubermenu-css" href="./Home/ubermenu.min.css" rel="stylesheet"
	type="text/css" media="all">

<style id="ubermenu-custom-generated-css">
.ubermenu-main .ubermenu-item-level-0>.ubermenu-target {
	color: #253847;
}

.ubermenu-main .ubermenu-submenu.ubermenu-submenu-drop {
	background-color: #47b7cd;
	border: 1px solid #47b7cd;
	color: #ffffff;
}

.ubermenu .ubermenu-submenu.ubermenu-submenu-id-274 {
	width: 0px;
	min-width: 0px;
}
</style>
</head>
<body>
	<div>
		<img class="parallax-slider" src="./Home/bg.jpg"
			style="transform: translate3d(0px, 0px, 0px); position: absolute; height: 100%; width: 100%; max-width: none;">
	</div>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container">
		<div
			style="height: 40px; bottom: 50px; right: 100px; position: absolute; z-index: 0;">
			<div class="row">
				<div class="form-inline">
					<form action="analyze" enctype="multipart/form-data" method="post">
						<input type="text" id="filepath" onclick="image.click()"
							class="form-control" readonly="readonly" style="width: 250px;"
							value="Upload Your Photo">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-default"
							style="height: 40px; width: 100px; font-size: 18px;">Start</button>
						<input type="file" name="image" id="image"
							onchange="filepath.value=this.value" style="display: none">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>