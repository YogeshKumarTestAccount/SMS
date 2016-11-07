package com.seekdigital.admin.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seekdigital.admin.service.AdminService;
import com.seekdigital.common.RandomUtil;
import com.seekdigital.entity.FormEntity;
import com.seekdigital.entity.Mstaffiliation;
import com.seekdigital.entity.Mstbank;
import com.seekdigital.entity.Mstbloodgroup;
import com.seekdigital.entity.Mstcategory;
import com.seekdigital.entity.Mstcity;
import com.seekdigital.entity.Mstdisabilitychild;
import com.seekdigital.entity.Mstgender;
import com.seekdigital.entity.Mstleave;
import com.seekdigital.entity.Mstlogin;
import com.seekdigital.entity.Mstmaritalstatus;
import com.seekdigital.entity.Mstmedium;
import com.seekdigital.entity.Mstmothertongue;
import com.seekdigital.entity.Mstregistration;
import com.seekdigital.entity.Mstreligion;
import com.seekdigital.entity.Mstschool;
import com.seekdigital.entity.Mstschoolconnect;
import com.seekdigital.entity.Mstschooltype;
import com.seekdigital.entity.Mstsemester;
import com.seekdigital.entity.Mstsocialcategory;
import com.seekdigital.entity.Mststream;
import com.seekdigital.entity.Mststudclass;
import com.seekdigital.entity.Mststudclasssection;
import com.seekdigital.entity.Mststudenttimetable;
import com.seekdigital.entity.Mstsubcategory;
import com.seekdigital.entity.Mstsubject;
import com.seekdigital.entity.Mstteachertimetable;
import com.seekdigital.entity.Mstterms;
import com.seekdigital.entity.Mstuploadstudmarksheet;
import com.seekdigital.entity.Tblbankname;
import com.seekdigital.entity.Tbldaysofweek;
import com.seekdigital.entity.Tblinvites;
import com.seekdigital.entity.Tblrolename;
import com.seekdigital.entity.Tblschoolandbranchdetail;
import com.seekdigital.entity.Trnattendancerecord;
import com.seekdigital.entity.Trndocumenttype;
import com.seekdigital.entity.Trndocumentupload;
import com.seekdigital.entity.Trnteacherleaveapp;

