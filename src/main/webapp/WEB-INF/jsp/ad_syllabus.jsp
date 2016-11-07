
<!-- BEGIN PAGE HEADER-->

<!-- <td><input type="text" class="code" id="customFieldName" name="customFieldName[]" value="" placeholder="Input Name" /> -->


<%@include file="header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	/* /* var counter=0;
	 $(document)
	 .ready(
	 function() {
	 $(".addCF")
	 .click(
	 function() {
	 counter+=1;
	 $("#customFields")
	 .append(
	 '<tr valign="top"><th scope="row"><label for="customFieldName">subject'+ counter + '</label></th>  <td><input type="text" class="code" id="customFieldValue" '+counter +'name="customFieldValue[]" value="" placeholder="Input Value" /> &nbsp; <a href="javascript:void(0);" class="remCF">Remove</a></td></tr>');
	
	 });
	 /* for (var i = 0; i < $("#customFieldValue").val(); i++) {
	 } */
	/* $("#customFields").on('click', '.remCF', function() {
		$(this).parent().parent().remove();
	});											
	}); */

	jQuery(document)
			.ready(
					function($) {
						$('.my-form .add-box')
								.click(
										function() {
											var n = $('.text-box').length + 1;
											var box_html = $('<p class="text-box"><label for="subject" class="col-md-3 control-label"><b>Subject</b> <span class="box-number"></span></label> <input type="text" name="boxes[]" value="" id="box" /> <a href="#" class="remove-box">Remove</a></p>');

											box_html.hide();
											$('.my-form p.text-box:last')
													.after(box_html);
											box_html.fadeIn('slow');
											return false;
										});
						$('.my-form').on(
								'click',
								'.remove-box',
								function() {
									$(this).parent().css('background-color',
											'#FF6C6C');
									$(this).parent().fadeOut("slow",
											function() {
												$(this).remove();
												$('').each(function(index) {
													$(this).text(index);
												});
											});
									return false;
								});

						/*  $("text-box").on('click', '.remove-box', function() {
							$(this).parent().parent().remove(); */
					});
</script>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<!--<h3 class="page-title">
					Teacher
					</h3>-->
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
							</ul> -->
			</li>
			<li><i class="fa fa-home"></i> <a href="index.html"> Home </a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#"> Syllabus </a> <i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#"> upload </a></li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->







<!-- <div class="alert alert-info">
	<strong>Note:</strong> All (*) marked fields are mandatory.
	
									Only (<strong>.pdf, .JPG, .GIF, .PNG,.DOC, .DOCX</strong>)
									files are allowed .<br> (The maximum file size for uploads
									is <strong>5 MB</strong>)
								
</div> -->
<c:if test="${not empty sucmsg}">
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true"></button>
		<strong>${sucmsg}</strong>${sucmsg1}
	</div>
</c:if>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN VALIDATION STATES-->
		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i>Syllabus
				</div>

			</div>
			<div class="portlet-body form">

				<!-- BEGIN FORM-->
				<form action="ad_syllabus.web" method="POST" class="form-horizontal">
					<div class="form-body">



						<div class="form-group">
							<label class="col-md-3 control-label"><b>Class</b> <span
								class="required"> * </span></label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i>
									</span> <select
										class="table-group-action-input form-control input-inline input-small input-sm"
										name="Mststudclass">
										<option value="Select">select class</option>
										<c:forEach var="m" items="${mststudclasses}">
											<option value="${m.intClassId}">${m.txtClassName}</option>
										</c:forEach>


									</select>
								</div>
							</div>
						</div>



						<div class="my-form">
							<form role="form" method="post">
								<p class="text-box">
									<label for="box1" class="col-md-3 control-label"><b>Subject</b>
										<span class="box-number"></span></label> <input  
										 type="text"
										name="boxes[]" value="" id="box1" /> <a class="add-box" href="#"> Add</a>
								</p>

							</form>
						</div>





						<div class="form-actions fluid">
							<div class="col-md-offset-3 col-md-9">
								<button type="submit" class="btn green">Send</button>
								<!--<button type="button" class="btn default">Cancel</button>-->
							</div>
						</div>
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END VALIDATION STATES-->
	</div>
</div>



<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {

		slider(14);
	});
</script>

<%@include file="footer.jsp"%>







