
<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			<!-- <small>basic datatable samples</small> -->
		</h3>
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
							</ul>
						</li> -->
			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Fee Management </a> <!-- <i class="fa fa-angle-right"></i> -->
			</li>
			<!-- <li>
							<a href="#">
								Basic Datatables
							</a>
						</li> -->
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->

<!-- BEGIN PAGE HEADER-->
<div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
</div>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->


		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->

		<div class="tab-content">
			<div class="tab-pane active" id="tab_0">
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-reorder"></i>Fee management
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
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<form action="#" class="form-horizontal" method="post">
							<br>


							<div class="form-group">
								<label class="col-md-3 control-label"><b>Class</b><span
									class="required"> * </span> </label>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i>
										</span> <select
											class="table-group-action-input form-control input-inline input-small input-sm"
											name="ClassID">
											<option>Select Class</option>
											<c:forEach var="c" items="${ classes}">
												<option value="${ c.intClassId}">${ c.txtClassName }</option>
											</c:forEach>

										</select>


										<!-- <select>
                                                               <option value="All">All</option>
                                                                <option value="faculty">Faculty</option>
                                                                 <option value="non-Working">Non-Working</option>
  
                                                                   </select> -->
										<!-- <input type="text" class="form-control" placeholder="employee id"> -->
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label"><b>Section</b><span
									class="required"> * </span> </label>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i>
										</span> <select
											class="table-group-action-input form-control input-inline input-small input-sm"
											name="SectionId">

											<option value="">Select section</option>

											<c:forEach var="s" items="${sections }">
												<option value="${ s.intSectionId }">${ s.txtSectionName}</option>

											</c:forEach>
										</select>




										<!-- <input type="text" class="form-control" placeholder=""> -->
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label"><b>Student ID</b></label>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i>
										</span> <input type="text" class="form-control"
											placeholder="enter id" name="StudentId">
									</div>
								</div>
							</div>
							<div class="form-actions fluid">
								<div class="col-md-offset-3 col-md-9">
									<button type="submit" class="btn green">Search</button>
									<!--<button type="button" class="btn default">Cancel</button>-->
								</div>
							</div>
							<hr>

							<!-- < <div class="form-group">
													<label class="col-md-3 control-label">Enter Amount</label>
													<div class="col-md-4">
														<div class="input-group">
															<span class="input-group-addon">
																<i class="fa fa-bars"></i>
															</span>
															<input type="textArea" class="form-control" placeholder="Amount">
														</div>
													</div>
												</div>
											
                                                     <div class="form-group">
													<label class="col-md-3 control-label">Date</label>
													<div class="col-md-4">
														<div class="input-group">
															<span class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</span>
															<input type="date" class="form-control" placeholder="upload">
														</div>
													</div>
												</div> -->

							<div class="portlet-body">
								<div class="table-responsive">
								
									<table class="table table-condensed table-hover">
										<thead>
											<tr>
												<th>All
													<div class="checkbox-list">
														<label for="closeButton"> <input id="closeButton"
															type="checkbox" value="checked" checked
															class="input-small" /></label>


													</div>
												</th>
												<th>Student Id</th>
												<th>Student name</th>
												<th>Father name</th>
												<th>Mobile no</th>
												<th>Total fee</th>
												<th>Paid fee</th>
												<th>Balance</th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<th>
													<div class="checkbox-list">
														<label for="closeButton"> <input id="closeButton"
															type="checkbox" value="checked" checked
															class="input-small" /></label>


													</div>
												</th>

												<td>1</td>
												<td>Smith</td>
												<td>john</td>
												<td>7205500372</td>
												<td>20000</td>
												<td>10000</td>
												<td>10000</td>


											</tr>
											<tr>
												<th>
													<div class="checkbox-list">
														<label for="closeButton"> <input id="closeButton"
															type="checkbox" value="checked" checked
															class="input-small" /></label>


													</div>
												</th>
												<td>2</td>
												<td>allen</td>
												<td>john</td>
												<td>72055003725</td>
												<td>30000</td>
												<td>20000</td>
												<td>10000</td>
											</tr>

											<tr>
												<th>
													<div class="checkbox-list">
														<label for="closeButton"> <input id="closeButton"
															type="checkbox" value="checked" checked
															class="input-small" /></label>


													</div>
												</th>
												<td>3</td>
												<td>madhu</td>
												<td>john</td>
												<td>7205500372</td>
												<td>20000</td>
												<td>10000</td>
												<td>10000</td>
											</tr>
											<tr>
												<th>
													<div class="checkbox-list">
														<label for="closeButton"> <input id="closeButton"
															type="checkbox" value="checked" checked
															class="input-small" /></label>


													</div>
												</th>

												<td>4</td>
												<td>subhodh</td>
												<td>john</td>
												<td>7205500372</td>
												<td>20000</td>
												<td>10000</td>
												<td>10000</td>
											<tr>
												<th>
													<div class="checkbox-list">
														<label for="closeButton"> <input id="closeButton"
															type="checkbox" value="checked" checked
															class="input-small" /></label>


													</div>
												</th>

												<td>5</td>
												<td>abhi</td>
												<td>john</td>
												<td>7205500372</td>
												<td>20000</td>
												<td>10000</td>
												<td>10000</td>
											</tr>

										</tbody>
									</table>


								</div>
							</div>

							<div class="form-actions fluid">
								<div class="col-md-offset-3 col-md-9">
									<button type="submit" class="btn green">Send</button>
									<!--<button type="button" class="btn default">Cancel</button>-->
								</div>
							</div>
						</form>
						<!-- END FORM-->


						<!-- END PAGE CONTENT-->
					</div>
					</div>
					</div>
					</div>
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END CONTAINER -->
			<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(9);
	});
</script>
			<%@include file="footer.jsp"%>