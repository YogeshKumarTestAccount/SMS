package com.seekdigital.admin.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seekdigital.admin.dao.AdminDao;
import com.seekdigital.admin.service.AdminService;
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

@Service("adminService")
public class AdminServiceImpl<T> implements AdminService<T> {
	@Autowired
	AdminDao<T> adminDao;

	@Override
	public List<Mstsemester> semester() {
		// TODO Auto-generated method stub
		return adminDao.semester();
	}

	@Override
	public List<Mststream> stream() {
		// TODO Auto-generated method stub
		return adminDao.stream();
	}

	@Override
	public List<Mstmothertongue> mothertongue() {
		// TODO Auto-generated method stub
		return adminDao.mothertongue();
	}

	@Override
	public List<Mstmedium> medium() {
		// TODO Auto-generated method stub
		return adminDao.medium();
	}
	@Override
	public List<Mstaffiliation> affiliation() {
		// TODO Auto-generated method stub
		return adminDao.affiliation();
	}

	@Override
	public List<Mstschooltype> schooltype() {
		// TODO Auto-generated method stub
		return adminDao.schooltype();
	}

	@Override
	public List<Mstgender> gender() {
		// TODO Auto-generated method stub
		return adminDao.gender();
	}

	@Override
	public List<Mstbloodgroup> bloodgroup() {
		// TODO Auto-generated method stub
		return adminDao.bloodgroup();
	}

	@Override
	public List<Mstsocialcategory> socialcategory() {
		// TODO Auto-generated method stub
		return adminDao.socialcategory();
	}

	@Override
	public List<Mstdisabilitychild> disabilitychild() {
		// TODO Auto-generated method stub
		return adminDao.disabilitychild();
	}

	@Override
	public List<Mstreligion> religion() {
		// TODO Auto-generated method stub
		return adminDao.religion();
	}

	@Override
	public List<Mstcity> city() {
		return adminDao.city();
	}

	//---------school and branch details
	@Override
	public void addSandBDetails(Tblschoolandbranchdetail tbl) {
		adminDao.addSandBDetails(tbl);
	}

	@Override
	public List<Tblschoolandbranchdetail> getAllDetails() {
		// TODO Auto-generated method stub
		return adminDao.getAllDetails();
	}

	@Override
	public void deleteSchool(int id) {
		adminDao.deleteSchool(id);
	}

	@Override
	public void updateBranch(Tblschoolandbranchdetail tbl, int id) {
	adminDao.updateBranch(tbl, id);
	}
	
	
	/* end of school and branch */

	// ----- master record start


	public List<Mstcategory> getCategory() {
	return adminDao.getCategory();
}

@Override
public void deleteUser(int id) {
	adminDao.deleteUser(id);
	
}

public List<Mstregistration> getAllStudentLists(int ClassId, int SectionId, String Id) {
	return adminDao.getAllStudentLists(ClassId, SectionId, Id);
}

public List<Mstregistration> getAllStaffLists(String Id)
{
	return adminDao.getAllStaffLists(Id);
}

@Override
public void updateStudent(Mstregistration reg, int id) {
	
	 adminDao.updateStudent(reg, id);
	
}


	// ------ master record end



//-------------------user credentials start

@Override
public List<Mstlogin> getUser() {
	// TODO Auto-generated method stub
	return adminDao.getUser();
}


//----------------------user credentials end

	@Override
	public List<Tblrolename> getRoles() {
		// TODO Auto-generated method stub
		return adminDao.getRoles();
	}

	
	// ---------- student performance
	
	@Override
	public List<Mststudclass> getClasses() {
		// TODO Auto-generated method stub
		return adminDao.getClasses();
	}

	@Override
	public List<Mststudclasssection> getSections() {
		// TODO Auto-generated method stub
		return adminDao.getSections();
	}

	@Override
	public List<Mstterms> getTerms() {
		// TODO Auto-generated method stub
		return adminDao.getTerms();
	}
	
	@Override
	public List<Mstuploadstudmarksheet> getMarksList(int ClassId, int SectionId, int TermId, String StudentId) {
		// TODO Auto-generated method stub
		return adminDao.getMarksList(ClassId, SectionId, TermId, StudentId);
	}
	
	@Override
	public Mstuploadstudmarksheet getMarkSheet(int id) {
		// TODO Auto-generated method stub
		return adminDao.getMarkSheet(id);
	}

	//------------student performance end


	@Override
	public void adddetails(Mstschoolconnect tbl) {
		// TODO Auto-generated method stub
		adminDao.adddetails(tbl);
	}

	@Override
	public List<Mstschool> getUsers() {
		// TODO Auto-generated method stub
		return adminDao.getUsers();
		

	}

	@Override
	public void addsyllabus(Mstsubject sub)
	{
		 adminDao.addsyllabus(sub);
	}

