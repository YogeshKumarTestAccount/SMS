<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
<!--
	//-->
	$(document).ready(function() {

		$('#form1').validate({ // initialize the plugin
			rules : {
				mstschool : {
					required : true,
					lettersonly : true
				},

				txtMailId : {
					required : true,
					email : true,
					minlength : 5
				}
			},

			messages : {
				mstschool : {
					required : "* please select school"

				},
				txtMailId : {
					required : "* please enter email-id"
				}

			},

			highlight : function(element) {
				$(element).parent().addClass('error')
			}

		});

	});
</script>

<style>
#form1 .error {
	color: red;
	font-size: 13px;
}
</style>









<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			<!-- <small>basic datatable samples</small> -->
		</h3>
		<ul class="page-breadcrumb breadcrumb">
			<li class="btn-group">
			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> School's Connect </a> <!-- <i class="fa fa-angle-right"></i> -->
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
<div class="row">
	<div class="alert alert-info">
		<strong>Note:</strong> All (*) marked fields are mandatory.
	</div>


	<c:if test="${not empty sucmsg}">
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true"></button>
			<strong>${sucmsg}</strong>${sucmsg1}
		</div>
	</c:if>

	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->


		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->

		<div class="tab-content">
			<div class="tab-pane active" id="tab_0">
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-reorder"></i>School's Connect
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
						<form action="ad_school's connect.web" class="form-horizontal"
							method="post" enctype="multipart/form-data" id="form1">
							<div class="form-body">

								<div class="form-group">
									<label class="col-md-3 control-label"><b>Title</b></label>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-book"></i>
											</span> <input type="text" name="txtTitle" class="form-control"
												placeholder="">

										</div>

									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label"><b>School<b>
												<span class="required"> * </span></label>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-building-o"></i>
											</span>
											<!--<input type="text" class="form-control" placeholder="">-->
											<select
												class="table-group-action-input form-control input-inline input-small input-sm"
												name="mstschool" required="required">

												<option value="">select school</option>
												<c:forEach var="m" items="${mstschools}">

													<option value="${m.intSchoolId}">${m.txtSchoolName}</option>
												</c:forEach>


											</select>
										</div>
									</div>
								</div>


								<div class="form-group">
									<label class="col-md-3 control-label"><b>Email id</b> <span
										class="required"> * </span></label>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i>
											</span> <input type="text" class="form-control" placeholder=""
												name="txtMailId" required="required">
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label"><b>Body</b></label>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-bars"></i>
											</span>

											<textarea name="txtBody" class="form-control" rows="3"></textarea>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label"><b>Attachment</b></label>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-upload"></i>
											</span> <input type="file" name="blAttachment" class="form-control"
												placeholder="upload">
										</div>
										<p>
											Only (<strong>.pdf, .JPG, .GIF, .PNG, .DOC, .DOCX</strong>)
											files are allowed .<br> (The maximum file size for
											uploads is <strong>5 MB</strong>)
										</p>
									</div>
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
	  
	   slider(12);
	});
</script>
<%@include file="footer.jsp"%>