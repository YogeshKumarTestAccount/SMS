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
			Homework <small>(and Project)</small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Homework </a></li>

		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<c:if test = "${!empty msg}">
<c:if test="${empty homework}">
<div class="alert alert-info">
					<strong>No Record Found!!!</strong>
				</div>
	</c:if></c:if>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="form-group">
	<form action="par_homework.web" method="POST">
		<label class="col-md-2 control-label"><b>Select Student: </b></label>
		<div class="col-md-5">
			<select  id="parent" style="width: 40%" class="form-control" name="studentName">
				<option value = "-1">Select</option>
				<c:forEach items="${regal}" var="s">
					<option><c:out value="${s.txtFirstName}">${s.txtFirstName}</c:out></option>
				</c:forEach>
			</select>
			<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
		</div>
		<p>
			<label>Or select a date:</label>&nbsp;
							<input name = "date" class="form-control form-control-inline input-medium date-picker"
							data-date="2012-10-11" data-date-format="yyyy-mm-dd"
								size="16" type="text" value="" >&nbsp;
								
		</p><input type="submit" value = "Go" class="btn btn-primary" id = "parSubmit">
	<!-- 	<input type="submit" class="btn btn-primary"> -->
		</form>
		<br><br><br>
	</div>
<div class="row">
	<div class="col-md-12">
	<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">Today's Homework</div>
			</div>
			</div>
		<!-- <h2></h2> -->
		<!-- <p>
			<span><div style="float: right" class="form-group">
					<table border="0">
						<tr>
							<td><label>Or select a date:</label>&nbsp</td>
							<td><input name = "date"
								class="form-control form-control-inline input-medium date-picker"
								size="16" type="text" value="">&nbsp</td>
							<td>
								<button class="btn blue">Go</button>
							</td>
						</tr>
					</table>
				</div></span>
		</p> -->
		<table id="user" class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<th style="width: 15%">Subject</th>
					<th style="width: 50%">Homework</th>
					<th style="width: 50%">Submission Date</th>
				</tr>
				<c:forEach items="${homework}" var = "t">
				<tr>
				<td>${t.txtSubject}</td>
				<td>${t.txtHomeWork}</td>
				<td>${t.dtDueDate}</td>
				</tr>
				</c:forEach>
				<tr>
				<tr>
					<td colspan="3"><div style="text-align: center">
							<ul class="pagination pagination-sm">
								<li><a href="#"> <i class="fa fa-angle-left"></i>
								</a></li>
								<li><a href="#"> 1 </a></li>
								<li><a href="#"> 2 </a></li>
								<li><a href="#"> 3 </a></li>
								<li><a href="#"> 4 </a></li>
								<li><a href="#"> 5 </a></li>
								<li><a href="#"> 6 </a></li>
								<li><a href="#"> <i class="fa fa-angle-right"></i>
								</a></li>
							</ul>

						</div></td>
				</tr>
			</tbody>
		</table>
		
		<div style="text-align: center">
			<button type="button"
				onclick="window.location.href='par_projects.web'" type="button"
				class="btn btn-primary">View Projects</button>
		</div>
	</div>
</div>

<!-- END PAGE CONTENT-->
<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(205);
	});
</script>
<%@include file="footer.jsp"%>