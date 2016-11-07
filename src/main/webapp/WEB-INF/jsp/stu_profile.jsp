
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<!-- BEGIN PAGE HEADER-->
			<%@include file="header.jsp" %>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					User Profile
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						
						<li>
							<i class="fa fa-home"></i>
							<a href="index.html">
								Student
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								User Profile
							</a>
							
						</li>
						
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
						<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					
					</h3>
				
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row profile">
				<div class="col-md-12">
					<!--BEGIN TABS-->
					<div class="tabbable tabbable-custom tabbable-full-width">
						
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1_1">
								<div class="row">
									<div class="col-md-3">
										<ul class="list-unstyled profile-nav">
											<li>
								<c:forEach items="${mst}"  var = "m" begin="0" end="0">
												<!-- <img src="assets/img/profile/index.png" class="img-responsive" alt=""/>	 -->
												<img class="img-responsive" src="getUserImage/<c:out value="${m.intRegistrationId}"/>.web">
											</li>
										</ul>
									</div>
									
									<%--  <div class="col-md-5">
											<select style="width:40%" class="form-control">
											<option>Select</option>
											<c:forEach items="${mst}" var="m">
											<option><c:out value = "${m.txtStudentFirstName}">${m.txtStudentFirstName}</c:out></option>
											</c:forEach>
											</select>
										<div>
										</form>
									</div>
								</div> --%>
									
								
						<div class="col-md-8">
							<!-- BEGIN BORDERED TABLE PORTLET-->
							 
							<div class="portlet box green">
							
								<div class="portlet-title">
									<div class="caption">
									Personal Identity Information
									</div>
								</div>
								
								<%-- <div class="col-md-5">
											<select style="width:40%" class="form-control">
											<option>Select</option>
											<c:forEach items="${mst}" var="m">
											<option><c:out value = "${m.txtStudentFirstName}">${m.txtStudentFirstName}</c:out></option>
											</c:forEach>
											</select>
										<div>
										</form>
									</div>
								</div>
								 --%>
								<div class="portlet-body">
									<div class="table-responsive">
									
										<table class="table table-bordered table-hover">
										<thead>
											
										<tr>
											<th>
												 Name
											</th>
											<td>
												${m.txtFirstName}
											</td>
										</tr>
										<tr>
											<th>
												 Address
											</th>
											<td>
												${m.txtPerAddress}
											</td>
										</tr>
										<tr>
											<th>
												 Birthday
											</th>
											<td>
												${m.dtDob}
											</td>
										</tr>
										<tr>
											<th>
												 Blood Group
											</th>
											<td>
												${m.mstbloodgroup.txtBloodGroupName}
											</td>
										</tr>
										<tr>
											<th>
												 Class
											</th>
											<td>
												${m.mststudclass.txtClassName}
											</td>
										</tr>
										<tr>
											<th>
												 Section
											</th>
											<td>
												${m.mststudclasssection.txtSectionName}
											</td>
										</tr>
										<tr>
											<th>
												 Father's Name
											</th>
											<td>
												${m.txtFatherName}
											</td>
										</tr>
										<tr>
											<th>
												 Mother's Name
											</th>
											<td>
												${m.txtMotherName}
											</td>
										</tr>
										<tr>
											<th>
												 Contact Number
											</th>
											<td>
												${m.txtFotherNumber}
											</td>
										</tr>
										
										</thead>
										</table>
										
									</div>
								</div>
								</c:forEach>
							</div>
							
							<!-- END BORDERED TABLE PORTLET-->
						</div>
					</div>
			
							
							<div class="tab-pane" id="tab_1_6">
								
									
								</div>
							</div>
							<!--end tab-pane-->
						</div>
					</div>
					<!--END TABS-->
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		
			<!-- END PAGE CONTENT-->
		
	
	<!-- END CONTENT -->

<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(301);
	});
</script>
<%@include file="footer.jsp" %>