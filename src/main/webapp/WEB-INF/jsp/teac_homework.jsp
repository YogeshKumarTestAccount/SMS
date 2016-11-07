<!DOCTYPE html>

<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.1.1
Version: 2.0.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
    $(document).ready(function () {
    	$(".chk").hide();
       $(".check").click(function () {
            if ($(this).is(":checked")) {
                $(".chk").show();
            } else {
                $(".chk").hide();
            } 



            
        });
  }); 
 
/* $(document).ready(function() {

		$('#form1').validate({ // initialize the plugin

			rules : {


				classId:
				{
				required:true
				},

				txtSubject : {

					required : true,

					lettersonly : true

				}

		
		},

			messages : {
			
				classId:
					{
					required : "please select class"
					}	,	
				txtSubject: {

					required : "enter subject"
				} 	

			},

			highlight : function(element) {

				$(element).parent().addClass('error')

			}

		});
		

	}); */
</script>



<!-- <style>
#form1 .error {
	color: red;
	font-size: 12px;
	font-weight: bolder;
}
</style> -->

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">Teacher</h3>
		<ul class="page-breadcrumb breadcrumb">
			<li class="btn-group">
				<!-- <button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
							<span>
								Actions
							</span>
							<i class="fa fa-angle-down"></i>
							</button>
							<ul class="dropdown-menu pull-right" role="menu">
								<li>
									<a href="#">
										Action
									</a>
								</li>
								<li>
									<a href="#">
										Another action
									</a>
								</li>
								<li>
									<a href="#">
										Something else here
									</a>
								</li>
								<li class="divider">
								</li>
								<li>
									<a href="#">
										Separated link
									</a>
								</li>
							</ul> -->
			</li>
			<li><i class="fa fa-home"></i> <a href="ad_index.web"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Homework </a> 
			</li>
			
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->




<c:if test="${not empty msg1}">

	<div class="alert alert-success">
		<i class="fa fa-check-circle"></i> <strong>${msg1}${msg2}</strong>
	</div>
</c:if>

<div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
</div>


<div class="row">
	<div class="col-md-12">

		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">Homework</div>
			</div>
			<div class="portlet-body">
				<div class="table-responsive">
					<form:form action="teac_homeworkPosted.web" 
						commandName="tblhomework">
						<table class="table table-bordered table-hover">
							<tbody>
								<tr>
									<td style="font-weight: bold">Class <span class="required"
										style="color: red"> * </span></td>
									<td><form:select  name="classId" path="mststudclass.intClassId" id = "class"
											class="form-control" >
											<form:option value="-1" label="--Select Class--" />
											<form:options items="${classes}" itemValue="intClassId"
												itemLabel="txtClassName" />
										</form:select> 
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span></td>

									<td style="font-weight: bold">Section <span
										class="required" style="color: red"> * </span></td>
									<td><form:select path="mststudclasssection.intSectionId" 
											class="form-control" id="section">
											<form:option value="-1" label="--Select Section--" />
											<form:options items="${sections}" itemValue="intSectionId"
												itemLabel="txtSectionName" />
										</form:select> 
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages2"></span>
										</span></td>
								</tr>


								<tr>
									<td style="font-weight: bold">Subject<span
										class="required" style="color: red"> * </span>
									</td>
									<td><input name="txtSubject" id="subject"
										placeholder="Enter the subject" class="form-control" /> <span
										style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages3"></span>
									</span></td>
									<td style="font-weight: bold">Homework <span
										class="required" style="color: red"> * </span>
									</td>
									<td><textarea class="form-control" name="txtHomeWork"
											id="homework"></textarea> <span
										style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages4"></span>
									</span></td>

								</tr>
								<tr>
									<td style="font-weight: bold">Due Date <span
										class="required" style="color: red"> * </span></td>
									<td><input name="dtDueDate" id="dtDueDate"
										class="form-control form-control-inline input-medium date-picker" />
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages5"></span>
									</span></td>
									<td style="font-weight: bold"><a href="teac_profile.web"><input
											type="checkbox" class = "check"></a>Assign To</td>
									<td>
										<!-- id="select2_sample_modal_2"  class="form-control" multiple-->
										<div class = "chk">
  									 <select class="form-control select2" id="select2_sample_modal_2" name = "select" placeholder = "Select Student" multiple>

								
											<c:forEach items = "${students}" var = "s">
										<option value="${s.intRegistrationId}">${s.txtFirstName}&nbsp;${s.txtLastName}</option>
										
										</c:forEach>

									</select>
									</div>
									</td>
								</tr>






							</tbody>
						</table>
						<div style="padding-left: 450px">
							<input type="submit" class="btn green" value="Submit" id="submit1"
								 />
						</div>
					</form:form>


				</div>
			</div>
		</div>
		<!-- END BORDERED TABLE PORTLET-->



		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">Homework History</div>
				<br />


				<form action="teachHomeworkHistory.web">
					<div class="col-md-4">
				<!-- 	<label class="control-label col-md-2">From</label> -->
						<table class="table table-striped table-bordered table-hover">
							<tr>
							<td><span class="input-group-addon"> From </span></td>
								<td><input name="fromDate"
									class="form-control form-control-inline input-medium date-picker"
									id="date1"> 
									<span
									style="color: red;font-weight: bolder;"> <span
										class="field-validation-valid" id="validationMessages6"></span>
								</span>
									</td>
									
								<td><span class="input-group-addon"> to </span></td>
								<td><input name="toDate"
									class="form-control form-control-inline input-medium date-picker"
									id="date2">
									<span
									style="color: red; font-weight: bolder;"> <span
										class="field-validation-valid" id="validationMessages7"></span>
								</span>
									</td> 
								<td><input type="submit" id="submit2"
									class="btn btn-primary" value="Search"></td>
							</tr>
							

						</table>

					</div>

				</form>
			</div>


			<div class="portlet-body">
				<div class="table-responsive">
					<c:if test="${not empty history}">
						<c:choose>
							<c:when test="${not empty homeworkHistory}"> 
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Date</th>
											<th>Class</th>
											<th>Section</th>
											<th>Subject</th>
											<th>Homework</th>
											<th>Submission Date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${homeworkHistory}" var="history">
											<tr>
												<td><fmt:formatDate value="${history.dtAssignDate}"
														pattern="dd-MMM-yyyy" /></td>
												<td>${history.mststudclass.txtClassName}</td>
												<td>${history.mststudclasssection.txtSectionName}</td>
												<td>${history.txtSubject}</td>
												<td>${history.txtHomeWork}</td>
												<td><fmt:formatDate value="${history.dtDueDate}"
														pattern="dd-MMM-yyyy" /></td>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</c:when>

							<c:otherwise>
								<h3 style="text-align: center; font-weight: bolder;">No
									record found!!</h3>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>












		</div>




	</div>



</div>
<!-- 	</div> -->
<!-- END CONTENT -->
<!-- </div> -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->

<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(102);
	});
</script>
<%@ include file="footer.jsp"%>
