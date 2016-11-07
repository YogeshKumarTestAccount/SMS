package com.seekdigital.teacher.controller;
 
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seekdigital.entity.Mstleave;
import com.seekdigital.entity.Mstquestionandanswer;
import com.seekdigital.entity.Mstregistration;
import com.seekdigital.entity.Mststudclass;
import com.seekdigital.entity.Mststudclasssection;
import com.seekdigital.entity.Mstteachercheckin;
import com.seekdigital.entity.Mstteacherinvite;
import com.seekdigital.entity.Mstteacherproject;
import com.seekdigital.entity.Mstteachertimetable;
import com.seekdigital.entity.Mstterms;
import com.seekdigital.entity.Mstuploadstudmarksheet;
import com.seekdigital.entity.Tblhomework;
import com.seekdigital.entity.Tblinvites;
import com.seekdigital.entity.Trnstudentleaveapp;
import com.seekdigital.entity.Trnteacherleaveapp;
import com.seekdigital.teacher.service.TeacherService;

@Controller
public class TeacherController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	public TeacherService teacherService;

	// teacher profile page display
	@RequestMapping(value = "teac_profile.web")
	public String teacProfile(Model model, Mstregistration mstregistration) {
		System.out.println("inside teacher profile method");
		List<Mstregistration> profile = teacherService.Profile(1);
		model.addAttribute("teacherProfile", profile);
		return "teac_profile";
	}

	// teacher profile page gets redisplayed with updated details
	@RequestMapping(value = "profileEdit.web")
	public String teacProfileEdit(ModelMap model, Mstregistration mstregistration) {
		System.out.println("inside teacher profile edit method");
		
		mstregistration.setIntRegistrationId(1);
		teacherService.update(mstregistration);

		List<Mstregistration> profile = teacherService.Profile(1);
		model.addAttribute("teacherProfile", profile);
		model.addAttribute("msg1", "Success!");
		model.addAttribute("msg2", " Details have been updated successfully");

		return "teac_profile";
	}
	
	//displays leave request page for the teacher
	@RequestMapping(value = "teac_leave request.web")
	public String teacLeaveRequest(ModelMap model) {
		List<Mstleave> leaveTypes = teacherService.getAllLeaveTypes();
		model.addAttribute("leaveTypes", leaveTypes);
		model.addAttribute("trnteacherleaveapp", new Trnteacherleaveapp());
		return "teac_leave request";
	}
	
	//displays leave request page after the leave is applied
	@RequestMapping(value = "teachPostLeaveRequest.web")
	public String applyLeave(ModelMap map, Trnteacherleaveapp trnteacherleaveapp)
	{
		java.sql.Date fromDate = new java.sql.Date(trnteacherleaveapp.getDtFromDate().getTime());
		java.sql.Date toDate = new java.sql.Date(trnteacherleaveapp.getDtToDate().getTime());
		trnteacherleaveapp.setDtFromDate(fromDate);
		trnteacherleaveapp.setDtToDate(toDate);
		Mstregistration mstreg = new Mstregistration();
		mstreg.setIntRegistrationId(1);
		trnteacherleaveapp.setMstregistration(mstreg);
		trnteacherleaveapp.setDtAppliedDate(new java.sql.Date(new Date().getTime()));
		trnteacherleaveapp.setIntStatus(1);
		teacherService.applyLeave(trnteacherleaveapp);
	map.addAttribute("trnteacherleaveapp", new Trnteacherleaveapp());
		
		map.addAttribute("msg1", "Your request for leave has been sent successfully");
		List<Mstleave> leaveTypes = teacherService.getAllLeaveTypes();
		map.addAttribute("leaveTypes", leaveTypes);
		map.addAttribute("trnteacherleaveapp", new Trnteacherleaveapp());
		return "teac_leave request";
	}
	
	//displays leave inbox page
	@RequestMapping(value = "teac_leaveInbox.web")
	public String teacLeaveInbox(ModelMap model) {
		List<Trnteacherleaveapp> leaveInbox =  teacherService.getTeacherLeaveInbox(1);
		model.addAttribute("inbox", leaveInbox);
		return "teac_leaveInbox";
	}
	
	//displays student leave inbox page
		@RequestMapping(value = "teac_StudentLeaveInbox.web")
		public String teacStudentLeaveInbox(ModelMap model) {
			List<Trnstudentleaveapp> studentLeaveRequest = teacherService.getStudentLeaveRequest();
			model.addAttribute("studentLeaveRequest", studentLeaveRequest);
			return "teac_StudentLeaveInbox";
		}

	//for student leave approval
		@RequestMapping(value = "teac_studLeaveApprove.web")
		public String teacStudentLeaveApproval(ModelMap model,HttpServletRequest request) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			teacherService.approveOrRejectStudentLeave(id, 2,new java.sql.Date(new Date().getTime()));
			model.addAttribute("approve", "Leave request is approved");
			List<Trnstudentleaveapp> studentLeaveRequest = teacherService.getStudentLeaveRequest();
			model.addAttribute("studentLeaveRequest", studentLeaveRequest);
			return "teac_StudentLeaveInbox";
		}
		
		//for student leave rejection
				@RequestMapping(value = "teac_studLeaveReject.web")
				public String teacStudentLeaveReject(ModelMap model,HttpServletRequest request ) {
					
					int id = Integer.parseInt(request.getParameter("id"));
					teacherService.approveOrRejectStudentLeave(id, 3,new java.sql.Date(new Date().getTime()));
					List<Trnstudentleaveapp> studentLeaveRequest = teacherService.getStudentLeaveRequest();
					model.addAttribute("studentLeaveRequest", studentLeaveRequest);
					model.addAttribute("reject", "Leave request is rejected");
					return "teac_StudentLeaveInbox";
				}
			
		//leave request search
				@RequestMapping(value = "teac_leaveRequestSearch.web",method = RequestMethod.POST)
				public String teacleaveRequestSearch(ModelMap model,HttpServletRequest request ) {
					
					int status = Integer.parseInt(request.getParameter("Status"));
					
					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
					try{
						java.sql.Date fromDate = new java.sql.Date(dateFormat.parse(request.getParameter("FromDate")).getTime());
						java.sql.Date toDate = new java.sql.Date(dateFormat.parse(request.getParameter("ToDate")).getTime());
						if(status==1)
						{
							List<Trnstudentleaveapp> searchedLeaveReq = teacherService.getAllSearchedLeaveReq(fromDate, toDate);
							model.addAttribute("studentLeaveRequest1", searchedLeaveReq);
							List<Trnstudentleaveapp> studentLeaveRequest = teacherService.getStudentLeaveRequest();
							model.addAttribute("studentLeaveRequest", studentLeaveRequest);
							model.addAttribute("check", "check");
						}
						if(status==2||status==3)
						{
							List<Trnstudentleaveapp> searchedLeaveReq = teacherService.getSearchedLeaveReq(status, fromDate, toDate);
							model.addAttribute("studentLeaveRequest1", searchedLeaveReq);
							List<Trnstudentleaveapp> studentLeaveRequest = teacherService.getStudentLeaveRequest();
							model.addAttribute("studentLeaveRequest", studentLeaveRequest);
							model.addAttribute("check", "check");
							
						}
					
					}
					catch(ParseException e)
					{
						e.printStackTrace();
					}
					return "teac_StudentLeaveInbox";
				}		
				
	/*@InitBinder
	public void initBinder(WebDataBinder binder) {
	    binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}*/
	
	//displays the page to upload marksheet of students
	@RequestMapping(value = "teac_marksheet.web")
	public String teacMarkSheet(ModelMap model,Mstuploadstudmarksheet mstuploadstudmarksheet) {
		System.out.println("inside marksheet");
		List<Mststudclass> classes = teacherService.getAllClasses();
		List<Mststudclasssection> sections = teacherService.getAllSections();
		List<Mstterms> examTerms = teacherService.getExamTerms();
		List<Mstregistration> students = teacherService.getStudents();
		sections.remove(4);
		classes.remove(12);

		 
		model.addAttribute("classes", classes);
		model.addAttribute("sections", sections);
		model.addAttribute("examTerms", examTerms);
		model.addAttribute("students", students);
		
		return "teac_marksheet";
	}
	
	//displays the marksheet page after uploading the marksheet file
    @RequestMapping(value = "marksheetupload.web")
    public String teacMarkSheetUpload(Mstuploadstudmarksheet mstuploadstudmarksheet,BindingResult result,ModelMap model,@RequestParam("file")MultipartFile file)
    		throws IOException {
            System.out.println("after uploading............");
            System.out.println("filename:"+file.getOriginalFilename());  
            System.out.println("size:"+file.getSize());
            System.out.println("file:"+file);
            System.out.println("file content type = "+file.getContentType());
            byte[] bytes = file.getBytes();
            mstuploadstudmarksheet.setTxtfileName(file.getOriginalFilename());
            mstuploadstudmarksheet.setTxtcontentType(file.getContentType());

            mstuploadstudmarksheet.setBlMarkSheet(bytes);
            mstuploadstudmarksheet.setDtDate(new Date());
            mstuploadstudmarksheet.setIntTeacherId(1);
            teacherService.uploadStudentMarksheet(mstuploadstudmarksheet);

            List<Mststudclass> classes = teacherService.getAllClasses();
            List<Mststudclasssection> sections = teacherService.getAllSections();
            List<Mstterms> examTerms = teacherService.getExamTerms();
            List<Mstregistration> students = teacherService.getStudents();
            sections.remove(4);
            classes.remove(12);
            model.addAttribute("msg", "Marksheet has been uploaded successfully....");

            model.addAttribute("mstuploadstudmarksheet", new Mstuploadstudmarksheet());
           
            model.addAttribute("classes", classes);
            model.addAttribute("sections", sections);
            model.addAttribute("examTerms", examTerms);
            model.addAttribute("students", students);
            return "teac_marksheet";
    }
	
    //this method is used to search the marksheet according to exam
    @RequestMapping(value = "searchMarksheet.web")
	public String searchMarksheet(ModelMap model,HttpServletRequest request,Mstuploadstudmarksheet mstuploadstudmarksheet) {
    	System.out.println("Id:"+Integer.parseInt(request.getParameter("exam")));
    	
    	List<Mststudclass> classes = teacherService.getAllClasses();
		List<Mststudclasssection> sections = teacherService.getAllSections();
		List<Mstterms> examTerms = teacherService.getExamTerms();
		List<Mstregistration> students = teacherService.getStudents();
		List<Mstuploadstudmarksheet> studentMarksheet = teacherService.getStudentMarksheet(Integer.parseInt(request.getParameter("exam")));
		sections.remove(4);
		classes.remove(12);
		model.addAttribute("studentMarksheet",studentMarksheet);
		model.addAttribute("classes", classes);
		model.addAttribute("sections", sections);
		model.addAttribute("examTerms", examTerms);
		model.addAttribute("students", students);
		model.addAttribute("check", "check");
		return "teac_marksheet";
	}
    
    //marksheet download
    @RequestMapping(value = "marksheetViewOrDownload.web")
	public void marksheetDownload(@RequestParam("id") int id,HttpServletResponse response) throws IOException {
		
		Mstuploadstudmarksheet file = teacherService.getMarksheet(id);
		
    	response.setContentLength(file.getBlMarkSheet().length);
    	response.setContentType(file.getTxtcontentType());
		OutputStream out = response.getOutputStream();
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlMarkSheet(), out);
		out.flush();
		out.close();
		return;

	}
    
    //notification file download
    @RequestMapping(value = "notificationFileDownload.web")
	public void marksheetView(@RequestParam("id") int id,HttpServletResponse response) throws IOException {
		
		Tblinvites file = teacherService.getNotificationFile(id);
		
    	response.setContentLength(file.getBlUploadFile().length);
    	response.setContentType(file.getTxtcontentType());
		OutputStream out = response.getOutputStream();
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlUploadFile(), out);
		out.flush();
		out.close();
		return;

	}
	@RequestMapping(value = "teac_notification.web")
	public String teacNotification(ModelMap model) {
		List<Tblinvites> teacherNotification = teacherService.getTeacherNotification(3);
		model.addAttribute("notification", teacherNotification);
		return "teac_notification";
	}

	//display project page to post new project
	@RequestMapping(value = "teac_project.web")
	public String teacProject(ModelMap model) {
		List<Mststudclass> classes = teacherService.getAllClasses();
		List<Mststudclasssection> sections = teacherService.getAllSections();
		model.addAttribute("mstteacherproject", new Mstteacherproject());
		List<Mstregistration> students = teacherService.getStudents();
		sections.remove(4);
		classes.remove(12);
		
		model.addAttribute("classes", classes);
		model.addAttribute("sections", sections);
		model.addAttribute("students", students);
	
		return "teac_project";
	}
	
	//project page display after the project is posted
		@RequestMapping(value = "teac_projectPosted.web")
		public String teachProjectPost(ModelMap map, Mstteacherproject mstteacherproject,HttpServletRequest request) {
			
			java.sql.Date dueDate = new java.sql.Date(mstteacherproject.getDtDueDate().getTime());
			java.sql.Date assignDate = new java.sql.Date(new Date().getTime());
			mstteacherproject.setDtAssignDate(assignDate);
			mstteacherproject.setDtDueDate(dueDate);
			mstteacherproject.setIntTeacherId(1);
			if(request.getParameterValues("select")!=null)
			{
				String[] values = request.getParameterValues("select");
				System.out.println("select length:"+values.length);
				System.out.println("inside if..........");
				int[] array = Stream.of(values).mapToInt(Integer::parseInt).toArray();
				for(Integer i :array){
				Mstregistration mstregistration = new Mstregistration();
				mstregistration.setIntRegistrationId(i);
				mstteacherproject.setMstregistration(mstregistration);
				teacherService.projectPost(mstteacherproject);
				System.out.println("project for particular students......");
				}
				
			}
			else
			{
				teacherService.projectPost(mstteacherproject);
			}
			
			map.addAttribute("msg1", "Success!");
			map.addAttribute("msg2", "  project is posted successfully");
			//map = new ModelMap();
			map.addAttribute("mstteacherproject", new Mstteacherproject());
			List<Mststudclass> classes = teacherService.getAllClasses();
			List<Mststudclasssection> sections = teacherService.getAllSections();
			List<Mstregistration> students = teacherService.getStudents();
			sections.remove(4);
			classes.remove(12);
			map.addAttribute("classes", classes);
			map.addAttribute("sections", sections);
			map.addAttribute("students", students);
			
			return "teac_project";
		}
		
		//display the posted project's for the searched date
		@RequestMapping(value = "teachProjectHistory.web")
		public String teachProjectHistory(ModelMap map,HttpServletRequest request,Mstteacherproject mstteacherproject)
		{
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			try {
				java.sql.Date fromDate = new java.sql.Date(dateFormat.parse(request.getParameter("fromDate")).getTime());
				java.sql.Date toDate = new java.sql.Date(dateFormat.parse(request.getParameter("toDate")).getTime());
				System.out.println("after conversion");
				System.out.println("from date:"+fromDate);
				System.out.println("To date:"+toDate);
				List<Mstteacherproject> projectHistory = teacherService.getProjectHistory(1, fromDate, toDate);
				map.addAttribute("projectHistory",  projectHistory);
				map.addAttribute("history", "history display");
				List<Mststudclass> classes = teacherService.getAllClasses();
				List<Mststudclasssection> sections = teacherService.getAllSections();
				List<Mstregistration> students = teacherService.getStudents();
				sections.remove(4);
				classes.remove(12);
				map.addAttribute("classes", classes);
				map.addAttribute("sections", sections);
				map.addAttribute("students", students);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return "teac_project";
		}
		
	//display the question & answer page
	@RequestMapping(value = "teac_question & answer.web")
	public String teacQuestionAnswer(ModelMap model) {
		List<Mstquestionandanswer> questions = teacherService.getStudentQuestions();
		model.addAttribute("questions", questions);
		return "teac_question & answer";
	}
	
	//teac_answer.web
	@RequestMapping(value = "teac_answer.web")
	public String teacAnswer(ModelMap model,HttpServletRequest request) {
		int questionId = Integer.parseInt(request.getParameter("id"));
		String answer = request.getParameter("answer");
	System.out.println("question Id:"+questionId);
	System.out.println("answer:"+answer);
		teacherService.postAnswer(questionId, answer, 1);
		List<Mstquestionandanswer> questions = teacherService.getStudentQuestions();
		model.addAttribute("questions", questions);
		model.addAttribute("msg", "Your answer is posted successfully");
		return "teac_question & answer";
	}

	//displays the page to invite the class
	@RequestMapping(value = "teac_send invites.web")
	public String teacSendInvites(ModelMap model) {
		List<Mststudclass> classes = teacherService.getAllClasses();
		List<Mststudclasssection> sections = teacherService.getAllSections();
		sections.remove(4);
		classes.remove(12);
		model.addAttribute("mstteacherinvite", new Mstteacherinvite());
		model.addAttribute("classes", classes);
		model.addAttribute("sections", sections);
		return "teac_send invites";
	}
	
	//displays the page after the invite is sent to whole class
	@RequestMapping(value = "teac_InvitePost.web")
	public String teacInvitesPosted(ModelMap model,Mstteacherinvite mstteacherinvite) {
		Mstregistration mstregistration = new Mstregistration();
		mstregistration.setIntRegistrationId(1);
		mstteacherinvite.setMstregistration(mstregistration);
		mstteacherinvite.setDtInvitesDate(new Date());
		teacherService.postTeacherInvite(mstteacherinvite);
		model.addAttribute("mstteacherinvite", new Mstteacherinvite());
		List<Mststudclass> classes = teacherService.getAllClasses();
		List<Mststudclasssection> sections = teacherService.getAllSections();
		sections.remove(4);
		classes.remove(12);
		model.addAttribute("classes", classes);
		model.addAttribute("sections", sections);
		model.addAttribute("invite", "Your Invite request has been sent successfully");
		return "teac_send invites";
	}
	//display the timetable page of teacher
	@RequestMapping(value = "teac_timetable.web")
	public String teacTimetable(ModelMap map) {
		List<Mstteachertimetable> timetable = teacherService.getTimetable(1);
		map.addAttribute("timetable", timetable);
		
		return "teac_timetable";
	}
	
	//displays the timetable page after teacher has checked-in into particular class
	@RequestMapping(value = "teac_checkIn.web")
	public String teacCheckIn(ModelMap map,@RequestParam("id") int intTeacherTimeTableId) {
		System.out.println("id......."+intTeacherTimeTableId);
		Mstteachertimetable mstteachertimetable = new Mstteachertimetable();
		mstteachertimetable.setIntTeacherTimeTableId(intTeacherTimeTableId);
		Mstteachercheckin mstteachercheckin = new Mstteachercheckin();
		mstteachercheckin.setMstteachertimetable(mstteachertimetable);
		mstteachercheckin.setDtCheckIn(new Date());
		teacherService.recordCheckInTime(mstteachercheckin);
		
		map.clear();
		List<Mstteachertimetable> timetable = teacherService.getTimetable(1);
		map.addAttribute("timetable", timetable);
		map.addAttribute("msg", "Your request for class Check-In time has been marked");
		
		return "teac_timetable";
	}

	
	
	//displays the class check-in history of teacher
	@RequestMapping(value = "teachCheckInHistory.web")
	public String teacCheckInHistory(ModelMap map,HttpServletRequest request) {
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		try {
			java.sql.Date fromDate = new java.sql.Date(dateFormat.parse(request.getParameter("fromDate")).getTime());
			java.sql.Date toDate = new java.sql.Date(dateFormat.parse(request.getParameter("toDate")).getTime());
			List<Mstteachercheckin> classCheckInTimeHistory = teacherService.getClassCheckInTimeHistory(1, fromDate, toDate);
			map.addAttribute("checkin",classCheckInTimeHistory);
			List<Mstteachertimetable> timetable = teacherService.getTimetable(1);
			map.addAttribute("timetable", timetable);
			map.addAttribute("checkInHistory", "Yes");
		} catch (ParseException e) {
			e.printStackTrace();
	 	}
		
		return "teac_timetable";
	}

	
	// homework page display to post the homework
	@RequestMapping(value = "teac_homework.web")
	public String teacHomework(ModelMap map) {
		List<Mststudclass> classes = teacherService.getAllClasses();
		List<Mststudclasssection> sections = teacherService.getAllSections();
		List<Mstregistration> students = teacherService.getStudents();
		map.addAttribute("tblhomework", new Tblhomework());
		sections.remove(4);
		classes.remove(12);
		map.addAttribute("classes", classes);
		map.addAttribute("sections", sections);
		map.addAttribute("students", students);
		return "teac_homework";
	}

	// homework page display after the homework is posted
	@RequestMapping(value = "teac_homeworkPosted.web")
	public String teachHomeworkPost(ModelMap map, Tblhomework tblhomework,HttpServletRequest request) {
		System.out.println("inside..................homework");
		java.sql.Date dueDate = new java.sql.Date(tblhomework.getDtDueDate().getTime());
		java.sql.Date assignDate = new java.sql.Date(new Date().getTime());
		tblhomework.setDtAssignDate(assignDate);
		tblhomework.setDtDueDate(dueDate);
		tblhomework.setIntTeacherId(1);
		if(request.getParameterValues("select")!=null)
		{
			String[] values = request.getParameterValues("select");
			System.out.println("select length:"+values.length);
			System.out.println("inside if..........");
			int[] array = Stream.of(values).mapToInt(Integer::parseInt).toArray();
			for(Integer i :array){
			Mstregistration mstregistration = new Mstregistration();
			mstregistration.setIntRegistrationId(i);
			tblhomework.setMstregistration(mstregistration);
			teacherService.homeworkPost(tblhomework);
			System.out.println("homework for particular students......");
			}
			
		}
		else
		{
		teacherService.homeworkPost(tblhomework);
		}
		map.addAttribute("msg1", "Success!");
		map.addAttribute("msg2", " Homework is posted successfully");
		//map = new ModelMap();
		map.addAttribute("tblhomework", new Tblhomework());
		List<Mststudclass> classes = teacherService.getAllClasses();
		List<Mststudclasssection> sections = teacherService.getAllSections();
		List<Mstregistration> students = teacherService.getStudents();
		sections.remove(4);
		classes.remove(12);
		map.addAttribute("classes", classes);
		map.addAttribute("sections", sections);
		map.addAttribute("students", students);
		


		return "teac_homework";
	}
	
	//display the posted homework's for the searched dates
	@RequestMapping(value = "teachHomeworkHistory.web")
	public String teachHomeworkHistory(ModelMap map,HttpServletRequest request,Tblhomework tblhomework)
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		try {
			java.sql.Date fromDate = new java.sql.Date(dateFormat.parse(request.getParameter("fromDate")).getTime());
			java.sql.Date toDate = new java.sql.Date(dateFormat.parse(request.getParameter("toDate")).getTime());
			System.out.println("after conversion");
			System.out.println("from date:"+fromDate);
			System.out.println("To date:"+toDate);
			List<Tblhomework> homeworkHistory = teacherService.getHomeworkHistory(1, fromDate, toDate);
			map.addAttribute("homeworkHistory", homeworkHistory);
			map.addAttribute("history", "history display");
			List<Mststudclass> classes = teacherService.getAllClasses();
			List<Mststudclasssection> sections = teacherService.getAllSections();
			List<Mstregistration> students = teacherService.getStudents();
			sections.remove(4);
			map.addAttribute("classes", classes);
			map.addAttribute("sections", sections);
			map.addAttribute("students", students);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return "teac_homework";
	}
}

