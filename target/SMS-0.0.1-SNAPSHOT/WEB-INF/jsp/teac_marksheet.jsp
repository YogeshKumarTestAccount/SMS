
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

			<%@ include file = "header.jsp" %>	 
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					Teacher 
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li class="btn-group">
							
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
								Student Marksheet
							</a>
						</li>
						
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			
			 <c:if test = "${not empty msg}">
			 
			 							<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
			 							<i class="fa fa-check-circle"></i>
								<strong>${msg}</strong>
							</div>
							</c:if>
			 <div class="alert alert-info">
								<strong>Note:</strong> 
								All (*) marked fields are mandatory.
							</div>
			
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet box green" >
						<div class="portlet-title" >
							<div class="caption" >
								<i class="fa fa-reorder"></i>Upload Student Marksheet
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
							<form:form action="marksheetupload.web" class="form-horizontal" enctype="multipart/form-data" commandName = "mstuploadstudmarksheet">
								
									

									<div class="form-group">
										<label class="col-md-3 control-label" style = "font-weight:bold">Class
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-9" style = "width:360px;">
										<form:select path="mststudclass.intClassId" class="form-control" id="class">
										<form:option value="-1" label="--Select Class--"/>
										<form:options items = "${classes}" itemValue="intClassId" itemLabel="txtClassName"/>
										</form:select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
										
										</div>
									</div>
									
									
									
									<div class="form-group">
										<label class="col-md-3 control-label" style = "font-weight:bold">Section
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-9" style = "width:360px;" >
										<form:select path="mststudclasssection.intSectionId" class="form-control" id="section">
										<form:option value="-1" label="--Select Section--"/>
										<form:options items = "${sections}" itemValue="intSectionId" itemLabel="txtSectionName"/>
										</form:select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages2"></span>
										</span>
										</div>
									</div>
									
									
									<div class="form-group">
										<label class="col-md-3 control-label" style = "font-weight:bold">Exam
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-9" style = "width:360px;">
										<form:select path="mstterms.intTermId" class="form-control" id = "examType">
										<form:option value="-1" label="--Select Exam Term--"/>
										<form:options items="${examTerms}" itemLabel="txtTermName" itemValue="intTermId"/>
										
										</form:select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages3"></span>
										</span>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-3 control-label" style = "font-weight:bold">Student Name
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-9" style = "width:360px;">
										<form:select path="mstregistration.intRegistrationId" class="form-control" id = "student">
										<form:option value="-1" label="--Select Student--"/>
										<form:options items="${students}" itemLabel="txtFirstName" itemValue="intRegistrationId"/>
										
										</form:select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages4"></span>
										</span>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-3 control-label" style = "font-weight:bold">Marksheet
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-9">
											<span class="btn green fileinput-button" style = "width:330px;background-color:grey;">
												<i class="fa fa-ban-circle"></i>
													<span>
													Browse Excel Sheet
													</span>
												<input type="file" name="file" id = "file"/>
											</span>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages5"></span>
										</span>
										</div>
										
									</div>
									<div class="alert alert-info">
								<strong>Note:</strong> 
								Only (.xsl) (.xslt) extension files are allowed.
							</div>

									
								<div class="form-actions fluid">
									<div style = "padding-left:130px" class="col-md-offset-3 col-md-9">
										<input type="submit"  class="btn green" value="Submit" id ="marksubmit1">
										
									</div>
								</div>
							</form:form>
							<!-- END FORM-->
						</div>
					</div>
					<!-- END VALIDATION STATES-->
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet box green">
								<div class="portlet-title" >
									<div class="caption">
									Uploaded Marksheets
									</div>
								</div>
					
								
								

								<div class="portlet-body">
									<div class="table-responsive">
									
									
									
									<div class="col-md-7">
									<div class="form-group">
										<label class="col-md-2 control-label" style = "font-weight:bold">Exam
										<span class="required">
											 *
										</span>
										</label>
										<form action = "searchMarksheet.web">
										<div class="col-md-7" >
										<select id = "examType2" name = "exam" class="form-control" >
										<option value="">Select Exam</option>
										<c:forEach items = "${examTerms}" var = "e">
										<option value="${e.intTermId}">${e.txtTermName}</option>
										
										</c:forEach>
										</select>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages6"></span>
										</span>
										
										</div>
										<div class="col-md-2" ><input type="submit" id ="marksubmit2" class="btn green" value="Search" >
										</div>
										</form>
									</div>
									
									</div>
									<br/><br/>
									<c:if test = "${not empty check}">
									<c:choose>
										<c:when test = "${ not empty studentMarksheet}">
					 					<table class="table table-bordered table-hover">
										<thead>
										<tr>
											<th>
												Date
											</th>
											<th>
												 Class
											</th>
											<th>
												 Section
											</th>
											<!-- <th>
												 Student Id
											</th> -->
											<th>
												Student Name
											</th>
											<th>
												 Exam
											</th>
											<th>
												 Action
											</th>
											
											
											
										</tr>
										</thead>
										<tbody>	
										
										
										
										<c:forEach items = "${studentMarksheet}" var = "m">							
											<tr>
												<td><fmt:formatDate value="${m.dtDate}" pattern="dd-MMM-yyyy"/></td>
												<td>${m.mststudclass.txtClassName}</td>
												<td>${m.mststudclasssection.txtSectionName}</td>
												<!-- <td>SD001</td> -->
												<td>${m.mstregistration.txtFirstName}&nbsp;${m.mstregistration.txtLastName}</td>
												<td>${m.mstterms.txtTermName}</td>
												<td>
												<a
		href="marksheetViewOrDownload.web?id=${m.intUploadStudMarksheetId}">
																		<button type="button" class="btn purple">
																			<i class="fa fa-upload"></i> Download
																		</button>
																	</a>
																	
												
												
												
												
												
											</tr>
										</c:forEach>	
										
										
										
										</tbody>										
										</table>
										</c:when>
										<c:otherwise><h3 style="text-align:center;font-weight:bolder;">No record found!!</h3>
										</c:otherwise>
										</c:choose>
										</c:if>
																				
									</div>
								</div>
							</div>
							<!-- END BORDERED TABLE PORTLET-->
				</div>
					
			</div>
					<!-- END VALIDATION STATES-->
				
			
			
			
			
		
	<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(105);
	});
</script>
<%@ include file = "footer.jsp" %>	 