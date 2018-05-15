<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="emmy.physiognomy.model.*"%>

<%
	AnalyzeResult analyzeResult = (AnalyzeResult) session.getAttribute("analyzeResult");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<!-- Tell the browser to be responsive to screen width -->
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->


<style type="text/css">
.align-center {
	position: fixed;
	left: 50%;
	top: 50%;
	margin-left: width/2;
	margin-top: height/2;
}
</style>

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

@font-face {
	font-family: myFont;
	src: url('Font/calligraphy.ttf');
}
</style>

</head>

<body>
	<jsp:include page="./top.jsp"></jsp:include>
	<!-- Content Wrapper. Contains page content background-color: #ecf0f5; -->
	<div style="padding-top: 150px;">
		<!-- Main content -->
		<!-- Info boxes -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-4">
						<img height="960" width="720"
							src="./uploadImages/<%=analyzeResult.getPhysiognomyData().getFolderName()%>/<%=analyzeResult.getPhysiognomyData().getFilename()%>">
					</div>
					<div class="col-md-1"></div>
					<!-- /.col -->
					<div id="cn" class="col-md-6"
						style="font-family: myFont; font-size: 30px; writing-mode: tb-rl; height: 600px;">
						<%
							out.print(analyzeResult.getStatementCN1() + "<br><br>");
							out.print(analyzeResult.getStatementCN2() + "<br><br>");
							out.print(analyzeResult.getStatementCN3());
						%>
					</div>
					<div id="en" class="col-md-6"
						style="font-size: 28px; height: 600px; display: none;">
						<%
							if (analyzeResult.getStatementEN1() != null && analyzeResult.getStatementEN2() != null
									&& analyzeResult.getStatementEN3() != null) {
								out.print(analyzeResult.getStatementEN1() + "<br><br>");
								out.print(analyzeResult.getStatementEN2() + "<br><br>");
								out.print(analyzeResult.getStatementEN3());
							} else {
								out.print("<br><br><br><br>COMING SOON !");
							}
						%>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>

	<div class="container">
		<div
			style="height: 40px; top: 150px; right: 100px; position: absolute; z-index: 0;">
			<div class="row">
				<input type="checkbox" name="my-checkbox">
			</div>
		</div>
	</div>

	<div class="container">
		<div
			style="height: 40px; bottom: 50px; right: 100px; position: absolute; z-index: 0;">
			<div class="row">
				<div class="form-inline">
					<a class="btn btn-default"
						style="height: 40px; width: 100px; font-size: 18px; color: #444"
						href="index">Home</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
						class="btn btn-default"
						style="height: 40px; width: 180px; font-size: 18px; color: #444"
						href="detail">Detailed Analysis</a>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery 3 -->
	<script src="./AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="./AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="./Plugins/switch/bootstrap-switch.min.js"></script>


	<script type="text/javascript">
		$("[name='my-checkbox']").bootstrapSwitch({
			onText : "EN",
			offText : "中",
			onColor : "info",
			offColor : "primary",
			size : "small",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$("#cn").css("display", "none");
					$("#en").css("display", "block");
				} else {
					$("#cn").css("display", "block");
					$("#en").css("display", "none");
				}
			}
		})
	</script>
</body>
</html>
