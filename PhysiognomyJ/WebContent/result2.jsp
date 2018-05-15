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
</style>

</head>

<body>
	<jsp:include page="./top.jsp"></jsp:include>
	<!-- Content Wrapper. Contains page content background-color: #ecf0f5; -->
	<div class="wrapper" style="min-height: 916.28px; padding-top: 100px;">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"
					style="border: 1px solid #ccc; border-top: none; border-top: none;">
					<div class="box">
						<div class="box-header with-border">
							<h2 class="box-title">
								<strong>Eyes Feature Analyze</strong>
							</h2>
						</div>
						<br />
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
								<div class="col-sm-6">
									<div style="height: 40px;">
										<span style="font-size: 16px">Left Eye</span>
									</div>
									<div style="height: 45px;">
										<span style="display: block; font-size: 16px"><i>The
												optimal eye shape for your left eye is the "<%=analyzeResult.getPhysiognomyData().getLeftEye()[0]%>"base
												on the matching analytical process.
										</i></span>
									</div>
									<div class="col-sm-12" style="height: 130px;">
										<div class="col-sm-6">
											<img height="120" width="214" class="img-circle"
												src="./uploadImages/<%=analyzeResult.getPhysiognomyData().getFolderName()%>/left_eye.jpg">
										</div>
										<div class="col-sm-6">
											<img height="120" width="240" class="img-circle"
												src="./templets/left_eye/<%=analyzeResult.getPhysiognomyData().getLeftEye()[0]%>.jpg">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="progress-group">
											<span class="progress-text">Matched-degree</span> <span
												class="progress-number"><b><%=analyzeResult.getPhysiognomyData().getLeftEye()[1]%></b>%</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-green"
													style="width: <%=analyzeResult.getPhysiognomyData().getLeftEye()[1]%>%"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<!-- Bar chart -->
									<div class="box box-primary">
										<div class="box-header with-border">
											<i class="fa fa-bar-chart-o"></i>
											<h3 class="box-title">Top 5</h3>
										</div>
										<div class="box-body">
											<div id="left-eye-bar-chart" style="height: 180px;"></div>
										</div>
									</div>
								</div>
							</div>
							<hr />
							<div class="row">
								<div class="col-sm-6">
									<div style="height: 40px;">
										<span style="font-size: 16px">Right Eye</span>
									</div>
									<div style="height: 45px;">
										<span style="display: block; font-size: 16px"><i>The
												optimal eye shape for your right eye is the "<%=analyzeResult.getPhysiognomyData().getRightEye()[0]%>"base
												on the matching analytical process.
										</i></span>
									</div>
									<div class="col-sm-12" style="height: 130px;">
										<div class="col-sm-6">
											<img height="120" width="214" class="img-circle"
												src="./uploadImages/<%=analyzeResult.getPhysiognomyData().getFolderName()%>/right_eye.jpg">
										</div>
										<div class="col-sm-6">
											<img height="120" width="240" class="img-circle"
												src="./templets/right_eye/<%=analyzeResult.getPhysiognomyData().getRightEye()[0]%>.jpg">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="progress-group">
											<span class="progress-text">Matched-degree</span> <span
												class="progress-number"><b><%=analyzeResult.getPhysiognomyData().getRightEye()[1]%></b>%</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-green"
													style="width: <%=analyzeResult.getPhysiognomyData().getRightEye()[1]%>%"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<!-- Bar chart -->
									<div class="box box-primary">
										<div class="box-header with-border">
											<i class="fa fa-bar-chart-o"></i>
											<h3 class="box-title">Top 5</h3>
										</div>
										<div class="box-body">
											<div id="right-eye-bar-chart" style="height: 180px;"></div>
										</div>
									</div>
								</div>
							</div>
							<hr />
							<div class="row">
								<div class="col-sm-6">
									<div style="height: 40px;">
										<span style="font-size: 16px">Overlaping Eyes</span>
									</div>
									<div style="height: 45px;">
										<span style="display: block; font-size: 16px"><i>Your
												eyes match the "<%=analyzeResult.getPhysiognomyData().getAvgEye()[0]%>"
												best through the comprehensive analysis.
										</i></span>
									</div>
									<div class="col-sm-12" style="height: 130px;">
										<div class="col-sm-6">
											<img height="120" width="214" class="img-circle"
												src="./uploadImages/<%=analyzeResult.getPhysiognomyData().getFolderName()%>/avg_eye.jpg">
										</div>
										<div class="col-sm-6">
											<img height="120" width="240" class="img-circle"
												src="./templets/left_eye/<%=analyzeResult.getPhysiognomyData().getAvgEye()[0]%>.jpg">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="progress-group">
											<span class="progress-text">Matched-degree</span> <span
												class="progress-number"><b><%=analyzeResult.getPhysiognomyData().getAvgEye()[1]%></b>%</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-green"
													style="width: <%=analyzeResult.getPhysiognomyData().getAvgEye()[1]%>%"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<!-- Bar chart -->
									<div class="box box-primary">
										<div class="box-header with-border">
											<i class="fa fa-bar-chart-o"></i>
											<h3 class="box-title">Top 5</h3>
										</div>
										<div class="box-body">
											<div id="avg-eye-bar-chart" style="height: 180px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- ./box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
		</section>
		<br>
		<section class="content">
			<!-- /.row -->
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"
					style="border: 1px solid #ccc; border-top: none; border-top: none;">
					<div class="box">
						<div class="box-header with-border">
							<h2 class="box-title">
								<strong>Eyebrows Feature Analyze</strong>
							</h2>
						</div>
						<br />
						<!-- /.box-header -->
						<%
							double width = 490 / Double.parseDouble(analyzeResult.getPhysiognomyData().getBrowStyle()[4])
									* Double.parseDouble(analyzeResult.getPhysiognomyData().getBrowStyle()[2]) / 120 * 430;
							String browHtml = "<div align=\"center\"><img height=\"70\" width=\"490\" class=\"img-rounded\" src=\"./uploadImages/"
								+ analyzeResult.getPhysiognomyData().getFolderName() + "/brow.jpg\"></div>";
							String browStyle = analyzeResult.getPhysiognomyData().getBrowStyle()[0];
						%>
						<div class="box-body">
							<div class="row">
								<div class="col-sm-6">
									<div style="height: 45px;">
										<span style="display: block; font-size: 16px"><i>Your
												eyebrows match the "<%=analyzeResult.getPhysiognomyData().getBrowStyle()[0] %>"
												best through the comprehensive analysis.
										</i></span>
									</div>
									
									<%

									%>

									<%="narrow".equals(browStyle) ? browHtml : ""%>
									<div align="center">
										<img height="70" width="<%=width%>" class="img-rounded"
											src="./templets/brow/narrow.jpg">
									</div>
									<%="middle".equals(browStyle) ? browHtml : ""%>
									<div align="center">
										<img height="70" width="<%=width%>" class="img-rounded"
											src="./templets/brow/middle.jpg">
									</div>
									<%="wide".equals(browStyle) ? browHtml : ""%>
									<div align="center">
										<img height="70" width="<%=width%>" class="img-rounded"
											src="./templets/brow/wide.jpg">
									</div>
									<div class="col-sm-12">
										<div class="progress-group">
											<span class="progress-text">Matched-degree</span> <span
												class="progress-number"><b><%=analyzeResult.getPhysiognomyData().getBrowStyle()[1]%></b>%</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-green"
													style="width: <%=analyzeResult.getPhysiognomyData().getBrowStyle()[1]%>%"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<!-- Bar chart -->
									<div class="box box-primary">
										<div class="box-body">
											<div id="brow-bar-chart" style="height: 415px;"></div>
										</div>
									</div>
								</div>
							</div>
							<hr />
						</div>
						<!-- ./box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<div class="container">
		<div
			style="height: 40px; bottom: 50px; right: 100px; position: absolute; z-index: 0;">
			<div class="row">
				<div class="form-inline">
					<a class="btn btn-default"
						style="height: 40px; width: 100px; font-size: 18px; color: #444"
						href="index">Home</a>&nbsp;&nbsp;&nbsp;&nbsp; <a type="submit"
						class="btn btn-default"
						style="height: 40px; width: 100px; font-size: 18px; color: #444"
						href="javascript:{history.go(-1);}">Back</a>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery 3 -->
	<script src="./AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="./AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FLOT CHARTS -->
	<script src="./AdminLTE/bower_components/Flot/jquery.flot.js"></script>
	<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
	<script
		src="./AdminLTE/bower_components/Flot/jquery.flot.categories.js"></script>
	<script
		src="./AdminLTE/bower_components/Flot/jquery.flot.barnumbers.js"></script>



	<script>
		$(function() {

			/*
			 * BAR CHART
			 * ---------
			 */
			var left_eye_bar_data = {
				data :
	<%=analyzeResult.getPhysiognomyData().getLeftEyeData()%>
		,
				color : '#3c8dbc'
			}
			$.plot('#left-eye-bar-chart', [ left_eye_bar_data ], {
				grid : {
					borderWidth : 1,
					borderColor : '#f3f3f3',
					tickColor : '#f3f3f3'
				},
				series : {
					bars : {
						show : true,
						barWidth : 0.5,
						align : 'center'
					}
				},
				xaxis : {
					mode : 'categories',
					tickLength : 0
				},
				bars : {
					numbers : {
						show : true,
						numberFormatter : function(v, bar) {
							return v;
						}
					}
				}
			})

			var right_eye_bar_data = {
				data :
	<%=analyzeResult.getPhysiognomyData().getRightEyeData()%>
		,
				color : '#3c8dbc'
			}
			$.plot('#right-eye-bar-chart', [ right_eye_bar_data ], {
				grid : {
					borderWidth : 1,
					borderColor : '#f3f3f3',
					tickColor : '#f3f3f3'
				},
				series : {
					bars : {
						show : true,
						barWidth : 0.5,
						align : 'center'
					}
				},
				xaxis : {
					mode : 'categories',
					tickLength : 0
				},
				bars : {
					numbers : {
						show : true,
						numberFormatter : function(v, bar) {
							return v;
						}
					}
				}
			})

			var avg_eye_bar_data = {
				data :
	<%=analyzeResult.getPhysiognomyData().getAvgEyeData()%>
		,
				color : '#3c8dbc'
			}
			$.plot('#avg-eye-bar-chart', [ avg_eye_bar_data ], {
				grid : {
					borderWidth : 1,
					borderColor : '#f3f3f3',
					tickColor : '#f3f3f3'
				},
				series : {
					bars : {
						show : true,
						barWidth : 0.5,
						align : 'center'
					}
				},
				xaxis : {
					mode : 'categories',
					tickLength : 0
				},
				bars : {
					numbers : {
						show : true,
						numberFormatter : function(v, bar) {
							return v;
						}
					}
				}
			})

			var brow_bar_data = {
				data :
	<%=analyzeResult.getPhysiognomyData().getBrowData()%>
		,
				color : '#3c8dbc'
			}
			$.plot('#brow-bar-chart', [ brow_bar_data ], {
				grid : {
					borderWidth : 1,
					borderColor : '#f3f3f3',
					tickColor : '#f3f3f3'
				},
				series : {
					bars : {
						show : true,
						barWidth : 0.5,
						align : 'center'
					}
				},
				xaxis : {
					mode : 'categories',
					tickLength : 0
				},
				bars : {
					numbers : {
						show : true,
						numberFormatter : function(v, bar) {
							return v;
						}
					}
				}
			})
			/* END BAR CHART */
		})
	</script>

</body>
</html>
