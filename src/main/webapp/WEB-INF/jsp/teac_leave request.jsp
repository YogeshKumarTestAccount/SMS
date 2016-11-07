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

			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ include file = "header.jsp" %>	  
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
								Leave Application
							</a>
							<!-- <i class="fa fa-angle-right"></i> -->
						</li>
						<!-- <li>
							<a href="#">
							New	
							</a>
						</li> -->
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			 
			 <c:if test = "${not empty msg1}">
			 
			 							<div class="alert alert-success">
			 								<i class="fa fa-check-circle"></i>
								<strong>${msg1}</strong> 
							</div>
							</c:if>
							
			  <div class="alert alert-info">
								<strong>Note:</strong> 
								All (*) marked fields are mandatory.
							</div>
			 
			 
			
			<div class="row">
				<div class="col-md-12">
				
				<div class="portlet box green" >
								<div class="portlet-title" >
									<div class="caption">
									Leave Application
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
									<form:form action="teachPostLeaveRequest.web" commandName="trnteacherleaveapp">
										<table class="table table-bordered table-hover">
										<tbody>
										<tr>
										<td style = "font-weight:bold">Leave Type
										<span class="required" style ="color:red">
											 *
										</span></td>
										<td>
											<form:select path="mstleave.intLeaveId" class="form-control" id = "leaveType">
										<form:option value="-1" label="--Select leave Type--"/>
										<form:options items = "${leaveTypes}" itemValue="intLeaveId" itemLabel="txtLeaveType"/>
										</form:select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
										</td>
										
										<td style = "font-weight:bold">From Date
										<span class="required" style ="color:red">
											 *
										</span></td>
										<td><input name="dtFromDate" id = "date1" class="form-control form-control-inline input-medium date-picker" />
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages2"></span>
										</span>
										</td>
										</tr>
										
										
										<tr>
										<td style = "font-weight:bold">To Date<span class="required" style ="color:red">
											 *
										</span>
										</td>
										<td><input name="dtToDate" id = "date2" class="form-control form-control-inline input-medium date-picker"  />
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages3"></span>
										</span>
										</td>
										<td style = "font-weight:bold">Please specify reason
										<span class="required" style ="color:red">
											 *
										</span>
										</td>
										<td><textarea class="form-control" name = "txtReason" id = "txtReason"></textarea>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages4"></span>
										</span>
										</td>
										
										</tr>
										
										
										
										
									</tbody>										
										</table>
										<div style = "padding-left:450px">
										<input type="submit" class="btn green" value="Submit" id = "leaveSubmit"></div>
																		
									</form:form>
									</div>
								</div>
							</div>
							<!-- END BORDERED TABLE PORTLET-->
							
							
							
							
							
					
									
									
									

									
									
							
									
									
								
				</div>
			 
			
							
							
			</div>
			
			
			
	<!-- END CONTENT -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(109);
	});
</script>
<%@ include file = "footer.jsp" %>	 
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
