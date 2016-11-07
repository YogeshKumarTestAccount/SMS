<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			Attendance <small>Your child's daily report</small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Attendance </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<c:if test="${!empty msg}">

	<c:if test="${empty trnAttendance }">
				<div class="alert alert-info">
					<strong>No Record Found!!!</strong>
				</div>
			</c:if>
</c:if>

<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->

<form action="par_attendance.web" method="POST">
	<div class="form-group">
		<label class="col-md-2 control-label"><b>Select Student: </b></label>
		<div class="col-md-5">

			<select id="parent" style="width: 40%" class="form-control"
				name="mstregistration">
				<option value="-1">Select</option>
				<c:forEach items="${regal}" var="m">
					<option value="${m.txtFirstName}">${m.txtFirstName}</option>
				</c:forEach>
			</select>
			<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
		</div>

		<input type="submit" class="btn btn-primary" id = "parSubmit">
	</div>
</form>
<br>
<br>
<br>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN BORDERED TABLE PORTLET-->
		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">Today's Attendance</div>
			</div>
			<div class="portlet-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Date</th>
								<th>In Time</th>
								<th>Out Time</th>
								<th>Total Hours(HH:MM)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${trnAttendance}" var="atd">
								<tr>
									<td>${atd.dtSlotDate }</td>
									<td>${inTime}</td>
									<td>${outTime}</td>
									<td>${totalHours}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<c:if test="${!empty msg1}">
	<c:if test="${empty trnBetweenAttendance }">
				<div class="alert alert-info">
					<strong>${msg1}&nbsp;&nbsp;&nbsp;Alert! No Record Found</strong>
				</div>
			</c:if>
</c:if>
<%-- <c:if test = "${!empty msg1 }">

<c:if test="${empty trnBetweenAttendance}">
<div class = "alert alert-danger"><strong>Alert! No Record Found</strong></div>
	</c:if></c:if> --%>
<!-- END BORDERED TABLE PORTLET-->

<!-- BEGIN BORDERED TABLE PORTLET-->
<%-- <c:if test = "${!empty msg}">
<c:if test="${empty trnBetweenAttendance}">
<div class = "alert alert-danger"><strong>Alert! No Record Found Allx</strong></div>
	</c:if></c:if> --%>

<div class="portlet box green">
	<form action="par_attendance.web" method="POST">
		<div class="portlet-title" style="padding: 4px 10px 4px 10px;">

			<label style="margin-top: 6px;" class="control-label col-md-1">From:</label>
			<div class="col-md-4">
				<div class="input-group input-large date-picker input-daterange" 
					data-date="2012-10-11" data-date-format="yyyy-mm-dd">
					<input type="text" class="form-control" name="fromDate" 
						id = "date1">
						<span
									style="color: red; font-weight: bolder;"> <span
										class="field-validation-valid" id="validationMessages6"></span>
									</span>
						 <span class="input-group-addon">
						to </span>
						
						
						 <input type="text" class="form-control" name="toDate" id = "date2">
						 <span
									style="color: red; font-weight: bolder;"> <span
										class="field-validation-valid" id="validationMessages7"></span>
									</span>
				</div>
			</div>
			<input type="submit"  value="Search" class="btn btn-primary" id = "projsubmit2">
		</div>
	</form>
</div>
<div class="portlet-body">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Date</th>
					<th>In Time</th>
					<th>Out Time</th>
					<th>Total Hours(HH:MM)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="a">
					<tr><td>${a.date }</td>
					<td>${a.inTime }</td><td>${a.outTime }</td><td>${a.totalhrs }</td>
					</tr>
				</c:forEach>				
			</tbody>
		</table>

	</div>
</div>
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(202);
	});
</script>

<%-- <%@include file="par_attendance_1.jsp"%> --%>
<%@include file="footer.jsp"%>