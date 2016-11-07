<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

			<!-- BEGIN PAGE HEADER-->
			<%@include file="header.jsp" %>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					Events <small></small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						
						<li>
							<i class="fa fa-home"></i>
							<a href="index.html">
								Home
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								Events
							</a>
							
						</li>
						
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="form-group">
				 <label  class="col-md-2 control-label"><b>Select Student: </b></label>
				         <div class="col-md-5">
						      <form action="par_attendance.jsp">
									<select style="width: 40%" class="form-control" name="mstregistration">
										<option value="">Select</option>
												<c:forEach items="${regal}" var="m">
													<option value="${m.intRegistrationId}">${m.txtStudentFirstName}</option>
												</c:forEach>
									</select>
								</form>
						</div>
		   </div>
			<br><br><br>
			
			<div class="row">
				<div class="col-md-12">
			<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i>Event
							</div>
							<div class="actions">
								<a href="#" class="btn green btn-sm">
									 <i class="fa fa-check-circle-o"></i>&nbspYes
								</a>
								<a href="#" class="btn red btn-sm">
									 <i class="fa fa-times-circle-o"></i> No
								</a>
								<a href="#" class="btn btn-primary btn-sm">
									 <i class="fa fa-clock-o"></i> Maybe
								</a>
							</div>
						</div>
						<div class="portlet-body">
						<table><tr>
						<td width="50%" valign="top">
							<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px;"><div class="scroller" style="height: 200px; overflow: hidden; width: auto;" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
								<p><h3>Dance Competion</h3></p>
								<p><b>Date:</b> 28-09-2016</p>
								<p><b>Time:</b> 10:00 am</p>
								<p><b>Status:</b> 460 people attending.</p>
								
							</div><div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 130.719px; background: rgb(161, 178, 189);"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; display: none; background: yellow;"></div></div>
						</td><td>	
							<div style="float:right" class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bell-o"></i>Recent Update
							</div>
							
						</div>
						<div class="portlet-body">
							<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 300px;"><div class="scroller" style="height: 300px; overflow: hidden; width: auto;" data-always-visible="1" data-rail-visible="0">
								<ul class="feeds">
									
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn red">
														<i class="fa fa-times-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Madhu is not going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Aparna is going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 30 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Prashant is going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 Just now
											</div>
										</div>
									</li>
									<li>
										
										
											<div class="col1">
												<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Subodh is going.
														
													</div>
												</div>
											</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn red">
														<i class="fa fa-times-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Narendra is not going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn yellow">
														<i class="fa fa-clock-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Aniket maybe attending.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 2 hours
											</div>
										</div>
									</li>
									<li>
										
											<div class="col1">
												<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn yellow">
														<i class="fa fa-clock-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Abhilash maybe attending.
														
													</div>
												</div>
											</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										
									</li>
									<li>
										<div class="col1">
										<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Arshiya is going.
														
													</div>
												</div>
											</div>	
										</div>
										<div class="col2">
											<div class="date">
												 Just now
											</div>
										</div>
									</li>
									<li>
										
											<div class="col1">
												<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Mubeen is going.
														
													</div>
												</div>
											</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-default">
														<i class="fa fa-user"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 You have 5 pending membership that requires a quick review.
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-info">
														<i class="fa fa-shopping-cart"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 New order received with
														<span class="label label-sm label-success">
															 Reference Number: DR23923
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 30 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-success">
														<i class="fa fa-user"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 You have 5 pending membership that requires a quick review.
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-warning">
														<i class="fa fa-bell-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Web server hardware needs to be upgraded.
														<span class="label label-sm label-default ">
															 Overdue
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 2 hours
											</div>
										</div>
									</li>
									<li>
										<a href="#">
											<div class="col1">
												<div class="cont">
													<div class="cont-col1">
														<div class="label label-sm label-info">
															<i class="fa fa-briefcase"></i>
														</div>
													</div>
													<div class="cont-col2">
														<div class="desc">
															 IPO Report for year 2013 has been released.
														</div>
													</div>
												</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										</a>
									</li>
								</ul>
							</div><div class="slimScrollBar" style="width: 7px; position: absolute; top: 25px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 124.827px; background: rgb(187, 187, 187);"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(234, 234, 234);"></div></div>
							<div class="scroller-footer">
								<div class="pull-right">
									<a href="#">
										 See All Records <i class="m-icon-swapright m-icon-gray"></i>
									</a>
									 &nbsp;
								</div>
							</div></table>
						</div>
					</div></td>
						</div>
					</div>
						<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i>Event
							</div>
							<div class="actions">
								<a href="#" class="btn green btn-sm">
									 <i class="fa fa-check-circle-o"></i>&nbspYes
								</a>
								<a href="#" class="btn red btn-sm">
									 <i class="fa fa-times-circle-o"></i> No
								</a>
								<a href="#" class="btn btn-primary btn-sm">
									 <i class="fa fa-clock-o"></i> Maybe
								</a>
							</div>
						</div>
						<div class="portlet-body">
						<table><tr>
						<td width="50%" valign="top">
							<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px;"><div class="scroller" style="height: 200px; overflow: hidden; width: auto;" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
								<p><h3>Students Gathering</h3></p>
								<p><b>Date:</b> 28-08-2016</p>
								<p><b>Time:</b> 8:00am</p>
								<p><b>Status:</b> 460 people attending.</p>
								
							</div><div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 130.719px; background: rgb(161, 178, 189);"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; display: none; background: yellow;"></div></div>
						</td><td>	
							<div style="float:right" class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bell-o"></i>Recent Update
							</div>
							
						</div>
						<div class="portlet-body">
							<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 300px;"><div class="scroller" style="height: 300px; overflow: hidden; width: auto;" data-always-visible="1" data-rail-visible="0">
								<ul class="feeds">
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Prashant is going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 Just now
											</div>
										</div>
									</li>
									<li>
										
										
											<div class="col1">
												<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Subodh is going.
														
													</div>
												</div>
											</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn red">
														<i class="fa fa-times-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Madhu is not going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Aparna is going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 30 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn red">
														<i class="fa fa-times-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Narendra is not going.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn yellow">
														<i class="fa fa-clock-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Aniket maybe attending.
														
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 2 hours
											</div>
										</div>
									</li>
									<li>
										
											<div class="col1">
												<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn yellow">
														<i class="fa fa-clock-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Abhilash maybe attending.
														
													</div>
												</div>
											</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										
									</li>
									<li>
										<div class="col1">
										<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Arshiya is going.
														
													</div>
												</div>
											</div>	
										</div>
										<div class="col2">
											<div class="date">
												 Just now
											</div>
										</div>
									</li>
									<li>
										
											<div class="col1">
												<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm btn green">
														<i class="fa fa-check-circle-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Mubeen is going.
														
													</div>
												</div>
											</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-default">
														<i class="fa fa-user"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 You have 5 pending membership that requires a quick review.
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-info">
														<i class="fa fa-shopping-cart"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 New order received with
														<span class="label label-sm label-success">
															 Reference Number: DR23923
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 30 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-success">
														<i class="fa fa-user"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 You have 5 pending membership that requires a quick review.
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 24 mins
											</div>
										</div>
									</li>
									<li>
										<div class="col1">
											<div class="cont">
												<div class="cont-col1">
													<div class="label label-sm label-warning">
														<i class="fa fa-bell-o"></i>
													</div>
												</div>
												<div class="cont-col2">
													<div class="desc">
														 Web server hardware needs to be upgraded.
														<span class="label label-sm label-default ">
															 Overdue
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col2">
											<div class="date">
												 2 hours
											</div>
										</div>
									</li>
									<li>
										<a href="#">
											<div class="col1">
												<div class="cont">
													<div class="cont-col1">
														<div class="label label-sm label-info">
															<i class="fa fa-briefcase"></i>
														</div>
													</div>
													<div class="cont-col2">
														<div class="desc">
															 IPO Report for year 2013 has been released.
														</div>
													</div>
												</div>
											</div>
											<div class="col2">
												<div class="date">
													 20 mins
												</div>
											</div>
										</a>
									</li>
								</ul>
							</div><div class="slimScrollBar" style="width: 7px; position: absolute; top: 25px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 124.827px; background: rgb(187, 187, 187);"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(234, 234, 234);"></div></div>
							<div class="scroller-footer">
								<div class="pull-right">
									<a href="#">
										 See All Records <i class="m-icon-swapright m-icon-gray"></i>
									</a>
									 &nbsp;
								</div>
							</div></table>
						</div>
					</div></td>
						</div>
					</div>
								
						</div>
				
						
						</div>
				
				
				
			</div>
			
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->

<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->

<%@include file="footer.jsp" %>