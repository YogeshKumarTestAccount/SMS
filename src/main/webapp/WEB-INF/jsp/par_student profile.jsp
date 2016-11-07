<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- BEGIN PLUGINS USED BY X-EDITABLE -->

        
<link rel="stylesheet" type="text/css"
	href="assets/plugins/select2/select2.css" />
<link rel="stylesheet" type="text/css"
	href="assets/plugins/select2/select2-metronic.css" />
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap-datetimepicker/css/datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap-editable/bootstrap-editable/css/bootstrap-editable.css" />
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap-editable/inputs-ext/address/address.css" />
<!-- END PLUGINS USED BY X-EDITABLE -->
<!-- <script type="text/javascript">
	document.getElementById("mySelect").value = "${studentName}";
</script> -->
<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			Student's Information <small>Details of your child</small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Student Profile </a></li>

		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<c:if test="${!empty noRecordErr }">
	<div class="alert alert-danger">
		<strong>Alert! No Student Record Found</strong>
	</div>
</c:if>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<%-- <form  action="${pageContext.request.contextPath}/par_student profile" name="form1" id="smart-form" method="post"> --%>

<div class="form-group">

	<label class="col-md-2 control-label"><b>Select Student: </b></label>
	<form action="par_student profile.web" id="demo" method="POST">
		<div class="col-md-5">
			<select  id="parent" style="width: 40%" class="form-control" 
			name="studentName">
				<option value = "-1">Select</option>
				<c:forEach items="${mst}" var="s">
					<option><c:out value="${s.txtFirstName}">${s.txtFirstName}</c:out></option>
				</c:forEach>
			</select>
			<span style="color: red; font-weight: bolder;">
				 	<span	class="field-validation-valid" id="validationMessages1"></span>
			</span>
		</div>
		<input type="submit"  class="btn btn-primary" id = "parSubmit"> <br>
		</form>
		<br>
		<br>
</div>

<!-- <button id= "show" type = "button" onClick="myFunction()" style = "center" class = "btn btn-primary">Update</button> -->
<div class="row">
	<div class="col-md-12">
		<c:forEach items="${studDetail}" var="s">

			<table id="user" class="table table-bordered table-striped">
				<tbody>
					<tr>
						<td class="bold" style="width: 15%">Student Name</td>
						<td style="width: 50%">${s.txtFirstName}</td>
					</tr>
					<tr>
						<td class="bold">DOB</td>
						<td>${s.dtDob }</td>
					</tr>
					<tr>
						<td class="bold">Sex</td>
						<td>${s.mstgender.txtGenderName}</td>
					</tr>
					<tr>
						<td class="bold">Class</td>
						<td>${s.mststudclass.txtClassName }</td>
					</tr>
					<tr>
						<td class="bold">Section</td>
						<td>${s.mststudclasssection.txtSectionName }</td>

					</tr>
					<!-- class="editable editable-click" data-pk="1" -->
					<tr>
						<td class="bold">Blood Group</td>
						<td>
								${s.mstbloodgroup.txtBloodGroupName } 
						</td>
					</tr>
					<tr>
						<td class="bold">Address</td>
						<td>
								${s.txtPerAddress} 
						</td>
					</tr>
					
					<tr>
						<td class="bold">Contact Number (Father):</td>
						<td>
								 ${s.txtFmobileNumber} 
						</td>
					</tr>
					<tr>
						<td class="bold">Contact Number (Mother):</td>
						 <td>
						 		${s.txtMmobileNumber }
						 </td> 
					</tr>
					<tr>
						<td class="bold">Emergency Contact 1:</td>
						<td>
								 ${s.txtFotherNumber }
						</td >
					</tr>
					<tr>
						<td class="bold">Emergency Contact 2:</td>
						<td>
								${s.txtMotherNumber }
						</td> 
					</tr>
				</tbody>
			</table>
			</div>
			<i class="fa fa-pencil"></i>
	<a href="par_student profile_update.web?name=${s.txtFirstName}" style= "font-size: larger; font-weight: bold;">Click here to update Student Information</a>
</div>
			
		</c:forEach>
	

<!-- END PAGE LEVEL SCRIPTS -->
<!-- END PAGE CONTENT-->
<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(201);
	});
</script>
<%@include file="footer.jsp"%>

