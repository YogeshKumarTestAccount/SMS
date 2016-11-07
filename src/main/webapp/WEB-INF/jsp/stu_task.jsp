<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">Task/Assignments</h3>
		<ul class="page-breadcrumb breadcrumb">
			<li class="btn-group"></li>
			<li><i class="fa fa-home"></i> <a href="index.html"> Student
			</a> <i class="fa fa-angle-right"></i></li>

			<li><a href="#"> Task/Assignment </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">

		<div class="col-md-2"></div>
		<div class="col-md-4"></div>

		<div class="col-md-6">
			<form action="stu_task.web" method="post">
				<div class="form-group">
					<label class="control-label col-md-3">Select Date</label>
					<div class="col-md-4">
						<div class="input-group input-medium date-picker input-daterange"
							data-date="2012-09-26" data-date-format="yyyy-mm-dd">
							<input type="text"  class="form-control"
								name="assignDate" id="date3">
								<span
									style="color: red; font-weight: bolder;"> <span
										class="field-validation-valid" id="validationMessages5"></span>
								</span>
						</div>
					</div>

					<div class="col-md-2" style="margin-left: 82px;">
						<input type="submit" value="Search" class="btn btn-primary"
							id="submit6">
					</div>
				</div>


			</form>
		</div>
	</div>
	<br />
	<div class="portlet box green">
		<div class="portlet-title">
			<div class="caption">Homework</div>
		</div>
		<div class="tools">
			<a href="javascript:;" class="collapse"> </a> <a
				href="#portlet-config" data-toggle="modal" class="config"> </a> <a
				href="javascript:;" class="reload"> </a> <a href="javascript:;"
				class="remove"> </a>
		</div>
		<div class="portlet-body">
			<div class="table-responsive">
				<c:choose>
					<c:when test="${not empty hwList }">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Date</th>
									<th>Subject</th>
									<th>Question</th>
									<th>Teacher Name</th>
									<th>Due Date</th>
								</tr>
							</thead>
							<tbody>
								<%
									int i = 0;
											int j = 0;
								%>

								<c:forEach items="${hwList}" var="m">
									<tr>

										<td>${m.dtAssignDate}</td>
										<td>${m.txtSubject}</td>
										<td>${m.txtHomeWork}</td>

										<c:forEach var="c" items="${teachNamesListHW}" begin="<%= i%>"
											end="<%=j %>">
											<td>${c}</td>
										</c:forEach>
										<%
											i++;
														j++;
										%>
										<td>${m.dtDueDate}</td>
									</tr>
								</c:forEach>
								<%-- </c:forEach> --%>
							</tbody>
							<%
								i = 0;
										j = 0;
							%>
						</table>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">
								<div align="center">
									<h1>No Records Found!!!</h1>
								</div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-4"></div>
	<div class="col-md-6">
		<form action="stu_project.web" method="post">
			<div class="form-group">
				<label class="control-label col-md-3">Select Date</label>
				<div class="col-md-4">
					<div class="input-group input-medium date-picker input-daterange"
						data-date="2012-09-26" data-date-format="yyyy-mm-dd">
						<input type="text" id="date1" class="form-control"
							name="assignDatee">
							<span style="color: red; font-weight: bolder;">
										 <span class="field-validation-valid" id="validationMessages1"></span>
								</span>
					</div>
				</div>
				<div class="col-md-2" style="margin-left: 82px;">
					<input type="submit" value="Search" class="btn btn-primary"
						id="stusubmit">
				</div>
			</div>
		</form>
	</div>
	<div class="portlet box green">
		<div class="portlet-title">
			<div class="caption">Assignments/Projects</div>
		</div>
		<div class="portlet-body">
			<div class="table-responsive">
				<c:choose>
					<c:when test="${not empty hwListe }">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Date</th>
									<th>Project Name</th>
									<th>Desription</th>
									<th>Teacher Name</th>
									<th>Due Date</th>
								</tr>
							</thead>
							<tbody>

								<%
									int k = 0;
											int l = 0;
								%>
								<c:forEach items="${hwListe}" var="m">
									<tr>

										<td>${m.dtAssignDate}</td>
										<td>${m.txtProjectName}</td>
										<td>${m.txtProjectDescription}</td>
										<c:forEach var="c" items="${teachNamesListProj}"
											begin="<%= k%>" end="<%=l %>">
											<td>${c}</td>
										</c:forEach>
										<%
											k++;
														l++;
										%>
										<td>${m.dtDueDate}</td>
									</tr>
								</c:forEach>
							</tbody>
							<%
								k = 0;
										l = 0;
							%>
						</table>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">
								<div align="center">
									<h1>No Records Found!!!</h1>
								</div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>
</div>
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(303);
	});
</script>
<!-- END PAGE CONTENT-->
<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="footer.jsp"%>