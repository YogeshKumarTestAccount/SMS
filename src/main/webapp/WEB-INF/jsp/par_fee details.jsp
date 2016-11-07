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
					Fee Details <small></small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						
						<li>
							<i class="fa fa-home"></i>
							<a href="index.html">
								Home
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li class="active">
							<a href="#">
								Fee Details
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
									<select style="width: 40%" class="form-control" name="mstregistration">
										<option value="">Select</option>
												<c:forEach items="${regal}" var="m">
													<option value="${m.intRegistrationId}">${m.txtFirstName}</option>
												</c:forEach>
									</select>
						</div>
		   </div>			<br><br><br>
			
			<div class="row">
			<div class="col-md-12">
				<table id="user" class="table table-bordered table-striped">
					<tbody>
					<tr>
					<th>Month</th>
					<th>Invoice No.</th>
					
					<th>Due Date</th>
					<th>Amount</th>
					<th width="20%">Status</th>
					</tr>
					<tr>
					<td>Aug/2016</td>
					<td>DX0001006</td>
					
					<td>22-08-2016</td>
					<td>30,0000 INR</td>
					<td><span class="label label-sm label-info">
											 Pending 
										</span>&nbsp&nbsp&nbsp&nbsp<button type="button"  class="btn btn red btn-xs">Click here to Pay</button></td>
					</tr>
					
					<tr>
					<td>Jan/2016</td>
					<td>DX0001036</td>
					
					<td>--</td>
					<td>30,0000 INR</td>
					<td><span class="label label-sm label-success">
											 Paid
										</span></td>
					</tr>
					
					<tr>
					<td>Aug/2015</td>
					<td>DX0001026</td>
					
					<td>--</td>
					<td>30,0000 INR</td>
					<td><span class="label label-sm label-success">
											 Paid
										</span></td>
					</tr>
					
					<tr>
					<td>Jan/2015</td>
					<td>DX0001005</td>
				
					<td>--</td>
					<td>30,0000 INR</td>
						<td><span class="label label-sm label-success">
											 Paid
										</span></td>
					</tr>
					</tbody>
					</table>
					
					
				<div style="text-align:center">
								<ul class="pagination pagination-sm">
									<li>
										<a href="#">
											<i class="fa fa-angle-left"></i>
										</a>
									</li>
									<li>
										<a href="#">
											 1
										</a>
									</li>
									<li>
										<a href="#">
											 2
										</a>
									</li>
									<li>
										<a href="#">
											 3
										</a>
									</li>
									<li>
										<a href="#">
											 4
										</a>
									</li>
									<li>
										<a href="#">
											 5
										</a>
									</li>
									<li>
										<a href="#">
											 6
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-angle-right"></i>
										</a>
									</li>
								</ul>
							</div>
			</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(207);
	});
</script>
<%@include file="footer.jsp" %>