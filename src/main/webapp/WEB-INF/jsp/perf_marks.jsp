
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
					Marks
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li class="btn-group">
							
							
						</li>
						<li>
							<i class="fa fa-home"></i>
							<a href="index.html">
								Student
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						
						<li>
							<a href="#">
								Marks
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
					
					
							<!-- BEGIN BORDERED TABLE PORTLET-->
							<div class="portlet box green">
								<div class="portlet-title">
									<div class="caption">
									MarkSheet
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
												 Class
											</th>
											<th>
												 Section
											</th>
											
											<th>
												 Exam
											</th>
											<th>
												 Action
											</th>
											
											
											
										</tr>
										</thead>
										<tbody>	
										<c:forEach items="${mst}" var = "m">									
											<tr>
												<td>${m.dtDate}</td>
												
												<td>${m.mststudclass.intClassId}</td>
												
												<td>${m.mststudclasssection.txtSectionName}</td>
												
												<td>${m.mstterms.txtTermName}</td>
												
												<td><a href="download/ ${m.intUploadStudMarksheetId}.web">
												
												<button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
												
												</a></td>
												
												<%-- <a href="download/ ${m.intUploadStudMarksheetId}.web">
																		<button type="button" class="btn green">
																			<!-- should give value here -->
																			<i class="fa fa-download"> </i> Download --%>
																		
												
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
	  
	   slider(306);
	});
</script>
<%@include file="footer.jsp" %>