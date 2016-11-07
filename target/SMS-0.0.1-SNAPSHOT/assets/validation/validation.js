//-------------- begin student validation-------------

//student attendance search
$(document).ready(
		function() {
			$('#submit2').click(
					function() {
						
						var date = $("#date1").val();
						if (date == "") {
							$('#validationMessages6').slideDown().html(
									"<span>Please select from date</span>");

							return false;
						} else {
							$('#validationMessages6').slideDown().html("");
						}
						
						var date = $("#date2").val();
						if (date == "") {
							$('#validationMessages7').slideDown().html(
									"<span>Please select to date</span>");

							return false;
						} else {
							$('#validationMessages7').slideDown().html("");
						}

					});

		});


//student homework search
$(document).ready(
		function() {
			$('#submit6').click(
					function() {
						
						var date = $("#date3").val();
						if (date == "") {
							$('#validationMessages5').slideDown().html(
									"<span>Please select date</span>");
							

							return false;
						} else {
							$('#validationMessages5').slideDown().html("");
						}
					});

		});


//student project search
$(document).ready(
		function() {
			$('#stusubmit').click(
					function() {
						
						var date = $("#date1").val();
						if (date == "") {
							$('#validationMessages1').slideDown().html(
									"<span>Please select date</span>");
							
							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
						}
					});

		});


//student question and answer 
$(document).ready(
		function() {
			$('#submit7').click(
					function() {
						var subject = $("#subject").val();
						if (subject == "Select") {
							$('#validationMessages5').slideDown().html(
									"<span>Please select the subject</span>");

							return false;
						} else {
							$('#validationMessages5').slideDown().html("");
						}
						
						var question = $("#question").val();
						if (question == "") {
							$('#validationMessages7').slideDown().html(
									"<span>Please write the question here</span>");

							return false;
						} else {
							$('#validationMessages7').slideDown().html("");
						}
						

					});

		});

//--------------end of student validation-----------------
//teacher homework page
$(document).ready(
		function() {
			$('#submit1').click(
					function() {
						//class
						var cls = $("#class").val();
						if (cls == "-1") {
							$('#validationMessages1').slideDown().html(
									"<span>Please select  class</span>");

							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
						}

						//section
						var sec = $("#section").val();
						if (sec == "-1") {
							$('#validationMessages2').slideDown().html(
									"<span>Please select section</span>");
							return false;
			 			} else {
							$('#validationMessages2').slideDown().html("");
						}

						//subject
						var subject = $("#subject").val();
						if (subject == "") {
							$('#validationMessages3').slideDown().html(
									"<span>Please enter subject name</span>");
							return false;
						} else {
							$('#validationMessages3').slideDown().html("");
						}

						// homework
			 			var homework = $("#homework").val();
						if (homework == "") {
							$('#validationMessages4').slideDown().html(
									"<span>Please enter homework</span>");
							return false;
						} else {
							$('#validationMessages4').slideDown().html("");
						}

						//dtDueDate
						var dtDueDate = $("#dtDueDate").val();
						if (dtDueDate == "") {
							$('#validationMessages5').slideDown().html(
									"<span>Please select due date</span>");
							return false;
						} else {
							$('#validationMessages5').slideDown().html("");
						}

					});

		});
//teacher homework search
$(document).ready(
		function() {
			$('#submit2').click(
					function() {
						
						var date = $("#date1").val();
						if (date == "") {
							$('#validationMessages6').slideDown().html(
									"<span>Please select from date</span>");

							return false;
						} else {
							$('#validationMessages6').slideDown().html("");
						}
						
						var date = $("#date2").val();
						if (date == "") {
							$('#validationMessages7').slideDown().html(
									"<span>Please select to date</span>");

							return false;
						} else {
							$('#validationMessages7').slideDown().html("");
						}

					});

		});

