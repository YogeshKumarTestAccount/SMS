

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
			<li><i class="fa fa-home"></i> <a href="ad_index.web"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><i class="fa  fa-upload"></i> <a href="#"> Document's
					Upload </a> <!-- <i class="fa fa-angle-right"></i> --></li>
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






<div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
</div>
<!-- BEGIN CONDENSED TABLE PORTLET-->
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-tags"></i>Document's Upload
			<!-- Condensed Table -->
		</div>
		<div class="tools">
			<!--<a href="javascript:;" class="collapse">
								</a>
							 <a href="#portlet-config" data-toggle="modal" class="config">
								</a> 
								<a href="javascript:;" class="reload">
								</a>
								 <a href="javascript:;" class="remove">
								</a> -->
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<form action="ad_document-upload.web" method="post"
			class="form-horizontal" enctype="multipart/form-data">

			<div class="form-group">
				<br> <label class="col-md-3 control-label"><b>Category</b>
					<span class="required"> * </span></label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa  fa-list-alt"></i>
						</span> <select name="trndocumenttype"
							class="table-group-action-input form-control input-inline input-small input-sm">
							<option value="">Select Doc type</option>
							<c:forEach var="docType" items="${docType}">
								<option value="${docType.intDocumentTypeId}">${docType.txtDocumentName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">

				<label class="col-md-3 control-label"><b>Sub-Category</b> <span
					class="required"> * </span></label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa  fa-list-alt"></i>
						</span> <select name="mstsubcategory"
							class="table-group-action-input form-control input-inline input-small input-sm">
							<option value="">Select Sub-Category</option>
							<c:forEach var="subCat" items="${subCat}">
								<option value="${subCat.intSubCategoryId}">${subCat.txtSubCategoryName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="form-group">

				<label class="col-md-3 control-label"><b>Upload For</b> <span
					class="required"> * </span></label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa  fa-user"></i>
						</span> <select name="mstcategory"
							class="table-group-action-input form-control input-inline input-small input-sm">
							<option value="">Select person</option>
							<c:forEach var="cat" items="${cat}">
								<option value="${cat.intCategoryId1}">${cat.txtCategoryName}</option>
							</c:forEach>

						</select>
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-md-3 control-label"><b>Upload File</b></label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa fa-upload"></i>
						</span> <input type="file" class="form-control" placeholder="upload"
							name="blUploadFile">

					</div>

					<p>
						Only (<strong>.pdf, .JPG, .GIF, .PNG, .DOC, .DOCX</strong>) files
						are allowed .<br> (The maximum file size for uploads is <strong>5
							MB</strong>)
					</p>

				</div>
			</div>
			<!-- <div class="panel-body">
								<li>
									 The maximum file size for uploads in this demo is <strong>5 MB</strong> (default file size is unlimited).
								</li>
								<li>
									 Only image files (<strong>JPG, GIF, PNG</strong>) are allowed in this demo (by default there is no file type restriction).
								</li>
								<!--<li>
									 Uploaded files will be deleted automatically after <strong>5 minutes</strong> (demo setting).
								</li>
						
						</div>-->



			<div class="form-group">
				<label class="col-md-3 control-label"><b>Description</b></label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa fa-bars"></i>
						</span>

						<textarea name="txtDescription" class="form-control" rows="3"></textarea>

						<!-- <input type="textarea" class="form-control" placeholder="Massage"> -->
					</div>
				</div>
			</div>
			<!-- <label class="col-md-3 control-label">Description</label>
													<div class="col-md-4">
														<div class="input-group">
															<span class="input-group-addon">
																<i class="fa fa-align-justify"></i>
															</span>
															<input type="text" class="form-control" placeholder="student name">
														</div>
													</div>
												</div> -->

			<!-- <div class="clearfix" align="center"> -->

			<!-- <button type="button" class="btn green">Submit</button>
									<br>
									<br> -->
			<div class="form-actions fluid">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn green">Submit</button>
					<!--<button type="button" class="btn default">Cancel</button>-->
				</div>
			</div>
			<!-- </div> -->

		</form>


	</div>
	<!-- END CONDENSED TABLE PORTLET-->



	<!-- END PAGE CONTENT-->
</div>
<!-- END CONTENT -->
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">Document's Upload Inbox</div>
	</div>
	<div class="portlet-body">
		<div class="table-responsive">
			<table class="table table-striped table-hover table-bordered"
				id="sample_editable_1">
				<thead>
					<tr>

						<th>Sl.No</th>
						<th>Category</th>
						<th>Sub-Category</th>
						<th>Upload for</th>
						<th>Description</th>
						<th>Uploaded File</th>


					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty docList }">
							<%
								int i = 1;
							%>
							<c:forEach var="cc" items="${docList}">
								<tr>
									<td><%=i%></td>


									<c:forEach var="c" items="${docType }">
										<c:if
											test="${ c.intDocumentTypeId == cc.trndocumenttype.intDocumentTypeId}">
											<td>${c.txtDocumentName }</td>
										</c:if>
									</c:forEach>





									<c:forEach var="c" items="${subCat }">
										<c:if
											test="${ c.intSubCategoryId == cc.mstsubcategory.intSubCategoryId}">
											<td>${c.txtSubCategoryName }</td>
										</c:if>
									</c:forEach>

									<c:forEach var="c" items="${cat }">
										<c:if
											test="${ c.intCategoryId1 == cc.mstcategory.intCategoryId1}">
											<td>${c.txtCategoryName }</td>
										</c:if>
									</c:forEach>

									<td>${cc.txtDescription}</td>


									<td><a href="downloadUploadDoc/${cc.intDocumentUploadId}.web" class="btn green">Download</a>
									</td>
								</tr>
								<%
									i++;
								%>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8">
									<div align="center">
										<h2>No Records Found!!!</h2>
									</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

		</div>
	</div>
</div>

<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="footer.jsp"%>