<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function() {

		$('#formReg').validate({ // initialize the plugin
			rules : {
				firstName : {
					required : true,
					lettersonly : true
				}, lastName : {
					required : true,
					lettersonly : true
				}, fatherName : {
					required : true,
					lettersonly : true
				}, gender : {
					required : true
				}, mobNum : {
					required : true,
					digits : true,
					minlength : 10,
					maxlength : 10
				}, email : {
					required : true,
					email : true
				}, joinDate : {
					required : true
				}, experience : {
					required : true
				}, ctc : {
					required : true,
					digits : true
				}, perAdd : {
					required : true
				}, tempAdd : {
					required : true
				},

				
			},

			messages : {
				firstName : {
					required : "Enter First Name"
				}, lastName : {
				required : "Enter Last Name"
			}, fatherName : {
				required : "Enter Father/Husband Name"
			}, gender : {
				required : "Select Gender"
			}, mobNum : {
				required : "Enter Mobile Number"
			}, joinDate : {
				required : "Joining Date is required"
			}, experience : {
				required : "Experience is required"
			}, ctc : {
				required : "Enter CTC"
			}, perAdd : {
				required : "Permanent Address is required"
			}, tempAdd : {
				required : "Temporary Address is required"
			}, 

			},

			highlight : function(element) {
				$(element).parent().addClass('error')
			}

		});

	});
</script>

<style>
#formReg .error {
	color: red;
	font-size: 13px;
}
</style>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			Teacher Registration Details <small></small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="ad_index.web"> Home
			</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#"> Teacher Details </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<c:choose>
	<c:when test="${not empty msg1 }">
		<div class="alert alert-success">
			<b><i class="fa fa-check-circle"></i>${msg1}</b>
		</div>
	</c:when>