//teacherProfile
$(document).ready(
		function() {
			$('#profileSubmit').click(
					function() {
						//permanent address
						var perAddr = $("#perAddr").val();
						if (perAddr == "") {
							$('#validationMessages1').slideDown().html(
									"<span>Permanent address cannot be empty</span>");

							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
						}
						//temporary address
						var tempAddr = $("#tempAddr").val();
						if (tempAddr == "") {
							$('#validationMessages2').slideDown().html(
									"<span>Temporary address cannot be empty</span>");

							return false;
						} else {
							$('#validationMessages2').slideDown().html("");
						}
						
						//emailID
						var emailID = $("#emailID").val();
						if (emailID == "") {
							$('#validationMessages3').slideDown().html(
									"<span>Email ID cannot be empty</span>");

							return false;
						} else {
							$('#validationMessages3').slideDown().html("");
						}
						
						//mobile number
						var mobileNumber = $("#mobileNumber").val();
						if (mobileNumber == "") {
							$('#validationMessages4').slideDown().html(
									"<span>Mobile Number cannot be empty</span>");

							return false;
						} 
						if(!mobileNumber.match("^(\\d*$)"))
						 {
						 $('#validationMessages4').slideDown().html("Only numbers are allowed..");
							return false;
						 }
					
						 if(!(mobileNumber.length==10)){
							$('#validationMessages4').slideDown().html("Mobile number should be 10 digits..");
							return false;
						}
						 
						else {
							$('#validationMessages4').slideDown().html("");
						}
						
					

					});

		});

//leave request
$(document).ready(
		function() {
			$('#leaveSubmit').click(
					function() {
						
						//student selection for parent leave
						var student = $("#student").val();
						if (student == "-1") {
							$('#validationMessages5').slideDown().html(
									"<span>Please select the student</span>");

							return false;
						} else {
							$('#validationMessages5').slideDown().html("");
						}
						//leaveType
						var leaveType = $("#leaveType").val();
						if (leaveType == "-1") {
							$('#validationMessages1').slideDown().html(
									"<span>Please select leave type</span>");

							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
						}
						
						
						//from date
						var date = $("#date1").val();
						if (date == "") {
							$('#validationMessages2').slideDown().html(
									"<span>Please select from date</span>");

							return false;
						} else {
							$('#validationMessages2').slideDown().html("");
						}
						
						//to date
						var date = $("#date2").val();
						if (date == "") {
							$('#validationMessages3').slideDown().html(
									"<span>Please select to date</span>");

							return false;
						} else {
							$('#validationMessages3').slideDown().html("");
						}

						//txtReason
						var txtReason = $("#txtReason").val();
						if (txtReason == "") {
							$('#validationMessages4').slideDown().html(
									"<span>Please enter the reason</span>");

							return false;
						} else {
							$('#validationMessages4').slideDown().html("");
						}
						
						
						
						
					});

		});

//teacher project page
$(document).ready(
		function() {
			$('#projsubmit1').click(
					function() {
						//class
						var cls = $("#class").val();
						if (cls == "-1") {
							$('#validationMessages1').slideDown().html(
									"<span>Please select  class</span>");

							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
						}

						//section
						var sec = $("#section").val();
						if (sec == "-1") {
							$('#validationMessages2').slideDown().html(
									"<span>Please select section</span>");
							return false;
						} else {
							$('#validationMessages2').slideDown().html("");
						}

						//project name
						var projectName = $("#projectName").val();
						if (projectName == "") {
							$('#validationMessages3').slideDown().html(
									"<span>Please enter project name</span>");
							return false;
						} else {
							$('#validationMessages3').slideDown().html("");
						}

						// project description
						var projDesc = $("#projDesc").val();
						if (projDesc == "") {
							$('#validationMessages4').slideDown().html(
									"<span>Please enter project description</span>");
							return false;
						} else {
							$('#validationMessages4').slideDown().html("");
						}

						//dtDueDate
						var dtDueDate = $("#dtDueDate").val();
						if (dtDueDate == "") {
							$('#validationMessages5').slideDown().html(
									"<span>Please select due date</span>");
							return false;
						} else {
							$('#validationMessages5').slideDown().html("");
						}

					});

		});
