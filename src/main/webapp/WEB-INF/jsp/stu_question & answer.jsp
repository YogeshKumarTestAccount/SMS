<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">Question & Answer</h3>
		<ul class="page-breadcrumb breadcrumb">

			<li><i class="fa fa-home"></i> <a href="index.html"> Student
			</a> <i class="fa fa-angle-right"></i></li>

			<li><a href="#"> Question & Answer </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<c:if test="${not empty msg}">
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
		<strong>${msg}</strong>
	</div>
</c:if>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<form action="stu_question & answer.web" method="POST">
	<div class="row">
		<div class="col-md-12 blog-page">
			<div class="row">
				<div class="col-md-9 article-block">

					<div class="media">
					
						<%-- <h2>${msg }</h2> --%>
						<form action="stu_question & answer.web" method="POST">
							<div class="post-comment">
								<div class="form-group">
									<label class="control-label col-md-3" >Subject Name<span
				class="required"> * </span></label>
									<div class="col-md-4" id="msg">
										<select class="form-control input-xlarge select2me" id="subject"
											data-placeholder="" name="mstSubject" >
											<%--<c:if test="${not empty performance}">
					<c:choose>
						<c:when test="${not empty mst }"> --%>
											<option value="Select">Select</option>

											<c:forEach items="${mst}" var="m">
												<option value="${m.intSubjectId}">${m.txtSubjectName}</option>
											</c:forEach>

										</select>
										<span style="color: red; font-weight: bolder;"> <span
										class="field-validation-valid" id="validationMessages5"></span>
								</span>
									</div>
								</div>
							<br/>
							<br/>
							<br/>
								<div class="form-group">
									<label class="control-label col-md-3" >Write Question Here:<span
										class="required">*</span>
									</label>
									<textarea class="col-md-6 form-control" rows="8"
										 name="writequestion" id="question"></textarea>
										 <span
									style="color: red; font-weight: bolder;"> <span
										class="field-validation-valid" id="validationMessages7"></span>
								</span>
								</div>
								<input type="submit"   id="submit7" class="margin-top-20 btn blue"  value="Send" >
							</div>
						</form>
						<br /> <br />

						<table>
							<%
							int i = 0;
							int j = 0;
								%>
							<c:forEach items="${q}" var="cc">
								<thead>
									<tr>
										<th><a href="#" class="pull-left">
												Q${cc.intQuestionAndAnswerId}. </a>
											<div class="media-body">

												<p>${cc.txtQuestion}?</p>
                                               ${cc.mstregistration.txtFirstName}
											</div></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="media">
												<a href="#" class="pull-left"> Ans. </a>
												<div class="media-body">

													<p>${cc.txtAnswer}</p>
													<%-- </c:forEach> --%>
													<%-- 	</c:if> --%>

													<%-- <c:forEach items="${teacherName}" var = "t" begin="${i}" end="${i}"> --%>
													
													<c:forEach items="${teachNamesList}" var="teach"
														begin="<%=i %>" end="<%=j %>">
														<span> <a href="#">${teach}</a>
														</span>

													</c:forEach>
													<%
							                        i++;
										            j++;
								                    %>
													<%-- <%i++ ;%>
														<%=i %>
													</c:forEach --%>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</c:forEach>
                              <%
								i = 0;
								j = 0;
							  %>
						</table>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- END PAGE CONTENT-->
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(305);
	});
</script>
<%@include file="footer.jsp"%>