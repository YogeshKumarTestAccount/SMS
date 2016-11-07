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
								Leave Inbox
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
			 
			 <c:if test = "${not empty approve}">
			 
			 							<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
			 								<i class="fa fa-check-circle"></i>
								<strong>${approve}</strong> 
							</div>
							</c:if>
			<c:if test = "${not empty reject}">
			 
			 							<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
			 								<i class="fa fa-times"></i> 
								<strong>${reject}</strong> 
							</div>
							</c:if>
							
			 <!--  <div class="alert alert-info">
								<strong>Note:</strong> 
								All (*) marked fields are mandatory.
							</div> -->
			 
			 
			
			<div class="row" >
				<div class="col-md-12">
				
				<%-- <div style = "height:300px;overflow: scroll-y;">
				<div class="portlet box green"  >
								<div class="portlet-title" >
									<div class="caption">
									Student Leave Request 
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
										<table class="table table-bordered table-hover">
										<thead>
										<tr>
										<th>
												Student Name
											</th>
											<th>
												Applied Date
											</th>
											<th>
												 Leave Type
											</th>
											<th>
												 From Date
											</th>
											
											<th>
												To Date
											</th>
											<th>
												 Reason
											</th>
											<th>
												Action
											</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items ="${studentLeaveRequest}" var = "l">
											<c:if test="${l.intStatus==1}">
										<tr>
										<td>${l.mstregistration.txtFirstName} &nbsp;${l.mstregistration.txtLastName}</td>
										<td><fmt:formatDate value="${l.dtAppliedDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.mstleave.txtLeaveType }</td>
										<td><fmt:formatDate value="${l.dtFromDate}" pattern="dd-MMM-yyyy"/></td>
										<td><fmt:formatDate value="${l.dtToDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.txtReason}</td>
										<td>
										<a href = "#" class="label label-sm label-success" style = "font-weight: bolder;" >Approve</a>
										<a href = "#" class="label label-sm label-danger" style = "font-weight: bolder;">Reject</a>
										
										</td>
										</tr>
										</c:if>
										</c:forEach>
										
										
										
									</tbody>										
										</table>
										
																		
									</div>
								</div>
							</div>
							</div>
							<!-- END BORDERED TABLE PORTLET-->
							
							
							<div style = "height:300px;overflow: scroll-y;">
				<div class="portlet box green"  >
								<div class="portlet-title" >
									<div class="caption">
									Approved/Rejected Leave
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
										<table class="table table-bordered table-hover">
										<thead>
										<tr>
										<th>
												Student Name
											</th>
										
											<th>
												Applied Date
											</th>
											<th>
												 Leave Type
											</th>
											<th>
												 From Date
											</th>
											
											<th>
												To Date
											</th>
											<th>
												 Reason
											</th>
											<th>
												Status
											</th>
											<th>
												Approved/Rejected Date
											</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items ="${studentLeaveRequest}" var = "l">
											<c:if test="${l.intStatus==2 or l.intStatus==3}">
										<tr>
										<td>${l.mstregistration.txtFirstName} &nbsp;${l.mstregistration.txtLastName}</td>
										
										
										<td><fmt:formatDate value="${l.dtAppliedDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.mstleave.txtLeaveType }</td>
										<td><fmt:formatDate value="${l.dtFromDate}" pattern="dd-MMM-yyyy"/></td>
										<td><fmt:formatDate value="${l.dtToDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.txtReason}</td>
										<td>
										
										<c:if test = "${l.intStatus==2}">
										<p class="label label-sm label-success" style = "font-weight: bolder;">Approved</p>
										</c:if>
										<c:if test = "${l.intStatus==3}">
										<p class="label label-sm label-danger" style = "font-weight: bolder;">Rejected</p>
										</c:if>
										
										</td>
										<td><fmt:formatDate value="${l.dtApprovedDate}" pattern="dd-MMM-yyyy"/></td>
										</tr>
										</c:if>
										</c:forEach>
										
										
										
									</tbody>										
										</table>
										
																		
									</div>
								</div>
							</div>
							</div>
							<!-- END BORDERED TABLE PORTLET-->
							
							
					 --%>
									
						<div class="portlet box green">
							 <div class="portlet-title">
        <div class="caption" style="padding-left:420px">
            Leave Approvals Request
        </div>
    </div>
						<div class="portlet-body">
							<ul class="nav nav-pills">
								<li class="active">
									<a href="#tab_2_1" data-toggle="tab">
									Request Status
							
									</a>
								</li>
								<li>
									<a href="#tab_2_2" data-toggle="tab">
										Pending Request
									</a>
								</li>
								
							</ul>
							
							
							<div class="tab-content">
								<div class="tab-pane fade" id="tab_2_2">
								
									<div class="portlet-body">
									<div class="table-responsive">
									
									<c:choose>
									<c:when test = "${not empty studentLeaveRequest}">
										<table class="table table-bordered table-hover">
										<thead>
										<tr>
										<th class="info">
												Student Name
											</th>
											<th class="info">
												Applied Date
											</th>
											<th class="info">
												 Leave Type
											</th>
											<th class="info">
												 From Date
											</th>
											
											<th class="info">
												To Date
											</th>
											<th class="info">
												 Reason
											</th>
											<th class="info">
												Action
											</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items ="${studentLeaveRequest}" var = "l">
											<c:if test="${l.intStatus==1}">
										<tr>
										<td>${l.mstregistration.txtFirstName} &nbsp;${l.mstregistration.txtLastName}</td>
										<td><fmt:formatDate value="${l.dtAppliedDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.mstleave.txtLeaveType }</td>
										<td><fmt:formatDate value="${l.dtFromDate}" pattern="dd-MMM-yyyy"/></td>
										<td><fmt:formatDate value="${l.dtToDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.txtReason}</td>
										<td>
										<a href = "teac_studLeaveApprove.web?id=${l.intStudentLeaveAppId}" class="label label-sm label-success" style = "font-weight: bolder;" >Approve</a>
										<a href = "teac_studLeaveReject.web?id=${l.intStudentLeaveAppId}" class="label label-sm label-danger" style = "font-weight: bolder;">Reject</a>
										
										</td>
										</tr>
										</c:if>
										</c:forEach>
										
										
										
									</tbody>										
										</table>
										</c:when>
										<c:otherwise>
										<h3 style="text-align:center;font-weight:bolder;">No pending request</h3>
										</c:otherwise>
										</c:choose>
										
																		
									</div>
								
							
								</div>
								</div>
								<div class="tab-pane fade active in" id="tab_2_1">
									<div class="portlet-body">
									<form action="teac_leaveRequestSearch.web" method="post">                           
									 <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <th><b>From Date</b> </th>
                                    <th><input class="form-control date-picker" id="date1" name="FromDate" type="text" value="" /><span
									style="color: red; font-weight: bolder; "> <span
										class="field-validation-valid" id="validationMessages6"></span>
									</span></th>
                                    <th><b>To Date</b></th>
                                    <th><input class="form-control date-picker" id="date2" name="ToDate" type="text" value="" /><span
									style="color: red; font-weight: bolder;  "> <span
										class="field-validation-valid" id="validationMessages7"></span>
									</span></th>
                                    <th><b>Status</b></th>
                                    <th><select class="form-control" id="select" name="Status">
                                    <option value="-1">Select</option>
                                    <option value="1">-- All --</option>