@Controller
@SuppressWarnings({ "unused", "rawtypes" })
public class AdminController<T> {
	@Autowired
	public AdminService<T> adminService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));

	}

	@RequestMapping(value = "ad_index.web")
	public String adIndex(Model model) {
		return "ad_index";
	}

	// -------------start attendance
	@RequestMapping(value = "ad_attendance.web", method = RequestMethod.GET)
	public ModelAndView attendance() {
		ModelAndView mav = new ModelAndView("ad_attendance");
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		mav.addObject("classes", classes);
		mav.addObject("sections", sections);

		return mav;
	}

	@SuppressWarnings("null")
	@RequestMapping(value = "ad_attendance.web", method = RequestMethod.POST)
	public ModelAndView attendancePost(HttpServletRequest req, @RequestParam Map<String, String> params)
			throws ParseException {
		ModelAndView mav = new ModelAndView("ad_attendance");

		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		mav.addObject("classes", classes);
		mav.addObject("sections", sections);

		String classStr = req.getParameter("ClassId");
		int classId = Integer.parseInt(classStr);
		String sectionStr = req.getParameter("SectionId");
		int sectionId = Integer.parseInt(sectionStr);
		String studIdStr = req.getParameter("stuId");
		String d1 = params.get("from");
		String d2 = params.get("to");

		// start initialization
		int studId = 0;
		String stuName = null;
		ArrayList<Trnattendancerecord> attndList = new ArrayList<Trnattendancerecord>();

		String sdfw = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date curDt = sdf.parse(sdfw);

		ArrayList<String> output = new ArrayList<String>();
		ArrayList<Integer> stuIdList = new ArrayList<Integer>();
		ArrayList<Integer> stuIdListSecondary = new ArrayList<Integer>();
		ArrayList<String> stuNameList = new ArrayList<String>();
		ArrayList<Integer> stuIdListFromReg = new ArrayList<Integer>();
		// end initialization

		if (!studIdStr.equals("") && !d1.equals("") && !d2.equals("")) {

			SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date startDate = dateFormat1.parse(d1);
			java.util.Date endDate = dateFormat1.parse(d2);

			studId = Integer.parseInt(studIdStr);
			stuIdListSecondary = (ArrayList<Integer>) adminService.getStudentList(classId, sectionId, studId);

			if (stuIdListSecondary.size() != 0) {

				attndList = (ArrayList<Trnattendancerecord>) adminService.getStudentAttendFromTo(startDate, endDate,
						studId);
				Iterator<Trnattendancerecord> itr = attndList.iterator();
				while (itr.hasNext()) {
					Trnattendancerecord trnAObj = (Trnattendancerecord) itr.next();
					int nowStuId = trnAObj.getMstregistration().getIntRegistrationId();
					stuIdList.add(nowStuId);

					stuName = adminService.getStuName(nowStuId);
					stuNameList.add(stuName);
				}
			}

		} else if (!studIdStr.equals("") && d1.equals("") && d2.equals("")) {

			studId = Integer.parseInt(studIdStr);

			stuIdListSecondary = (ArrayList<Integer>) adminService.getStudentList(classId, sectionId, studId);

			if (stuIdListSecondary.size() != 0) {
				attndList = (ArrayList<Trnattendancerecord>) adminService.getStudAttend(studId, curDt);

				Iterator<Trnattendancerecord> itr = attndList.iterator();
				while (itr.hasNext()) {
					Trnattendancerecord trnAObj = (Trnattendancerecord) itr.next();
					int nowStuId = trnAObj.getMstregistration().getIntRegistrationId();
					stuIdList.add(nowStuId);

					stuName = adminService.getStuName(nowStuId);
					stuNameList.add(stuName);
				}
			}

		} else if (studIdStr.equals("") && !d1.equals("") && !d2.equals("")) {

			SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date startDate = dateFormat1.parse(d1);
			java.util.Date endDate = dateFormat1.parse(d2);

			stuIdListFromReg = (ArrayList<Integer>) adminService.getStudentIds(classId, sectionId);

			for (int i = 0; i < stuIdListFromReg.size(); i++) {

				ArrayList<Trnattendancerecord> attndList11 = (ArrayList<Trnattendancerecord>) adminService
						.getStudentAttendFromTo(startDate, endDate, stuIdListFromReg.get(i));

				Iterator<Trnattendancerecord> itr = attndList11.iterator();
				while (itr.hasNext()) {
					Trnattendancerecord trnAObj = (Trnattendancerecord) itr.next();
					int nowStuId = trnAObj.getMstregistration().getIntRegistrationId();
					stuIdList.add(nowStuId);

					stuName = adminService.getStuName(nowStuId);
					stuNameList.add(stuName);
				}
				if (attndList11 != null) {
					attndList.addAll(attndList11);
				}
			}

		} else if (studIdStr.equals("") && d1.equals("") && d2.equals("")) {

			stuIdListFromReg = (ArrayList<Integer>) adminService.getStudentIds(classId, sectionId);

			for (int i = 0; i < stuIdListFromReg.size(); i++) {

				ArrayList<Trnattendancerecord> attndList11 = (ArrayList<Trnattendancerecord>) adminService
						.getStudAttend(stuIdListFromReg.get(i), curDt);

				Iterator<Trnattendancerecord> itr = attndList11.iterator();
				while (itr.hasNext()) {
					Trnattendancerecord trnAObj = (Trnattendancerecord) itr.next();
					int nowStuId = trnAObj.getMstregistration().getIntRegistrationId();
					stuIdList.add(nowStuId);

					stuName = adminService.getStuName(nowStuId);
					stuNameList.add(stuName);
				}
				if (attndList11 != null) {
					attndList.addAll(attndList11);
				}
			}

		}

		if (attndList != null) {
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
		}
		mav.addObject("output", output);
		mav.addObject("stuIdList", stuIdList);
		mav.addObject("stuNameList", stuNameList);
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
	// -------------end attendance

	// =================-----> start leave request <-----===============
	@RequestMapping(value = "ad_leave_request.web")
	public ModelAndView adLeaveRequest() {
		ModelAndView mav = new ModelAndView("ad_leave_request");
		ArrayList<Integer> idList = new ArrayList<Integer>();
		ArrayList<String> nameList = new ArrayList<String>();
		ArrayList<Trnteacherleaveapp> TeachLeaveObjList = (ArrayList<Trnteacherleaveapp>) adminService
				.getLeaveReqFromTeacher();

		mav.addObject("teachList", TeachLeaveObjList);
		Iterator<Trnteacherleaveapp> it = TeachLeaveObjList.iterator();
		while (it.hasNext()) {
			Trnteacherleaveapp teaLeaveObj = (Trnteacherleaveapp) it.next();
			int regId = teaLeaveObj.getMstregistration().getIntRegistrationId();
			String stuName = adminService.getStuName(regId);
			idList.add(regId);
			nameList.add(stuName);
		}
		ArrayList<Mstleave> leaveTypeList = (ArrayList<Mstleave>) adminService.getLeaveTypes();
		mav.addObject("leaveTypeList", leaveTypeList);
		mav.addObject("idList", idList);
		mav.addObject("nameList", nameList);
		return mav;
	}

	@RequestMapping(value = "ad_leave_request.web", method = RequestMethod.POST)
	public ModelAndView adLeaveRequestPost(HttpServletRequest req, RedirectAttributes redAtt) throws ParseException {
		ModelAndView mav = new ModelAndView();

		String sdfw = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date curDt = sdf.parse(sdfw);

		String[] stringIds = req.getParameterValues("teachLeaveReqIds");
		int count = stringIds.length;

		String action = req.getParameter("action");
		if ("app".equals(action)) {
			for (String s : stringIds) {
				int nowId = Integer.parseInt(s);
				int approvedStatusId = 2;
				adminService.letApprove(nowId, curDt, approvedStatusId);
			}
			redAtt.addFlashAttribute("msg1", " Your are approved " + count);
			if (count == 1) {
				redAtt.addFlashAttribute("msg2", " teacher leave request successfully!!!!");
			} else {
				redAtt.addFlashAttribute("msg2", " teachers leave request successfully!!!!");
			}
		} else if ("rej".equals(action)) {
			for (String s : stringIds) {
				int nowId = Integer.parseInt(s);
				int approvedStatusId = 3;
				adminService.letReject(nowId, approvedStatusId);
			}
			redAtt.addFlashAttribute("msg1", " Your are rejected " + count);
			if (count == 1) {
				redAtt.addFlashAttribute("msg2", " teacher leave request successfully!!!!");
			} else {
				redAtt.addFlashAttribute("msg2", " teachers leave request successfully!!!!");
			}
		}

		ArrayList<Integer> idList = new ArrayList<Integer>();
		ArrayList<String> nameList = new ArrayList<String>();
		ArrayList<Trnteacherleaveapp> TeachLeaveObjList = (ArrayList<Trnteacherleaveapp>) adminService
				.getLeaveReqFromTeacher();
		mav.addObject("teachList", TeachLeaveObjList);
		Iterator<Trnteacherleaveapp> it = TeachLeaveObjList.iterator();
		while (it.hasNext()) {
			Trnteacherleaveapp teaLeaveObj = (Trnteacherleaveapp) it.next();
			int regId = teaLeaveObj.getMstregistration().getIntRegistrationId();
			String stuName = adminService.getStuName(regId);
			idList.add(regId);
			nameList.add(stuName);
		}
		ArrayList<Mstleave> leaveTypeList = (ArrayList<Mstleave>) adminService.getLeaveTypes();
		mav.addObject("leaveTypeList", leaveTypeList);
		mav.addObject("idList", idList);
		mav.addObject("nameList", nameList);
		return new ModelAndView("redirect:/ad_leave_request.web");
	}

	// =================-----> end leave request <-----===============

	@RequestMapping(value = "ad_activity log.web")
	public String activityLog(Model model) {
		return "ad_activity log";
	}

	@RequestMapping(value = "login.web")
	public String login(Model model) {
		return "login";
	}

	// -- new reg start
	@RequestMapping(value = "user_new reg.web")
	public ModelAndView userNewReg() {
		ModelAndView mav = new ModelAndView("user_new reg");
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		ArrayList<Mstsemester> sems = (ArrayList<Mstsemester>) adminService.semester();
		ArrayList<Mststream> streams = (ArrayList<Mststream>) adminService.stream();
		ArrayList<Mstmedium> mediums = (ArrayList<Mstmedium>) adminService.medium();
		ArrayList<Mstmothertongue> motherTongues = (ArrayList<Mstmothertongue>) adminService.mothertongue();
		ArrayList<Mstaffiliation> affiliations = (ArrayList<Mstaffiliation>) adminService.affiliation();
		ArrayList<Mstschooltype> schoolType = (ArrayList<Mstschooltype>) adminService.schooltype();

		mav.addObject("classes", classes);
		mav.addObject("sections", sections);
		mav.addObject("sems", sems);
		mav.addObject("streams", streams);
		mav.addObject("mediums", mediums);
		mav.addObject("motherTongues", motherTongues);
		mav.addObject("affiliations", affiliations);
		mav.addObject("schoolType", schoolType);

		ArrayList<Mstgender> gal = (ArrayList<Mstgender>) adminService.gender();
		ArrayList<Mstbloodgroup> bal = (ArrayList<Mstbloodgroup>) adminService.bloodgroup();
		ArrayList<Mstreligion> ral = (ArrayList<Mstreligion>) adminService.religion();
		ArrayList<Mstsocialcategory> sal = (ArrayList<Mstsocialcategory>) adminService.socialcategory();
		ArrayList<Mstdisabilitychild> dal = (ArrayList<Mstdisabilitychild>) adminService.disabilitychild();
		ArrayList<Mstcity> cities = (ArrayList<Mstcity>) adminService.city();
		mav.addObject("gal", gal);
		mav.addObject("bal", bal);
		mav.addObject("ral", ral);
		mav.addObject("sal", sal);
		mav.addObject("dal", dal);
		mav.addObject("cities", cities);

		ArrayList<Tblbankname> banks = (ArrayList<Tblbankname>) adminService.bankname();
		mav.addObject("banks", banks);

		return mav;
	}

	@RequestMapping(value = "user_new reg.web", method = RequestMethod.POST)
	public ModelAndView userNewRegSave(HttpServletRequest req, RedirectAttributes redAtt) throws ParseException {
		ModelAndView mav = new ModelAndView();

		Mstregistration reg = new Mstregistration();
		
		String tcNum = req.getParameter("txtTransferCertificateNo");

		String tcDate = req.getParameter("dtTransferCertificateDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date tcDt = sdf.parse(tcDate);

		String preSchool = req.getParameter("txtPreviousSchoolName");
		String preSchoolAdd = req.getParameter("txtPreviousSchoolAddress");

		String stuFirstName = req.getParameter("txtFirstName");
		String stuMiddleName = req.getParameter("txtMiddleName");
		String stuLastName = req.getParameter("txtLastName");

		String fatherName = req.getParameter("txtFatherName");

		String motherName = req.getParameter("txtMotherName");

		String fOccu = req.getParameter("txtFoccupation");
		String mOccu = req.getParameter("txtMoccupation");

		String fMobile = req.getParameter("txtFmobileNumber");
		String mMobile = req.getParameter("txtMmobileNumber");

		String fEduQua = req.getParameter("txtFeducationalQualification");
		String mEduQua = req.getParameter("txtMeducationalQualification");

		String fOtherNum = req.getParameter("txtFotherNumber");
		String mOtherNum = req.getParameter("txtMotherNumber");

		String fEmail = req.getParameter("txtFemailId");
		String mEmail = req.getParameter("txtMemailId");

		String fAadhar = req.getParameter("txtFaadharNumber");
		String mAadhar = req.getParameter("txtMaadharNumber");

		reg.setTxtTransferCertificateNo(tcNum);
		reg.setDtTransferCertificateDate(tcDt);
		reg.setTxtPreviousSchoolName(preSchool);
		reg.setTxtPreviousSchoolAddress(preSchoolAdd);
		reg.setTxtFirstName(stuFirstName);
		reg.setTxtMiddleName(stuMiddleName);
		reg.setTxtLastName(stuLastName);
		reg.setTxtFatherName(fatherName);
		reg.setTxtMotherName(motherName);
		reg.setTxtFoccupation(fOccu);
		reg.setTxtMoccupation(mOccu);
		reg.setTxtFmobileNumber(fMobile);
		reg.setTxtMmobileNumber(mMobile);
		reg.setTxtFeducationalQualification(fEduQua);
		reg.setTxtMeducationalQualification(mEduQua);
		reg.setTxtFotherNumber(fOtherNum);
		reg.setTxtMotherNumber(mOtherNum);
		reg.setTxtFemailId(fEmail);
		reg.setTxtMemailId(mEmail);
		reg.setTxtFaadharNumber(fAadhar);
		reg.setTxtMaadharNumber(mAadhar);

		int clas = Integer.parseInt(req.getParameter("mststudclass"));
		int section = Integer.parseInt(req.getParameter("mststudclasssection"));
		int sem = Integer.parseInt(req.getParameter("mstsemester"));
		int stream = Integer.parseInt(req.getParameter("mststream"));
		int medium = Integer.parseInt(req.getParameter("mstmedium"));
		int motherTongue = Integer.parseInt(req.getParameter("mstmothertongue"));
		int aff = Integer.parseInt(req.getParameter("mstaffiliation"));
		int schlType = Integer.parseInt(req.getParameter("mstschooltype"));

		Mststudclass claObj = new Mststudclass();
		Mststudclasssection secObj = new Mststudclasssection();
		Mstsemester semObj = new Mstsemester();
		Mststream strmObj = new Mststream();
		Mstmedium mediumObj = new Mstmedium();
		Mstmothertongue motherObj= new Mstmothertongue();
		Mstaffiliation affObj = new Mstaffiliation();
		Mstschooltype schltypeObj = new Mstschooltype();

		claObj.setIntClassId(clas);
		secObj.setIntSectionId(section);
		semObj.setIntSemesterId(sem);
		strmObj.setIntStreamId(stream);
		mediumObj.setIntMediumId(medium);
		motherObj.setIntmothertongueId(motherTongue);
		affObj.setIntAffiliationId(aff);
		schltypeObj.setIntSchoolTypeId(schlType);

		reg.setMststudclass(claObj);
		reg.setMststudclasssection(secObj);
		reg.setMstsemester(semObj);
		reg.setMststream(strmObj);
		reg.setMstmedium(mediumObj);
		reg.setMstmothertongue(motherObj);
		reg.setMstaffiliation(affObj);
		reg.setMstschooltype(schltypeObj);

		// ---------------------------------------

		Mstgender gen = new Mstgender();
		Mstbloodgroup bg = new Mstbloodgroup();
		Mstreligion rel = new Mstreligion();
		Mstsocialcategory soc = new Mstsocialcategory();
		Mstdisabilitychild dis = new Mstdisabilitychild();
		Mstcity city = new Mstcity();

		// ----- getting values
		String dob = req.getParameter("dob");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dt = sdf2.parse(dob); // date of birth
		String adate = req.getParameter("Adate");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dt1 = sdf1.parse(adate); // admission date
		int blood = Integer.parseInt(req.getParameter("bloodgroup"));
		int gender = Integer.parseInt(req.getParameter("gender"));
		int religion = Integer.parseInt(req.getParameter("religion"));
		int social = Integer.parseInt(req.getParameter("social"));
		int dchild = Integer.parseInt(req.getParameter("child"));
		int citi = Integer.parseInt(req.getParameter("city"));
		String nation = req.getParameter("nationality");
		Long income = (long) Integer.parseInt(req.getParameter("income"));
		int depend = Integer.parseInt(req.getParameter("depend"));
		String scasteno = req.getParameter("scasteno");
		String scaste = req.getParameter("scaste");
		String fcasteno = req.getParameter("fcasteno");
		String fcaste = req.getParameter("fcaste");
		String mcasteno = req.getParameter("mcasteno");
		String mcaste = req.getParameter("mcaste");
		String perAddress = req.getParameter("perAdd");
		String tempAddress = req.getParameter("tempAdd");
		String local = req.getParameter("local");
		String taluk = req.getParameter("taluk");
		String district = req.getParameter("district");
		String code = req.getParameter("code");
		String steno = req.getParameter("steno");
		String bplcardno = req.getParameter("bplCardNo");
		
		String acno = req.getParameter("acNum");
		String ifsc = req.getParameter("ifsc");

		// --setting values to db
		gen.setIntGenderId(gender);
		reg.setMstgender(gen); // gender
		bg.setIntBloodGroupId(blood);
		reg.setMstbloodgroup(bg); // blood group
		rel.setIntReligionId(religion);
		reg.setMstreligion(rel); // religion
		soc.setIntSocialCategoryId(social);
		reg.setMstsocialcategory(soc); // social
		dis.setIntDisabilityChildId(dchild);
		reg.setMstdisabilitychild(dis); // disability
		city.setIntCityId(citi);
		reg.setMstcity(city); // city
		reg.setTxtNationality(nation);
		reg.setNmParentsAnnualIncome(income);
		reg.setTxtStudentCasteCertificateNo(scasteno);
		reg.setTxtStudentCaste(scaste);
		reg.setTxtFathersCasteCertificateNo(fcasteno);
		reg.setTxtFathersCaste(fcaste);
		reg.setTxtMothersCasteCertificateNo(mcasteno);
		reg.setTxtMothersCaste(mcaste);
		reg.setTxtPerAddress(perAddress);
		reg.setTxtTempAddress(tempAddress);
		reg.setTxtLocality(local);
		reg.setTxtTaluk(taluk);
		reg.setTxtDistrict(district);
		reg.setTxtPincode(code);
		reg.setTxtStudentEnrollmentNumber(steno);
		reg.setDtAdmissionDate(dt1);
		reg.setDtDob(dt);
		reg.setIntNoOfDependency(depend);
		reg.setTxtBplcardNo(bplcardno);
		
		// -----------------------

		/*String rel = params.get("religion");
		if (rel.equals("")) {	
		}else{
			int relId = Integer.parseInt(rel);
			Mstreligion relObj = new Mstreligion();
			relObj.setIntReligionId(relId);
			regObj.setMstreligion(relObj);
		}*/
		
		String yOrNo=req.getParameter("blBelongToBpl");
		if (yOrNo.equals("")) {
		}else{
		Boolean btbpl = Boolean.parseBoolean(yOrNo);
		 reg.setBlBelongToBpl(btbpl);
		}
		
		// for role
		Tblrolename trn = new Tblrolename();
		trn.setIntRoleId(adminService.getRoleId("Students"));
		reg.setTblrolename(trn);
		adminService.addRegister(reg);
		
		Mstregistration rrNew = new Mstregistration();
		int regId = adminService.getReg(steno);
		rrNew.setIntRegistrationId(regId);
		
		// for bank
		Mstbank mstbank = new Mstbank();
		String bankName=req.getParameter("bank");
		if (bankName.equals("")) {
		}else{
		int bankid = Integer.parseInt(bankName);
		Tblbankname tblbn = new Tblbankname();
		tblbn.setIntBankNameId(bankid);
		mstbank.setTxtBankName(tblbn);
		}
		
		mstbank.setTxtBankAccountNo(acno);
		mstbank.setTxtIfsccode(ifsc);
		
		mstbank.setMstregistration(rrNew);
		adminService.addBankDetails(mstbank);

		//for login
		Mstlogin mstlogin = new Mstlogin();
		mstlogin.setMstregistration(rrNew);
		mstlogin.setTxtPassword(RandomUtil.generateRandomPassword());
		adminService.addLoginDetails(mstlogin);
		
		redAtt.addFlashAttribute("msg1", " '"+stuFirstName+"'");
		redAtt.addFlashAttribute("msg2", " was Registered Successfully!!!");
		
		return new ModelAndView("redirect:/user_new reg.web");

	}

	// --- new reg end
	// -------- Master record start
	

		@RequestMapping(value = "user_staff.web")
		public ModelAndView userStaff() {
			System.out.println("inside get");
			ModelAndView m = new ModelAndView("user_staff");
			ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
			ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
			ArrayList<Mstcategory> category = (ArrayList<Mstcategory>) adminService.getCategory();
			m.addObject("classes", classes);
			m.addObject("sections", sections);
			m.addObject("category", category);
			m.addObject("i", "i");
			return m;
		}

		@RequestMapping(value = "user_staff.web", method = RequestMethod.POST)
		public ModelAndView userStaffSearch(HttpServletRequest req) {
			System.out.println("inside post");
			ModelAndView m = new ModelAndView("user_staff");
			ArrayList<Mstcity> cities = (ArrayList<Mstcity>) adminService.city();
			ArrayList<Mstgender> gal = (ArrayList<Mstgender>) adminService.gender();
			ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
			ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
			ArrayList<Mstcategory> category = (ArrayList<Mstcategory>) adminService.getCategory();
			System.out.println("inside post after ");
			String CatId = req.getParameter("categoryId");

			String Id = req.getParameter("StudentId");
			System.out.println(Id + "hey here its printing empty");
			if (CatId.equals("1")) {
				int ClassId = Integer.parseInt(req.getParameter("ClassId"));
				int SectionId = Integer.parseInt(req.getParameter("SectionId"));
				ArrayList<Mstregistration> Mstal = (ArrayList<Mstregistration>) adminService.getAllStudentLists(ClassId,
						SectionId, Id);
				m.addObject("Mstal", Mstal);
				m.addObject("performance", "performance");

			} else if (CatId.equals("2") || CatId.equals("3")) {
				ArrayList<Mstregistration> Mstal = (ArrayList<Mstregistration>) adminService.getAllStaffLists(Id);
				m.addObject("Mstal", Mstal);
				m.addObject("performance1", "performance1");
			}
			m.addObject("classes", classes);
			m.addObject("sections", sections);
			m.addObject("gal", gal);
			m.addObject("cities", cities);
			m.addObject("category", category);

			return m;
		}

		@RequestMapping(value = "deleteUser/{id}.web", method = RequestMethod.GET)
		public String deleteUser(@PathVariable Integer id, RedirectAttributes re) {
			adminService.deleteUser(id);
			re.addFlashAttribute("Delmsg", "success!!! ");
			re.addFlashAttribute("Delmsg1", " the entry has been deleted");
			return "redirect:/user_staff.web";
		}

		@RequestMapping(value = "updateStudent/{id}/{i}.web")
		public String updateStudent(@ModelAttribute Mstregistration reg, @PathVariable Integer id, @PathVariable Integer i,
				RedirectAttributes re) {

			System.out.println(reg.getTxtFirstName());
			System.out.println(reg.getTxtLastName());
			System.out.println(id);
			System.out.println(i);
			adminService.updateStudent(reg, id);

			re.addFlashAttribute("updmsg", "success!!");
			re.addFlashAttribute("updmsg1", "  your data has been updated");
			return "redirect:/user_staff.web";
		}

		// ------- master record end
 
		// ---------user credentials start
		@RequestMapping(value = "user_credentials.web")
		public ModelAndView userCredentials() {
			System.out.println("inside first user");
			ModelAndView m = new ModelAndView("user_credentials");
			ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
			ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
			ArrayList<Mstcategory> category = (ArrayList<Mstcategory>) adminService.getCategory();
			m.addObject("classes", classes);
			m.addObject("sections", sections);
			m.addObject("category", category);
			return m;
		}

		@RequestMapping(value = "user_credentials.web", method = RequestMethod.POST)
		public ModelAndView userCredentialsSubmit(HttpServletRequest req) {

			System.out.println("inside user");
			ModelAndView m = new ModelAndView("user_credentials");
			String CatId = req.getParameter("categoryId");

			String Id = req.getParameter("StudentId");
			ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
			ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
			ArrayList<Mstcategory> category = (ArrayList<Mstcategory>) adminService.getCategory();
			ArrayList<Mstlogin> loginal = (ArrayList<Mstlogin>) adminService.getUser();

			if (CatId.equals("1")) {
				int ClassId = Integer.parseInt(req.getParameter("ClassId"));
				int SectionId = Integer.parseInt(req.getParameter("SectionId"));
				ArrayList<Mstregistration> Mstal = (ArrayList<Mstregistration>) adminService.getAllStudentLists(ClassId,
						SectionId, Id);

				m.addObject("loginal", loginal);
				m.addObject("Mstal", Mstal);
				m.addObject("performance", "performance");
			} else if (CatId.equals("2") || CatId.equals("3")) {
				ArrayList<Mstregistration> Mstal = (ArrayList<Mstregistration>) adminService.getAllStaffLists(Id);
				m.addObject("Mstal", Mstal);
				m.addObject("loginal", loginal);
				m.addObject("performance1", "performance1");
			}

			m.addObject("classes", classes);
			m.addObject("sections", sections);
			m.addObject("category", category);

			return m;
		}

		// -----------user credentials end

	@RequestMapping(value = "ad_library.web")
	public String adLibrary(Model model) {
		return "ad_library";
	}

	// ---------------------------doc upload start--------------------------

	@RequestMapping(value = "ad_document-upload.web", method = RequestMethod.GET)
	public ModelAndView adDocumentUpload() {
		ModelAndView mav = new ModelAndView("ad_document-upload");
		ArrayList<Trndocumenttype> docType = (ArrayList<Trndocumenttype>) adminService.getDocType();
		ArrayList<Mstsubcategory> subCat = (ArrayList<Mstsubcategory>) adminService.getSubCategories();
		ArrayList<Mstcategory> cat = (ArrayList<Mstcategory>) adminService.getCategories();

		mav.addObject("docType", docType);
		mav.addObject("subCat", subCat);
		mav.addObject("cat", cat);

		ArrayList<Trndocumentupload> docList = (ArrayList<Trndocumentupload>) adminService.getUploadDetails();
		mav.addObject("docList", docList);

		return mav;
	}

	@RequestMapping(value = "ad_document-upload.web", method = RequestMethod.POST)
	public ModelAndView adDocUploadData(HttpServletRequest req, @RequestParam CommonsMultipartFile[] blUploadFile) {
		Trndocumentupload docUp = new Trndocumentupload();
		ModelAndView mav = new ModelAndView("redirect:/ad_document-upload.web");
		ArrayList<Trndocumenttype> docType1 = (ArrayList<Trndocumenttype>) adminService.getDocType();
		ArrayList<Mstsubcategory> subCat1 = (ArrayList<Mstsubcategory>) adminService.getSubCategories();
		ArrayList<Mstcategory> cat1 = (ArrayList<Mstcategory>) adminService.getCategories();

		String desc = req.getParameter("txtDescription");

		docUp.setTxtDescription(desc);

		int type = Integer.parseInt(req.getParameter("trndocumenttype"));
		int sc = Integer.parseInt(req.getParameter("mstsubcategory"));
		int c = Integer.parseInt(req.getParameter("mstcategory"));

		Trndocumenttype docType = new Trndocumenttype();
		Mstsubcategory subCat = new Mstsubcategory();
		Mstcategory cat = new Mstcategory();
		docType.setIntDocumentTypeId(type);
		subCat.setIntSubCategoryId(sc);
		cat.setIntCategoryId1(c);

		docUp.setTrndocumenttype(docType);
		docUp.setMstsubcategory(subCat);
		docUp.setMstcategory(cat);

		if (blUploadFile != null && blUploadFile.length > 0) {
			for (CommonsMultipartFile aFile : blUploadFile) {
				docUp.setBlUploadFile(aFile.getBytes());
				docUp.setTxtfileName(aFile.getOriginalFilename());
				docUp.setTxtcontentType(aFile.getContentType());
				adminService.addDocUploadDetails(docUp);
			}
		}
		ArrayList<Trndocumentupload> docList = (ArrayList<Trndocumentupload>) adminService.getUploadDetails();
		mav.addObject("docList", docList);
		mav.addObject("docType", docType1);
		mav.addObject("subCat", subCat1);
		mav.addObject("cat", cat1);

		return mav;
	}

	@RequestMapping(value = "downloadUploadDoc/{id}.web")
	public void DownloadDoc(HttpServletResponse res, @PathVariable Integer id) throws IOException {
		Trndocumentupload file = adminService.uploadDocObj(id);
		res.setContentLength(file.getBlUploadFile().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlUploadFile(), out);
		out.flush();
		out.close();
		return;
	}

	// ---------------------------doc upload end--------------------------

	/* fee management start */
	@RequestMapping(value = "fin_fee management.web")
	public ModelAndView finFeeManagement() {
		ModelAndView m = new ModelAndView("fin_fee management");
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		m.addObject("classes", classes);
		m.addObject("sections", sections);
		return m;
	}

	@RequestMapping(value = "fin_fee management.web", method = RequestMethod.POST)
	public ModelAndView finFeeManagementSearch(HttpServletRequest req) {
		ModelAndView m = new ModelAndView("fin_fee management");
		int classId = Integer.parseInt(req.getParameter("ClassID"));
		int SectionId = Integer.parseInt(req.getParameter("SectionId"));
		int StudentId = Integer.parseInt(req.getParameter("StudentId"));

		return m;
	}

	/* fee management end */

	// --------invites start

	@RequestMapping(value = "ad_invites.web", method = RequestMethod.GET)
	public ModelAndView adInvites() {

		ModelAndView m = new ModelAndView("ad_invites");
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		ArrayList<Tblrolename> roles = (ArrayList<Tblrolename>) adminService.getRoles();

		m.addObject("classes", classes);
		m.addObject("sections", sections);
		m.addObject("roles", roles);

		ArrayList<Tblinvites> invDetails = (ArrayList<Tblinvites>) adminService.getInviteDetails();
		m.addObject("invDetails", invDetails);
		
		String stu="Students";
		int roleId=adminService.getRoleId(stu);
		m.addObject("roleId", roleId);

		return m;
	}

	@RequestMapping(value = "ad_invites.web", method = RequestMethod.POST)
	public ModelAndView adInvitesData(HttpServletRequest req, @RequestParam CommonsMultipartFile[] blUploadFile,
			RedirectAttributes redAtt) {
		ModelAndView m = new ModelAndView();
		Tblinvites inv = new Tblinvites();
		Tblrolename tr = new Tblrolename();
		Mststudclass mc = new Mststudclass();
		Mststudclasssection ms = new Mststudclasssection();

		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		ArrayList<Tblrolename> roles = (ArrayList<Tblrolename>) adminService.getRoles();
		ArrayList<Tblinvites> invDetails = (ArrayList<Tblinvites>) adminService.getInviteDetails();

		String title = req.getParameter("txtInvitationTitle");
		String body = req.getParameter("txtBody");
		System.out.println(title);
		System.out.println(body);
		inv.setTxtInvitationTitle(title);
		inv.setTxtBody(body);
		Date dt = new Date();
		inv.setDtDate(dt);

		int r = Integer.parseInt(req.getParameter("tblrolename"));
		tr.setIntRoleId(r);
		inv.setTblrolename(tr);
		String InvClass = req.getParameter("mststudclass");
		String InvSection = req.getParameter("mststudclasssection");
		
		int classIdAll=adminService.getClassId("All");
		int sectionIdAll=adminService.getSectionId("All");
		m.addObject("classIdAll", classIdAll);
		m.addObject("sectionIdAll", sectionIdAll);
		
		if (r == 1) {
			if (InvClass.equals("") && InvSection.equals("")) {
				if (blUploadFile != null && blUploadFile.length > 0) {
					Mststudclass classObj=new Mststudclass();
					classObj.setIntClassId(classIdAll);
					Mststudclasssection secObj=new Mststudclasssection();
					secObj.setIntSectionId(sectionIdAll);
					inv.setMststudclass(classObj);
					inv.setMststudclasssection(secObj);
					for (CommonsMultipartFile aFile : blUploadFile) {
						inv.setBlUploadFile(aFile.getBytes());
						inv.setTxtfileName(aFile.getOriginalFilename());
						inv.setTxtcontentType(aFile.getContentType());
						adminService.addInvitesUpload(inv);
					}
				}
			} else if (InvSection.equals("")) {
				mc.setIntClassId(Integer.parseInt(InvClass));
				inv.setMststudclass(mc);
				if (blUploadFile != null && blUploadFile.length > 0) {
					Mststudclasssection secObj=new Mststudclasssection();
					secObj.setIntSectionId(sectionIdAll);
					inv.setMststudclasssection(secObj);
					for (CommonsMultipartFile aFile : blUploadFile) {
						inv.setBlUploadFile(aFile.getBytes());
						inv.setTxtfileName(aFile.getOriginalFilename());
						inv.setTxtcontentType(aFile.getContentType());
						adminService.addInvitesUpload(inv);
					}
				}
			} else {
				mc.setIntClassId(Integer.parseInt(InvClass));
				inv.setMststudclass(mc);
				ms.setIntSectionId(Integer.parseInt(InvSection));
				inv.setMststudclasssection(ms);

				if (blUploadFile != null && blUploadFile.length > 0) {
					for (CommonsMultipartFile aFile : blUploadFile) {
						inv.setBlUploadFile(aFile.getBytes());
						inv.setTxtfileName(aFile.getOriginalFilename());
						inv.setTxtcontentType(aFile.getContentType());
						adminService.addInvitesUpload(inv);
					}
				}
			}
		}
		else{
			if (blUploadFile != null && blUploadFile.length > 0) {
				for (CommonsMultipartFile aFile : blUploadFile) {
					inv.setBlUploadFile(aFile.getBytes());
					inv.setTxtfileName(aFile.getOriginalFilename());
					inv.setTxtcontentType(aFile.getContentType());
					adminService.addInvitesUpload(inv);
				}
			}
		}
		String stu="Students";
		int roleId=adminService.getRoleId(stu);
		m.addObject("roleId", roleId);

		m.addObject("classes", classes);
		m.addObject("sections", sections);
		m.addObject("roles", roles);

		m.addObject("invDetails", invDetails);
		redAtt.addFlashAttribute("sucmsg", " Success!!!  Your invite has been sent");
		return new ModelAndView("redirect:/ad_invites.web");
	}

	@RequestMapping(value = "downloadInvite/{id}.web")
	public void DownloadInv(HttpServletResponse res, @PathVariable Integer id) throws IOException {
		Tblinvites file = adminService.invObj(id);
		res.setContentLength(file.getBlUploadFile().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlUploadFile(), out);
		out.flush();
		out.close();
		return;
	}
	// ------- invites end

	// -------------schools connect start

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "ad_school's connect.web")
	public ModelAndView adSchoolConnect() {
		ModelAndView m = new ModelAndView("ad_school's connect");
		ArrayList<Mstschool> mstschools = (ArrayList<Mstschool>) adminService.getUsers();
		m.addObject("mstschools", mstschools);
		return m;
	}

	@RequestMapping(value = "ad_school's connect.web", method = RequestMethod.POST)
	public ModelAndView adSchoolConnect(HttpServletRequest req, @RequestParam CommonsMultipartFile[] blAttachment,
			RedirectAttributes re) throws MessagingException {
		ModelAndView m = new ModelAndView("redirect:/ad_school's connect.web");
		Mstschoolconnect sc = new Mstschoolconnect();
		int id = Integer.parseInt(req.getParameter("mstschool"));
		Mstschool msc = new Mstschool();
		msc.setIntSchoolId(id);
		sc.setMstschool(msc);
		String title = req.getParameter("txtTitle");
		String body = req.getParameter("txtBody");
		String mailid = req.getParameter("txtMailId");

		sc.setTxtTitle(title);
		sc.setTxtMailId(mailid);
		sc.setTxtBody(body);

		if (blAttachment != null && blAttachment.length > 0) {
			for (CommonsMultipartFile aFile : blAttachment) {
				sc.setBlAttachment(aFile.getBytes());
				adminService.addDocUploadDetails(sc);
			}
		}

		// adminService.addDocUploadDetails(sc);

		System.out.println("mail sending process start");

		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(mailid);
		mimeMessageHelper.setSubject(title);
		mimeMessageHelper.setText(body);
		ByteArrayDataSource byteArrayDataSource = null;
		if (blAttachment != null && blAttachment.length > 0) {
			for (CommonsMultipartFile aFile : blAttachment) {

				byteArrayDataSource = new ByteArrayDataSource(aFile.getBytes(), aFile.getContentType());
				mimeMessageHelper.addAttachment(aFile.getOriginalFilename(), byteArrayDataSource);
			}
		}

		System.out.println("Start of mail");
		mailSender.send(mimeMessage);
		System.out.println("End of mail");

		System.out.println("mail sending process end");

		re.addFlashAttribute("sucmsg", "success!!!");
		re.addFlashAttribute("sucmsg1", "   mail sent");

		return m;

	}

	// -------------schools connect end

	// --------school and branch start
		@RequestMapping(value = "ad_school & branch.web")
		public ModelAndView adSchoolAndBranch() {

			ModelAndView m = new ModelAndView("ad_school & branch");
			ArrayList<Tblschoolandbranchdetail> sandbal = (ArrayList<Tblschoolandbranchdetail>) adminService
					.getAllDetails();
			m.addObject("sandbal", sandbal);

			return m;
		}

		@RequestMapping(value = "ad_school & branch.web", method = RequestMethod.POST)
		public ModelAndView listAll(@ModelAttribute("sandbdetails") Tblschoolandbranchdetail sandbdetails,
				RedirectAttributes re) {

			ModelAndView m = new ModelAndView();
			adminService.addSandBDetails(sandbdetails);
			re.addFlashAttribute("sucmsg", "success!!!");
			re.addFlashAttribute("sucmsg1", "    your data stored in database");
			return new ModelAndView("redirect:/ad_school & branch.web");
		}

		@RequestMapping(value = "delete/{id}.web", method = RequestMethod.GET)
		public String delete(@PathVariable Integer id, RedirectAttributes re) {
			System.out.println("inside delete");
			adminService.deleteSchool(id);
			// i = 1;
			re.addFlashAttribute("Delmsg", "success!! ");
			re.addFlashAttribute("Delmsg1", "entry has been deleted");
			return "redirect:/ad_school & branch.web";

		}

		@RequestMapping(value = "updateSchool/{id}.web")
		public String updateSchool(@ModelAttribute Tblschoolandbranchdetail schoolBranch, @PathVariable Integer id,
				RedirectAttributes re) {
			adminService.updateBranch(schoolBranch, id);
			re.addFlashAttribute("updmsg", "success!!!");
			re.addFlashAttribute("updmsg1", "    your changes has been updated");
			return "redirect:/ad_school & branch.web";
		}

		// -------school and branch end

		@RequestMapping(value = "ad_syllabus.web")
		public ModelAndView adSyllbus() {
			ModelAndView m = new ModelAndView("ad_syllabus");
			ArrayList<Mststudclass> mststudclasses = (ArrayList<Mststudclass>) adminService.getSyllabus();
			m.addObject("mststudclasses", mststudclasses);
			return m;
		}

		@RequestMapping(value = "ad_syllabus.web", method = RequestMethod.POST)
		public ModelAndView adsyllabus(HttpServletRequest req,RedirectAttributes ra) {
			ModelAndView m = new ModelAndView();
			
			int i = Integer.parseInt(req.getParameter("Mststudclass"));
			Mststudclass mst=new Mststudclass();
			mst.setIntClassId(i);
			String[] subject = req.getParameterValues("boxes[]");
			System.out.println("size: "+subject.length);
			for (String str : subject) {
			Mstsubject sub = new Mstsubject();
		       sub.setMststudclass(mst);
		   
		        sub.setTxtSubjectName(str);
			adminService.addsyllabus(sub);
			}
			
			ra.addFlashAttribute("sucmsg", "success!!!");
			ra.addFlashAttribute("sucmsg1", "   syllabus has been added");
			 
			return new ModelAndView("redirect:/ad_syllabus.web");

		}

	// time table start

	

	@RequestMapping(value = "ad_timetable.web")
	public ModelAndView adTimetable() {
		ModelAndView m = new ModelAndView("ad_timetable");
		ArrayList<Mstcategory> cat = (ArrayList<Mstcategory>) adminService.getCategories();
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		ArrayList<Mstsubject> subject = (ArrayList<Mstsubject>) adminService.getSubject();
		ArrayList<Tbldaysofweek> tbldaysofweeks = (ArrayList<Tbldaysofweek>) adminService.getdays();

		m.addObject("classes", classes);
		m.addObject("sections", sections);
		m.addObject("cat", cat);
		m.addObject("subject", subject);
		m.addObject("days", tbldaysofweeks);

		return m;
	}

	@RequestMapping(value = "ad_timetable.web", method = RequestMethod.POST)
	public ModelAndView adTimetable(HttpServletRequest req,RedirectAttributes ra)  {
		ModelAndView m = new ModelAndView("ad_timetable");
		Mststudenttimetable mst = new Mststudenttimetable();
		Mstteachertimetable mstt = new Mstteachertimetable();
		String id = req.getParameter("mstcategory");
		int c = Integer.parseInt(req.getParameter("mststudclass"));
		int s = Integer.parseInt(req.getParameter("mststudclasssection"));
		int j=Integer.parseInt(req.getParameter("mstsubject"));
		int k=Integer.parseInt(req.getParameter("tbldaysofweek"));
		/*String id1 = req.getParameter("mstsubject");
		String id2 = req.getParameter("tbldaysofweek");*/
		
		/*ArrayList<Mstcategory> cat = (ArrayList<Mstcategory>) adminService.getCategories();
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		ArrayList<Mstsubject> subject = (ArrayList<Mstsubject>) adminService.getSubject();
		ArrayList<Tbldaysofweek> week = (ArrayList<Tbldaysofweek>) adminService.getdays();
		m.addObject("classes", classes);
		m.addObject("sections", sections);
		m.addObject("subject", subject);
		m.addObject("week", week);
		m.addObject("cat", cat);*/
		
		Mststudclass mc = new Mststudclass();
		Mststudclasssection ms = new Mststudclasssection();
		Mstsubject mstsubject=new Mstsubject();
		Tbldaysofweek tbldaysofweek=new Tbldaysofweek();
		// Mstcategory cat=new Mstcategory();
        mstsubject.setIntSubjectId(j);
        tbldaysofweek.setIntDaysId(k);
		mc.setIntClassId(c);
		ms.setIntSectionId(s);
	
		
		
		String[] timming = req.getParameterValues("boxes[]");
		System.out.println("size: "+timming.length);
		
        if (id.equals("1")) {
        	mst.setMststudclass(mc);
    		mst.setMststudclasssection(ms);
    		mst.setMstsubject(mstsubject);
    		mst.setTbldaysofweek(tbldaysofweek);
    		for (String str : timming) {
    			
    			
    		    mst.setTxtClassTimings(str);
    			}
			
			adminService.addtimetableDetails(mst);

			
		} else if (id.equals("2")) {
			mstt.setMststudclass(mc);
			mstt.setMststudclasssection(ms);
			mstt.setMstsubject(mstsubject);
			mstt.setTbldaysofweek(tbldaysofweek);
			for (String str : timming) {
				
				
			    mstt.setTxtClassTimings(str);
				}
			adminService.addtimetableDetails(mstt);
		}



        
        ra.addFlashAttribute("sucmsg", "success!!!");
		ra.addFlashAttribute("sucmsg1", "    your data stored in database");
	   
		return new ModelAndView("redirect:/ad_timetable.web");
		
		}

	/*@RequestMapping(value = "delete/{id}.web")
	public String delete1(@PathVariable Integer id) {
		// ModelAndView m=new ModelAndView("ad_timetable");

		adminService.deleteTimetable(id);

		return "redirect:/ad_timetable.web";

	}
*/
	// --------- time table end

	// ---------teacher reg start----------------

	@RequestMapping(value = "ad_reg.web")
	public ModelAndView adReg() {
		ModelAndView mav = new ModelAndView("ad_reg");

		List<Mstgender> gender = adminService.gender();
		List<Mstcity> city = adminService.city();
		List<Mstreligion> religion = adminService.religion();
		ArrayList<Mstmaritalstatus> marital = (ArrayList<Mstmaritalstatus>) adminService.getMaritalStatus();
		ArrayList<Mstsubject> subject = (ArrayList<Mstsubject>) adminService.getSubject();

		mav.addObject("gender", gender);
		mav.addObject("city", city);
		mav.addObject("religion", religion);
		mav.addObject("marital", marital);
		mav.addObject("subject", subject);

		return mav;
	}

	@RequestMapping(value = "ad_reg.web", method = RequestMethod.POST)
	public ModelAndView adRegPost(@RequestParam Map<String, String> params, RedirectAttributes redAtt)
			throws ParseException {
		ModelAndView mav = new ModelAndView();
		Mstregistration regObj = new Mstregistration();

		List<Mstgender> gender = adminService.gender();
		List<Mstcity> city = adminService.city();
		List<Mstreligion> religion = adminService.religion();
		ArrayList<Mstmaritalstatus> marital = (ArrayList<Mstmaritalstatus>) adminService.getMaritalStatus();
		ArrayList<Mstsubject> subject = (ArrayList<Mstsubject>) adminService.getSubject();

		mav.addObject("gender", gender);
		mav.addObject("city", city);
		mav.addObject("religion", religion);
		mav.addObject("marital", marital);
		mav.addObject("subject", subject);
		
		
		//not required start
		
		
		String rel = params.get("religion");
		if (rel.equals("")) {	
		}else{
			int relId = Integer.parseInt(rel);
			Mstreligion relObj = new Mstreligion();
			relObj.setIntReligionId(relId);
			regObj.setMstreligion(relObj);
		}
		
		String marry = params.get("marital");
		if (marry.equals("")) {
		}else{
			int marryId = Integer.parseInt(marry);
			Mstmaritalstatus marryObj = new Mstmaritalstatus();
			marryObj.setIntMaritalStatusId(marryId);
			regObj.setMstmaritalstatus(marryObj);
		}
		
		String ct = params.get("city");
		if (ct.equals("")) {
		}else {
			int cityId = Integer.parseInt(ct);
			Mstcity cityObj = new Mstcity();
			cityObj.setIntCityId(cityId);
			regObj.setMstcity(cityObj);
		}
		
		
		String sub = params.get("subject");
		if (sub.equals("")) {
		}else {
			int subId = Integer.parseInt(sub);
			Mstsubject subObj = new Mstsubject();
			subObj.setIntSubjectId(subId);
			regObj.setMstsubject(subObj);
		}
		//not required end
		
		String fN = params.get("firstName");
		String mN = params.get("middleName");
		String lN = params.get("lastName");
		String fthrN = params.get("fatherName");
		String gen = params.get("gender");
		int genId = Integer.parseInt(gen);
		String mNum = params.get("mobNum");
		String email = params.get("email");
		String jDt = params.get("joinDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date joinDt = sdf.parse(jDt);
		String preShlNm = params.get("preSchoolName");
		String exp = params.get("experience");
		String desi = params.get("designation");
		String ctc = params.get("ctc");
		String perAdd = params.get("perAdd");
		String tempAdd = params.get("tempAdd");
		
		regObj.setTxtFirstName(fN);
		regObj.setTxtMiddleName(mN);
		regObj.setTxtLastName(lN);
		regObj.setTxtFatherName(fthrN);
		regObj.setTxtFmobileNumber(mNum);
		regObj.setTxtEmailId(email);
		regObj.setDtJoiningDate(joinDt);
		regObj.setTxtPreviousSchoolName(preShlNm);
		regObj.setTxtExperience(exp);
		regObj.setTxtDesignation(desi);
		regObj.setTxtPerAddress(perAdd);
		regObj.setTxtTempAddress(tempAdd);
		
		Mstgender genObj = new Mstgender();
		genObj.setIntGenderId(genId);
		
		Tblrolename trn = new Tblrolename();
		trn.setIntRoleId(3);

		regObj.setMstgender(genObj);
		regObj.setTblrolename(trn);

		adminService.saveTeachReg(regObj);

		int nowRegId = regObj.getIntRegistrationId();
		regObj.setIntRegistrationId(nowRegId);

		Mstbank bankObj = new Mstbank();
		bankObj.setMstregistration(regObj);
		bankObj.setTxtCtc(ctc);

		adminService.saveTeachBank(bankObj);
		redAtt.addFlashAttribute("msg1", " '" + fN + "'" + " was registered Successfully!!!!!!");

		return new ModelAndView("redirect:/ad_reg.web");
	}

	// ---------teacher reg end----------------

	// ---------Student performance start

	@RequestMapping(value = "ad_student perform.web")
	public ModelAndView adStudentPerform() {
		ModelAndView m = new ModelAndView("ad_student perform");
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		ArrayList<Mstterms> terms = (ArrayList<Mstterms>) adminService.getTerms();
		m.addObject("classes", classes);
		m.addObject("sections", sections);
		m.addObject("terms", terms);
		return m;
	}

	@RequestMapping(value = "ad_student perform.web", method = RequestMethod.POST)
	public ModelAndView adStudentPerformSearch(HttpServletRequest req) {
		ModelAndView m = new ModelAndView("ad_student perform");
		int ClassId = Integer.parseInt(req.getParameter("ClassId"));
		int SectionId = Integer.parseInt(req.getParameter("SectionId"));
		System.out.println("inside stu per");
		int TermId = Integer.parseInt(req.getParameter("TermId"));

		String StudentId = req.getParameter("StudentId");
		ArrayList<Mststudclass> classes = (ArrayList<Mststudclass>) adminService.getClasses();
		ArrayList<Mststudclasssection> sections = (ArrayList<Mststudclasssection>) adminService.getSections();
		ArrayList<Mstterms> terms = (ArrayList<Mstterms>) adminService.getTerms();
		m.addObject("classes", classes);
		m.addObject("sections", sections);
		m.addObject("terms", terms);
		ArrayList<Mstregistration> Mstal = (ArrayList<Mstregistration>) adminService.getAllStudentLists(ClassId,
				SectionId, StudentId);

		ArrayList<Mstuploadstudmarksheet> Mstms = (ArrayList<Mstuploadstudmarksheet>) adminService.getMarksList(ClassId,
				SectionId, TermId, StudentId);
		System.out.println(Mstms.size());
		/*
		 * Iterator<Mstuploadstudmarksheet> i=Mstms.iterator(); while
		 * (i.hasNext()) { Mstuploadstudmarksheet mstuploadstudmarksheet =
		 * (Mstuploadstudmarksheet) i.next();
		 * 
		 * }
		 */
		m.addObject("Mstms", Mstms);
		m.addObject("Mstal", Mstal);
		m.addObject("performance", "performance");
		return m;

	}

	@RequestMapping(value = "downloadPerformance/{id}")
	public void DownloadMarks(HttpServletResponse res, @PathVariable Integer id) throws IOException {
		/* ModelAndView m = new ModelAndView("ad_student perform"); */
		Mstuploadstudmarksheet file = adminService.getMarkSheet(id);
		res.setContentLength(file.getBlMarkSheet().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlMarkSheet(), out);
		/* res.sendRedirect("ad_student perform.jsp"); */
		out.flush();
		out.close();
		return;

	}

	@RequestMapping(value = "viewPerformance/{id}")
	public void ViewMarks(HttpServletResponse res, @PathVariable Integer id) throws IOException {
		/* ModelAndView m = new ModelAndView("ad_student perform"); */
		Mstuploadstudmarksheet file = adminService.getMarkSheet(id);
		res.setContentLength(file.getBlMarkSheet().length);
		res.setContentType(file.getTxtcontentType());
		OutputStream out = res.getOutputStream();
		res.setHeader("Content-Disposition", "inline; filename=\"" + file.getTxtfileName() + "\"");
		FileCopyUtils.copy(file.getBlMarkSheet(), out);
		/* res.sendRedirect("ad_student perform.jsp"); */
		out.flush();
		out.close();
		return;

	}

	// --------Student performance end

}