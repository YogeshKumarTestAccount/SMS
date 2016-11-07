package com.seekdigital.student.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.seekdigital.entity.Mstquestionandanswer;
import com.seekdigital.entity.Mstregistration;
import com.seekdigital.entity.Mststudclass;
import com.seekdigital.entity.Mststudenttimetable;
import com.seekdigital.entity.Mstsubject;
import com.seekdigital.entity.Mstteacherinvite;
import com.seekdigital.entity.Mstteacherproject;
import com.seekdigital.entity.Mstuploadstudmarksheet;
import com.seekdigital.entity.Tblhomework;
import com.seekdigital.entity.Tblinvites;
import com.seekdigital.entity.Trnattendancerecord;
import com.seekdigital.student.service.StudentService;



@Controller
public class StudentController {
	
	@Autowired
	private StudentService Studentservice;
	
	//Student Profile
	@RequestMapping("stu_profile.web")
	public ModelAndView studentprofile(@ModelAttribute("student") Mstregistration student) 
	{
		ModelAndView mav = new ModelAndView("stu_profile");
		List<Mstregistration> mst = (List<Mstregistration>)Studentservice.getParentInformationByName();
		mav.addObject("mst",mst);
		

		return mav;
	}
	
	@RequestMapping(value="/getUserImage/{id}.web")
	public void getUserImage(HttpServletResponse response , @PathVariable("id") int tweetID) throws IOException{

	 response.setContentType("image/jpeg");
	 List<Mstregistration> list = Studentservice.getParentInformationByName();
	 for (Iterator iterator = list.iterator(); iterator.hasNext();) {
		Mstregistration mstregistration = (Mstregistration) iterator.next();
		if(mstregistration.getIntRegistrationId()==tweetID){
		 byte[] buffer = mstregistration.getBlImage();
		 InputStream in1 = new ByteArrayInputStream(buffer);
		  IOUtils.copy(in1, response.getOutputStream());
	}}
	          
	}
	//student question and answer
	
