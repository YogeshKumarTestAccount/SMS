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
			Notification <small></small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a>
			<i class="fa fa-angle-right"></i></li>
			<li><a href="#"> Notification </a></li>

		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<c:if test = "${!empty noRecordErr }">
<div class = "alert alert-danger"><strong>Alert! No New Notification Found</strong></div>
	</c:if>
<div class="form-group">

	<label class="col-md-2 control-label"><b>Select Student: </b></label>
	<form action="par_notification.web" id="demo" method="POST">
	
		<div class="col-md-5">
			<select id="parent" style="width: 40%" class="form-control"
				name="studentName">
				<option value = "-1">Select</option>
				<c:forEach items="${regal}" var="s">
					<option><c:out value="${s.txtFirstName}">${s.txtFirstName}</c:out></option>
				</c:forEach>
			</select>
			<span style="color: red; font-weight: bolder;"> <span
											class="field-validation-valid" id="validationMessages1"></span>
										</span>
		</div>
		<!-- <input type="submit" onclick= "window.location.href='par_notification.web'"class="btn btn-primary"> <br> -->
		<input type = "submit" value= "Submit" id = "parSubmit" class="btn btn-primary">
		<br><br>
</form>
</div>

<div class="row">
				<div class="col-md-12">
					
					
							<!-- BEGIN BORDERED TABLE PORTLET-->
							<div class="portlet box green">
								<div class="portlet-title">
									<div class="caption">
									 School Management Notification
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
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
												 Action
											</th>
										</tr>
										</thead>
										<tbody>	
										<c:forEach items="${tblinvites}"  var = "m">								
											<tr>
												<td>${m.dtDate}</td>
												<td>${m.txtInvitationTitle}</td>
												<td>${m.txtBody}</td>
												<td><a href="downloadsNotification/${m.intInvitesId}.web">
												
												<button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
												
												</a></td>
											</tr>
											</c:forEach>
										</tbody>										
										</table>
																				
									</div>
								</div>
							</div>
							<!-- END BORDERED TABLE PORTLET-->
				</div>
					
			</div>
			<div class="row">
				<div class="col-md-12">
					
					
							<!-- BEGIN BORDERED TABLE PORTLET-->
							<div class="portlet box green">
								<div class="portlet-title">
									<div class="caption">
									 Teacher Notification
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
										<table class="table table-bordered table-hover">
										<thead>
										<tr>
											<th>
												 Date
											</th>
											
											<th>
												 Description
											</th>
											
										</tr>
										</thead>
										<tbody>	
										<c:forEach items="${mste}"  var = "m">								
											<tr>
												<td>${m.dtInvitesDate}</td>
												
												<td>${m.txtMessage}</td>
											</tr>
											</c:forEach>
										</tbody>										
										</table>
																				
									</div>
								</div>
							</div>
							<!-- END BORDERED TABLE PORTLET-->
				</div>
					
			</div>
<%-- <div class="row">
	<div class="col-md-12">
<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption"><i class="fa fa-tags"></i>School Management Notification</div>
			</div>
			<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<!-- <a href="#portlet-config" data-toggle="modal" class="config">
								</a> -->
								<a href="javascript:;" class="reload">
								</a>
								<!-- <a href="javascript:;" class="remove">
								</a> -->
							</div>
			</div>
		<table id="user" class="table table-bordered table-striped">
			<tbody>
				<tr>


					<th>Subject / Message</th>
					<th width="40%">Description</th>
					<th>Date</th>
					<th>Attachment</th>

				</tr>
				<c:forEach items="${tblinvites }" var = "n">
				<tr>
					<td><b><a href="#">${n.txtInvitationTitle}</a></b></td>
					<td>${n.txtBody}</td>
					<td>${n.dtDate}</td>
					<td><button type="button" class="btn btn green btn-xs">Download</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div style="text-align: right">

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
		</div>
	</div>
</div> --%>
<!-- END PAGE CONTENT-->
<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(206);
	});
</script>
<%@include file="footer.jsp"%>