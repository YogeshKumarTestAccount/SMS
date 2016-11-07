
<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function() {

		$('#stuRegForm').validate({ // initialize the plugin
			rules : {
				mststudclass : {
					required : true,
				},
				mststudclasssection : {
					required : true,
				},
				mstsemester : {
					required : true,
				},
				mststream : {
					required : true,
				},
				mstmedium : {
					required : true,
				},
				mstmothertongue : {
					required : true,
				},
				mstaffiliation : {
					required : true,
				},
				txtPreviousSchoolName : {
					required : true,
				/* lettersonly : true */
				},
				mstschooltype : {
					required : true,
				},
				txtFirstName : {
					required : true,
					lettersonly : true
				},
				txtLastName : {
					required : true,
					lettersonly : true
				},
				txtFatherName : {
					required : true,
					lettersonly : true
				},
				txtMotherName : {
					required : true,
					lettersonly : true
				},txtFoccupation : {
					required : true,
					lettersonly : true
				},
				txtMoccupation : {
					required : true,
					lettersonly : true
				},
				txtFmobileNumber : {
					required : true,
					digits : true,
					minlength : 10,
					maxlength : 10
				},
				txtMmobileNumber : {
					required : true,
					digits : true,
					minlength : 10,
					maxlength : 10
				},txtFotherNumber : {
					required : true,
					digits : true,
					minlength : 10,
					maxlength : 10
				},
				txtMotherNumber : {
					required : true,
					digits : true,
					minlength : 10,
					maxlength : 10
				},dob : {
					required : true,
				},
				gender : {
					required : true,
				},
				nationality : {
					required : true,
					lettersonly : true
				},
				bloodgroup : {
					required : true,
				},
				religion : {
					required : true,
				},
				social : {
					required : true,
				},child : {
					required : true,
				},
				perAdd : {
					required : true
				},
				tempAdd : {
					required : true
				},
				city : {
					required : true,
				},taluk : {
					required : true,
					lettersonly : true
				},
				district : {
					required : true,
					lettersonly : true
				},
				code : {
					required : true,
					digits : true
				},
				steno : {
					required : true,
				},
			},

			messages : {
				mststudclass : {
					required : "Please Select Class"
				},
				mststudclasssection : {
					required : "Please Select Section"
				},
				mstsemester : {
					required : "Please Select Semester"
				},
				mststream : {
					required : "Please Select Stream"
				},
				mstmedium : {
					required : "Please Select Medium"
				},
				mstmothertongue : {
					required : "Please Select Mothertongue"
				},
				mstaffiliation : {
					required : "Please Select Affilation"
				},
				txtPreviousSchoolName : {
					required : "Enter Previous School Name"
				},
				mstschooltype : {
					required : "Please Select School Type"
				},
				txtFirstName : {
					required : "Enter First Name"
				},
				txtLastName : {
					required : "Enter Last Name"
				},
				txtFatherName : {
					required : "Enter Father Name"
				},
				txtMotherName : {
					required : "Enter Mother Name"
				},
				txtFoccupation : {
					required : "Enter Father Occupation"
				},
				txtMoccupation : {
					required : "Enter Mother Occupation"
				},
				txtFmobileNumber : {
					required : "Enter Father Mobile Number"
				},
				txtFmobileNumber : {
					required : "Enter Mother Mobile Number"
				},
				txtFotherNumber : {
					required : "Enter Father Other Mobile Number"
				},
				txtMotherNumber : {
					required : "Enter Mother Other Mobile Number"
				},
				dob : {
					required : "Please Select Date Of Birth"
				},
				gender : {
					required : "Please Select Gender"
				},
				nationality : {
					required : "Enter Nationality"
				},
				bloodgroup : {
					required : "Please Select Blood Group"
				},
				religion : {
					required : "Please Select Religion"
				},
				social : {
					required : "Please Select Social Category"
				},child : {
					required : "Please Select Disability Child"
				},
				perAdd : {
					required : "Permanent Address is required"
				},
				tempAdd : {
					required : "Temporary Address is required"
				},
				city : {
					required : "Please Select City"
				},
				taluk : {
					required : "Enter Taluk"
				},
				district : {
					required : "Enter District"
				},
				code : {
					required : "Enter Pincode"
				},
				steno : {
					required : "Enter Enrollment Number"
				}
				

			},

			highlight : function(element) {
				$(element).parent().addClass('error')
			}

		});

	});
