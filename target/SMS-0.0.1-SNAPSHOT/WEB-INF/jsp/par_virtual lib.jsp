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
					Virtual Library <small></small>
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
								Virtual Library
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
		   </div>
			<br><br><br>
			
			<div class="row">
				<div style="text-align:center" class="col-md-12">
				<h4>Please Subscribe to Virtual Library to access all the books</h4>
				<div style="text-align:center"><button type="button" onclick="window.location.href='par_virtual lib1.web'" type="button" class="btn btn-primary">Pay Now to get full access</button></div>
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
	  
	   slider(209);
	});
</script>
<%@include file="footer.jsp" %>