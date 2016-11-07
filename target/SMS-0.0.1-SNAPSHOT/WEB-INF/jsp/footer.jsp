<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html>
    <script type="text/javascript" src="assets/validation/jquery.min.js"></script>
<script type="text/javascript"
	src="assets/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/validation/validation.js"></script>
<div class="footer">
	<div class="footer-inner">
		  2016 &copy; by SeekDigital.
	</div>
	<div class="footer-tools">
		<!--<span class="go-top">
			<i class="fa fa-angle-up"></i>
		</span>-->
	</div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/plugins/respond.min.js"></script>
<script src="assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-3.1.0.js"type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap2-typeahead.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="assets/plugins/clockface/js/clockface.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<!-- begin abhilash scripts -->
<script type="text/javascript"
	src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="assets/plugins/ckeditor/ckeditor.js"></script>
<!-- end abhilash scripts -->

<!-- END PAGE LEVEL PLUGINS -->
<!-- multi select begin -->
<script type="text/javascript" src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
<!-- multi select end -->


<script type="text/javascript" src="assets/plugins/bootstrap-editable/bootstrap-editable/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-editable/inputs-ext/address/address.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-editable/inputs-ext/wysihtml5/wysihtml5.js"></script>
<script type="text/javascript" src="assets/plugins/moment.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery.mockjax.js"></script>
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/scripts/core/app.js"></script>
<script src="assets/scripts/custom/components-pickers.js"></script>
<script src="assets/scripts/custom/components-dropdowns.js"></script>
<script src="assets/scripts/custom/form-editable.js"></script>

<script type="text/javascript">
$(document).ready(
		function() {
			
$("#nav").click(function ( e ) {
    e.preventDefault();
    $("  li a.active").removeClass("active"); //Remove any "active" class  
    $("a", this).addClass("active"); //Add "active" class to selected tab  

    // $(activeTab).show(); //Fade in the active content  
});
		});
</script>
<script>
jQuery(document).ready(function() {       
   // initiate layout and plugins
   App.init();
   ComponentsPickers.init();
   ComponentsDropdowns.init();
   FormEditable.init();
});
</script>
</body>
<!-- END BODY -->
</html>