	@RequestMapping("stu_question & answer.web")
	public ModelAndView studentquestionandanswer(HttpServletRequest req)
	{
		ModelAndView mav = new ModelAndView("stu_question & answer");
		
		List<Mstsubject> mst = (List<Mstsubject>)Studentservice.getStudentQuestionByName();
		mav.addObject("mst",mst);
		
		int stuId=4;
		   Mstregistration regObj=Studentservice.getClass(stuId);
		   String classStr=regObj.getMststudclass().getTxtClassName();
		   int classjj=Integer.parseInt(classStr);
	
		
		 List<Mstquestionandanswer> q = Studentservice.getTeacherNameAll(classjj);
		 /*ArrayList<String> stuNamesList=new ArrayList<String>();*/
		 ArrayList<String> teachNamesList=new ArrayList<String>();
		 Iterator<Mstquestionandanswer> itr=q.iterator();
		 while (itr.hasNext()) {
			Mstquestionandanswer qq = (Mstquestionandanswer) itr.next();
			int teachId=qq.getIntTeacherId();
			System.out.println(teachId);
			String teachName=Studentservice.getTeachName(teachId);
			teachNamesList.add(teachName);
			
			
		}
		 
		
		 mav.addObject("teachNamesList", teachNamesList);
		   mav.addObject("q", q);
		   
		
			   
			   
		return mav;
	}
	
	
	@RequestMapping(value="stu_question & answer.web",method = RequestMethod.POST)  
	   public ModelAndView save(HttpServletRequest req)throws ParseException { 
		
		Mstquestionandanswer mq = new Mstquestionandanswer();
	   ModelAndView m=new ModelAndView("stu_question & answer");
	   String quetion = req.getParameter("writequestion");
	   mq.setTxtQuestion(quetion);
	   int subjectId = Integer.parseInt(req.getParameter("mstSubject"));
	   Mstsubject msbject = new Mstsubject();
	   Mstregistration reg=new Mstregistration();
	   int stuId=4;
	   reg.setIntRegistrationId(stuId);
	   Mstregistration regObj=Studentservice.getClass(stuId);
	   String classStr=regObj.getMststudclass().getTxtClassName();
	   int classjj=Integer.parseInt(classStr);
	   
	   
	   
	   mq.setMstregistration(reg);
	   msbject.setIntSubjectId(subjectId);
	   mq.setMstsubject(msbject);
	  // mq.setTxtAnswer("This Question has not been answered till now!!!!");
	   mq.setIntTeacherId(0);
	   Mststudclass classObj=new Mststudclass();
	   classObj.setIntClassId(regObj.getMststudclass().getIntClassId());
	   
	   mq.setMststudclass(classObj);
	   Studentservice.addQuestion(mq);
	   m.addObject("msg", "Successfully Added");
	   
	   
	   List<Mstsubject> mst = (List<Mstsubject>)Studentservice.getStudentQuestionByName();
		m.addObject("mst",mst);
		
	
		 List<Mstquestionandanswer> q = Studentservice.getTeacherNameAll(classjj);
		 /*ArrayList<String> stuNamesList=new ArrayList<String>();*/
		 ArrayList<String> teachNamesList=new ArrayList<String>();
		 Iterator<Mstquestionandanswer> itr=q.iterator();
		 while (itr.hasNext()) {
			Mstquestionandanswer qq = (Mstquestionandanswer) itr.next();
			int teachId=qq.getIntTeacherId();
			System.out.println(teachId);
			String teachName=Studentservice.getTeachName(teachId);
			teachNamesList.add(teachName);
			
			
		}
	   
	   
		 m.addObject("teachNamesList", teachNamesList);
		 m.addObject("q", q);
	
	   
		  
	   return m;
	   } 
	
	
	
	
 //student task/assignment
	@RequestMapping("stu_task.web")
	public ModelAndView studenttask() throws ParseException {

		ModelAndView mav = new ModelAndView("stu_task");

		String sdfw = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date curDt = sdf.parse(sdfw);

		Calendar now = Calendar.getInstance();
		now.add(Calendar.WEEK_OF_YEAR, -1);
		System.out.println("date before 1 week : " + (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1)
				+ "-" + now.get(Calendar.DATE));
		String oneWeekBeforeStr = (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1) + "-"
				+ now.get(Calendar.DATE);
		java.util.Date oneWeekBefore = sdf.parse(oneWeekBeforeStr);

		java.sql.Date date = new java.sql.Date(oneWeekBefore.getTime());
		int id = 1;

		ArrayList<Tblhomework> hwList = (ArrayList<Tblhomework>) Studentservice.getHWFromTo(date, new java.sql.Date(curDt.getTime()), id);

		ArrayList<String> teachNamesListHW = new ArrayList<String>();
		ArrayList<String> teachNamesListProj = new ArrayList<String>();
		Iterator<Tblhomework> itr = hwList.iterator();
		while (itr.hasNext()) {
			Tblhomework qq = (Tblhomework) itr.next();
			int teachId = qq.getIntTeacherId();
			System.out.println(teachId);
			String teachName = Studentservice.getTeacherName(teachId);
			teachNamesListHW.add(teachName);
		}
		
		
		mav.addObject("hwList", hwList);

		ArrayList<Mstteacherproject> hwListe = (ArrayList<Mstteacherproject>) Studentservice.getProFromTo(new java.sql.Date(oneWeekBefore.getTime()),
				new java.sql.Date(curDt.getTime()), id);

		Iterator<Mstteacherproject> itr2 = hwListe.iterator();
		while (itr2.hasNext()) {
			Mstteacherproject qq = (Mstteacherproject) itr2.next();
			int teachId = qq.getIntTeacherId();
			System.out.println(teachId);
			String teachName = Studentservice.getTeacherName(teachId);
			teachNamesListProj.add(teachName);
		}
		
		
		
		mav.addObject("hwListe", hwListe);
		mav.addObject("teachNamesListHW", teachNamesListHW);
		mav.addObject("teachNamesListProj", teachNamesListProj);
		return mav;
	}

