

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- BEGIN PAGE HEADER-->
<%@include file="header.jsp"%>
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
 
	jQuery(document).ready(function($){
	    $('.my-form .add-box').click(function(){
	        var n = $('.text-box').length + 1;
	        var box_html = $('<p class="text-box"><label for="Time">Time <span class="box-number"></span></label> <input type="text" name="boxes[]" value="" id="box" /> <a href="#" class="remove-box">Remove</a></p>');
	      
	        box_html.hide();
	        $('.my-form p.text-box:last').after(box_html);
	        box_html.fadeIn('slow');
	        return false;
	    });
	    $('.my-form').on('click', '.remove-box', function(){
	        $(this).parent().css( 'background-color', '#FF6C6C' );
	        $(this).parent().fadeOut("slow", function() {
	            $(this).remove();
	            $('').each(function(index){
	                $(this).text( index);
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
                <h3 class="page-title">Admin</h3>
                <ul class="page-breadcrumb breadcrumb">
                        <li class="btn-group"></li>
                        <li class="active"><i class="fa fa-home"></i> <a
                                href="index.html"> Home </a> <i class="fa fa-angle-right"></i></li>
                        <li><a href="#"> Time Table </a></li>

                </ul>
                <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->

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

<!-- BEGIN BORDERED TABLE PORTLET-->
<div class="portlet box green">
        <div class="portlet-title">
                <div class="caption">Timetable</div>
        </div>

        <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form action="ad_timetable.web" method="post" class="form-horizontal" enctype="multipart/form-data">
                        <div class="form-body">

                                <div class="form-group">
                                        <br> <label class="col-md-3 control-label"><b>Upload
                                                        for</b> <span class="required"> * </span></label>
                                        <div class="col-md-4">
                                                <div class="input-group">
                                                        <span class="input-group-addon"> <i
                                                                class="fa  fa-list-alt"></i>
                                                        </span> <select name="mstcategory"
                                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                                                <option value="">Select person</option>
                                                                <c:forEach var="cat" items="${cat}">
                                                                        <option value="${cat.intCategoryId1}">${cat.txtCategoryName}</option>
                                                                </c:forEach>
                                                                <!-- <option value="Educational document">student</option>
                                                                <option value="Work Experience">teacher</option> -->
                                                                <!-- <option value="others">Others</option> -->
                                                        </select>
                                                </div>
                                        </div>
                                </div>

                                <!-- <div class="portlet-body form"> -->
                                <!-- BEGIN FORM-->
                                <div class="form-group">
                                        <label class="col-md-3 control-label"><b>Class</b> <span
                                                class="required"> * </span></label>
                                        <div class="col-md-4">
                                                <div class="input-group">
                                                        <span class="input-group-addon"> <i class="fa fa-user"></i>
                                                        </span> <select
                                                                class="table-group-action-input form-control input-inline input-small input-sm"
                                                                name="mststudclass">
                                                                <option>Select Class</option>
                                                                <c:forEach var="classe" items="${classes}">
                                                                        <option value="${classe.intClassId}">${classe.txtClassName}</option>
                                                                </c:forEach>

                                                        </select>
                                                        <!-- <input type="text" class="form-control" placeholder=""> -->
                                                </div>
                                        </div>
                                </div>

                                <!-- <div class="portlet-body form"> -->
                                <!-- BEGIN FORM-->
                                <div class="form-group">
                                        <label class="col-md-3 control-label"><b>Section</b> <span
                                                class="required"> * </span></label>
                                        <div class="col-md-4">
                                                <div class="input-group">
                                                        <span class="input-group-addon"> <i class="fa fa-user"></i>
                                                        </span> <select
                                                                class="table-group-action-input form-control input-inline input-small input-sm"
                                                                name="mststudclasssection">
                                                                <option value="">Select</option>
                                                                <c:forEach var="s" items="${sections}">
                                                                        <option value="${s.intSectionId}">${s.txtSectionName}</option>
                                                                </c:forEach>



                                                        </select>
                                                        <!-- <input type="text" class="form-control" placeholder=""> -->
                                                </div>
                                        </div>
                                </div>
                                
                                
                                 <div class="form-group">
                                        <label class="col-md-3 control-label"><b>Subject</b> <span
                                                class="required"> * </span></label>
                                        <div class="col-md-4">
                                                <div class="input-group">
                                                        <span class="input-group-addon"> <i class="fa fa-user"></i>
                                                        </span> <select
                                                                class="table-group-action-input form-control input-inline input-small input-sm"
                                                                name="mstsubject">
                                                                <option value="">Select</option>
                                                                <c:forEach var="s" items="${subject}">
                                                                        <option value="${s.intSubjectId}">${s.txtSubjectName}</option>
                                                                </c:forEach>



                                                        </select>
                                                        <!-- <input type="text" class="form-control" placeholder=""> -->
                                                </div>
                                        </div>
                                </div>

                                 <div class="form-group">
                                        <label class="col-md-3 control-label"><b>Day</b> <span
                                                class="required"> * </span></label>
                                        <div class="col-md-4">
                                                <div class="input-group">
                                                        <span class="input-group-addon"> <i class="fa fa-user"></i>
                                                        </span> <select
                                                                class="table-group-action-input form-control input-inline input-small input-sm"
                                                                name="tbldaysofweek">
                                                                <option value="">Select</option>
                                                                <c:forEach var="s" items="${days}">
                                                                        <option value="${s.intDaysId}">${s.txtDay}</option>
                                                                </c:forEach>



                                                        </select>
                                                        <!-- <input type="text" class="form-control" placeholder=""> -->
                                                </div>
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
                                                
                                                <div class="my-form">
                        <form role="form" method="post">
                     <p class="text-box">
                  <label for="box1">Time <span class="box-number"></span></label>
                  <input type="text" name="boxes[]" value="" id="box1" />
                <a class="add-box" href="#">Add</a>
                  </p>



                        <div class="clearfix" align="center">

                                <button type="submit" class="btn green">Submit</button>
                                <br> <br>

                        </div>
                </form>
        </div>


        <!-- END CONDENSED TABLE PORTLET-->

        <!-- END BORDERED TABLE PORTLET-->
       <%--  <div class="portlet box green">
                <div class="portlet-title">
                        <div class="caption">Student time table</div>

                </div>

                <div class="portlet-body">
                        <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                        <thead>
                                                <tr>
                                                        <th>S NO.</th>
                                                        <th>Class</th>
                                                        <th>Section</th>
                                                        <th>Subject</th>
                                                        <th>Day</th>
                                                        <th>Time</th>
                                                        <th>Action</th>
                                                </tr>
                                        </thead>
                                        <c:forEach var="mst" items="${ Mst}">
                                        <tbody>
                                                <tr>
                                                        <td>${mst.intStudentTimeTableId}</td>
                                                <td>        <c:forEach var="classes" items="${classes }">
                                                                <c:if
                                                                        test="${ classes.intClassId == mst.mststudclass.intClassId}">
                                                                        ${classes.txtClassName }
                                                                </c:if>
                                                        </c:forEach></td>

                                                        <td><c:forEach var="s" items="${sections }">
                                                                <c:if
                                                                        test="${ s.intSectionId  == mst.mststudclasssection.intSectionId}">
                                                                        ${s.txtSectionName }
                                                                </c:if>
                                                        </c:forEach></td>

                                                        <td><c:forEach var="s" items="${subject }">
                                                                <c:if test="${ s.intSubjectId  == mst.mstsubject.intSubjectId}">
                                                                        ${s.txtSubjectName }
                                                                </c:if>
                                                        </c:forEach></td>
                                                        <td><c:forEach var="s" items="${week }">
                                                                <c:if test="${ s.intDaysId  == mst.tbldaysofweek.intDaysId}">
                                                                        ${s.txtDay}
                                                                </c:if>
                                                        </c:forEach></td>
                                                        <td>${mst.txtClassTimings}</td>
                                                        <td><a href="delete/${mst.intStudentTimeTableId}.web" >Delete</a><!-- </a><button type="Submit" class="btn green">
                                                                        <i class="fa  fa-trash-o"> </i> Delete</a>
                                                                </button>--></td> 
                                                </tr>
                                                </tbody>
                                        </c:forEach>

                                        <tbody>
                                                <!-- <tr>
                                                        <td>1</td>
                                                        <td>5</td>
                                                        <td>A</td>
                                                        <td>Science</td>
                                                        <td>Monday</td>
                                                        <td>9:30-10:30</td>
                                                        <td><button type="button" class="btn green">
                                                                        <i class="fa  fa-trash-o"> </i> Delete
                                                                </button></td>
                                                        <td>
                                                <button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
                                                </td>
                                                        <td><button type="button" class="btn red"><i class="fa fa-edit"> </i> Edit</button>
                                                                </td>        

                                                </tr>
                                                <tr>
                                                        <td>2</td>
                                                        <td>5</td>
                                                        <td>B</td>
                                                        <td>English</td>
                                                        <td>Tuesday</td>
                                                        <td>9:30-10:30</td>
                                                        <td><button type="button" class="btn green">
                                                                        <i class="fa  fa-trash-o"> </i> Delete
                                                                </button></td>
                                                        <td>
                                                <button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
                                                </td>
                                                        <td><button type="button" class="btn red"><i class="fa fa-edit"> </i> Edit</button>
                                                                </td>

                                                </tr>
                                                <tr>
                                                        <td>3</td>
                                                        <td>4</td>
                                                        <td>C</td>
                                                        <td>Mathematics</td>
                                                        <td>Wednesday</td>
                                                        <td>9:30-10:30</td>
                                                        <td><button type="button" class="btn green">
                                                                        <i class="fa  fa-trash-o"> </i> Delete
                                                                </button></td>
                                                        <td>
                                                <button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
                                                </td>
                                                        <td><button type="button" class="btn red"><i class="fa fa-edit"> </i> Edit</button>
                                                                </td>
                                                </tr> -->
                                        </tbody>
                                </table>
                        </div>
                </div>
                <div class="portlet box green">
                        <div class="portlet-title">
                                <div class="caption">Teacher time table</div>

                        </div>

                        <div class="portlet-body">
                                <div class="table-responsive">
                                        <table class="table table-bordered table-hover">
                                                <thead>
                                                        <tr>
                                                                <th>S NO.</th>
                                                                <th>Class</th>
                                                                <th>Section</th>
                                                                <th>Subject</th>
                                                                <th>Day</th>
                                                                <th>Time</th>
                                                                <th>Action</th>

                                                        </tr>
                                                        
                                                        </thead>
                                        <c:forEach var="mst" items="${ Mstt}">
                                        <tbody>
                                                <tr>
                                                        <td>${mst.intTeacherTimeTableId}</td>
                                                <td>        <c:forEach var="classes" items="${classes }">
                                                                <c:if
                                                                        test="${ classes.intClassId == mst.mststudclass.intClassId}">
                                                                        ${classes.txtClassName }
                                                                </c:if>
                                                        </c:forEach></td>

                                                        <td><c:forEach var="s" items="${sections }">
                                                                <c:if
                                                                        test="${ s.intSectionId  == mst.mststudclasssection.intSectionId}">
                                                                        ${s.txtSectionName }
                                                                </c:if>
                                                        </c:forEach></td>

                                                        <td><c:forEach var="s" items="${subject }">
                                                                <c:if test="${ s.intSubjectId  == mst.mstsubject.intSubjectId}">
                                                                        ${s.txtSubjectName }
                                                                </c:if>
                                                        </c:forEach></td>
                                                        <td><c:forEach var="s" items="${week }">
                                                                <c:if test="${ s.intDaysId  == mst.tbldaysofweek.intDaysId}">
                                                                        ${s.txtDay}
                                                                </c:if>
                                                        </c:forEach></td>
                                                        <td>${mst.txtClassTimings}</td>
                                                        <td><td><a href="delete/${mst.intTeacherTimeTableId}.web" >Delete</a><!-- <button type="Submit" class="btn green">
                                                                        <i class="fa  fa-trash-o"> </i> Delete
                                                                </button> --></td>
                                                </tr>
                                                 </thead>
                                                <tbody>
                                                </c:forEach>
                                                        <!-- <tr>
                                                                <td>1</td>
                                                                <td>5</td>
                                                                <td>A</td>
                                                                <td>Science</td>
                                                                <td>Monday</td>
                                                                <td>9:30-10:30</td>
                                                                <td><button type="button" class="btn green">
                                                                                <i class="fa  fa-trash-o"> </i> Delete
                                                                        </button></td>
                                                                <td>
                                                <button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
                                                </td>
                                                        <td><button type="button" class="btn red"><i class="fa fa-edit"> </i> Edit</button>
                                                                </td>

                                                        </tr> -->
                                                        <!-- <tr>
                                                                <td>1</td>
                                                                <td>5</td>
                                                                <td>A</td>
                                                                <td>Science</td>
                                                                <td>Monday</td>
                                                                <td>9:30-10:30</td>
                                                                <td><button type="button" class="btn green">
                                                                                <i class="fa  fa-trash-o"> </i> Delete
                                                                        </button></td>
                                                                <td>
                                                <button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
                                                </td>
                                                        <td><button type="button" class="btn red"><i class="fa fa-edit"> </i> Edit</button>
                                                                </td>

                                                        </tr>
                                                        <tr>
                                                                <td>1</td>
                                                                <td>5</td>
                                                                <td>A</td>
                                                                <td>Science</td>
                                                                <td>Monday</td>
                                                                <td>9:30-10:30</td>
                                                                <td><button type="button" class="btn green">
                                                                                <i class="fa  fa-trash-o""> </i> Delete
                                                                        </button></td>
                                                                <td>
                                                <button type="button" class="btn green"><i class="fa fa-download"> </i> Download</button>
                                                </td>
                                                        <td><button type="button" class="btn red"><i class="fa fa-edit"> </i> Edit</button>
                                                                </td> -->
                                                        </tr>
                                                 </tbody>
                                        </table>
                                </div>
                        </div> --%>
                </div>
        </div>
</div>
</div>

<!-- END BORDERED TABLE PORTLET-->
</div>


<!-- END PAGE CONTENT-->
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<script src="assets/scripts/custom/slider.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {    
	  
	   slider(7);
	});
</script>
<%@include file="footer.jsp"%>