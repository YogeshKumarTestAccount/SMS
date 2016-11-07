package com.seekdigital.student.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.seekdigital.entity.Mstquestionandanswer;
import com.seekdigital.entity.Mstregistration;
import com.seekdigital.entity.Mststudenttimetable;
import com.seekdigital.entity.Mstsubject;
import com.seekdigital.entity.Mstteacherproject;
import com.seekdigital.entity.Mstuploadstudmarksheet;
import com.seekdigital.entity.Tblhomework;
import com.seekdigital.entity.Tblinvites;
import com.seekdigital.entity.Trnattendancerecord;
import com.seekdigital.entity.Mstteacherinvite;

public interface StudentService {
	
	//Student Profile
	public List<Mstregistration> getParentInformationByName();
	
	//student question and answer
	
public List<Mstsubject> getStudentQuestionByName();
	
	public void addQuestion(Mstquestionandanswer mq);
	
	public List<Mstquestionandanswer> getList();
	
public  List<String> getTeacherName();
    
    public  List<Mstquestionandanswer> getTeacherNameAll(int classjj);


	public String getTeachName(int teachId);
	public Mstregistration getClass(int stuId);
	//student timetable
	
	public List<Object[]> getStuTimeTablebyClass();
	
	/*public List<Object[]> getStuTimeTablebyClass();*/
	
	//student notification
	
	public List<Tblinvites> getStudentNotificationByName();
	public Tblinvites getAdminNotification(Integer id);
	
	 //student marks
	
	public List<Mstuploadstudmarksheet> getStudentMarksByName();
	
	public Mstuploadstudmarksheet getMarkSheet(int id);
	
	 //student task/assignment

	public List<Tblhomework> getHW(java.util.Date curDt);

	public List<Mstteacherproject> getProject(java.util.Date curDt);

	public List<Tblhomework> getHWFromTo(Date oneWeekBefore, Date curDt, int id);

	public List<Mstteacherproject> getProFromTo(Date oneWeekBefore, Date curDt, int id);

	public String getTeacherName(int teachId);

	
	//student attendance
	public List<Trnattendancerecord> getStudAttendance(int studId, java.util.Date curDt);

	public String getStuNames(int studId);
	
	public List<Integer> getStudentListe(int studId);

	public List<Trnattendancerecord> getStudentAttendFromToDate(java.util.Date startDate, java.util.Date endDate ,int id);

	public List<Mstteacherinvite> getTeacherNotificationByName();


	

	}


