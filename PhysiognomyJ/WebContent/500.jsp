<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- Bootstrap 3.3.7 -->
<link
	href="./AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="./AdminLTE/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Ionicons -->
<link href="./AdminLTE/bower_components/Ionicons/css/ionicons.min.css"
	rel="stylesheet">
<!-- jvectormap -->
<link
	href="./AdminLTE/bower_components/jvectormap/jquery-jvectormap.css"
	rel="stylesheet">
<!-- Theme style -->
<link href="./AdminLTE/dist/css/AdminLTE.min.css" rel="stylesheet">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link href="./AdminLTE/dist/css/skins/_all-skins.min.css"
	rel="stylesheet">

<link href="./Home/style2.css" rel="stylesheet">
<link href="./Home/style-ie.css" rel="stylesheet">
<link id="hli-style-css" href="./Home/style.css" rel="stylesheet"
	type="text/css" media="all">
<link id="ubermenu-css" href="./Home/ubermenu.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="./Plugins/switch/bootstrap-switch.min.css" rel="stylesheet"
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
	<jsp:include page="./top.jsp"></jsp:include>
	<!-- Content Wrapper. Contains page content -->
	<div class="content" style="padding-top: 150px;">
		<!-- Main content -->
		<section class="content">

			<div class="error-page">
				<h2 class="headline text-red">500</h2>

				<div class="error-content">
					<h3>
						<i class="fa fa-warning text-red"></i> Oops! Something went wrong.
					</h3>

					<p>
						We will work on fixing that right away. Meanwhile, you may <a
							href="./index">return to home</a>.
					</p>
				</div>
			</div>
			<!-- /.error-page -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>