	@Override
	public List<Mststudclass> getSyllabus()
	{
		return adminDao.getSyllabus();
	}


@Override
public List<Mststudclass> getClasseAd() {
	// TODO Auto-generated method stub
	return adminDao.getClasseAd();
}



   


@Override
public List<Mststudclasssection> getSection() {
	// TODO Auto-generated method stub
	return adminDao.getSection();
 }
//--------doc upload service impl----------------------



@Override
public List<Trndocumenttype> getDocType() {
	return adminDao.getDocType();
}

@Override
public List<Mstsubcategory> getSubCategories() {
	return adminDao.getSubCategories();
}

@Override
public List<Mstcategory> getCategories() {
	return adminDao.getCategories();
}

@Override
public void addDocUploadDetails(Trndocumentupload docUp) {
	adminDao.addDocUploadDetails(docUp);	
}

@Override
public void addInvitesUpload(Tblinvites ti) {
	adminDao.addInvitesUpload(ti);
	
}
@Override
public List<Trndocumentupload> getUploadDetails() {
	return adminDao.getUploadDetails();
	
}


//--------doc upload end----------------------
//--------invites service impl start----------------------





//--------invites service impl end----------------------
@Override
public void addDocUploadDetails(Mstschoolconnect docUp) {
	// TODO Auto-generated method stub
	adminDao.addDocUploadDetails(docUp);
}
	

@Override
public void addtimetableDetails(Mststudenttimetable mst) {
        // TODO Auto-generated method stub
        adminDao.addtimetableDetails(mst);
}

/*@Override
public List<Mststudenttimetable> getAllStudenttimetable(int ClassId, int SectionId) {
        // TODO Auto-generated method stub
        return adminDao.getAllStudenttimetable(ClassId, SectionId);
}*/

@Override
public List<Mstsubject> getSubject() {
        // TODO Auto-generated method stub
        return adminDao.getSubject();
}

@Override
public List<Tbldaysofweek> getdays() {
        // TODO Auto-generated method stub
        return adminDao.getdays();
}

/*@Override
public List<Mstteachertimetable> getAllTeachertimetable(int c, int s) {
        // TODO Auto-generated method stub
        return adminDao.getAllTeachertimetable(c, s);
}
*/

@Override
public void addtimetableDetails(Mstteachertimetable mstt) {
        // TODO Auto-generated method stub
        
        adminDao.addtimetableDetails(mstt);
        
}
/*
@Override
public String deleteTimetable(int id) {
	adminDao.deleteTimetable(id);
     return "table deleted succesfully";
	
}*/
@Override
public List<Trnattendancerecord> getStudAttend(int studId, Date curDt) {
	return adminDao.getStudAttend(studId, curDt);
}

@Override
public String getStuName(int studId) {
	return adminDao.getStuName(studId);
}

@Override
public List<Integer> getStudentList(int classId, int sectionId, int studId) {
	return adminDao.getStudentList(classId,sectionId,studId);
}

@Override
public List<Trnattendancerecord> getStudentAttendFromTo(java.util.Date startDate, java.util.Date endDate, int id) {
	return adminDao.getStudentAttendFromTo(startDate,endDate,id);
}

@Override
public List<Integer> getStudentIds(int classId, int sectionId) {
	// TODO Auto-generated method stub
	return adminDao.getStudentIds(classId,sectionId);
}

@Override
public List<Tblinvites> getInviteDetails() {
	// TODO Auto-generated method stub
	return adminDao.getInviteDetails();
}

@Override
public List<Tblinvites> getInvObj(Integer id) {
	// TODO Auto-generated method stub
	return adminDao.getInvObj(id);
}

@Override
public List<Trnteacherleaveapp> getLeaveReqFromTeacher() {
	// TODO Auto-generated method stub
	return adminDao.getLeaveReqFromTeacher();
}

@Override
public List<Mstleave> getLeaveTypes() {
	// TODO Auto-generated method stub
	return adminDao.getLeaveTypes();
}

@Override
public List<Mstmaritalstatus> getMaritalStatus() {
	// TODO Auto-generated method stub
	return adminDao.getMaritalStatus();
}

@Override
public void saveTeachReg(Mstregistration regObj) {
	// TODO Auto-generated method stub
	adminDao.saveTeachReg(regObj);
}

@Override
public void saveTeachBank(Mstbank bankObj) {
	// TODO Auto-generated method stub
	adminDao.saveTeachBank(bankObj);
}

@Override
public void letApprove(int nowId, Date curDt, int approvedStatusId) {
	// TODO Auto-generated method stub
	adminDao.letApprove(nowId,curDt,approvedStatusId);
}

@Override
public void letReject(int nowId, int approvedStatusId) {
	// TODO Auto-generated method stub
	adminDao.letReject(nowId,approvedStatusId);
}

@Override
public Trndocumentupload uploadDocObj(Integer id) {
	// TODO Auto-generated method stub
	return adminDao.uploadDocObj(id);
}

@Override
public Tblinvites invObj(Integer id) {
	// TODO Auto-generated method stub
	return adminDao.invObj(id);
}

@Override
public int getRoleId(String stu) {
	// TODO Auto-generated method stub
	return adminDao.getRoleId(stu);
}

@Override
public List<Tblbankname> bankname() {
	// TODO Auto-generated method stub
	return adminDao.bankname();
}

@Override
public void addRegister(Mstregistration reg) {
	// TODO Auto-generated method stub
	adminDao.addRegister(reg);
}

@Override
public int getReg(String steno) {
	// TODO Auto-generated method stub
	return adminDao.getReg(steno);
}

@Override
public void addBankDetails(Mstbank mstbank) {
	// TODO Auto-generated method stub
	adminDao.addBankDetails(mstbank);
}

@Override
public void addLoginDetails(Mstlogin mstlogin) {
	// TODO Auto-generated method stub
	adminDao.addLoginDetails(mstlogin);
}

@Override
public int getClassId(String string) {
	// TODO Auto-generated method stub
	return adminDao.getClassId(string);
}

@Override
public int getSectionId(String string) {
	// TODO Auto-generated method stub
	return adminDao.getSectionId(string);
}




//--------Attendance end----------------------
	

//--------invites end----------------------





}
