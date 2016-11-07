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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file = "header.jsp"%>

			
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					Teacher
					</h3>
					<ul class="page-breadcrumb breadcrumb">
					
						<li>
							<i class="fa fa-home"></i>
							<a href="ad_index.web">
								Home
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
						<i class="fa fa-upload"></i>
							<a href="#">
								Send Invites
							</a>
							
						</li>
						
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			 <c:if test = "${not empty invite}">
			 
			 							<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
			 							<i class="fa fa-check-circle"></i>
								<strong>${invite}</strong>
							</div>
							</c:if>
			 <div class="alert alert-info">
								<strong>Note:</strong> 
								All (*) marked fields are mandatory.
							</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					
							
							
							<div class="portlet box green">
								<div class="portlet-title" >
									<div class="caption">
									Invite
									</div>
								</div>
								<div class="portlet-body">
								
								
								
								<div class="table-responsive">
								<form:form action="teac_InvitePost.web" commandName="mstteacherinvite">
								<table class="table table-bordered table-hover">
								<tbody>
								
								<tr>
										<td style = "font-weight:bold">Class
										<span class="required" style ="color:red">
											 *
										</span></td>
										<td><form:select path="mststudclass.intClassId" class="form-control" id = "class">
										<form:option value="-1" label="--Select Class--"/>
										<form:options items = "${classes}" itemValue="intClassId" itemLabel="txtClassName"/>
										</form:select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
										</td>
										
										<td style = "font-weight:bold">Section
										<span class="required" style ="color:red">
											 *
										</span></td>
										<td><form:select path="mststudclasssection.intSectionId" class="form-control" id = "section">
										<form:option value="-1" label="--Select Section--"/>
										<form:options items = "${sections}" itemValue="intSectionId" itemLabel="txtSectionName"/>
										</form:select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages2"></span>
										</span>
										</td>
										</tr>
										
								
								<tr>
									
									
									<td style = "font-weight:bold">Message<span class="required" style ="color:red">
											 *
										</span></td>
									<td><textarea class="form-control" placeholder = "Enter the message" name = "txtMessage" id = "message"></textarea>
									<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages3"></span>
										</span>
									</td>
								</tr>
								
								
									
									<tr>
									<td colspan = "4" align = "center"><input type="submit" value = "Send" class="btn green" id = "invite"></td>
									</tr>
								</tbody>
								
								</table>
								</form:form>
								</div>
								
								
									
								</div>
							</div>
		
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(107);
	});
</script>
	<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file = "footer.jsp"%>