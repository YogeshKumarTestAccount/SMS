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
		<h3 class="page-title">Leave Application</h3>
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
			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Leave Application </a> <!-- <i class="fa fa-angle-right"></i> -->
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
<c:if test="${!empty msg }">
	<div class="alert alert-success">
		<i class="fa fa-check-circle"></i> <strong>${msg}</strong>
	</div>
</c:if>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<%-- <c:url var = "addAction" value = "par_leave request.web"></c:url> --%>
<form action="par_leave request.web" method="POST">

	<div class="form-group">
		<label class="col-md-2 control-label"><b>Select Student: </b></label>
		<div class="col-md-5">
			<select id = "student" style="width: 40%" class="form-control"
				name="mstregistration" id = "student" >
				<option value="-1">Select</option>
				<c:forEach items="${regal}" var="m">
					<option value="${m.intRegistrationId}">${m.txtFirstName}</option>
				</c:forEach>
			</select>
			<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages5"></span>
										</span>
		</div>
	</div>
	<br> <br> <br>
	<div class="alert alert-info">
		<strong>Note:</strong> All (*) marked fields are mandatory.
	</div>
	<div class="row">
		<div class="col-md-12">

			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">Leave Application</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<tbody>
								<tr>
									<td style="font-weight: bold">Leave Type <span
										class="required" style="color: red"> * </span></td>
									<td colspan="6"><select style="width: 32.5%"
										class="form-control" name="mstleave" id = "leaveType">
											<option value = "-1">Select Leave Type</option>
											<c:forEach var="l" items="${leaveal }">
												<option value="${l.intLeaveId }">${ l. txtLeaveType }</option>
											</c:forEach>
									</select>
									<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
									</td>
								</tr>
								<tr>
									<td style="font-weight: bold">From Date <span
										class="required" style="color: red"> * </span>

									</td>
									<td><input id = "date1"
										data-required="1" class="form-control form-control-inline input-medium date-picker" name="dtFromDate" />
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages2"></span>
										</span>
										</td>
									<td style="font-weight: bold">To Date<span
										class="required" style="color: red"> * </span>
									</td>
									<td><input id = "date2"
										data-required="1" class="form-control form-control-inline input-medium date-picker" name="dtToDate" />
										<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages3"></span>
										</span>
										</td>
									<td style="font-weight: bold">Please specify reason <span
										class="required" style="color: red"> * </span>
									</td>
									<td><textarea class="form-control" name="txtReason" id = "txtReason"
											required="required"></textarea>
											<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages4"></span>
										</span>
											</td>

								</tr>
							</tbody>
						</table>
						<div style="padding-left: 450px">
							<button type="submit" class="btn green" id = "leaveSubmit">Submit</button>
						</div>

					</div>
				</div>
			</div>
			<!-- END BORDERED TABLE PORTLET-->
		</div>
	</div>
</form>
<%-- </form:form> --%>
<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(210);
	});
</script>
<%@include file="footer.jsp"%>