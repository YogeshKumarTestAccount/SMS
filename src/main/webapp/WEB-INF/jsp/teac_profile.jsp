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
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file = "header.jsp"%>

			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					Teacher
					</h3>
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
						<li>
							<i class="fa fa-home"></i>
							<a href="ad_index.web">
								Home
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								Profile
							</a>
							<!-- <i class="fa fa-angle-right"></i> -->
						</li>
						<!-- <li>
							<a href="#">
								Edit Profile
							</a>
						</li> -->
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			
			 
			 
			 
			 							<c:if test = "${not empty msg1}">
			 
			 							<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
			 							<i class="fa fa-check-circle"></i>
								<strong>${msg1}${msg2}</strong> 
							</div>
							</c:if>
			 
			
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet box green" >
						<div class="portlet-title" >
							<div class="caption" >
								<i class="fa fa-reorder"></i>Profile
							</div>
							<!-- <div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div> -->
						</div>
						<div class="portlet-body form">
						
							<!-- BEGIN FORM-->
							<!-- <form action="#" id="form_sample_1" class="form-horizontal"> -->
							
								<div class="form-body">
									
									<form:form action="profileEdit.web"  class="form-horizontal" commandName="mstregistration">
									<c:forEach items="${teacherProfile}" begin="0" end="0" var = "profile">

									<div class="form-group">
										<label class="control-label col-md-3" style = "font-weight:bold">Name</label>
										<div class="col-md-4">
										<form:input path="txtFirstName" value="${profile.txtFirstName}" data-required="1" class="form-control" readonly="true"/>
										</div>
									</div>
									
 
									
									<div class="form-group">
										<label class="control-label col-md-3" style = "font-weight:bold">Designation</label>
										<div class="col-md-4">
										<form:input path ="txtDesignation"  value="${profile.txtDesignation}" data-required="1" class="form-control" readonly="true" />
										</div>
									</div>
									
									

									
																		<div class="form-group">
										<label class="control-label col-md-3" style = "font-weight:bold">Experience</label>
										<div class="col-md-4">
											<form:input path="txtExperience"  value="${profile.txtExperience}" data-required="1" class="form-control" readonly="true" />
										</div>
									</div>
									
									
									
																		<div class="form-group">
										<label class="control-label col-md-3" style = "font-weight:bold">Permanent Address
										<span class="required" style ="color:red">
											 *
										</span>
										</label>
										<div class="col-md-4">
										<textarea name="txtPerAddress" class="form-control" id = "perAddr" >${profile.txtPerAddress}</textarea>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
										</div>
									</div>
									
									<div class="form-group">
										<label class="control-label col-md-3" style = "font-weight:bold">Temporary Address
										<span class="required" style ="color:red">
											 *
										</span>
										</label>
										<div class="col-md-4">
										<textarea name ="txtTempAddress"class="form-control" id = "tempAddr" >${profile.txtTempAddress}</textarea>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages2"></span>
										</span>
										</div>
									</div>
									
									<div class="form-group">
										<label class="control-label col-md-3"style = "font-weight:bold">Email ID
										<span class="required" style ="color:red">
											 *
										</span>
										</label>
										<div class="col-md-4">
										<form:input path="txtEmailId" id = "emailID"  value="${profile.txtEmailId}" data-required="1" class="form-control" />
											<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages3"></span>
										</span>
										</div>
									</div>
									
									<div class="form-group">
										<label class="control-label col-md-3" style = "font-weight:bold">Mobile Number
										<span class="required" style ="color:red">
											 *
										</span>
										</label>
										<div class="col-md-4">
										<form:input path="txtFotherNumber" id = "mobileNumber" value="${profile.txtFotherNumber}" data-required="1" class="form-control" />
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages4"></span>
										</span>
										</div>
									</div>
									
									
									
									
									
								<div class="form-actions fluid">
									<div style = "padding-left:130px" class="col-md-offset-3 col-md-9">
										<button type="submit"  class="btn green" id = "profileSubmit">Update</button>
										
									</div>
								</div>
								</c:forEach>
							</form:form>
							<!-- END FORM-->
						</div>
					</div>
					<!-- END VALIDATION STATES-->
				</div>
			</div>
			
			
			
		</div>
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(101);
	});
</script>
	<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file = "footer.jsp"%>