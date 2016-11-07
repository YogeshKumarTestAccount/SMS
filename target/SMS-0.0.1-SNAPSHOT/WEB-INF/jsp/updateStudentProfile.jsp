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

<c:if test="${!empty msg}">

	
				<div class="alert alert-info">
					<strong>${msg}</strong>
				</div>
			
</c:if>

<!-- <button id= "show" type = "button" onClick="myFunction()" style = "center" class = "btn btn-primary">Update</button> -->
<div class="row">
	<div class="col-md-12">
<form action = "Updated_par_student profile.web" >
		<c:forEach items="${studDetail}" var="s">
	 <input type="hidden" name = "intRegistrationId" value="${s.intRegistrationId }">
	  <input type="hidden" name = "txtFirstName" value="${s.txtFirstName }">
			<table id="user" class="table table-bordered table-striped">
				<tbody>
					<tr>
						<td class="bold" style="width: 15%" >Student Name</td>
						<td style="width: 50%" >${s.txtFirstName}</td>
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
							<input type="text" class="form-control"  name = "txtPerAddress"value="${s.txtPerAddress} "/>
						</td>
					</tr>
					
					<tr>
						<td class="bold">Contact Number (Father):</td>
						<td>
							<input type="text" class="form-control"value=" ${s.txtFmobileNumber}" name="txtFmobileNumber">
						</td>
					</tr>
					<tr>
						<td class="bold">Contact Number (Mother):</td>
						 <td>
						 	<input type="text" class="form-control" value="${s.txtMmobileNumber }" name="txtMmobileNumber">
						</td> 
					</tr>
					<tr>
						<td class="bold">Emergency Contact 1:</td>
						<td>
							<input type="text" class="form-control" value=" ${s.txtFotherNumber }" name="txtFotherNumber">
						</td >
					</tr>
					<tr>
						<td class="bold">Emergency Contact 2:</td>
						<td>
							<input type="text" class="form-control" value="${s.txtMotherNumber }" name="txtMotherNumber">
						</td> 
					</tr>
				</tbody>
			</table>
		</c:forEach>
			<div style="padding-left: 500px;">
	<input type ="submit" name = "submit" value = "Update" class= "btn blue">
	</div> 
</form>
	</div>
	
</div>

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

