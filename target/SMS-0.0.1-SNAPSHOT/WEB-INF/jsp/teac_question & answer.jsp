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
						<i class="fa fa-question-circle"></i>
							<a href="#">
								Question & Answer
							</a>
							
						</li>
						
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			
			<c:if test = "${not empty msg}">
			 
			 							<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
			 							<i class="fa fa-check-circle"></i>
								<strong>${msg}</strong>
							</div>
							</c:if>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					
							
							
							<div class="portlet box green">
								<div class="portlet-title">
									<div class="caption">
									Question Answer
									</div>
								</div>
								<div class="portlet-body">
								
								
								
								<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<tbody>
									<c:if test = "${! empty questions}">
								<c:forEach items = "${questions}" var = "q">
								
								<form action = "teac_answer.web">
								<tr>
									<td><p><b>Class</b> : ${q.mstregistration.mststudclass.txtClassName}<br/>
								<!-- <b>Section:A</b><br/> -->
								<b>StudentName:</b>${q.mstregistration.txtFirstName}&nbsp;${q.mstregistration.txtLastName}<br/>
								<b>Question:</b>${q.txtQuestion}</p>
								</td>
								</tr>
									<tr>

										<td><b>Answer</b> :<textarea class="form-control" name = "answer" id = "answer"></textarea>
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
										</td>
									</tr>
									<tr>
									<td align = "center">
									<input type = "hidden" name = "id" value = "${q.intQuestionAndAnswerId}">
									<button type="submit"  class="btn green" id = "ansSubmit">Send</button></td>
									</tr>
									
									</form>
									</c:forEach>
								</c:if>
								<c:if test = "${empty questions}">
								<h3 style="text-align:center;font-weight:bolder;">No Questions are available to answer</h3>
								</c:if>
								
								
								</tbody>
								
								</table>
								</div>
				 				
								
									
								</div>
							</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(103);
	});
</script>
	<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file = "footer.jsp"%>