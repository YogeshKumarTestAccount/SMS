package com.seekdigital.parent.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;
import org.joda.time.Hours;
import org.joda.time.Minutes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.seekdigital.entity.Mstfeemanagement;
import com.seekdigital.entity.Mstleave;
import com.seekdigital.entity.Mstregistration;
import com.seekdigital.entity.Mststudenttimetable;
import com.seekdigital.entity.Mstteacherinvite;
import com.seekdigital.entity.Mstteacherproject;
import com.seekdigital.entity.Mstuploadstudmarksheet;
import com.seekdigital.entity.Tblhomework;
import com.seekdigital.entity.Tblinvites;
import com.seekdigital.entity.Trnattendancerecord;
import com.seekdigital.entity.Trnstudentleaveapp;
import com.seekdigital.parent.service.ParentService;


@Controller
public class ParentController {

	@Autowired
	ParentService parentService;

	@RequestMapping("par_student profile.web")
	public ModelAndView parStudentProfile() {
		ModelAndView mav = new ModelAndView("par_student profile");
		List<Mstregistration> mst = (List<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("mst", mst);
		return mav;
	}
	
	@RequestMapping(value = "par_student profile.web", method = RequestMethod.POST)
	public ModelAndView parStudentProfile(HttpServletRequest req,ModelMap model,ModelMap map) {
		ModelAndView mav = new ModelAndView("par_student profile");
		List<Mstregistration> mst = (List<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("mst", mst);
		String studentName = req.getParameter("studentName");
		List<Mstregistration> studDetail = (List<Mstregistration>) parentService.getStudentDetailByName(studentName);
		map.addAttribute("studentName", studentName);
		if(studDetail.isEmpty()){
			
			mav.addObject("noRecordErr", "true");
		}else{
			mav.addObject("studDetail", studDetail);
		}
		
		return mav;
	}
	
	@RequestMapping(value = "par_student profile_update.web")
	public ModelAndView updateStudentProfile(ModelMap map,HttpServletRequest req,@RequestParam String name){
		ModelAndView mav = new ModelAndView("updateStudentProfile");
		List<Mstregistration> studDetail = (List<Mstregistration>) parentService.getStudentDetailByName(name);
		mav.addObject("studDetail", studDetail);
		return mav;
	}
	
	@RequestMapping(value = "Updated_par_student profile.web")
	public ModelAndView updatedStudentProfile(ModelMap map,@ModelAttribute Mstregistration mstregistration){
		ModelAndView mav = new ModelAndView("updateStudentProfile");
		//System.out.println("id:"+mstregistration.getIntRegistrationId());
		//System.out.println(mstregistration.getTxtPerAddress());
		parentService.update(mstregistration,mstregistration.getIntRegistrationId());
		List<Mstregistration> studDetail = (List<Mstregistration>) parentService.getStudentDetailByName(mstregistration.getTxtFirstName());
		//System.out.println("list:"+studDetail);
		mav.addObject("studDetail", studDetail);
		mav.addObject("msg","Details have been updated successfully");
		return mav;
	}
	
	


	
	@RequestMapping("par_marks.web")
	public ModelAndView studentmarks(@ModelAttribute("parent") Mstuploadstudmarksheet parent)
	{
		
		ModelAndView mav = new ModelAndView("par_marks");
		List<Mstuploadstudmarksheet> mst = (List<Mstuploadstudmarksheet>)parentService.getStudentMarksByName();
		mav.addObject("mst",mst);
		return mav;
	}

	//marks download
	@RequestMapping(value = "downloads/{id}")
	public void Download(HttpServletResponse res, @PathVariable Integer id) throws IOException {
		
		Mstuploadstudmarksheet file = parentService.getMarkSheet(id);
		res.setContentLength(file.getBlMarkSheet().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlMarkSheet(), out);
		res.sendRedirect("par_marks.jsp");
		out.flush();
		out.close();
		return;

		
	}
	// correct for leave request
	@RequestMapping(value = "par_leave request.web")
	public ModelAndView addLeaveRequestDropDown(@ModelAttribute("trnLeave") Trnstudentleaveapp trnLeave) {
		ModelAndView mav = new ModelAndView("par_leave request");
		ArrayList<Mstleave> leaveal = (ArrayList<Mstleave>) parentService.getLeave();
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("leaveal", leaveal);
		mav.addObject("regal", regal);

		return mav;
	}
	
	@RequestMapping(value = "par_leave request.web", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest req,ModelMap map) throws ParseException {
		Trnstudentleaveapp lapp = new Trnstudentleaveapp();
		ModelAndView m = new ModelAndView("par_leave request");
		String reason = req.getParameter("txtReason");
		lapp.setTxtReason(reason);
		int leaveId = Integer.parseInt(req.getParameter("mstleave"));
		int RegId = Integer.parseInt(req.getParameter("mstregistration"));
		SimpleDateFormat dateFormate1 = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat dateFormate2 = new SimpleDateFormat("MM/dd/yyyy");

		String d1 = req.getParameter("dtFromDate");
		String d2 = req.getParameter("dtToDate");
		java.sql.Date fromDate = new java.sql.Date(dateFormate1.parse(d1).getTime());
		java.sql.Date toDate = new java.sql.Date(dateFormate2.parse(d2).getTime());
		java.sql.Date appliedDate = new java.sql.Date(new java.util.Date().getTime());
		lapp.setDtFromDate(fromDate);
		lapp.setDtToDate(toDate);
		lapp.setDtAppliedDate(appliedDate);
		Mstleave ml = new Mstleave();
		ml.setIntLeaveId(leaveId);
		lapp.setMstleave(ml);

		Mstregistration mreg = new Mstregistration();
		mreg.setIntRegistrationId(RegId);
		lapp.setMstregistration(mreg);
		parentService.leaveApp(lapp);
		map.addAttribute("msg","Leave Request has been sent successfully");
		
		ArrayList<Mstleave> leaveal = (ArrayList<Mstleave>) parentService.getLeave();
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		m.addObject("leaveal", leaveal);
		m.addObject("regal", regal);

		return m;
	}
	
	@RequestMapping(value = "par_StudleaveInbox.web")
	public ModelAndView leaveRequestInbox(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("par_StudleaveInbox");
		List<Mstregistration> mst = (List<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("mst", mst);
	/*int id = Integer.parseInt(req.getParameter("studentName"));
	List<Trnstudentleaveapp> studentLeaveInbox = parentService.getStudentLeaveInbox(id);
	
		
		mav.addObject("inbox", "inbox");
		mav.addObject("studentLeaveInbox", studentLeaveInbox);*/
		
		return mav;
	}
	
	@RequestMapping(value = "par_StudleaveInboxData.web")
	public ModelAndView leaveRequestInboxData(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("par_StudleaveInbox");
		List<Mstregistration> mst = (List<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("mst", mst);
	int id = Integer.parseInt(req.getParameter("studentName"));
	List<Trnstudentleaveapp> studentLeaveInbox = parentService.getStudentLeaveInbox(id);
	
		
		mav.addObject("inbox", "inbox");
		mav.addObject("studentLeaveInbox", studentLeaveInbox);
		
		return mav;
	}

	@RequestMapping(value = "par_attendance.web")
	public ModelAndView addNameInAttendanceLisrt(@ModelAttribute("attendance") Trnattendancerecord attendance) {
		ModelAndView mav = new ModelAndView("par_attendance");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}

	
	@RequestMapping(value = "par_attendance.web", method = RequestMethod.POST)
	public ModelAndView getCurrentAttendance(HttpServletRequest req,ModelMap map) throws ParseException {
		
		ModelAndView m = new ModelAndView("par_attendance");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		m.addObject("regal", regal);
		String name = req.getParameter("mstregistration");
		if(name!=null){
			List<Trnattendancerecord> trnAttendance = parentService.getStudentAttendanceByName(name);

			ArrayList<String> s  = new ArrayList<>();
			java.util.Iterator<Trnattendancerecord> i2 = trnAttendance.iterator();
			while(i2.hasNext()){
				Trnattendancerecord attendanceObject = i2.next();
				String time = attendanceObject.getDtSlotTime();
				String splitedTime[] = time.split("\\s+");
				String inTime = splitedTime[0];
				String outTime = splitedTime[1];
				
				s.add(time);		s.add(inTime);			s.add(outTime);
				m.addObject("inTime", inTime);
				m.addObject("outTime", outTime);
				
				SimpleDateFormat formatter1 = new SimpleDateFormat("HH:mm");
				DateTime timeValue1 = new DateTime(formatter1.parse(inTime).getTime());

				SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
				DateTime timeValue2 = new DateTime(formatter2.parse(outTime).getTime());

				String hours = String.valueOf(Hours.hoursBetween(timeValue1,timeValue2).getHours() % 24);
				String minutes =String.valueOf( Minutes.minutesBetween(timeValue1, timeValue2).getMinutes() % 60);
				
				 if(Integer.parseInt(hours)<10){
		            	hours = "0"+hours;
		            }
		            if(Integer.parseInt(minutes)<10){
		            	minutes = "0"+minutes;
		            }
				String totalHours = hours+":"+minutes;

				m.addObject("totalHours", totalHours);
			}
			m.addObject("trnAttendance", trnAttendance);
			map.addAttribute("msg", "No Attendance Found For Today");
		
			}else {
					SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
					String d1 = req.getParameter("fromDate");
					String d2 = req.getParameter("toDate");
					 
					java.sql.Date startDate = new java.sql.Date(dateFormat1.parse(d1).getTime());
					java.sql.Date endDate = new java.sql.Date(dateFormat2.parse(d2).getTime());
					   java.sql.Date appliedDate = new java.sql.Date(new java.util.Date().getTime());
					   System.out.println("appliedDate "+appliedDate);
					   if(endDate.after(appliedDate)){
						   //System.out.println("Not Possible");
						   map.addAttribute("msg1", "Date Can't Be Greater Than Today's Date");  
					   }
					   else{
					List<Trnattendancerecord> trnBetweenAttendance = parentService.getStudentAttendanceBetweenTwoDates(startDate, endDate);
				       
					 List<BetweenCal> list = new ArrayList();
				        for (Iterator iterator = trnBetweenAttendance.iterator(); iterator.hasNext();) {
				        	Trnattendancerecord trn = (Trnattendancerecord) iterator.next();
				        	BetweenCal entityModel = new BetweenCal();
				        	entityModel.setDate(trn.getDtSlotDate());
				            
				            SimpleDateFormat formatter1 = new SimpleDateFormat("HH:mm");
				            SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
				            String time = trn.getDtSlotTime();
				            String[] splitedTime = time.split("\\s+");
				            String inTime = splitedTime[0];
				            String outTime = splitedTime[1];
				            entityModel.setInTime(inTime);
				            entityModel.setOutTime(outTime);

				            DateTime timeValue1 = new DateTime(formatter1.parse(inTime).getTime());
				            DateTime timeValue2 = new DateTime(formatter2.parse(outTime).getTime());
				            String hours = String.valueOf(Hours.hoursBetween(timeValue1,timeValue2).getHours() % 24);
				            if(Integer.parseInt(hours)<10){
				            	hours = "0"+hours;
				            }
				            String minutes =String.valueOf( Minutes.minutesBetween(timeValue1, timeValue2).getMinutes() % 60);
				            if(Integer.parseInt(minutes)<10){
				            	minutes = "0"+minutes;
				            }
				            	
				            String totalHours = hours+":"+minutes;
				            entityModel.setTotalhrs(totalHours);
				            
				            list.add(entityModel);
				            
				        }
				        m.addObject("list", list);
					   }
					map.addAttribute("msg", "No Attendance Found For Today");
			}return m;
	}
			@RequestMapping(value = "par_timetable.web")
			public ModelAndView addNameInParTimeTable(@ModelAttribute("studTimeTable") Mststudenttimetable stuudentTimeTable) {
				ModelAndView mav = new ModelAndView("par_timetable");
				ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
				mav.addObject("regal", regal);
				return mav;
			}
		
			//a
			@RequestMapping(value = "par_timetable.web",method = RequestMethod.POST)
			public ModelAndView partimetable(@ModelAttribute("parent") Mststudenttimetable parent) {
						
				ModelAndView mav = new ModelAndView("par_timetable");
				ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
				mav.addObject("regal", regal);
				List<Object[]> mst = (List<Object[]>)parentService.getStuTimeTablebyClass();
				mav.addObject("mst",mst);
				return mav;
					} 

	/*@RequestMapping(value = "par_timetable.web", method = RequestMethod.POST)
	public ModelAndView displayStudentParTimeTable(HttpServletRequest req) {
		String name = req.getParameter("studentName");
		ModelAndView mav = new ModelAndView("par_timetable");
		List<Mststudenttimetable> studTimeTbl = parentService.getStudentTimeTable(name);
		mav.addObject("studTimeTbl", studTimeTbl);
		return mav;
	}*/

	@RequestMapping(value = "par_homework.web")
	public ModelAndView addNameInParHomeWork(@ModelAttribute("studHomeWork") Tblhomework stuudentHomeWork) {
		ModelAndView mav = new ModelAndView("par_homework");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "par_homework.web", method = RequestMethod.POST)
	public ModelAndView gettudentHomeWork(HttpServletRequest req,ModelMap map) throws ParseException {

		ModelAndView m = new ModelAndView("par_homework");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		m.addObject("regal", regal);
		String name = req.getParameter("studentName");
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
		String d1 = req.getParameter("date");
		List<Tblhomework> homework = null;
		if(name!=null && d1 == ""){
		
			 homework = parentService.getStudentHomeWorkByName(name);
			 m.addObject("homework", homework);
			
		
		}else{
			
			java.sql.Date date = new java.sql.Date(dateFormate.parse(d1).getTime());
			System.out.println("Date="+d1);
			
		 homework = parentService.getStudentHomeWorkByName(name, date);
		 m.addObject("homework", homework);
			
		}
		if(homework.isEmpty())
		{
		
		map.addAttribute("msg", "No Record Found");
		}
		return m;
	}

	@RequestMapping(value = "par_notification.web")
	public ModelAndView addNameInParNotification() {
		ModelAndView mav = new ModelAndView("par_notification");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}

	@RequestMapping(value = "par_notification.web", method = RequestMethod.POST)
	public ModelAndView displayStudentNotification(HttpServletRequest req,ModelMap map) {
		ModelAndView mav = new ModelAndView("par_notification");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		String name = req.getParameter("studentName");
		
		List<Tblinvites> tblinvites = parentService.getNotificationByStudentName(name);
		
		List<Mstteacherinvite> mste = parentService.getNotificationToStudentNameByTeacher(name);
		
		
		if(tblinvites.isEmpty() && mste.isEmpty()){
			mav.addObject("noRecordErr", "true");
		}else{
			mav.addObject("tblinvites", tblinvites);
			mav.addObject("mste",mste);
		}
		//map.addAttribute("msg", "No New Notification");
		return mav;
	}

	@RequestMapping(value = "downloadsNotification/{id}")
	public void Downloade(HttpServletResponse res, @PathVariable int id) throws IOException {
		System.out.println("inside notification");
		System.out.println(id);
		Tblinvites file = parentService.getNotificationById(id);
		res.setContentLength(file.getBlUploadFile().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlUploadFile(), out);
		out.flush();
		out.close();
		return;
	}
	
	@RequestMapping(value = "par_fee details.web")
	public ModelAndView addNameInParFeeDetail(@ModelAttribute("studentFeeDetail") Mstfeemanagement fm) {
		ModelAndView mav = new ModelAndView("par_fee details");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}

	@RequestMapping(value = "par_gps tarcking.web")
	public ModelAndView addNameInParGpsTracking() {
		ModelAndView mav = new ModelAndView("par_gps tarcking");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}

	@RequestMapping(value = "par_extra cirrcular.web")
	public String parExtraCirrcular(Model model) {
		return "par_extra cirrcular";
	}

	@RequestMapping(value = "par_event.web")
	public ModelAndView addNameInParEvent() {
		ModelAndView mav = new ModelAndView("par_event");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}

	@RequestMapping(value = "par_virtual lib.web")
	public ModelAndView addNameInParVirtualLibrary() {
		ModelAndView mav = new ModelAndView("par_virtual lib");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}

	@RequestMapping(value = "par_virtual lib1.web")
	public String parVirtualLib1(Model model) {
		return "par_virtual lib1";
	}

		
	@RequestMapping(value = "par_projects.web")
	public ModelAndView viewNameInDropDownOfProjectPage() {
		ModelAndView mav = new ModelAndView("par_projects");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		return mav;
	}

	@RequestMapping(value = "par_projects.web",method = RequestMethod.POST)
	public ModelAndView viewProjectDetail(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("par_projects");
		ArrayList<Mstregistration> regal = (ArrayList<Mstregistration>) parentService.getStudentInformationByName();
		mav.addObject("regal", regal);
		String name = req.getParameter("studentName");
		List<Mstteacherproject> project = parentService.getStudentProjectByName(name);
		if(project.isEmpty()){
			mav.addObject("noRecordErr","true" );
		}else{
			mav.addObject("project", project);
		}
		
		return mav;
	}
	
	
}
