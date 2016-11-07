<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script type="text/javascript">
$(document).ready(function() {

		$('#leaveForm').validate({ // initialize the plugin
			rules : {
				teachLeaveReqIds : {
					required : true
				}
			},

			messages : {
				teachLeaveReqIds : {
					required : "Select above Checkbox atleast one"
				}
			},

			highlight : function(element) {
				$(element).parent().addClass('error')
			}

		});

	});
</script>

<style>
#leaveForm .error {
	color: red;
	font-size: 14px;
	azimuth: grad;
}
</style> -->

<script type="text/javascript">
$(document).ready(function(){
    $('#leaveForm').submit(function() {
        var error = 0;
        if (!($('#checkId').is(':checked'))) {
            error = 1
            alert("Please check atleast one to do this Operation");
        }

        if (error) {
            return false;
        } else {
            return true;
        }

    });
});
</script>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			Leave Request Approval <small></small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="ad_index.web"> Home
			</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#"> Leave Request </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<c:choose>
	<c:when test="${not empty msg1 }">
		<div class="alert alert-success">
			<b><i class="fa fa-check-circle"></i>${msg1}${msg2}</b>
		</div>
	</c:when>
</c:choose>
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">


		<!-- BEGIN BORDERED TABLE PORTLET-->

		<!-- END BORDERED TABLE PORTLET-->

		<!-- BEGIN BORDERED TABLE PORTLET-->

		<!-- BEGIN PAGE CONTENT-->
		<div class="row">
			<div class="col-md-12">

				<!-- ------------------------------------------------------ -->


				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-globe"></i>Leave Request Approval
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse"> </a> <a
								href="#portlet-config" data-toggle="modal" class="config"> </a>
							<a href="javascript:;" class="reload"> </a> <a
								href="javascript:;" class="remove"> </a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="table-toolbar">
							<!-- <div class="btn-group">
									<button id="sample_editable_1_new" class="btn green">
									Add New <i class="fa fa-plus"></i>
									</button>
								</div> -->
							<div class="btn-group pull-right">
								<button class="btn dropdown-toggle" data-toggle="dropdown">
									Tools <i class="fa fa-angle-down"></i>
								</button>
								<ul class="dropdown-menu pull-right">
									<li><a href="#"> Print </a></li>
									<li><a href="#"> Save as PDF </a></li>
									<li><a href="#"> Export to Excel </a></li>
								</ul>
							</div>
						</div>
						<form action="ad_leave_request.web" method="post" name="leaveForm" id="leaveForm">
							<table class="table table-striped table-bordered table-hover"
								id="sample_1">
								<thead>
									<tr>
										<th class="table-checkbox"><input type="checkbox"
											class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
										<th>Name</th>
										<th>Applied Date</th>
										<th>Leave Type</th>
										<th>From Date</th>
										<th>To date</th>
										<th>Reason</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty teachList }">

											<%
												int d = 0;
														int u = 0;
											%>
											<c:forEach var="teaLea" items="${teachList}">
												<tr class="odd gradeX">
													<td><input id="checkId" type="checkbox"
														name="teachLeaveReqIds"
														value="${teaLea.intTeacheLeaveAppId }" class="input-small"></td>

													<c:forEach var="s" items="${nameList}" begin="<%=d %>"
														end="<%=u %>">
														<td>${s}</td>
													</c:forEach>

													<td>${teaLea.dtAppliedDate }</td>

													<c:forEach var="ccc" items="${leaveTypeList}">
														<c:if
															test="${ccc.intLeaveId == teaLea.mstleave.intLeaveId }">
															<td>${ccc.txtLeaveType }</td>
														</c:if>
													</c:forEach>

													<td>${teaLea.dtFromDate }</td>

													<td>${teaLea.dtToDate }</td>

													<td>${teaLea.txtReason }</td>

													<!-- <td><button type="submit" class="btn green">Download</button>
													</td> -->
												</tr>
												<%
													d++;
																u++;
												%>
											</c:forEach>
											<%
												d = 0;
														u = 0;
											%>
											<tr>
												<td colspan="8" align="center">
													<button type="submit" class="btn green" name="action"
														value="app" id="sss">
														<i class="fa fa-check-square-o"></i>Approve
													</button>
													<button type="submit" class="btn green" name="action"
														value="rej" id="sss">
														<i class="fa fa-times"></i>Reject
													</button>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="8">
													<div align="center">
														<h2>No Records Found!!!</h2>
													</div>
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</form>
						<div></div>
					</div>
				</div>
				<!-- END EXAMPLE TABLE PORTLET-->


				<!-- ------------------------------------------------------ -->

			</div>
			<!-- END CONTENT -->
		</div>
	</div>
</div>
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(6);
	});
</script>
<%@include file="footer.jsp"%>