<option value="2">Approved</option>
<option value="3">Rejected</option>

</select>
<span
									style="color: red; font-weight: bolder; "> <span
										class="field-validation-valid" id="validationMessages8"></span>
									</span>
                                    </th>
                                    <th>
                                        <button type="submit" id = "projsubmit2" class="btn yellow filter-submit margin-bottom" id="btnSearch"><i class="fa fa-search"></i> Search</button>
                                    </th>
                                    
									
                                </tr>
                            </table>
</form>                     
							
									<div class="table-responsive">
									<c:if test="${! empty check}">
									<c:choose>
									<c:when test="${! empty studentLeaveRequest1}">
										<table class="table table-bordered table-hover">
										<thead>
										<tr>
										<th  class="info">
												Student Name
											</th>
										
											<th class="info">
												Applied Date
											</th>
											<th class="info">
												 Leave Type
											</th>
											<th class="info">
												 From Date
											</th>
											
											<th class="info">
												To Date
											</th>
											<th class="info"class="info">
												 Reason
											</th>
											
											<th class="info">
												Approved/Rejected Date
											</th>
											<th class="info">
												Status
											</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items ="${studentLeaveRequest1}" var = "l">
											<c:if test="${l.intStatus==2 or l.intStatus==3}">
										<tr>
										<td>${l.mstregistration.txtFirstName} &nbsp;${l.mstregistration.txtLastName}</td>
										
										
										<td><fmt:formatDate value="${l.dtAppliedDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.mstleave.txtLeaveType }</td>
										<td><fmt:formatDate value="${l.dtFromDate}" pattern="dd-MMM-yyyy"/></td>
										<td><fmt:formatDate value="${l.dtToDate}" pattern="dd-MMM-yyyy"/></td>
										<td>${l.txtReason}</td>
										
										<td><fmt:formatDate value="${l.dtApprovedDate}" pattern="dd-MMM-yyyy"/></td>
										<td>
										
										<c:if test = "${l.intStatus==2}">
										<p class="label label-sm label-success" style = "font-weight: bolder;">Approved</p>
										</c:if>
										<c:if test = "${l.intStatus==3}">
										<p class="label label-sm label-danger" style = "font-weight: bolder;">Rejected</p>
										</c:if>
										
										</td>
										</tr>
										</c:if>
										</c:forEach>
										
										
										
									</tbody>	
																		
										</table>
										</c:when>
										<c:otherwise><h3 style="text-align:center;font-weight:bolder;">No record found!!</h3></c:otherwise>
										</c:choose>
										</c:if>
										</div>								
									</div>
								
							
								
							</div>
						</div>
							
						</div>			

									
									
							
									
									
								
				</div>
			 
			
							
							
			</div>
			
			
			
		</div>
	<!-- END CONTENT -->

<%@ include file = "footer.jsp" %>	
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(111);
	});
</script> 
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
