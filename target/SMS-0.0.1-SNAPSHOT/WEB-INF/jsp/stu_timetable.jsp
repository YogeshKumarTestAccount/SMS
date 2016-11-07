<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			Time Table<small> of your child</small>
		</h3>
		<ul class="page-breadcrumb breadcrumb">
			<li class="btn-group"></li>
			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Time Table </a></li>

		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<%-- <div class="form-group">
	<form action="par_timetable.web" id="demo" method="POST">
		<label class="col-md-2 control-label"><b>Select Student: </b></label>
		<div class="col-md-5">
			<select id="mySelect" style="width: 40%"
				class="form-control" name="studentName">
				<option>Select</option>
				<c:forEach items="${regal}" var="s">
					<option><c:out value="${s.txtFirstName}">${s.txtFirstName}</c:out></option>
				</c:forEach>
			</select>
		</div>
		<input type="submit" class="btn btn-primary">
		</form>
		<br>
		<br>
		<br>
	</div> --%>


<!-- BEGIN BORDERED TABLE PORTLET-->
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">Time table</div>
	</div>
	<div class="portlet-body">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>
												 Timings
											</th>
											<th>
												 Monday
											</th>
											<th>
												 Tuesday
											</th>
											<th>
												 Wednesday
											</th>
											<th>
												 Thursday
											</th>
											<th>
												 Friday
											</th>
											<th>
												 Saturday
											</th>
											<th>
												 Sunday
											</th>
					</tr>
				</thead>
				<tbody>
				<tr>
						
		<c:forEach items="${mst}" var = "s">
		<c:if test="${s[2]=='Monday'}"><td>${s[0]}</td></c:if>
		<td>${s[1]}</td>
		<c:if test="${s[2]=='Sunday'}"><tr></c:if>
						
		</c:forEach>
		</tr>

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
<%@include file="footer.jsp"%>
<!-- =================================== -->
<%-- <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
					Time Table
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
								Time Table
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
									Time table
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
										<table class="table table-bordered table-hover">
										<thead>
										<tr>
											<th>
												 Timings
											</th>
											<th>
												 Monday
											</th>
											<th>
												 Tuesday
											</th>
											<th>
												 Wednesday
											</th>
											<th>
												 Thursday
											</th>
											<th>
												 Friday
											</th>
											<th>
												 Saturday
											</th>
											<th>
												 Sunday
											</th>
										</tr>
										</thead>
										<tbody>	
																		
											<tr>
											<c:forEach items="${mst}" var = "m">	
												<td>${m.txtClassTimings}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
											
											</tr>
											 <tr>
												<td>${m.txtClassTimings}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
											</tr>
											<tr>
												<td>${m.txtClassTimings}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
												<td>${m.mstsubject.txtSubjectName}</td>
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
	  
	   slider(307);
	});
</script>
<%@include file="footer.jsp" %> --%>