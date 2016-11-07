package com.seekdigital.parent.dao;

import java.util.Date;
import java.util.List;

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

public interface ParentDAO {
	
	public List<Mstregistration> getStudentInformationByName();
	public List<Mstregistration> getStudentDetailByName(String studentName);
	public void update(Mstregistration m,int id);
	public List<Mstleave> getLeave();
	public List<Trnattendancerecord> getStudentAttendanceByName();
	//List<Mstregistration> getStudentMarksByName();
	//a
	public List<Mstuploadstudmarksheet> getStudentMarksByName();
	public void leaveApp(Trnstudentleaveapp trnLeave);
	public List<Trnattendancerecord> getStudentAttendanceBetweenTwoDates(Date d1, Date d2);
	List<Trnattendancerecord> getStudentAttendanceByName(String studentName);
	List<Mststudenttimetable> getStudentTimeTable(String studentName);
	List<Tblhomework> getStudentHomeWorkByName(String studentName);
	List<Tblhomework> getStudentHomeWorkByName(String studentName,Date date);
	List<Mstteacherproject> getStudentProjectByName(String studentName);
	List<Tblinvites> getNotificationByStudentName(String studentName);
	//a
	List<Object[]> getStuTimeTablebyClass();
	List<Trnstudentleaveapp> getStudentLeaveInbox(int id);
	public Mstuploadstudmarksheet getMarkSheet(int id);
	 public Tblinvites getNotificationById(int id) ;
	 public List<Mstteacherinvite> getNotificationToStudentNameByTeacher(String studentName);
	
	
}