//teacher project search
$(document).ready(
		function() {
			$('#projsubmit2').click(
					function() {
						
						var date = $("#date1").val();
						if (date == "") {
							$('#validationMessages6').slideDown().html(
									"<span>Please select from date</span>");

							return false;
						} else {
							$('#validationMessages6').slideDown().html("");
						}
						
						var date = $("#date2").val();
						if (date == "") {
							$('#validationMessages7').slideDown().html(
									"<span>Please select to date</span>");

							return false;
						} else {
							$('#validationMessages7').slideDown().html("");
						}
						
						var select = $("#select").val();
						if (select == "-1") {
							$('#validationMessages8').slideDown().html(
									"<span>Please select  status</span>");

							return false;
						} else {
							$('#validationMessages8').slideDown().html("");
						}
						

					});

		});

//parent 
$(document).ready(
		function() {
			$('#parSubmit').click(
					function() {
						
						var parent = $("#parent").val();
						if (parent == "-1") {
							$('#validationMessages1').slideDown().html(
									"<span>Please select student</span>");

							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
						}
						
						
					});

		});

//teacher marksheet
$(document).ready(
		function() {
			$('#marksubmit1').click(
					function() {
						//class
						var cls = $("#class").val();
						if (cls == "-1") {
							$('#validationMessages1').slideDown().html(
									"<span>Please select  class</span>");

							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
						}

						//section
						var sec = $("#section").val();
						if (sec == "-1") {
							$('#validationMessages2').slideDown().html(
									"<span>Please select section</span>");
							return false;
						} else {
							$('#validationMessages2').slideDown().html("");
						}

						//examType
						var examType = $("#examType").val();
						if (examType == "-1") {
							$('#validationMessages3').slideDown().html(
									"<span>Please select exam type </span>");
							return false;
						} else {
							$('#validationMessages3').slideDown().html("");
						}

						//student
						var student = $("#student").val();
						if (student == "-1") {
							$('#validationMessages4').slideDown().html(
									"<span>Please enter project description</span>");
							return false;
						} else {
							$('#validationMessages4').slideDown().html("");
						}

						//excel file
						//^([a-z]\w*)\.(xls[mx]?)$
						var file = $("#file").val();
						if (file == "") {
							$('#validationMessages5').slideDown().html(
									"<span>Please choose file it cannot be empty</span>");
							return false;
						}
						else if(!file.match("([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$"))
							{
							$('#validationMessages5').slideDown().html(
									"<span>Only Excel(.xls,.xlsx files are allowed</span>");
							return false;
							
							}
						else {
							$('#validationMessages5').slideDown().html("");
						}

					});

		});


//teacher marksheet search 
$(document).ready(
		function() {
			$('#marksubmit2').click(
					function() {
						
						//examType
						var examType = $("#examType2").val();
						if (examType == "") {
							$('#validationMessages6').slideDown().html(
									"<span>Please select exam type </span>");
							return false;
						} else {
							$('#validationMessages6').slideDown().html("");
							
						}
					});

		});

//for teacher to answer
$(document).ready(
		function() {
			$('#ansSubmit').click(
					function() {
						
						//answer
						var answer = $("#answer").val();
						if (answer == "") {
							$('#validationMessages1').slideDown().html(
									"<span>Please enter the answer </span>");
							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
							
						}
					});

		});

//teacher invites
//for teacher to answer
$(document).ready(
		function() {
			$('#invite').click(
					function() {
						
						//class
						var cls = $("#class").val();
						if (cls == "-1") {
							$('#validationMessages1').slideDown().html(
									"<span>Please select the class </span>");
							return false;
						} else {
							$('#validationMessages1').slideDown().html("");
							
						}
						
						var section = $("#section").val();
						if (section == "-1") {
							$('#validationMessages2').slideDown().html(
									"<span>Please select the section </span>");
							return false;
						} else {
							$('#validationMessages2').slideDown().html("");
							
						}
						
						var message = $("#message").val();
						if (message == "") {
							$('#validationMessages3').slideDown().html(
									"<span>Please enter the message </span>");
							return false;
						} else {
							$('#validationMessages3').slideDown().html("");
							
						}
					});

		});
