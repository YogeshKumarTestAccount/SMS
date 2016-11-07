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

		$('#form1').validate({

			// initialize the plugin
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
		<h3 class="page-title">Staff/Student Master Record</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="ad_index.web"> Home
			</a> <i class="fa fa-angle-right"></i></li>
			<li><i class="fa fa-bar-chart-o"></i> <a href="#">
					Staff/Student Master Record </a></li>

		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->






<div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
</div>

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
							<i class="fa fa-search"></i> Staff/Student Master Record
						</div>

					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<form action="user_staff.web" class="form-horizontal"
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
											name="ClassId">
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
											name="SectionId">
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
				<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

				<!-- BEGIN CONDENSED TABLE PORTLET-->
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box green">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-list"></i>Student Master Record
								</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"> </a> <a
										href="javascript:;" class="reload"> </a>


								</div>
							</div>
							<div class="portlet-body">
								<div class="table-scrollable">

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
								<c:if test="${not empty performance}">
									<c:choose>

										<c:when test="${not empty Mstal }">
											<table class="table table-striped table-hover table-bordered"
												id="sample_editable_1">
												<thead>
													<tr>
														<th>Student ID</th>
														<th>First Name</th>
														<th>Last Name</th>
														<th>Class</th>
														<th>Section</th>
														<th>Father's Name</th>
														<th>Mobile No.</th>
														<th>DOB</th>
														<th>Gender</th>
														<th>Address</th>
														<th>City</th>
														<!-- <th>State</th>
														<th>Country</th> -->
														<th>Update</th>
														<th>Delete</th>
													</tr>
												</thead>
												<tbody>



													<c:forEach var="mst" items="${ Mstal}">

														<tr>
															<form
																action="updateStudent/${mst.intRegistrationId}/1.web"
																id="form2">
																<td><input type="text" class="form-control"
																	value="${mst.intRegistrationId}" readonly></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtFirstName }" name="txtFirstName"></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtLastName }" name="txtLastName"></td>
																<c:forEach var="c" items="${classes }">
																	<c:if
																		test="${ c.intClassId == mst.mststudclass.intClassId}">
																		<td><input type="text" class="form-control"
																			value="${c.txtClassName }" readonly></td>
																	</c:if>
																</c:forEach>

																<c:forEach var="s" items="${sections }">
																	<c:if
																		test="${ s.intSectionId  == mst.mststudclasssection.intSectionId}">
																		<td><input type="text" class="form-control"
																			value="${s.txtSectionName }" readonly></td>
																	</c:if>
																</c:forEach>

																<td><input type="text" class="form-control"
																	value="${mst.txtFatherName }" name="txtFatherName"></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtFmobileNumber }"
																	name="txtFmobileNumber" required="required"></td>
																<td><input type="date" class="form-control"
																	value="${mst.dtDob}" name="dtDob"></td>

																<c:forEach var="g" items="${gal }">
																	<c:if
																		test="${ g.intGenderId  == mst.mstgender.intGenderId}">
																		<td><input type="text" class="form-control"
																			value="${g.txtGenderName }" readonly></td>
																	</c:if>
																</c:forEach>

																<td><input type="text" class="form-control"
																	value="${mst.txtPerAddress}" name="txtPerAddress"></td>

																<c:forEach var="ci" items="${cities }">
																	<c:if
																		test="${ ci.intCityId  == mst.mstcity.intCityId }">
																		<td><input type="text" class="form-control"
																			value="${ci.txtCityName }" readonly></td>
																	</c:if>
																</c:forEach>


																<%-- 		<td><input type="text" class="form-control"
																	value="${mst.txtPerAddress}" name="sstate"></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtPerAddress}" name="scountry"></td> --%>

																<td><div class="btn-group btn-group-solid">

																		<button class="btn green" type="submit">
																			Update <i class="fa fa-edit"></i>
																		</button>

																	</div></td>
															</form>

															<td><div class="btn-group btn-group-solid">
																	<a href="deleteUser/${mst.intRegistrationId}.web">
																		<button type="button" class="btn red">
																			<i class="fa  fa-trash-o"> </i> Delete
																		</button>
																	</a>
																</div></td>

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
									<i class="fa fa-list"></i>Staff(Teaching/Non-Teaching) Master
									Record
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
								<c:if test="${not empty performance1}">
									<c:choose>

										<c:when test="${not empty Mstal }">
											<table class="table table-striped table-hover table-bordered">
												<thead>
													<tr>
														<!--<th>All
													<div class="checkbox-list">
														<label for="closeButton"> <input id="closeButton"
															type="checkbox" value="checked" checked
															class="input-small" /></label>
													</div>
												</th> -->
														<th>Staff ID</th>
														<th>First Name</th>
														<th>Last Name</th>
														<th>Father's Name</th>
														<th>Mobile No.</th>
														<th>DOB</th>
														<th>Gender</th>
														<th>Address</th>
														<th>City</th>
														<!-- <th>State</th>
														<th>Country</th> -->
														<th>Update</th>
														<th>Delete</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach var="mst" items="${ Mstal}">
														<tr>
															<form
																action="updateStudent/${mst.intRegistrationId }/2.web"
																id="form3">
																<td>${mst.intRegistrationId}</td>
																<td><input type="text" class="form-control"
																	value="${mst.txtFirstName }" name="txtFirstName"></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtLastName }" name="txtLastName"></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtFatherName }" name="txtFatherName"></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtFmobileNumber }"
																	name="txtFmobileNumber"></td>
																<td><input type="date" class="form-control"
																	value="${mst.dtDob}" name="dtDob"></td>

																<c:forEach var="g" items="${gal }">
																	<c:if
																		test="${ g.intGenderId  == mst.mstgender.intGenderId}">
																		<td><input type="text" class="form-control"
																			value="${g.txtGenderName }"></td>
																	</c:if>
																</c:forEach>

																<td><input type="text" class="form-control"
																	value="${mst.txtPerAddress}" name="txtPerAddress"></td>

																<c:forEach var="ci" items="${cities }">
																	<c:if
																		test="${ ci.intCityId  == mst.mstcity.intCityId }">
																		<td><input type="text" class="form-control"
																			value="${ci.txtCityName }"></td>
																	</c:if>
																</c:forEach>
																<%-- <td><input type="text" class="form-control"
																	value="${mst.txtPerAddress}"></td>
																<td><input type="text" class="form-control"
																	value="${mst.txtPerAddress}"></td> --%>

																<td><div class="btn-group btn-group-solid">

																		<button class="btn green" type="submit">
																			Update <i class="fa fa-edit"></i>
																		</button>

																	</div></td>
															</form>
															<td><div class="btn-group btn-group-solid">
																	<a href="deleteUser/${mst.intRegistrationId}.web">
																		<button type="button" class="btn red">
																			<i class="fa  fa-trash-o"> </i> Delete
																		</button>
																	</a>
																</div></td>

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
		</div>
	</div>
	<!-- END PAGE CONTENT-->

	<!-- END PAGE CONTENT-->


	<!-- END CONTENT -->
</div>

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
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>

<script>
	jQuery(document).ready(function() {
		App.init();
		TableEditable.init();
		slider(3);
	});
</script>
</body>
<!-- END BODY -->
</html>

