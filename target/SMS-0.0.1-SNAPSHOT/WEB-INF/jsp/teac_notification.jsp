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
								Notification
							</a>
							<!-- <i class="fa fa-angle-right"></i> -->
						</li>
						
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			
			 
			 
			 
			 
			 
			 
			 
			
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet box green" >
								<div class="portlet-title" >
									<div class="caption">
									Notification
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
									
									<c:choose>
									<c:when test="${not empty notification}">
										<table class="table table-bordered table-hover">
										<thead>
										<tr>
											<th>
												Date
											</th>
											<th>
												 Title
											</th>
											<th>
												 Description
											</th>
											<th>
												 Attachment
											</th>
											
											
										</tr>
										</thead>
										<tbody>	
										<c:forEach items = "${notification}" var = "n">							
											<tr>
												<td><fmt:formatDate value="${n.dtDate}" pattern="dd-MMM-yyyy"/></td>
												<td>${n.txtInvitationTitle}</td>
												<td>${n.txtBody}</td>
												<td>
												<c:choose>
												<c:when test="${empty n.blUploadFile }">
												No attachment found
												</c:when>
												<c:otherwise>
												${n.txtfileName}
												<!-- <button type="submit"   class="btn green">Download</button> -->
												<a
		href="notificationFileDownload.web?id=${n.intInvitesId}">
																		<button type="button" class="btn purple">
																			<i class="fa fa-upload"></i> Download
																		</button>
																	</a>
												</c:otherwise>
												</c:choose>
												</td>
												
												
											</tr>
											</c:forEach>	
											
											
										</tbody>										
										</table>
										</c:when>
										<c:otherwise>
										<h3 style="text-align:center;font-weight:bolder;">Notification are not available!!</h3>
										</c:otherwise>
										</c:choose>										
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
	  
	   slider(104);
	});
</script>
<%@include file = "footer.jsp"%>