</script>

<style>
#stuRegForm .error {
	color: red;
	font-size: 13px;
}
</style>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			Registration Page <small></small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="ad_index.web"> Home
			</a> <i class="fa fa-angle-right"></i></li>
			<!--<li>
							<a href="#">
								Form Stuff
							</a>
							<i class="fa fa-angle-right"></i>
						</li>-->
			<li><a href="#"> Registration Page </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<c:choose>
	<c:when test="${not empty msg1 }">
		<div class="alert alert-success">
			<b><i class="fa fa-check-circle"></i>${msg1}</b><small>${msg2}</small>
		</div>
	</c:when>
</c:choose>
<!-- BEGIN PAGE CONTENT-->


<div class="row">
	<div class="col-md-12">
		<!-- BEGIN VALIDATION STATES-->
		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i>Student Registration
				</div>
				<div class="tools">
					<!--<a href="javascript:;" class="collapse">
								</a>
								
								
								<a href="javascript:;" class="reload">
								</a>-->


				</div>
			</div>
			<div class="portlet-body form">

				<!-- BEGIN FORM-->
				<form action="user_new reg.web" class="form-horizontal"
					id="stuRegForm" method="post">
					<!-- <div class="form-body"> -->
					<!-- <div class="alert alert-danger display-hide">
							<button class="close" data-close="alert"></button>
							You have some form errors. Please check below.
						</div>
						<div class="alert alert-success display-hide">
							<button class="close" data-close="alert"></button>
							Your Regisration successful!
						</div> -->
					<div class="form-group">
						<label class="col-md-3 control-label"><b>Registration
								for</b> <span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i>
								</span>
								<ul class="dropdown-menu-list scroller"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<li><a href="#"> Student </a></li>
									<li><a href="ad_reg.web"> Teaching </a></li>
								</ul>
							</div>
						</div>
					</div>
					<h4 align="center">
						<b>Admission Details</b>
					</h4>

					<div class="form-group">
						<label class="col-md-3 control-label"><b>Admission to
								Class</b> <span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa fa-th-large"></i>
								</span> <select name="mststudclass"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select class</option>
									<c:forEach var="classes" items="${classes}">
										<option value="${classes.intClassId}">${classes.txtClassName}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label"><b>Section</b> <span
							class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa fa-th-large"></i>
								</span> <select name="mststudclasssection"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select Section</option>
									<c:forEach var="sections" items="${sections}">
										<option value="${sections.intSectionId}">${sections.txtSectionName}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label"><b>Semester</b> <span
							class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-trello"></i>
								</span> <select name="mstsemester"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select Semester</option>
									<c:forEach var="sems" items="${sems}">
										<option value="${sems.intSemesterId}">${sems.txtSemester}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>



					<div class="form-group">
						<label class="col-md-3 control-label"><b>Stream</b> <span
							class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa fa-minus-square"></i>
								</span> <select name="mststream"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select Stream</option>
									<c:forEach var="streams" items="${streams}">
										<option value="${streams.intStreamId}">${streams.txtStream}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>



					<div class="form-group">
						<label class="col-md-3 control-label"><b>Medium Of
								Instruction</b> <span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-bars"></i>
								</span> <select name="mstmedium"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select Medium</option>
									<c:forEach var="mediums" items="${mediums}">
										<option value="${mediums.intMediumId}">${mediums.txtMedium}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>


					<div class="form-group">
						<label class="col-md-3 control-label"><b>Mother Tongue</b>
							<span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-maxcdn"></i>
								</span> <select name="mstmothertongue"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select MotherTongue</option>
									<c:forEach var="mother" items="${motherTongues}">
										<option value="${mother.intmothertongueId}">${mother.txtmothertongue}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>


					<br>
					<h4 align="center">
						<b>Previous School Details(If Applicable)</b>
					</h4>


					<div class="form-group">
						<label class="col-md-3 control-label"><b>Previous
								School Affilation</b> <span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa fa-hospital-o"></i>
								</span> <select name="mstaffiliation"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select Affiliation</option>
									<c:forEach var="affiliations" items="${affiliations}">
										<option value="${affiliations.intAffiliationId}">${affiliations.txtAffiliation}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3"><b>Transfer
								Certificate No.</b> </label>
						<div class="col-md-4">
							<input name="txtTransferCertificateNo" type="text"
								class="form-control" />
						</div>
					</div>



					<div class="form-group">
						<label class="control-label col-md-3"><b>Transfer
								Certificate Date</b> </label>

						<!--  <div class="input-icon">
				                <i class="fa fa-calendar"></i>-->
						<div class="col-md-4">
							<input name="dtTransferCertificateDate"
								class="form-control placeholder-no-fix" type="date"
								autocomplete="off" placeholder="Transfer Certificate Date" />
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-md-3"><b>Previous
								School Name</b> <span class="required"> * </span> </label>
						<div class="col-md-4">
							<input name="txtPreviousSchoolName" type="text"
								class="form-control" />
						</div>
					</div>


					<div class="form-group">
						<label class="col-md-3 control-label"><b>Previous
								School Type</b> <span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa fa-hospital-o"></i>
								</span> <select name="mstschooltype"
									class="table-group-action-input form-control input-inline input-small input-sm">
									<option value="">Select School Type</option>
									<c:forEach var="schoolType" items="${schoolType}">
										<option value="${schoolType.intSchoolTypeId}">${schoolType.txtSchoolType}</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3"><b>Previous
								School Address</b> </label>
						<div class="col-md-4">
							<input name="txtPreviousSchoolAddress" type="text"
								class="form-control" />
						</div>
					</div>



					<br>
					<h4 align="center">
						<b>Student Details</b>
					</h4>

					<div class="form-group">
						<label class="control-label col-md-3"><b>Student Name</b>
							<span class="required"> * </span> </label>
						<div class="col-md-4">
							<input name="txtFirstName" type="text" class="form-control"
								placeholder="First Name" /> <input name="txtMiddleName"
								type="text" class="form-control" placeholder="Middle Name" /> <input
								name="txtLastName" type="text" class="form-control"
								placeholder="Last Name" />
						</div>
					</div>

					<table class="table table-striped table-hover table-bordered"
						id="sample_editable_1" border="0">
						<thead>
							<tr>
								<th width="26%"></th>
								<th width="37%">
									<div align="center">Father</div>
								</th>
								<th width="37%">
									<div align="center">Mother</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center"><b>Parent Name <font color="red">*</font></b>
								</td>
								<td><input name="txtFatherName" type="text"
									placeholder="Father Name" class="form-control" /></td>
								<td><input name="txtMotherName" type="text"
									placeholder="Mother Name" class="form-control" /></td>

							</tr>

							<tr>
								<td align="center"><b>Occupation <font color="red">*</font></b>
								</td>
								<td><input type="text" class="form-control"
									name="txtFoccupation" placeholder="Father Occupation"></td>
								<td><input type="text" class="form-control"
									name="txtMoccupation" placeholder="Mother Occupation"></td>

							</tr>

							<tr>
								<td align="center"><b>Mobile Number <font color="red">*</font></b>
								</td>
								<td><input type="text" class="form-control"
									name="txtFmobileNumber" placeholder="Father Mobile Number"></td>
								<td><input type="text" class="form-control"
									name="txtMmobileNumber" placeholder="Mother Mobile Number"></td>

							</tr>

							<tr>
								<td align="center"><b>Educational Qualification</b></td>
								<td><input type="text" class="form-control"
									name="txtFeducationalQualification"
									placeholder="Father Educational Qualifications"></td>
								<td><input type="text" class="form-control"
									name="txtMeducationalQualification"
									placeholder="Mother Educational Qualifications"></td>

							</tr>

							<tr>
								<td align="center"><b>Other Number <font color="red">*</font></b>
								</td>
								<td><input type="text" class="form-control"
									name="txtFotherNumber" placeholder="Father Other Number"></td>
								<td><input type="text" class="form-control"
									name="txtMotherNumber" placeholder="Mother Other Number">
								</td>

							</tr>

							<tr>
								<td align="center"><b>Email Id</b></td>
								<td><input type="text" class="form-control"
									name="txtFemailId" placeholder="Father Email"></td>
								<td><input type="text" class="form-control"
									name="txtMemailId" placeholder="Mother Email"></td>

							</tr>

							<tr>
								<td align="center"><b>Aadhar Number</b></td>
								<td><input type="text" class="form-control"
									name="txtFaadharNumber" placeholder="Father's Aadhar Number"></td>
								<td><input type="text" class="form-control"
									name="txtMaadharNumber" placeholder="Mother's Aadhar Number"></td>

							</tr>

						</tbody>
					</table>

					<div class="form-group">
						<label class="control-label col-md-3"><b>Date of Birth</b>
							<span class="required"> * </span> </label>

						<!--  <div class="input-icon">
				                <i class="fa fa-calendar"></i>-->
						<div class="col-md-4">
							<input class="form-control placeholder-no-fix" type="date"
								autocomplete="off" placeholder="Date of Birth" name="dob" />
						</div>
					</div>

					<table border="0">
						<tr>
							<th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<b> Age <font color="#d98c8c">*</font></b>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							</th>
							<td width="165px"><input type="number" class="form-control"
								name="" placeholder="Years"></td>
							<td width="165px"><input type="number" class="form-control"
								name="" placeholder="Month"></td>
						</tr>

					</table>
					<br>





					<div class="form-group">
						<label class="col-md-3 control-label"><b>Gender</b> <span
							class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i>
								</span> <select
									class="table-group-action-input form-control input-inline input-small input-sm"
									name="gender">
									<option value="">Select</option>
									<c:forEach var="g" items="${gal }">
										<option value="${ g.intGenderId }">${ g.txtGenderName }</option>
									</c:forEach>

								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-md-3"><b>Nationality</b> <span
							class="required"> * </span> </label>
						<div class="col-md-4">
							<input name="nationality" type="text" class="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3"><b>Parent's
								Annual Income</b> </label>
						<div class="col-md-4">
							<input name="income" type="number" class="form-control" />
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-md-3"><b>No. of
								Dependency</b> </label>
						<div class="col-md-4">
							<input name="depend" type="number" class="form-control" />
						</div>
					</div>



					<div class="form-group">
						<label class="col-md-3 control-label"><b>Blood Group</b> <span
							class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-heart"></i>
								</span> <select
									class="table-group-action-input form-control input-inline input-small input-sm"
									name="bloodgroup">
									<option value="">Select</option>
									<c:forEach var="b" items="${bal }">
										<option value="${ b.intBloodGroupId}">${b. txtBloodGroupName}</option>
									</c:forEach>



								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>





					<div class="form-group">
						<label class="col-md-3 control-label"><b>Religion</b> <span
							class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-flag"></i>
								</span> <select
									class="table-group-action-input form-control input-inline input-small input-sm"
									name="religion">
									<option value="">Select</option>
									<c:forEach var="r" items="${ral }">
										<option value="${ r.intReligionId }">${r. txtReligionName}</option>
									</c:forEach>
									<option value="Cancel">Others(Please Specify)</option>

								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>




					<table border="0">
						<tr>
							<th><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

									Student Caste Certificate No.
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></th>
							<td width="165px"><input type="text" class="form-control"
								name="scasteno"></td>
							<th><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Student Caste
									&nbsp&nbsp&nbsp&nbsp</b></th>
							<td width="165px"><input type="text" class="form-control"
								name="scaste"></td>
						</tr>

					</table>
					<br>


					<table border="0">
						<tr>
							<th><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

									Father's Caste Certificate No.
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></th>
							<td width="165px"><input type="text" class="form-control"
								name="fcasteno"></td>
							<th><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Father's Caste
									&nbsp&nbsp&nbsp&nbsp</b></th>
							<td width="165px"><input type="text" class="form-control"
								name="fcaste"></td>
						</tr>

					</table>
					<br>


					<table border="0">
						<tr>
							<th><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

									Mother's Caste Certificate No. &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></th>
							<td width="165px"><input type="text" class="form-control"
								name="mcasteno"></td>
							<th><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Mother's Caste
									&nbsp&nbsp&nbsp</b></th>
							<td width="165px"><input type="text" class="form-control"
								name="mcaste"></td>
						</tr>

					</table>
					<br>




					<div class="form-group">
						<label class="col-md-3 control-label"><b>Social
								Category</b> <span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-flag"></i>
								</span> <select
									class="table-group-action-input form-control input-inline input-small input-sm"
									name="social">
									<option value="">Select</option>
									<c:forEach var="s" items="${sal }">
										<option value="${ s.intSocialCategoryId }">${s. txtSocialCategory }</option>
									</c:forEach>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label"><b>Belong to BPL</b></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa fa-gear (alias)"></i>
								</span> <select
									class="table-group-action-input form-control input-inline input-small input-sm"
									name="blBelongToBpl">
									<option value="">Select</option>
									<option value="true">Yes</option>
									<option value="false">No</option>
								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3"><b>BPL Card No.</b>
						</label>
						<div class="col-md-4">
							<input name="bplCardNo" type="text" class="form-control" />
						</div>
					</div>



					<div class="form-group">
						<label class="col-md-3 control-label"><b>Disability
								Child</b> <span class="required"> * </span></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa  fa-minus-circle"></i>
								</span> <select
									class="table-group-action-input form-control input-inline input-small input-sm"
									name="child">
									<option value="">Select</option>
									<c:forEach var="d" items="${dal }">
										<option value="${ d.intDisabilityChildId  }">${d.txtDisability  }</option>
									</c:forEach>

								</select>
								<!-- <input type="text" class="form-control" placeholder=""> -->
							</div>
						</div>
					</div>



					<br>
					<h4 align="center">
						<b>Student Contact Details</b>
					</h4>

					<div class="portlet-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th><b>Permanent Address<font color="#d98c8c">*</font>
										</b></th>
										<th><textarea class="form-control" rows="1" name="perAdd"></textarea></th>

										<th><b>Temporary Address<font color="#d98c8c">*</font>
										</b></th>
										<th><textarea class="form-control" rows="1"
												name="tempAdd"></textarea></th>

									</tr>
								</thead>
								<thead>
									<tr>
										<th><b>Locality</b></th>
										<th><input type="text" class="form-control" name="local"></th>
										<th><b>City/Town/Village<font color="#d98c8c">*</font></b>
										</th>
										<th><select
											class="table-group-action-input form-control input-inline input-small input-sm"
											name="city">
												<option value="">Select</option>
												<c:forEach var="c" items="${cities }">
													<option value="${ c.intCityId  }">${c.txtCityName  }</option>
												</c:forEach>

										</select></th>


									</tr>

								</thead>
								<thead>
									<tr>
										<th><b>Taluk<font color="#d98c8c">*</font></b></th>
										<th><input type="text" class="form-control" name="taluk"></th>
										<th><b> District<font color="#d98c8c">*</font></b></th>
										<th><input type="text" class="form-control"
											name="district"></th>


									</tr>

								</thead>
								<thead>
									<tr>
										<th><b> Pincode<font color="#d98c8c">*</font></b></th>
										<th><input type="number" class="form-control" name="code"></th>
										<th colspan="2"></th>
									</tr>
								</thead>
							</table>

						</div>
					</div>
					<br>
					<h4 align="center">
						<b>(For Office Use Only)</b>
					</h4>




					<div class="portlet-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th><b>Student Enrollment No<font color="#d98c8c">*</font>
										</b></th>
										<th><input type="text" class="form-control" name="steno"></th>
										<th><b>Admission Date</b></th>
										<th><input type="date" class="form-control" name="Adate"></th>

									</tr>
								</thead>
								<thead>
									<tr>
										<th><b>Student/Parent's Bank Name</b></th>
										<th><select
											class="table-group-action-input form-control input-inline input-small input-sm"
											name="bank">
												<option value="">Select banks</option>
												<c:forEach var="c" items="${banks}">
													<option value="${ c.intBankNameId  }">${c.txtBankName  }</option>
												</c:forEach>

										</select></th>

										<th><b>Student/Parent's Bank A/c No</b></th>
										<th><input type="number" class="form-control"
											name="acNum"></th>
									</tr>

								</thead>
								<thead>
									<tr>
										<th><b> Bank IFSC Code</b></th>
										<th><input type="text" class="form-control" name="ifsc"></th>

										<th colspan=2></th>

									</tr>

								</thead>
							</table>
						</div>
					</div>
					<div class="form-actions fluid">
						<div class="col-md-offset-3 col-md-9">
							<button type="Submit" class="btn green">Submit</button>
							<button type="reset" class="btn green">Reset</button>
						</div>
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END VALIDATION STATES-->
	</div>
</div>



</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(2);
	});
</script>
<%@include file="footer.jsp"%>
