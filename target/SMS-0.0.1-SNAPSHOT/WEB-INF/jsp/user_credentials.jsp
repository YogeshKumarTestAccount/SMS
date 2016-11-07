
<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#Mcategory").change(function() {
			$(this).find("option:selected").each(function() {
				if ($(this).attr("value") == "1") {
					// $("#first").not(this).hide();
					$("#Mclass").show();
					$("#Msection").show();
				}

				else {
					$("#Mclass").hide();
					$("#Msection").hide();
				}
			});
		}).change();
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {

		$('#form1').validate({ // initialize the plugin
			rules : {
				categoryId : {
					required : true

				},
				SectionId : {

					required : true
				},
				ClassId : {

					required : true
				}

			},

			messages : {
				categoryId : {
					required : "* please select category"

				},
				SectionId : {
					required : "* please select section"

				},
				ClassId : {
					required : "* please select class"

				}

			},

			highlight : function(element) {
				$(element).parent().addClass('error')
			}

		});

	});
</script>

<style>
#form1 .error {
	color: red;
	font-size: 13px;
}
</style>



<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">View Credentials</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><i class="fa fa-bar-chart-o"></i> <a href="#"> View
					Credentials </a></li>

		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->






<div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
</div>



<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->


		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->

		<div class="tab-content">
			<div class="tab-pane active" id="tab_0">
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-search"></i> View Credentials
						</div>

					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<form action="user_credentials.web" class="form-horizontal"
							method="post" id="form1">


							<div class="form-group">
								<br> <label class="col-md-3 control-label"><b>Category</b>
									<span class="required"> * </span> </label>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="fa  fa-list-alt"></i>
										</span> <select
											class="table-group-action-input form-control input-inline input-small input-sm"
											name="categoryId" id="Mcategory">
											<option value="">Select Category</option>
											<c:forEach var="c" items="${category }">
												<option value="${c.intCategoryId1 }">${c.txtCategoryName }</option>
											</c:forEach>

										</select>

									</div>
								</div>
							</div>

							<div class="form-group" id="Mclass">
								<label class="col-md-3 control-label"><b>Class</b> <span
									class="required"> * </span> </label>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i>
										</span> <select
											class="table-group-action-input form-control input-inline input-small input-sm"
											name="ClassId" >
											<option value="">Select Class</option>
											<c:forEach var="c" items="${classes }">
												<option value="${c.intClassId }">${c.txtClassName }</option>
											</c:forEach>

										</select>

									</div>
								</div>
							</div>

							<div class="form-group" id="Msection">
								<label class="col-md-3 control-label"><b>Section</b> <span
									class="required"> * </span> </label>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i>
										</span> <select
											class="table-group-action-input form-control input-inline input-small input-sm"
											name="SectionId" >
											<option value="">Select</option>
											<c:forEach var="s" items="${sections }">
												<option value="${s.intSectionId }">${s.txtSectionName }</option>
											</c:forEach>


										</select>

									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label"><b>Student
										Name/ID</b></label>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i>
										</span> <input type="text" class="form-control"
											placeholder="Enter Name or ID" name="StudentId">
									</div>
								</div>
							</div>


							<div class="clearfix" align="center">

								<button type="submit" class="btn green">Search</button>
							</div>
						</form>
						<br>
					</div>
				</div>
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- BEGIN CONDENSED TABLE PORTLET-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>Student Credentials
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"> </a> <a
									href="javascript:;" class="reload"> </a>


							</div>
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">

								<div class="btn-group pull-right">

									<ul class="dropdown-menu pull-right">
										<li><a href="#"> Print </a></li>
										<li><a href="#"> Save as PDF </a></li>
										<li><a href="#"> Export to Excel </a></li>
									</ul>
								</div>
							</div>
							<c:if test="${not empty performance}">
								<c:choose>

									<c:when test="${not empty Mstal }">
										<table class="table table-striped table-hover table-bordered">
											<thead>
												<tr>

													<th>Student Name[ID]</th>
													<th>User Name</th>
													<th>Password</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="mst" items="${ Mstal}">
													<tr>
														<td>${mst.intRegistrationId}</td>
														<c:forEach var="login" items="${loginal}">
															<c:if
																test="${ mst.intRegistrationId == login.mstregistration.intRegistrationId}">
																<td>${login.mstregistration.intRegistrationId}</td>
																<td>${login.txtPassword}</td>
															</c:if>

														</c:forEach>
													</tr>

												</c:forEach>


											</tbody>
										</table>
									</c:when>


									<c:otherwise>


										<div align="center">
											<h1>No Records Found!!!</h1>
										</div>


									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END CONDENSED TABLE PORTLET-->

			<hr>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>Staff(Teaching/Non-Teaching)
								Credentials
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"> </a> <a
									href="javascript:;" class="reload"> </a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">
								<!-- <div class="btn-group">
									<button id="sample_editable_1_new" class="btn green">
									Add New <i class="fa fa-plus"></i>
									</button>
								</div> -->
								<div class="btn-group pull-right">
									<!-- <button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
									</button>   -->
									<ul class="dropdown-menu pull-right">
										<li><a href="#"> Print </a></li>
										<li><a href="#"> Save as PDF </a></li>
										<li><a href="#"> Export to Excel </a></li>
									</ul>
								</div>
							</div>
							<c:if test="${not empty performance1}">
								<c:choose>

									<c:when test="${not empty Mstal }">
										<table class="table table-striped table-hover table-bordered">
											<thead>
												<tr>

													<th>Staff Name[ID]</th>
													<th>User Name</th>
													<th>Password</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="mst" items="${ Mstal}">
													<tr>
														<td>${mst.intRegistrationId}</td>
														<c:forEach var="login" items="${loginal}">
															<c:if
																test="${ mst.intRegistrationId == login.mstregistration.intRegistrationId}">
																<td>${login.mstregistration.intRegistrationId}</td>
																<td>${login.txtPassword}</td>
															</c:if>

														</c:forEach>
													</tr>

												</c:forEach>


											</tbody>
										</table>
									</c:when>


									<c:otherwise>


										<div align="center">
											<h1>No Records Found!!!</h1>
										</div>


									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
		</div>

		<!-- END PAGE CONTENT-->

		<!-- END PAGE CONTENT-->

	</div>
	<!-- END CONTENT -->
</div>

<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer">
	<div class="footer-inner">2014 &copy; by SeekDigital</div>
	<div class="footer-tools">
		<span class="go-top"> <i class="fa fa-angle-up"></i>
		</span>
	</div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/plugins/respond.min.js"></script>
<script src="assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js"
	type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
	type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js"
	type="text/javascript"></script>
<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js"
	type="text/javascript"></script>
<!-- END CORE PLUGINS -->


<!--validation start  -->

<script type="text/javascript"
	src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript"
	src="assets/plugins/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript"
	src="assets/plugins/jquery-validation/dist/additional-methods.js"></script>

<!-- validation end  -->


<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript"
	src="assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript"
	src="assets/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="assets/plugins/data-tables/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/scripts/core/app.js"></script>
<script src="assets/scripts/custom/table-editable.js"></script>
<script src="assets/scripts/custom/slider.js"></script>
<script>
	jQuery(document).ready(function() {
		App.init();
		TableEditable.init();
		slider(4);
	});
</script>
</body>
<!-- END BODY -->
</html>
