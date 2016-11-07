   package com.seekdigital.teacher.serviceImpl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import com.seekdigital.teacher.dao.TeacherDao;
import com.seekdigital.teacher.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	public TeacherDao teacherDao;

	// this method is for fetching the profile details of a teacher
	@Transactional
	public List<Mstregistration> Profile(int registrationId) {

		return teacherDao.Profile(registrationId);
	}

	// this method is to update the teacher profile
	@Transactional
	public void update(Mstregistration mstregistration) {
		teacherDao.update(mstregistration);
	}

	// this method is to fetch all the classes
	@Transactional
	public List<Mststudclass> getAllClasses() {

		return teacherDao.getAllClasses();
	}

	// this method is to fetch the section
	@Transactional
	public List<Mststudclasssection> getAllSections() {
		return teacherDao.getAllSections();
	}

	// this method is used to post the homework
	@Transactional
	public void homeworkPost(Tblhomework tblhomework) {
		teacherDao.homeworkPost(tblhomework);

	}

	// this method is used to display the history of posted homework's
	@Transactional
	public List<Tblhomework> getHomeworkHistory(int registrationId, Date fromDate, Date toDate) {
		return teacherDao.getHomeworkHistory(registrationId, fromDate, toDate);
	}

	// this method is used to post the project
	@Transactional
	public void projectPost(Mstteacherproject mstteacherproject) {
		teacherDao.projectPost(mstteacherproject);
	}

	// this method is used to display the history of posted project's
	@Transactional
	public List<Mstteacherproject> getProjectHistory(int registrationId, Date fromDate, Date toDate) {
		return teacherDao.getProjectHistory(registrationId, fromDate, toDate);
	}

	// this method is to fetch the leave type for teacher
	@Transactional
	public List<Mstleave> getAllLeaveTypes() {
		return teacherDao.getAllLeaveTypes();
	}

	// this method is used to apply for leave
	@Transactional
	public void applyLeave(Trnteacherleaveapp trnteacherleaveapp) {
		teacherDao.applyLeave(trnteacherleaveapp);

	}

	// this method is used to fetch the types of exam terms
	@Transactional
	public List<Mstterms> getExamTerms() {
		return teacherDao.getExamTerms();
	}

	@Transactional
	// this method is used to fetch the timetable of the teacher
	public List<Mstteachertimetable> getTimetable(int registrationId) {

		return teacherDao.getTimetable(registrationId);
	}

	@Transactional
	// this method records the class check in time of the teacher
	public void recordCheckInTime(Mstteachercheckin mstteachercheckin) {
		teacherDao.recordCheckInTime(mstteachercheckin);
	}

	@Transactional
	// this method is used to display class check-in time history
	public List<Mstteachercheckin> getClassCheckInTimeHistory(int registrationId, Date fromDate, Date toDate) {
		return teacherDao.getClassCheckInTimeHistory(registrationId, fromDate, toDate);
	}

	@Transactional
	//this method is used to get the nofitication sent by admin to teacher
	public List<Tblinvites> getTeacherNotification(int roleId) {
		
		return teacherDao.getTeacherNotification(roleId);
	}

	@Transactional
	//this method is used to post the invite to the entire class
	public void postTeacherInvite(Mstteacherinvite mstteacherinvite) {
		teacherDao.postTeacherInvite(mstteacherinvite);
		
	}

	@Transactional
	//this method is to upload marksheet of students
	public void uploadStudentMarksheet(Mstuploadstudmarksheet mstuploadstudmarksheet) {
		teacherDao.uploadStudentMarksheet(mstuploadstudmarksheet);
	}

	@Transactional
	//this method is used to fetch teacher leave inbox
	public List<Trnteacherleaveapp> getTeacherLeaveInbox(int registrationId) {
		return teacherDao.getTeacherLeaveInbox(registrationId);
	}

	@Transactional
	//this method is used to fetch student leave request sent by parents
	public List<Trnstudentleaveapp> getStudentLeaveRequest() {
		return teacherDao.getStudentLeaveRequest();
	}

	@Transactional
	//this method is used to reject/approve leave
	public void approveOrRejectStudentLeave(int id, int status, Date appOrRejDate) {
		teacherDao.approveOrRejectStudentLeave(id, status, appOrRejDate);
		
	}

	@Transactional
	//this method is used to get all the searched leave request by date
	public List<Trnstudentleaveapp> getAllSearchedLeaveReq(Date fromDate, Date toDate) {
		return teacherDao.getAllSearchedLeaveReq(fromDate, toDate);
	}

	@Transactional
	public List<Trnstudentleaveapp> getSearchedLeaveReq(int status, Date fromDate, Date toDate) {
		
		return teacherDao.getSearchedLeaveReq(status, fromDate, toDate);
	}

	@Transactional
	//this method is used to fetch the questions posted by students
	public List<Mstquestionandanswer> getStudentQuestions() {
		return teacherDao.getStudentQuestions();
	}

	@Transactional
	//this method is used to answer the question 
	public void postAnswer(int questionId, String answer, int teacherId) {
		teacherDao.postAnswer(questionId, answer, teacherId);
	}

	@Transactional
	//this method is used to fetch marksheet of students by exam type
	public List<Mstuploadstudmarksheet> getStudentMarksheet(int examId) {
		// TODO Auto-generated method stub
		return teacherDao.getStudentMarksheet(examId);
	}
	
	@Transactional
	//this method is used to fetch all the students
		public List<Mstregistration> getStudents()
		{
		return teacherDao.getStudents();
		}
	@Transactional 
	//this method is used to fetch the marksheet to download or view
		public Mstuploadstudmarksheet getMarksheet(int id)
		{
			return teacherDao.getMarksheet(id);
		}

	@Transactional 
	//this method is used to get the file related to notification
	public Tblinvites getNotificationFile(int id) {
		return teacherDao.getNotificationFile(id);
	} 
	

}
