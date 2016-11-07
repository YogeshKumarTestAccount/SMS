package com.seekdigital.student.serviceImpl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seekdigital.entity.Mstquestionandanswer;
import com.seekdigital.entity.Mstregistration;
import com.seekdigital.entity.Mststudenttimetable;
import com.seekdigital.entity.Mstsubject;
import com.seekdigital.entity.Mstteacherproject;
import com.seekdigital.entity.Mstuploadstudmarksheet;
import com.seekdigital.entity.Tblhomework;
import com.seekdigital.entity.Tblinvites;
import com.seekdigital.entity.Trnattendancerecord;
import com.seekdigital.student.dao.StudentDao;
import com.seekdigital.entity.Mstteacherinvite;
import com.seekdigital.student.service.StudentService;

@Service("Studentservice")
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentdao;
	private Date Date;

	//Student Profile
	@Override
	@Transactional

	public List<Mstregistration> getParentInformationByName() {
		return studentdao.getParentInformationByName();
	}

	//student question and answer
	@Override
	@Transactional

	public List<Mstsubject> getStudentQuestionByName() {

		return studentdao.getStudentQuestionByName();
	}

	@Override
	@Transactional

	public void addQuestion(Mstquestionandanswer mq) {

		studentdao.addQuestion(mq);
	}

	@Override
	@Transactional

	public List<Mstquestionandanswer> getList() {

		return studentdao.getList();
	}
	
	//student timetable
	
	  @Override
	  @Transactional

	  public List<Object[]> getStuTimeTablebyClass()
	  {
		  return studentdao.getStuTimeTablebyClass();
	  }
	/*@Override
	public List<Object[]> getStuTimeTablebyClass() {
		// TODO Auto-generated method stub
		return studentdao.getStuTimeTablebyClass();
	}*/

	/*
	 * @Override public List<Trnattendancerecord>
	 * getStudentAttendanceBetweenTwoDates(Date d1, Date d2) {
	 * 
	 * 
	 * return studentdao.getStudentAttendanceBetweenTwoDates(d1, d2); }
	 */
	//student notification
	@Override
	@Transactional

	public List<Tblinvites> getStudentNotificationByName() {
		return studentdao.getStudentNotificationByName();
	}

	@Override
	@Transactional
	public Tblinvites getAdminNotification(Integer id)
	{
		return studentdao.getAdminNotification(id);
	}
	//student marks
	@Override
	@Transactional

	public List<Mstuploadstudmarksheet> getStudentMarksByName() {
		return studentdao.getStudentMarksByName();
	}
	
	@Override
	@Transactional
	public Mstuploadstudmarksheet getMarkSheet(int id) {
		// TODO Auto-generated method stub
		return studentdao.getMarkSheet(id);
	}

	
	//student attendance
	@Override
	@Transactional
	public List<Trnattendancerecord> getStudAttendance(int studId, java.util.Date curDt) {
		return studentdao.getStudAttendance(studId, curDt);
	}

	@Override
	@Transactional
	public String getStuNames(int studId) {
		return studentdao.getStuNames(studId);
	}

	@Override
	@Transactional
	public List<Integer> getStudentListe(int studId) {
		return studentdao.getStudentListe(studId);
	}

	@Override
	@Transactional

	public List<Trnattendancerecord> getStudentAttendFromToDate(java.util.Date startDate, java.util.Date endDate,
			int id) {
		return studentdao.getStudentAttendFromToDate(startDate, endDate, id);
	}

	@Override
	@Transactional
	public List<String> getTeacherName() {
		// TODO Auto-generated method stub
		return studentdao.getTeacherName();
	}

	@Override
	@Transactional
	public List<Mstquestionandanswer> getTeacherNameAll(int classjj) {
		// TODO Auto-generated method stub
		return studentdao.getTeacherNameAll(classjj);
	}

	@Override
	@Transactional
	public String getTeachName(int teachId) {
		// TODO Auto-generated method stub
		return studentdao.getTeachName(teachId);
	}

	@Override
	@Transactional
	public Mstregistration getClass(int stuId) {
		// TODO Auto-generated method stub
		return studentdao.getClass(stuId);
	}

	//homework
	@Override
	@Transactional
	public List<Tblhomework> getHW(java.util.Date curDt) {

		return studentdao.getHW(curDt);
	}

	@Override
	@Transactional
	public List<Mstteacherproject> getProject(java.util.Date curDt) {

		return studentdao.getProject(curDt);
	}

	@Override
	@Transactional
	public List<Tblhomework> getHWFromTo(Date oneWeekBefore, Date curDt, int id) {
		// TODO Auto-generated method stub
		return studentdao.getHWFromTo(oneWeekBefore,curDt,id);
	}

	@Override
	@Transactional
	public List<Mstteacherproject> getProFromTo(Date oneWeekBefore, Date curDt, int id) {
		// TODO Auto-generated method stub
		return studentdao.getProFromTo(oneWeekBefore,curDt,id);	}

	@Override
	@Transactional
	public String getTeacherName(int teachId) {
		// TODO Auto-generated method stub
		return studentdao.getTeacherName(teachId);	
		}

	@Override
	public List<Mstteacherinvite> getTeacherNotificationByName() {
		// TODO Auto-generated method stub
		return studentdao.getTeacherNotificationByName();
	}

	

}
