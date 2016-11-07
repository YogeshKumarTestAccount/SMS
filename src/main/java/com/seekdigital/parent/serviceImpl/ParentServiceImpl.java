package com.seekdigital.parent.serviceImpl;

import java.util.Date;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seekdigital.entity.Mstleave;
import com.seekdigital.entity.Mstregistration;
import com.seekdigital.entity.Mststudenttimetable;
import com.seekdigital.entity.Mstteacherproject;
import com.seekdigital.entity.Mstuploadstudmarksheet;
import com.seekdigital.entity.Tblhomework;
import com.seekdigital.entity.Tblinvites;
import com.seekdigital.entity.Trnattendancerecord;
import com.seekdigital.entity.Trnstudentleaveapp;
import com.seekdigital.parent.dao.ParentDAO;
import com.seekdigital.entity.Mstteacherinvite;
import com.seekdigital.parent.service.ParentService;
@Service("parentService")
public class ParentServiceImpl implements ParentService{


	@Autowired
	private ParentDAO parentdao;
	
	@Override
	@Transactional
	public List<Mstregistration> getStudentInformationByName(  ) {
		// TODO Auto-generated method stub
		return parentdao.getStudentInformationByName();
	}

	@Override
	@Transactional
	public List<Trnattendancerecord> getStudentAttendanceBetweenTwoDates(Date d1, Date d2) {
		return parentdao.getStudentAttendanceBetweenTwoDates(d1, d2);
	}

	@Override
	@Transactional
	public List<Trnattendancerecord> getStudentAttendanceByName() {
		// TODO Auto-generated method stub
		return parentdao.getStudentAttendanceByName();
	}

	/*@Transactional
	public List<Mstregistration> getStudentMarksByName() {
		// TODO Auto-generated method stub
		return parentdao.getStudentMarksByName();
	}*/
	
	@Override
	@Transactional
	public List<Mstuploadstudmarksheet> getStudentMarksByName() {
	return parentdao.getStudentMarksByName();
	}


	@Override
	@Transactional
	public void leaveApp(Trnstudentleaveapp trnLeave) {
		// TODO Auto-generated method stub
		 parentdao.leaveApp(trnLeave);
	}

	@Override
	@Transactional
	public List<Mstleave> getLeave() {
		// TODO Auto-generated method stub
		return parentdao.getLeave();
	}


	@Override
	@Transactional
	public List<Mstregistration> getStudentDetailByName(String studentName) {
		// TODO Auto-generated method stub
		return parentdao.getStudentDetailByName(studentName);
	}


	@Override
	@Transactional
	public List<Mststudenttimetable> getStudentTimeTable(String studentName) {
		// TODO Auto-generated method stub
		return parentdao.getStudentTimeTable(studentName);
	}

	@Override
	@Transactional
	public List<Tblhomework> getStudentHomeWorkByName(String studentName, Date date) {
		// TODO Auto-generated method stub
		return parentdao.getStudentHomeWorkByName(studentName,date);
	}

	@Override
	@Transactional
	public List<Tblhomework> getStudentHomeWorkByName(String studentName) {
		// TODO Auto-generated method stub
		return parentdao.getStudentHomeWorkByName(studentName);
	}

	@Override
	@Transactional
	public List<Mstteacherproject> getStudentProjectByName(String studentName) {
		// TODO Auto-generated method stub
		return parentdao.getStudentProjectByName(studentName);
	}

	@Override
	@Transactional
	public List<Trnattendancerecord> getStudentAttendanceByName(String studentName) {
		// TODO Auto-generated method stub
		return parentdao.getStudentAttendanceByName(studentName);
	}

	@Override
	@Transactional

	public List<Tblinvites> getNotificationByStudentName(String studentName) {
		// TODO Auto-generated method stub
		return parentdao.getNotificationByStudentName(studentName);
	}

	@Override
	@Transactional
	public void update(Mstregistration m,int id) {
		// TODO Auto-generated method stub
		parentdao.update(m,id);
	}

	@Override
	public List<Object[]> getStuTimeTablebyClass() {
		// TODO Auto-generated method stub
		return parentdao.getStuTimeTablebyClass();
	}

	@Override
	@Transactional
	public
	List<Trnstudentleaveapp> getStudentLeaveInbox(int id) {
		return parentdao.getStudentLeaveInbox(id);
	}

	@Override
	@Transactional
	public Mstuploadstudmarksheet getMarkSheet(int id) {
		return parentdao.getMarkSheet(id);
	}

	@Override
	@Transactional
	public Tblinvites getNotificationById(int id) {
		return parentdao.getNotificationById(id);
	}

	@Override
	@Transactional
	public List<Mstteacherinvite> getNotificationToStudentNameByTeacher(String studentName) {
		return parentdao.getNotificationToStudentNameByTeacher(studentName);
	}

	
		
}