</c:choose>
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">


		<!-- BEGIN BORDERED TABLE PORTLET-->
		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">Teacher Registration</div>
			</div>

			<div class="portlet-body">
				<div class="table-responsive">
					<br>
					<form action="ad_reg.web" id="formReg" method="post">
						<div class="row">
							<div class="col-md-12">


								<!-- BEGIN BORDERED TABLE PORTLET-->
								<div class="portlet box green">
									<div class="portlet-title">
										<div class="caption">General Information</div>
									</div>

									<div class="portlet-body">
										<div class="table-responsive">
											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th><b>First Name</b> <span class="required">
																<font color="red">*</font>
														</span>
														<th><input type="text" class="form-control"
															name="firstName"></th>

														<th><b>Middle Name</b></th>
														<th><input type="text" class="form-control"
															name="middleName" id="mName"></th>

													</tr>
												</thead>
												<thead>
													<tr>
														<th><b>Last Name</b><span class="required"> <font
																color="red">*</font>
														</span></th>
														<th><input type="text" class="form-control"
															name="lastName"></th>

														<th><b>Father/Husband Name</b><span class="required">
																<font color="red">*</font>
														</span></th>
														<th><input type="text" class="form-control"
															name="fatherName"></th>
													</tr>

												</thead>
												<thead>
													<tr>
														<th><b> Gender</b><span class="required"> <font
																color="red">*</font>
														</span></th>
														<th>
															<div class="col-md-4">
																<div class="input-group">
																	<span class="input-group-addon"> <i
																		class="fa fa-user"></i>
																	</span> <select
																		class="table-group-action-input form-control input-inline input-small input-sm"
																		name="gender">
																		<option value="">Select Gender</option>
																		<c:forEach var="g" items="${gender}">
																			<option value="${g.intGenderId}">${g.txtGenderName}</option>
																		</c:forEach>


																	</select>
																	<!-- <input type="text" class="form-control" placeholder=""> -->
																</div>
															</div>
														</th>

														<th><b> Religion</b></th>
														<th>
															<div class="col-md-4">
																<div class="input-group">
																	<span class="input-group-addon"> <i
																		class="fa fa-user"></i>
																	</span> <select
																		class="table-group-action-input form-control input-inline input-small input-sm"
																		name="religion">
																		<option value="">Select Religion</option>
																		<c:forEach var="g" items="${religion}">
																			<option value="${g.intReligionId}">${g.txtReligionName}</option>
																		</c:forEach>


																	</select>
																	<!-- <input type="text" class="form-control" placeholder=""> -->
																</div>
															</div>
														</th>
													</tr>

												</thead>
												<thead>
													<tr>
														<th><b> Marital Status</b></th>
														<th>
															<div class="col-md-4">
																<div class="input-group">
																	<span class="input-group-addon"> <i
																		class="fa fa-user"></i>
																	</span> <select
																		class="table-group-action-input form-control input-inline input-small input-sm"
																		name="marital">
																		<option value="">Select Marital Status</option>
																		<c:forEach var="g" items="${marital}">
																			<option value="${g.intMaritalStatusId}">${g.txtMaritalStatus}</option>
																		</c:forEach>

																	</select>
																</div>
															</div>
														</th>

														<th><b> City</b></th>
														<th>
															<div class="col-md-4">
																<div class="input-group">
																	<span class="input-group-addon"> <i
																		class="fa fa-list-alt"></i>
																	</span> <select
																		class="table-group-action-input form-control input-inline input-small input-sm"
																		name="city">
																		<option value="">Select City</option>
																		<c:forEach var="g" items="${city}">
																			<option value="${g.intCityId}">${g.txtCityName}</option>
																		</c:forEach>

																	</select>
																	<!-- <input type="text" class="form-control" placeholder=""> -->
																</div>
															</div>
														</th>
													</tr>

												</thead>
												<thead>
													<tr>
														<th><b> Mobile no(Only 10 digits)</b><span
															class="required"> <font color="red">*</font>
														</span></th>
														<th><input type="text" class="form-control"
															name="mobNum"></th>

														<th><b> Email</b><span class="required"> <font
																color="red">*</font>
														</span></th>
														<th><input type="text" class="form-control"
															name="email"></th>
													</tr>


												</thead>



											</table>

										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">


								<!-- BEGIN BORDERED TABLE PORTLET-->
								<div class="portlet box green">
									<div class="portlet-title">
										<div class="caption">Official Information</div>
									</div>

									<div class="portlet-body">
										<div class="table-responsive">
											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th><b>Joining Date</b><span class="required">
																<font color="red">*</font>
														</span></th>
														<th><input type="date" class="form-control"
															name="joinDate"></th>
														<th><b>Previous School name</b></th>
														<th><input type="text" class="form-control"
															name="preSchoolName"></th>

													</tr>
												</thead>
												<thead>
													<tr>
														<th><b>Subject</b></th>
														<th>
															<div class="col-md-4">
																<div class="input-group">
																	<span class="input-group-addon"> <i
																		class="fa fa-list-alt"></i>
																	</span> <select
																		class="table-group-action-input form-control input-inline input-small input-sm"
																		name="subject">
																		<option value="">Select Subject</option>
																		<c:forEach var="g" items="${subject}">
																			<option value="${g.intSubjectId}">${g.txtSubjectName}</option>
																		</c:forEach>

																	</select>
																	<!-- <input type="text" class="form-control" placeholder=""> -->
																</div>
															</div>
														</th>
														<th><b>Experience</b><span class="required"> <font
																color="red">*</font>
														</span></th>
														<th><input type="text" class="form-control"
															name="experience"></th>
													</tr>

												</thead>
												<thead>
													<tr>
														<th><b> Designation</b></th>
														<th><input type="text" class="form-control"
															name="designation"></th>

														<th><b> CTC</b><span class="required"> <font
																color="red">*</font>
														</span></th>
														<th><input type="text" class="form-control"
															name="ctc"></th>
													</tr>
												</thead>

												<thead>
													<tr>
														<th><b> Permanent Address</b><span class="required">
																<font color="red">*</font>
														</span></th>
														<th><textarea class="form-control" rows="1"
																name="perAdd"></textarea></th>

														<th><b> Temporary Address</b><span class="required">
																<font color="red">*</font>
														</span></th>
														<th><textarea class="form-control" rows="1"
																name="tempAdd"></textarea></th>
													</tr>

												</thead>

											</table>



										</div>
									</div>

								</div>
								<div class="col-md-offset-5 col-md-9">
									<button type="submit" class="btn green" id="submitTeachReg">
										<i class="fa fa-"></i> Submit
									</button>
								</div>

								<!-- END BORDERED TABLE PORTLET-->

								<!-- BEGIN BORDERED TABLE PORTLET-->

								<!-- BEGIN PAGE CONTENT-->

							</div>
							<!-- END PAGE CONTENT -->

						</div>
					</form>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
		</div>
		<!-- END CONTENT -->
	</div>
</div>
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(2);
	});
</script>
<%@include file="footer.jsp"%>