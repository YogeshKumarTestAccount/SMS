<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
<!--
	//-->
	$(document).ready(function() {

		$('#form1').validate({ // initialize the plugin
			rules : {
				txtSchoolName : {
					required : true,
					lettersonly : true
				},
				txtResponsiblePerson : {

					lettersonly : true
				},
				txtEmail : {
					
					email : true,
					minlength : 5
				},
				txtSchoolContactNumber : {
					
					digits : true,
					maxlength : 10
				},
				txtWebsite : {
					url : true
				}
			},

			messages : {
				txtSchoolName : {
					required : "* please enter school name"

				}

			},

			highlight : function(element) {
				$(element).parent().addClass('error')
			}

		});

		$('#form2').validate({ // initialize the plugin
			rules : {
				txtSchoolName : {
					required : true,
					lettersonly : true
				},
				txtResponsiblePerson : {

					lettersonly : true
				},
				txtEmail : {
					
					email : true,
					minlength : 5
				},

				txtWebsite : {
					url : true
				}
			},

			messages : {
				txtSchoolName : {
					required : "* school name cannot be empty"

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

#form2 .error {
	color: red;
	font-size: 13px;
}
</style>




<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			School And Branch Details <small></small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> School And Branch Details </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->

<div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
</div>

<c:if test="${not empty sucmsg}">
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
		<strong>${sucmsg}</strong>${sucmsg1}
	</div>
</c:if>



<c:if test="${not empty Delmsg}">
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
		<strong>${Delmsg}</strong>${Delmsg1}
	</div>
</c:if>

<c:if test="${not empty updmsg}">
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
		<strong>${updmsg}</strong>${updmsg1}
	</div>
</c:if>

<c:if test="${not empty errormsg}">
	<div class="alert alert-danger alert-dismissable" id="ermsg">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
		<strong>${errormsg}</strong>${errormsg1}
	</div>
</c:if>

<div class="row">
	<div class="col-md-12">


		<!-- BEGIN BORDERED TABLE PORTLET-->
		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-plus"></i> Add School Details
				</div>
			</div>
			<div class="portlet-body">
				<div class="table-responsive">



					<%-- <form:errors path="sandbdetails"></form:errors> --%>

					<div class="portlet-body form">

						<form action="ad_school & branch.web" method="post" id="form1">
							<div class="form-wizard">
								<table class="table table-bordered table-hover">

									<thead>
										<tr>
											<th><b>School Name </b> <span class="required"> <font
													color="red">*</font>
											</span></th>
											<th><input type="text" class="form-control"
												name="txtSchoolName"></th>
											<th><b>Responsible Person</b></th>
											<th><input type="text" class="form-control"
												name="txtResponsiblePerson"></th>

										</tr>
									</thead>
									<thead>
										<tr>
											<th><b>School Address</b></th>
											<th><input type="text" class="form-control"
												name="txtSchoolAddress"></th>

											<th><b>School Contact Number</b></th>
											<th><input type="text" class="form-control"
												name="txtSchoolContactNumber"></th>
										</tr>

									</thead>
									<thead>
										<tr>
											<th><b> Email</b></th>
											<th><input type="text" class="form-control"
												name="txtEmail"></th>

											<th><b>Website</b></th>
											<th><input type="text" class="form-control"
												name="txtWebsite"></th>
										</tr>
										<th colspan="4">
											<div class="col-md-offset-5 col-md-9">
												<button type="submit" class="btn green" id="btnSubmit">
													<i class="fa fa-check"></i> Submit
												</button>
											</div>
										</th>
									</thead>
								</table>
							</div>
						</form>
					</div>
					<!-- <div class="form-actions fluid">
												<div class="col-md-offset-3 col-md-9">
													<center><button type="submit" class="btn blue">Submit</button><center>
													<button type="button" class="btn default">Cancel</button> -->
					<!-- </div>
											</div> -->

				</div>
			</div>
		</div>




		<!-- BEGIN PAGE CONTENT-->
		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-list"></i>School Details Inbox
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
						<table class="table table-striped table-hover table-bordered"
							id="sample_editable_1">
							<thead>
								<tr>
									<th>Sl No</th>
									<th>School Name</th>
									<th>Responsible Person</th>
									<th>Address</th>
									<th>Email</th>
									<th>Website</th>
									<th>Update</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sb" items="${sandbal }">

									<tr>
										<form action="updateSchool/${ sb.intSchoolId }.web" >

											<td>${sb.intSchoolId }</td>
											<td><input type="text" class="form-control" name="txtSchoolName"
												value="${sb.txtSchoolName }" required="required"></td>
											<td><input type="text" name="txtResponsiblePerson"
												value="${sb.txtResponsiblePerson}" class="form-control"></td>
											<td><input type="text" name="txtSchoolAddress"
												value="${sb.txtSchoolAddress }" class="form-control"></td>
											<td><input type="text" name="txtEmail"
												value="${sb.txtEmail}" class="form-control" ></td>
											<td><input type="text" name="txtWebsite"
												value="${sb.txtWebsite }" class="form-control" ></td>
											<td>
												<button class="btn green" type="submit"  >
													<i class="fa fa-edit"></i> Update
												</button>

											</td>
										</form>
										<td><a href="delete/${ sb.intSchoolId }.web"
											id="alert_show">
												<button class="btn red">
													<i class="fa fa-trash-o"></i> Delete
												</button>
										</a></td>


									</tr>


								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- END EXAMPLE TABLE PORTLET-->
			</div>
		</div>
		<!-- END PAGE CONTENT -->
	</div>
</div>
<!-- END CONTENT -->

<!-- END CONTAINER -->
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


<!-- BEGIN PAGE LEVEL PLUGINS -->


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


<script type="text/javascript"
	src="assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>

<script type="text/javascript"
	src="assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript"
	src="assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
<script type="text/javascript"
	src="assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="assets/plugins/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script type="text/javascript"
	src="assets/plugins/bootstrap-markdown/lib/markdown.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL STYLES -->
<script src="assets/scripts/core/app.js"></script>
<script src="assets/scripts/custom/form-validation.js"></script>
<!-- END PAGE LEVEL STYLES -->


<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<!-- END PAGE LEVEL STYLES -->


<script>
	jQuery(document).ready(function() {
		App.init();
		slider(13);
		FormWizard.init();
	
	});
</script>
</body>
<!-- END BODY -->
</html>