	@RequestMapping(value = "stu_task.web", method = RequestMethod.POST)
	public ModelAndView studenttask1(HttpServletRequest req) throws ParseException {

		ArrayList<String> teachNamesListHW = new ArrayList<String>();
		ArrayList<String> teachNamesListProj = new ArrayList<String>();
		
		ModelAndView mav = new ModelAndView("stu_task");
		String aDateStr = req.getParameter("assignDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date aDate = sdf.parse(aDateStr);
		ArrayList<Tblhomework> hwList = new ArrayList<Tblhomework>();
		ArrayList<Mstteacherproject> hwListe = new ArrayList<Mstteacherproject>();

			hwList = (ArrayList<Tblhomework>) Studentservice.getHW(aDate);
		
			Iterator<Tblhomework> itr = hwList.iterator();
			while (itr.hasNext()) {
				Tblhomework qq = (Tblhomework) itr.next();
				int teachId = qq.getIntTeacherId();
				System.out.println(teachId);
				String teachName = Studentservice.getTeacherName(teachId);
				teachNamesListHW.add(teachName);
			}
			
			
			
			String sdfw = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			SimpleDateFormat sdfwww = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date curDt = sdfwww.parse(sdfw);
		
			Calendar now = Calendar.getInstance();
			now.add(Calendar.WEEK_OF_YEAR, -1);
			System.out.println("date before 1 week : " + (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1)
					+ "-" + now.get(Calendar.DATE));
			String oneWeekBeforeStr = (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1) + "-"
					+ now.get(Calendar.DATE);
			java.util.Date oneWeekBefore = sdf.parse(oneWeekBeforeStr);

			int id = 1;

			hwListe = (ArrayList<Mstteacherproject>) Studentservice.getProFromTo(new java.sql.Date(oneWeekBefore.getTime()), new java.sql.Date(curDt.getTime()), id);

			Iterator<Mstteacherproject> itr2 = hwListe.iterator();
			while (itr2.hasNext()) {
				Mstteacherproject qq = (Mstteacherproject) itr2.next();
				int teachId = qq.getIntTeacherId();
				System.out.println(teachId);
				String teachName = Studentservice.getTeacherName(teachId);
				teachNamesListProj.add(teachName);
			}
			
		
		mav.addObject("hwList", hwList);
		mav.addObject("hwListe", hwListe);
		mav.addObject("teachNamesListHW", teachNamesListHW);
		mav.addObject("teachNamesListProj", teachNamesListProj);
		return mav;
	}
	
	@RequestMapping("stu_project.web")
	public ModelAndView studentprojec() throws ParseException {

		ModelAndView mav = new ModelAndView("stu_task");

		String sdfw = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date curDt = sdf.parse(sdfw);

		Calendar now = Calendar.getInstance();
		now.add(Calendar.WEEK_OF_YEAR, -1);
		System.out.println("date before 1 week : " + (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1)
				+ "-" + now.get(Calendar.DATE));
		String oneWeekBeforeStr = (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1) + "-"
				+ now.get(Calendar.DATE);
		java.util.Date oneWeekBefore = sdf.parse(oneWeekBeforeStr);

		java.sql.Date date = new java.sql.Date(oneWeekBefore.getTime());
		int id = 1;

		ArrayList<Tblhomework> hwList = (ArrayList<Tblhomework>) Studentservice.getHWFromTo(date, new java.sql.Date(curDt.getTime()), id);

		ArrayList<String> teachNamesListHW = new ArrayList<String>();
		ArrayList<String> teachNamesListProj = new ArrayList<String>();
		Iterator<Tblhomework> itr = hwList.iterator();
		while (itr.hasNext()) {
			Tblhomework qq = (Tblhomework) itr.next();
			int teachId = qq.getIntTeacherId();
			System.out.println(teachId);
			String teachName = Studentservice.getTeacherName(teachId);
			teachNamesListHW.add(teachName);
		}
		
		
		mav.addObject("hwList", hwList);

		ArrayList<Mstteacherproject> hwListe = (ArrayList<Mstteacherproject>) Studentservice.getProFromTo(new java.sql.Date(oneWeekBefore.getTime()),
				new java.sql.Date(curDt.getTime()), id);

		Iterator<Mstteacherproject> itr2 = hwListe.iterator();
		while (itr2.hasNext()) {
			Mstteacherproject qq = (Mstteacherproject) itr2.next();
			int teachId = qq.getIntTeacherId();
			System.out.println(teachId);
			String teachName = Studentservice.getTeacherName(teachId);
			teachNamesListProj.add(teachName);
		}
		
		
		
		mav.addObject("hwListe", hwListe);
		mav.addObject("teachNamesListHW", teachNamesListHW);
		mav.addObject("teachNamesListProj", teachNamesListProj);
		return mav;
	}
	@RequestMapping(value = "stu_project.web", method = RequestMethod.POST)
	public ModelAndView studentproject(HttpServletRequest req) throws ParseException {
		
		ArrayList<String> teachNamesListHW = new ArrayList<String>();
		ArrayList<String> teachNamesListProj = new ArrayList<String>();
		
		ModelAndView mav = new ModelAndView("stu_task");
		String aDate = req.getParameter("assignDatee");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date aDt = sdf.parse(aDate);
		ArrayList<Tblhomework> hwList = new ArrayList<Tblhomework>();
		ArrayList<Mstteacherproject> hwListe = new ArrayList<Mstteacherproject>();
 
			hwListe = (ArrayList<Mstteacherproject>) Studentservice.getProject(aDt);
			
			Iterator<Mstteacherproject> itr2 = hwListe.iterator();
			while (itr2.hasNext()) {
				Mstteacherproject qq = (Mstteacherproject) itr2.next();
				int teachId = qq.getIntTeacherId();
				System.out.println(teachId);
				String teachName = Studentservice.getTeacherName(teachId);
				teachNamesListProj.add(teachName);
			}
			
			
			String sdfw = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			SimpleDateFormat sdfwww = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date curDt = sdfwww.parse(sdfw);			

			Calendar now = Calendar.getInstance();
			now.add(Calendar.WEEK_OF_YEAR, -1);
			System.out.println("date before 1 week : " + (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1)
					+ "-" + now.get(Calendar.DATE));
			String oneWeekBeforeStr = (now.get(Calendar.YEAR)) + "-" + (now.get(Calendar.MONTH) + 1) + "-"
					+ now.get(Calendar.DATE);
			java.util.Date oneWeekBefore = sdf.parse(oneWeekBeforeStr);

			int id = 1;

			hwList = (ArrayList<Tblhomework>) Studentservice.getHWFromTo(new java.sql.Date(oneWeekBefore.getTime()), new java.sql.Date(curDt.getTime()), id);

			Iterator<Tblhomework> itr = hwList.iterator();
			while (itr.hasNext()) {
				Tblhomework qq = (Tblhomework) itr.next();
				int teachId = qq.getIntTeacherId();
				System.out.println(teachId);
				String teachName = Studentservice.getTeacherName(teachId);
				teachNamesListHW.add(teachName);
			}
			
		mav.addObject("hwList", hwList);
		mav.addObject("hwListe", hwListe);
		mav.addObject("teachNamesListHW", teachNamesListHW);
		mav.addObject("teachNamesListProj", teachNamesListProj);
		return mav;
		
	}
	
/*@RequestMapping(value="stu_project.web", method = RequestMethod.POST)
public ModelAndView studentproject(HttpServletRequest req) throws ParseException
{

ModelAndView mav = new ModelAndView("stu_task");
String aDate=req.getParameter("assignDatee");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date curDt = sdf.parse(aDate);
ArrayList<Mstteacherproject> hwListe = (ArrayList<Mstteacherproject>) Studentservice.getProject(curDt);
mav.addObject("hwListe", hwListe);
mav.addObject("performance", "performance");
return mav;


}
*/	
//student attendance
	@SuppressWarnings("null")
	@RequestMapping(value = "stu_attedance.web")
	public ModelAndView attendancePost(HttpServletRequest req, @RequestParam Map<String, String> params)
			throws ParseException {
		ModelAndView mav = new ModelAndView("stu_attedance");

		String studIdStr = req.getParameter("stuId");
		
		// start initialization
		int studId = 4;
		/*String stuName = null;*/
		ArrayList<Trnattendancerecord> attndList = null;
		
		String sdfw = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date curDt = sdf.parse(sdfw);
		
		//end initialization
		
		ArrayList<String> output = new ArrayList<String>();

			attndList = (ArrayList<Trnattendancerecord>) Studentservice.getStudAttendance(studId, curDt);
			
		mav.addObject("attndList", attndList);
		Iterator<Trnattendancerecord> i2 = attndList.iterator();
		while (i2.hasNext()) {
			Trnattendancerecord attdObj = (Trnattendancerecord) i2.next();

			String inOutTime = attdObj.getDtSlotTime();

			ArrayList<String> inOutTotalList = (ArrayList<String>) getTotalTime(inOutTime);
			String inTime = inOutTotalList.get(0);
			String outTime = inOutTotalList.get(1);
			String totalTime = inOutTotalList.get(2);

			output.add(inTime);
			output.add(outTime);
			output.add(totalTime);
		} // while
		
		/*mav.addObject("output", output);
		mav.addObject("studId", studId);
		mav.addObject("stuName", stuName);*/
		mav.addObject("out", output);
		mav.addObject("attendance", "attendance");

		return mav;
	}

	@RequestMapping(value = "stu_attedance_dates.web", method = RequestMethod.GET)
	public ModelAndView attendanceByDates() {
		ModelAndView mav = new ModelAndView("stu_attedance");
		
		return mav;
	}

	@RequestMapping(value = "stu_attedance_dates.web", method = RequestMethod.POST)
	public ModelAndView attendanceByDatesPost(@RequestParam Map<String, String> params) throws ParseException {
		ModelAndView mav = new ModelAndView("stu_attedance");

		

		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		String d1 = params.get("from");
		String d2 = params.get("to");
		System.out.println("first");
		java.util.Date startDate = dateFormat1.parse(d1);
		System.out.println("second");
		java.util.Date endDate = dateFormat1.parse(d2);

		int studId = 4;
		String stuName = Studentservice.getStuNames(studId);

		ArrayList<Trnattendancerecord> trnBetweenAttendance = (ArrayList<Trnattendancerecord>) Studentservice
				.getStudentAttendFromToDate(startDate, endDate, studId);
		mav.addObject("trnBetweenAttendance", trnBetweenAttendance);
		Iterator<Trnattendancerecord> i = trnBetweenAttendance.iterator();
		ArrayList<String> output = new ArrayList<String>();
		while (i.hasNext()) {
			Trnattendancerecord trnattndObj = (Trnattendancerecord) i.next();
			String inOutTime = trnattndObj.getDtSlotTime();
			ArrayList<String> inOutTotalList = (ArrayList<String>) getTotalTime(inOutTime);
			String inTime = inOutTotalList.get(0);
			String outTime = inOutTotalList.get(1);
			String totalTime = inOutTotalList.get(2);

			/*
			 * mav.addObject("inTime", inTime); mav.addObject("outTime",
			 * outTime); mav.addObject("totalTime", totalTime);
			 */
			output.add(inTime);
			output.add(outTime);
			output.add(totalTime);

		}
		
		mav.addObject("out", output);
		mav.addObject("studId", studId);
		mav.addObject("stuName", stuName);

		mav.addObject("attendance", "attendance");

		return mav;
	}

	public List<String> getTotalTime(String inOutTime) {

		String inTime = inOutTime.substring(0, 5);
		String outTime = inOutTime.substring(6, 11);

		String inFHalf = inTime.substring(0, 2);
		String inSHalf = inTime.substring(3, 5);
		// String inStr=inFHalf.concat(inSHalf);
		int inFHfInt = Integer.parseInt(inFHalf);
		int inSHfInt = Integer.parseInt(inSHalf);
		String outFHalf = outTime.substring(0, 2);
		String outSHalf = outTime.substring(3, 5);
		// String outStr=outFHalf.concat(outSHalf);
		int outFHfInt = Integer.parseInt(outFHalf);
		int outSHfInt = Integer.parseInt(outSHalf);
		int totalFst = outFHfInt - inFHfInt; // ----------------first
												// half main o/p 
		int totalScnd = 0;
		if (outSHfInt == 00) {
			outSHfInt = 60;
			totalScnd = outSHfInt - inSHfInt;
			totalFst--;
		} else {

			if (outSHfInt < inSHfInt) {
				int totalScndaa = Math.abs(outSHfInt - inSHfInt);
				totalScnd = 60 - totalScndaa;
				totalFst--;
			} else {
				totalScnd = Math.abs(outSHfInt - inSHfInt);
			}
		}

		if (totalScnd == 60) {
			totalScnd = 00;
			totalFst++;
		}
		String totalTime = null;
		int lengthOut = String.valueOf(totalScnd).length();
		int lengthIn = String.valueOf(totalFst).length();
		if (lengthOut == 1 && lengthIn == 1) {
			totalTime = String.valueOf("0" + totalFst + ":" + "0" + totalScnd);
		} else if (lengthOut == 2 && lengthIn == 2) {
			totalTime = String.valueOf(totalFst + ":" + totalScnd);
		} else if (lengthIn == 1) {
			totalTime = String.valueOf("0" + totalFst + ":" + totalScnd);
		} else if (lengthOut == 1) {
			totalTime = String.valueOf(totalFst + ":" + "0" + totalScnd);
		} else {

		}

		ArrayList<String> list = new ArrayList<>();
		list.add(inTime);
		list.add(outTime);
		list.add(totalTime);
		return list;
	}

	//student timetable
	@RequestMapping("stu_timetable.web")
	public ModelAndView partimetable(@ModelAttribute("parent") Mststudenttimetable parent) {
				
		ModelAndView mav = new ModelAndView("stu_timetable");
		List<Object[]> mst = (List<Object[]>) Studentservice.getStuTimeTablebyClass();
		mav.addObject("mst",mst);
		return mav;
			} 


	//student notification
	
	@RequestMapping("stu_notification.web")
	public ModelAndView studentnotification(@ModelAttribute("student") Tblinvites student)
	{
		
		ModelAndView mav = new ModelAndView("stu_notification");
		List<Tblinvites> mst = (List<Tblinvites>)Studentservice.getStudentNotificationByName();
		
		List<Mstteacherinvite> mste = (List<Mstteacherinvite>)Studentservice.getTeacherNotificationByName();
		mav.addObject("mste",mste);
		mav.addObject("mst", mst);
		return mav;
	}
	
	@RequestMapping(value = "downloadss/{id}")
	public void Downloade(HttpServletResponse res, @PathVariable Integer id) throws IOException {
		Tblinvites file = Studentservice.getAdminNotification(id);
		res.setContentLength(file.getBlUploadFile().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlUploadFile(), out);
		
		out.flush();
		out.close();
		return;
	}

	
	//student marks
	
	@RequestMapping("perf_marks.web")
	public ModelAndView studentmarks(@ModelAttribute("student") Mstuploadstudmarksheet student)
	{
		
		ModelAndView mav = new ModelAndView("perf_marks");
		ArrayList<Mstuploadstudmarksheet> mst = (ArrayList<Mstuploadstudmarksheet>) Studentservice.getStudentMarksByName();
		mav.addObject("mst",mst);
		return mav;
	}
	
	@RequestMapping(value = "download/{id}")
	public void Download(HttpServletResponse res, @PathVariable Integer id) throws IOException {
		
		Mstuploadstudmarksheet file = Studentservice.getMarkSheet(id);
		res.setContentLength(file.getBlMarkSheet().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlMarkSheet(), out);
		res.sendRedirect("perf_marks.jsp");
		out.flush();
		out.close();
		return;

	}
	

}
