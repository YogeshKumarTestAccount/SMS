package com.seekdigital.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

public interface AdminService<T> {

	public List<Mstsemester> semester();

	public List<Mststream> stream();

	public List<Mstcity> city();

	public List<Mstmothertongue> mothertongue();

	public List<Mstmedium> medium();

	public List<Mstaffiliation> affiliation();

	public List<Mstschooltype> schooltype();

	public List<Mstgender> gender();

	public List<Mstbloodgroup> bloodgroup();

	public List<Mstsocialcategory> socialcategory();

	public List<Mstdisabilitychild> disabilitychild();

	public List<Mstreligion> religion();

	// ----- master record start

		public List<Mstcategory> getCategory();

		public void deleteUser(int id);

		public List<Mstregistration> getAllStudentLists(int ClassId, int SectionId, String Id);
		
		public List<Mstregistration> getAllStaffLists(String Id);
		
		public void updateStudent(Mstregistration reg, int id);
		

		// ------ master record end
			//-----------user credentials start
			
			public List<Mstlogin> getUser();
			
			//-----------user credentials end
			

			// ------ school and branch detail

			public void addSandBDetails(Tblschoolandbranchdetail tbl);

			public List<Tblschoolandbranchdetail> getAllDetails();

			public void deleteSchool(int id);
			
			public void updateBranch(Tblschoolandbranchdetail tbl, int id);

			// ----------- school and branch detail

	// --------invites section

	public List<Mststudclass> getClasses();

	public List<Mststudclasssection> getSections();

	public List<Tblrolename> getRoles();


	// ------------end of invites

	// -----stu performance start
		public List<Mstterms> getTerms();
		//public List<Mstregistration> getAllStudentLists(int ClassId, int SectionId );
		public List<Mstuploadstudmarksheet> getMarksList(int ClassId, int SectionId, int TermId, String StudentId);

		public Mstuploadstudmarksheet getMarkSheet(int id);
		// --------stu performance end
		
		
	/* start of school connect */

	public void adddetails(Mstschoolconnect tbl);

	public List<Mstschool> getUsers();
	/* void save(Mstschoolconnect tbl); file upload */
	/* end of school connect */

	// Sylabus
	public void addsyllabus(Mstsubject sub);

	public List<Mststudclass> getSyllabus();

	// attendance

	public List<Mststudclass> getClasseAd();

	public List<Mststudclasssection> getSection();
	// --------------Doc Upload for dao and service
	// interfaces------------------------

	public List<Trndocumenttype> getDocType();

	public List<Mstsubcategory> getSubCategories();

	public List<Mstcategory> getCategories();

	public void addDocUploadDetails(Trndocumentupload docUp);
	
	public List<Tblinvites> getInvObj(Integer id);

	// --------------Doc Upload end-----------------------------------
	// --------invites dao & service Interfaces


	// ------------end of invites
	public void addDocUploadDetails(Mstschoolconnect docUp);
	// time table
	public void addtimetableDetails(Mststudenttimetable mst);
	public void addtimetableDetails(Mstteachertimetable mstt);
/*	public List<Mststudenttimetable> getAllStudenttimetable(int ClassId, int SectionId);
*/
	public List<Mstsubject> getSubject();
	public List<Tbldaysofweek> getdays();
	/*public List<Mstteachertimetable> getAllTeachertimetable(int c, int s);
	public String deleteTimetable(int id);*/
public void addInvitesUpload(Tblinvites ti);
	
public List<Trnattendancerecord> getStudAttend(int studId, Date curDt);

public String getStuName(int studId);

public List<Integer> getStudentList(int classId, int sectionId, int studId);

public List<Trnattendancerecord> getStudentAttendFromTo(java.util.Date startDate, java.util.Date endDate ,int id);

public List<Integer> getStudentIds(int classId, int sectionId);

public List<Trndocumentupload> getUploadDetails();

public List<Tblinvites> getInviteDetails();

public List<Trnteacherleaveapp> getLeaveReqFromTeacher();

public List<Mstleave> getLeaveTypes();

public List<Mstmaritalstatus> getMaritalStatus();

public void saveTeachReg(Mstregistration regObj);

public void saveTeachBank(Mstbank bankObj);

public void letApprove(int nowId, Date curDt, int approvedStatusId);

public void letReject(int nowId, int approvedStatusId);

public Trndocumentupload uploadDocObj(Integer id);

public Tblinvites invObj(Integer id);

public int getRoleId(String stu);

public List<Tblbankname> bankname();

public void addRegister(Mstregistration reg);

public int getReg(String steno);

public void addBankDetails(Mstbank mstbank);

public void addLoginDetails(Mstlogin mstlogin);

public int getClassId(String string);

public int getSectionId(String string);


}
