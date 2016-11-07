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
			<li><a href="#"> Homework </a> <i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#"> Projects </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<c:if test = "${!empty noRecordErr }">
<div class = "alert alert-danger"><strong>Alert! No Project Detail Found</strong></div>
	</c:if>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<form action="par_projects.web" method="POST">
	<div class="form-group">
		<label class="col-md-2 control-label"><b>Select Student: </b></label>
		<div class="col-md-5">
			<select id="parent" style="width: 40%" class="form-control" name="studentName">
				<option value = "-1">Select</option>
				<c:forEach items="${regal}" var="m">
					<%-- <option value="${m.intRegistrationId}">${m.txtStudentFirstName}</option> --%>
					<option value="${m.txtFirstName}">${m.txtFirstName}</option>
				</c:forEach>
			</select>
			<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
		</div>
	</div>
	<input type="submit" id = "parSubmit" class="btn btn-primary">
	
<br><br><br>

<div class="row">
	<div class="col-md-12">
	<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">Projects</div>
			</div>
			</div>
		<table id="user" class="table table-bordered table-striped">
			<tbody>
				<tr>
					<th style="width: 15%">Subject</th>
					<th style="width: 50%">Project</th>
					<th style="width: 50%">Submission Date</th>
				</tr>
				<c:forEach items="${project}" var= "p">
				<tr>
					<td style="width: 15%">${p.txtProjectName}</td>
					<td style="width: 50%">${p.txtProjectDescription}</td>
					<td style="width: 50%">${p.dtDueDate }</td>
				</tr>
				</c:forEach>
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
				onclick="window.location.href='par_homework.web'" type="button"
				class="btn btn-primary">Back</button>
		</div>
	</div>

</div>
</form>
<!-- END PAGE CONTENT-->
<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="footer.jsp"%>
