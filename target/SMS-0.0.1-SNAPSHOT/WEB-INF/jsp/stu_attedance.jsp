<%@page import="org.hibernate.type.AdaptedImmutableType"%>
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<!-- <h3 class="page-title">
			Attendance <small>Your child's daily report</small>
		</h3> -->
		<ul class="page-breadcrumb breadcrumb">
			<li><i class="fa fa-home"></i> <a href="index.html"> Student
			</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#"> Attendance </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<div class="tab-content">
	<div class="tab-pane active" id="tab_0">
		</form>
		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN BORDERED TABLE PORTLET-->
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">Current Attendance</div>
					</div>
					<%!int k = 0;
	int l = 2;%>
					<div class="portlet-body">
						<div class="table-responsive">

							<c:if test="${not empty attendance}">
								<c:choose>

									<c:when test="${not empty attndList }">

										<table class="table table-bordered table-hover">
											<thead>
												<tr>
													<th>Date</th>
													<th>In-Time</th>
													<th>Out-Time</th>
													<th>Total-Hours</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach var="ad" items="${attndList}">
													<tr>

														<td>${ad.dtSlotDate}</td>
														<c:forEach var="out" items="${out}" begin="<%=k %>"
															end="<%=l %>">
															<td>${out}</td>
														</c:forEach>
														<%
															k += 3;
																			l += 3;
														%>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</c:when>
									<c:otherwise>
										<div align="center">
											<h1>No Records Found!!!</h1>
										</div>

									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
					</div>
				</div>
				<!-- END BORDERED TABLE PORTLET-->
				<!-- BEGIN BORDERED TABLE PORTLET-->
				<div class="portlet box green">
					<div class="portlet-title">
						<!--<label class="control-label col-md-1"><b>From</b></label>-->
						<form action="stu_attedance_dates.web" class="form-horizontal"
							method="post">
							<div class="portlet box green">
								<div class="portlet-title">
									<label class="control-label col-md-1">From</label>
									<div class="col-md-4">
										<div
											class="input-group input-large date-picker input-daterange"
											data-date="2012-09-26" data-date-format="yyyy-mm-dd">

											<input type="text" class="form-control" name="from"
												id="date1"> <span
												style="color: red; font-weight: bolder;"> <span
												class="field-validation-valid" id="validationMessages6"></span>
											</span> <span class="input-group-addon"> to </span> <input
												type="text" class="form-control" name="to" id="date2">

											<span style="color: red; font-weight: bolder;"> <span
												class="field-validation-valid" id="validationMessages7"></span>
											</span>

										</div>
									</div>
									<input type="Submit" value="Search" class="btn btn-primary"
										id="submit2">
								</div>

								<%!int i = 0;
	int j = 2;%>
								<!--table begin-->
								<div class="portlet-body">
									<div class="table-responsive">
										<c:if test="${not empty attendance}">
											<c:choose>

												<c:when test="${not empty trnBetweenAttendance }">

													<table class="table table-bordered table-hover">
														<thead>
															<tr>

																<th>Date</th>
																<th>In-Time</th>
																<th>Out-Time</th>
																<th>Total-Hours</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach var="ad" items="${trnBetweenAttendance}">
																<tr>

																	<td>${ad.dtSlotDate}</td>

																	<c:forEach var="out" items="${out}" begin="<%=i %>"
																		end="<%=j %>">
																		<td>${out}</td>
																	</c:forEach>
																	<%
																		i += 3;
																						j += 3;
																	%>
																</tr>
															</c:forEach>
															<%
																i = 0;
																			j = 2;
															%>
														</tbody>
													</table>
												</c:when>


												<c:otherwise>
													<div align="center">
														<h1>No Records Found!!!</h1>
													</div>
												</c:otherwise>
											</c:choose>
										</c:if>
									</div>
								</div>
							</div>
						</form>
						<!-- END BORDERED TABLE PORTLET-->
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
		</div>
		<!-- END CONTENT -->
	</div>
	<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(302);
	});
</script>
	<%@include file="footer.jsp"%>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->