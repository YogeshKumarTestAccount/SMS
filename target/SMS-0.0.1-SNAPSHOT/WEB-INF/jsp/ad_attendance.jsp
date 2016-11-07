<%@page import="org.hibernate.type.AdaptedImmutableType"%>
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
$(document).ready(function() {

		$('#attendForm').validate({ // initialize the plugin
			rules : {
				ClassId : {
					required : true
				}, SectionId : {
					required : true
				}
			},

			messages : {
				ClassId : {
					required : "Select the Class!!!"
				}, SectionId : {
					required : "Select the Section!!!"
				}
			},

			highlight : function(element) {
				$(element).parent().addClass('error')
			}

		});

	});
</script>

<style>
#attendForm .error {
	color: red;
	font-size: 14px;
}
</style>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			Attendance <small>Your child's daily report</small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">
			<li><i class="fa fa-home"></i> <a href="ad_index.web"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Attendance </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->


<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
</div>
<div class="tab-content">
	<div class="tab-pane active" id="tab_0">
		<div class="portlet box green">


			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i>Attendance Track Report for student
				</div>
			</div>
		</div>
		<!--<div class="tools">
											<a href="javascript:;" class="collapse">
											</a>
											<a href="#portlet-config" data-toggle="modal" class="config">
											</a>
											<a href="javascript:;" class="reload">
											</a>
											<a href="javascript:;" class="remove">
											</a>
										</div>-->
	</div>
	<form action="ad_attendance.web" class="form-horizontal" method="post" id="attendForm">

		<div class="form-group">
			<label class="col-md-3 control-label"><b>Class</b> <span
				class="required"> * </span></label>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon"> <i class="fa fa-user"></i>
					</span> <select
						class="table-group-action-input form-control input-inline input-small input-sm"
						name="ClassId" required="required">
						<option value="">Select Class</option>
						<c:forEach var="c" items="${classes }">
							<option value="${c.intClassId }">${c.txtClassName }</option>
						</c:forEach>

					</select>
					<!-- <input type="text" class="form-control" placeholder=""> -->
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label"><b>Section</b> <span
				class="required"> * </span></label>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon"> <i class="fa fa-user"></i>
					</span> <select
						class="table-group-action-input form-control input-inline input-small input-sm"
						name="SectionId" required="required">
						<option value="">Select Section</option>
						<c:forEach var="s" items="${sections }">
							<option value="${s.intSectionId }">${s.txtSectionName }</option>
						</c:forEach>

					</select>
				</div>
				<!-- <input type="text" class="form-control" placeholder=""> -->
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label"><b>Student ID</b></label>
			<div class="col-md-4">
				<div class="input-group" style="width: 320px;">
					<span class="input-group-addon"> <i class="fa fa-user"></i>
					</span> <input type="text" name="stuId" class="form-control"
						placeholder="enter id">

				</div>
			</div>
		</div>

			<div class="portlet-title" style="padding: 2px 4px 4px 11px;">
				<label class="col-md-3 control-label"><b>Select Date</b></label>
				<div class="input-group input-large date-picker input-daterange"
					data-date="2012-09-26" data-date-format="yyyy-mm-dd">
					<input type="text" class="form-control" name="from"
						placeholder="From"> <span class="input-group-addon"><i
						class="fa fa-angle-double-right"></i> </span> <input type="text"
						class="form-control" name="to" placeholder="To">
				</div>
			</div>

		<div class="form-actions fluid">
			<div class="col-md-offset-3 col-md-9">
				<button type="Submit" class="btn green">Search</button>
			</div>
		</div>
	</form>

	<div class="row">
		<div class="col-md-12">


			<!-- BEGIN BORDERED TABLE PORTLET-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">Attendance Records</div>
				</div>
				<%!int k = 0;
	int l = 2;
	int e = 0;
	int f = 0;
	int p = 0;
	int q = 0;%>
				<div class="portlet-body">
					<div class="table-responsive">



						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Student Id</th>
									<th>Student Name [ID]</th>
									<th>Date</th>
									<th>In-Time</th>
									<th>Out-Time</th>
									<th>Total-Hours</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty attendance}">
									<c:choose>

										<c:when test="${not empty attndList }">
											<c:forEach var="ad" items="${attndList}">
												<tr>
													<c:forEach var="id" items="${stuIdList}" begin="<%= p %>"
														end="<%= q %>">

														<td>${id}</td>
													</c:forEach>
													<c:forEach var="id" items="${stuIdList}" begin="<%= p %>"
														end="<%= q %>">
														<c:forEach var="name" items="${stuNameList}"
															begin="<%= e %>" end="<%= f %>">
															<td>${name}[${id}]</td>
														</c:forEach>
													</c:forEach>
													<td>${ad.dtSlotDate}</td>

													<c:forEach var="out" items="${output}" begin="<%=k %>"
														end="<%=l %>">
														<td>${out}</td>
													</c:forEach>
												</tr>
												<%
													k += 3;
																	l += 3;
												%>
												<%
													e += 1;
																	f += 1;
																	p += 1;
																	q += 1;
												%>

											</c:forEach>
											<%
												k = 0;
															l = 2;
															e = 0;
															f = 0;
															p = 0;
															q = 0;
											%>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">
													<div align="center">
														<h1>No Records Found!!!</h1>
													</div>
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:if>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(5);
	});
</script>
<%@include file="footer.jsp"%>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
