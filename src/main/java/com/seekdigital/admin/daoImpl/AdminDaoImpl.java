package com.seekdigital.admin.daoImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.seekdigital.admin.dao.AdminDao;
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

@Repository("adminDao")
@SuppressWarnings({ "unchecked", "rawtypes" })
public class AdminDaoImpl<T> implements AdminDao<T> {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Mstsemester> semester() {
		Session session = this.sessionFactory.openSession();

		List<Mstsemester> list = session.createQuery("FROM Mstsemester").list();
		session.close();

		return list;
	}

	@Override
	public List<Mststream> stream() {
		Session session = this.sessionFactory.openSession();
		List<Mststream> list = session.createQuery("FROM Mststream").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstmothertongue> mothertongue() {
		Session session = this.sessionFactory.openSession();

		List<Mstmothertongue> list = session.createQuery("FROM Mstmothertongue").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstmedium> medium() {
		Session session = this.sessionFactory.openSession();

		List<Mstmedium> list = session.createQuery("FROM Mstmedium").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstaffiliation> affiliation() {
		Session session = this.sessionFactory.openSession();

		List<Mstaffiliation> list = session.createQuery("FROM Mstaffiliation").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstschooltype> schooltype() {
		Session session = this.sessionFactory.openSession();
		List<Mstschooltype> list = session.createQuery("FROM Mstschooltype").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstgender> gender() {
		Session session = this.sessionFactory.openSession();
		List<Mstgender> list = session.createQuery("FROM Mstgender").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstbloodgroup> bloodgroup() {
		Session session = this.sessionFactory.openSession();
		List<Mstbloodgroup> list = session.createQuery("FROM Mstbloodgroup").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstsocialcategory> socialcategory() {
		Session session = this.sessionFactory.openSession();
		List<Mstsocialcategory> list = session.createQuery("FROM Mstsocialcategory").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstdisabilitychild> disabilitychild() {
		Session session = this.sessionFactory.openSession();
		List<Mstdisabilitychild> list = session.createQuery("FROM Mstdisabilitychild").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstreligion> religion() {
		Session session = this.sessionFactory.openSession();

		List<Mstreligion> list = session.createQuery("FROM Mstreligion").list();
		session.close();

		return list;
	}

	@Override
	public List<Mstcity> city() {
		Session session = this.sessionFactory.openSession();

		List<Mstcity> list = session.createQuery("FROM Mstcity ").list();
		session.close();

		return list;
	}

	
	// -------school and branch start

		@Override
		@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
		public void addSandBDetails(Tblschoolandbranchdetail tbl) {
			Session session = this.sessionFactory.openSession();

			session.save(tbl);
			session.close();
			// TODO Auto-generated method stub

		}

		@Override
		public List<Tblschoolandbranchdetail> getAllDetails() {
			Session session = this.sessionFactory.openSession();

			List<Tblschoolandbranchdetail> list = session.createQuery("from Tblschoolandbranchdetail").list();
			session.close();

			return list;

		}

		@Override
		public void deleteSchool(int id) {

			Tblschoolandbranchdetail myObject = new Tblschoolandbranchdetail();

			Session session = this.sessionFactory.openSession();
			myObject = (Tblschoolandbranchdetail) session.load(Tblschoolandbranchdetail.class, id);
			session.delete(myObject);

			// This makes the pending delete to be done
			session.flush();
			session.close();

		}

		@Override
		public void updateBranch(Tblschoolandbranchdetail tbl, int id) {
			Session s = this.sessionFactory.openSession();

			Query q = s
					.createQuery(
							"update Tblschoolandbranchdetail t set t.txtEmail= :p1, t.txtResponsiblePerson= :p2, t.txtSchoolAddress= :p3, t.txtSchoolName= :p4,"
									+ " t.txtWebsite= :p5 where t.intSchoolId= :id1 ")
					.setParameter("p1", tbl.getTxtEmail()).setParameter("p2", tbl.getTxtResponsiblePerson())
					.setParameter("p3", tbl.getTxtSchoolAddress()).setParameter("p4", tbl.getTxtSchoolName())
					.setParameter("p5", tbl.getTxtWebsite()).setParameter("id1", id);
			q.executeUpdate();

			s.close();
		}

		// -------school and branch end
		// ----- master record start

		public List<Mstcategory> getCategory() {
			Session s = sessionFactory.openSession();
			List<Mstcategory> q = s.createQuery("from Mstcategory").list();
			s.close();
			return q;
		}

		@Override
		public void deleteUser(int id) {
			Session s = sessionFactory.openSession();
			Mstregistration obj = (Mstregistration) s.load(Mstregistration.class, id);
			s.delete(obj);
			s.flush();
			s.close();
		}

		public List<Mstregistration> getAllStudentLists(int ClassId, int SectionId, String Id) {
			Session s = sessionFactory.openSession();
			int StudentIntId = 0;
			List<Mstregistration> q;
			Query hql;
			String str = "";
			/* ArrayList<Integer> loginal = new ArrayList<>(); */

			char c = ' ';
			if (!Id.isEmpty()) {
				c = Id.charAt(0);
			}

			// ------ condition starts

			if (Id.equals("") || Id.equals(null)) {
				System.out.println("inside first loop");
				str = "from Mstregistration m where  m.mststudclass.intClassId= :intClassId and m.mststudclasssection.intSectionId= :intSectionId and m.tblrolename.intRoleId= :intRoleId";
				hql = s.createQuery(str);
				hql.setParameter("intClassId", ClassId);
				hql.setParameter("intSectionId", SectionId);
				hql.setParameter("intRoleId", 1);

				q = hql.list();

				/*
				 * Iterator<Mstregistration> i = q.iterator(); while (i.hasNext()) {
				 * Mstregistration mstregistration = (Mstregistration) i.next();
				 * loginal.add(mstregistration.getIntRegistrationId()); }
				 */

				s.close();
				return q;
			}

			else if (!(Id.equals("") || Id.equals(null)) && Character.isLetter(c)) {
				System.out.println(c);
				str = "from Mstregistration m where m.mststudclass.intClassId= :intClassId and m.mststudclasssection.intSectionId= :intSectionId "
						+ "and m.txtFirstName= :txtFirstName and m.tblrolename.intRoleId= :intRoleId";
				hql = s.createQuery(str);
				hql.setParameter("intClassId", ClassId);
				hql.setParameter("intSectionId", SectionId);
				hql.setParameter("txtFirstName", Id.toLowerCase());
				hql.setParameter("intRoleId", 1);

				q = hql.list();
				s.close();
				return q;

			} else {
				StudentIntId = Integer.parseInt(Id);
				str = "from Mstregistration m where  m.mststudclass.intClassId= :intClassId and m.mststudclasssection.intSectionId= :intSectionId "
						+ "and m.intRegistrationId= :intRegistrationId and m.tblrolename.intRoleId= :intRoleId";
				hql = s.createQuery(str);
				hql.setParameter("intClassId", ClassId);
				hql.setParameter("intSectionId", SectionId);
				hql.setParameter("intRegistrationId", StudentIntId);
				hql.setParameter("intRoleId", 1);
				q = hql.list();
				s.close();
				return q;
			}

		}

		@Override
		public List<Mstregistration> getAllStaffLists(String Id) {
			Session s = sessionFactory.openSession();
			String str = "";
			List<Mstregistration> list;
			int StaffId = 0;
			char c = ' ';
			if (!Id.equals("")) {
				c = Id.charAt(0);
			}

			if (Id.equals("") || Id.equals(null)) {
				str = "from Mstregistration m where  m.tblrolename.intRoleId= :intRoleId";
				Query q = s.createQuery(str);
				q.setParameter("intRoleId", 3);
				list = q.list();
				s.close();
				return list;
			} else if (Character.isLetter(c)) {
				str = "from Mstregistration m where m.txtFirstName = :txtFirstName and m.tblrolename.intRoleId= :intRoleId";
				Query q = s.createQuery(str);
				q.setParameter("txtFirstName", Id.toLowerCase());
				q.setParameter("intRoleId", 3);
				list = q.list();
				s.close();
				return list;

			} else {
				StaffId = Integer.parseInt(Id);
				str = "from Mstregistration m where m.intRegistrationId = :intRegistrationId and m.tblrolename.intRoleId= :intRoleId";
				Query q = s.createQuery(str);
				q.setParameter("intRegistrationId", StaffId);
				q.setParameter("intRoleId", 3);
				list = q.list();
				s.close();
				return list;
			}

		}

		@Override
		public void updateStudent(Mstregistration reg, int id) {
			Session s = sessionFactory.openSession();
			System.out.println("inside dao");
			Query q = s
					.createQuery(
							"update  Mstregistration t set t.txtFirstName= :p1, t.txtLastName= :p2, t.txtFatherName= :p3, t.dtDob = :p4,t.txtPerAddress= :p5,t.txtFmobileNumber= :p6 where t.intRegistrationId= :p7")
					.setParameter("p1", reg.getTxtFirstName()).setParameter("p2", reg.getTxtLastName())
					.setParameter("p3", reg.getTxtFatherName()).setParameter("p4", reg.getDtDob())
					.setParameter("p5", reg.getTxtPerAddress())
					.setParameter("p6", reg.getTxtFmobileNumber()).setParameter("p7", id);
			q.executeUpdate();
			s.close();
		}

		
		
		
		// ------ master record end

		// -------------------user credentials start

		@Override
		public List<Mstlogin> getUser() {
			Session s = sessionFactory.openSession();
			List<Mstlogin> login = s.createQuery("from Mstlogin").list();
			s.close();
			return login;
		}

		// ----------------------user credentials end

	// ----------------dao invites start

	@Override
	public List<Mststudclass> getClasses() {

		Session session = this.sessionFactory.openSession();

		List<Mststudclass> list = session.createQuery("from Mststudclass").list();
		session.close();

		return list;

	}

	@Override
	public List<Mststudclasssection> getSections() {
		Session session = this.sessionFactory.openSession();

		List<Mststudclasssection> list = session.createQuery("from Mststudclasssection").list();
		session.close();

		return list;

		// return sessionFactory.getCurrentSession().createQuery("from
		// Mststudclasssection").list();

	}

	@Override
	public List<Tblrolename> getRoles() {
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Tblrolename").list();
		session.close();
		return list;
	}

	// ------------ end invites

	@Override
	public void adddetails(Mstschoolconnect tbl) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();

		session.save(tbl);
		session.close();
	}

	@Override
	public List<Mstschool> getUsers() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		List<Mstschool> list = session.createQuery("from Mstschool").list();
		session.close();
		return list;
	}
	/*
	 * @Override public void save(Mstschoolconnect tbl) {
	 * sessionFactory.getCurrentSession().save(tbl); }
	 */

	/* end of school connect */

	// syallbus

	@Override
	public void addsyllabus(Mstsubject sub) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		session.save(sub);
		session.close();
	}

	@Override
	public List<Mststudclass> getSyllabus() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Mststudclass").list();
		session.close();
		return list;
	}

	@Override
	public List<Mststudclass> getClasseAd() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Mststudclass").list();
		session.close();
		return list;
	}

	@Override
	public List<Mststudclasssection> getSection() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Mststudclasssection").list();
		session.close();
		return list;
	}
	// --------doc upload dao impl----------------------

	@Override
	public List<Trndocumenttype> getDocType() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Trndocumenttype").list();
		session.close();
		return list;
	}

	@Override
	public List<Mstsubcategory> getSubCategories() {
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Mstsubcategory").list();
		session.close();
		return list;
	}

	@Override
	public List<Mstcategory> getCategories() {
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Mstcategory").list();
		session.close();
		return list;

	}

	@Override
	public void addDocUploadDetails(Trndocumentupload docUp) {
		Session session = this.sessionFactory.openSession();

		session.save(docUp);
		session.close();

	}

	@Override
	public List<Trndocumentupload> getUploadDetails() {
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Trndocumentupload").list();
		session.close();
		return list;
	}

	// --------doc upload end----------------------

	@Override
	public void addInvitesUpload(Tblinvites ti) {
		Session session = this.sessionFactory.openSession();
		session.save(ti);
		session.close();
	}

	// ------------ end invites dao impl

	@Override
	public void addDocUploadDetails(Mstschoolconnect docUp) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		session.save(docUp);
		session.close();
	}

	@Override
	public void addtimetableDetails(Mststudenttimetable mst) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		session.save(mst);
		session.close();
	}

	

	@Override
	public List<Mstsubject> getSubject() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Mstsubject").list();
		session.close();
		return list;
	}

	@Override
	public List<Tbldaysofweek> getdays() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Tbldaysofweek").list();
		session.close();
		return list;
	}

	/*@Override
	public List<Mstteachertimetable> getAllTeachertimetable(int ClassId, int SectionId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		String hql = "from Mststudenttimetable m where m.mststudclass.intClassId= :intClassId  and m.mststudclasssection.intSectionId= :intSectionId";
		Query q = session.createQuery(hql);
		q.setParameter("intClassId", ClassId);
		q.setParameter("intSectionId", SectionId);
		List list = q.list();
		session.close();
		return list;
	}*/

	/*@Override
	public void deleteTimetable(int id) {
		// TODO Auto-generated method stub
		Mststudenttimetable mststudenttimetable;

		Session session = this.sessionFactory.openSession();
		mststudenttimetable = (Mststudenttimetable) session.load(Mststudenttimetable.class, id);
		session.delete(mststudenttimetable);

		// This makes the pending delete to be done
		session.flush();
		session.close();

	}*/

	@Override
	public void addtimetableDetails(Mstteachertimetable mstt) {
		// TODO Auto-generated method stub
		System.out.println("before datails");
		Session session = this.sessionFactory.openSession();
		session.save(mstt);
		session.close();
	}

	@Override
	public List<Tblinvites> getInviteDetails() {

		Session session = this.sessionFactory.openSession();
		List list = session.createQuery("from Tblinvites").list();
		session.close();
		return list;

	}

	@Override
	public List<Tblinvites> getInvObj(Integer id) {
		Session session = this.sessionFactory.openSession();
		String hql = "from Tblinvites t where t.intInvitesId= :intInvitesId"; //
		Query q = session.createQuery(hql);

		q.setParameter("intInvitesId", id);
		List<Tblinvites> list = q.list();
		session.close();
		return list;
	}

	// ------------ end invites

	// ----------------start attendance
	@Override
	public List<Trnattendancerecord> getStudAttend(int studId, Date curDt) {
		Session session = this.sessionFactory.openSession();

		String hql = "from Trnattendancerecord t where t.mstregistration.intRegistrationId= :intRegistrationId and t.dtSlotDate= :dtSlotDate"; //
		Query q = session.createQuery(hql);

		q.setParameter("intRegistrationId", studId);
		q.setParameter("dtSlotDate", curDt);
		List list = q.list();
		session.close();

		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String getStuName(int studId) {
		Session session = this.sessionFactory.openSession();

		String hql = "SELECT a.txtFirstName FROM Mstregistration a where a.intRegistrationId= :intRegistrationId";
		Query q = session.createQuery(hql);
		q.setParameter("intRegistrationId", studId);
		q.uniqueResult();

		List<String> results = q.list();
		System.out.println(results);
		String res = null;
		for (String s : results) {
			res = s;
		}
		System.out.println(res);
		session.close();

		return res;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getStudentList(int intClassId, int intSectionId, int intRegistrationId) {
		Session session = this.sessionFactory.openSession();

		String hql = "SELECT p.intRegistrationId FROM Mstregistration p where p.mststudclass.intClassId= :intClassId and p.mststudclasssection.intSectionId= :intSectionId and p.intRegistrationId= :intRegistrationId";
		Query q = session.createQuery(hql);
		q.setParameter("intClassId", intClassId);
		q.setParameter("intSectionId", intSectionId);
		q.setParameter("intRegistrationId", intRegistrationId);
		q.uniqueResult();

		List<Integer> lists = q.list();
		session.close();

		return lists;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Trnattendancerecord> getStudentAttendFromTo(java.util.Date startDate, java.util.Date endDate, int id) {
		Session session = this.sessionFactory.openSession();

		List<Trnattendancerecord> list = session
				.createQuery(
						"FROM Trnattendancerecord AS c WHERE c.dtSlotDate BETWEEN :startDate AND :endDate and c.mstregistration.intRegistrationId= :id")
				.setParameter("startDate", startDate).setParameter("endDate", endDate).setParameter("id", id)

				/*
				 * .createCriteria(Trnattendancerecord.class)
				 * .add(Restrictions.between("dtSlotDate", startDate, endDate))
				 */

				.list();
		session.close();

		return list;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getStudentIds(int classId, int sectionId) {
		Session session = this.sessionFactory.openSession();

		String hql = "SELECT p.intRegistrationId FROM Mstregistration p where p.mststudclass.intClassId= :intClassId and p.mststudclasssection.intSectionId= :intSectionId";
		Query q = session.createQuery(hql);
		q.setParameter("intClassId", classId);
		q.setParameter("intSectionId", sectionId);

		List<Integer> lists = q.list();
		session.close();

		return lists;
	}

	// ---------Attendance end

	// -------student performance start

	@Override
	public List<Mstuploadstudmarksheet> getMarksList(int ClassId, int SectionId, int TermId, String StudentId) {
		Session s = this.sessionFactory.openSession();
		List<Mstuploadstudmarksheet> q;
		int StudentIntId = 0;
		if (StudentId.equals("")) {
			Query hql = s.createQuery("from Mstuploadstudmarksheet m where m.mststudclass.intClassId= :intClassId and "
					+ "m.mststudclasssection.intSectionId= :intSectionId and m.mstterms.intTermId= :intTermId");
			hql.setParameter("intClassId", ClassId);
			hql.setParameter("intSectionId", SectionId);
			hql.setParameter("intTermId", TermId);
			q = hql.list();
			s.close();
			return q;
		} else {
			StudentIntId = Integer.parseInt(StudentId);
			Query hql = s.createQuery("from Mstuploadstudmarksheet m where m.mststudclass.intClassId= :intClassId and"
					+ " m.mststudclasssection.intSectionId= :intSectionId and m.mstterms.intTermId= :intTermId and "
					+ "m.mstregistration.intRegistrationId= :intRegistrationId");
			hql.setParameter("intClassId", ClassId);
			hql.setParameter("intSectionId", SectionId);
			hql.setParameter("intTermId", TermId);
			hql.setParameter("intRegistrationId", StudentIntId);
			q = hql.list();
			s.close();
			return q;
		}
	}

	@Override
	public List<Mstterms> getTerms() {

		Session s = this.sessionFactory.openSession();

		List<Mstterms> q = s.createQuery("from Mstterms").list();
		s.close();
		return q;
	}

	@Override
	public Mstuploadstudmarksheet getMarkSheet(int id) {
		Session s = this.sessionFactory.openSession();
		Mstuploadstudmarksheet m = (Mstuploadstudmarksheet) s.get(Mstuploadstudmarksheet.class, id);
		s.close();
		return m;

	}

	// -------student performance end
	
	@Override
	public List<Trnteacherleaveapp> getLeaveReqFromTeacher() {
		Session s = this.sessionFactory.openSession();
		List<Trnteacherleaveapp> list = s.createQuery("from Trnteacherleaveapp p where p.intStatus = '1'").list();
		s.close();
		return list;
	}

	@Override
	public List<Mstleave> getLeaveTypes() {
		Session s = this.sessionFactory.openSession();
		List<Mstleave> list = s.createQuery("from Mstleave").list();
		s.close();
		return list;
	}

	@Override
	public List<Mstmaritalstatus> getMaritalStatus() {
		Session s = this.sessionFactory.openSession();
		List<Mstmaritalstatus> list = s.createQuery("from Mstmaritalstatus").list();
		s.close();
		return list;
	}

	@Override
	public void saveTeachReg(Mstregistration regObj) {
		Session s=this.sessionFactory.openSession();
	s.save(regObj);
	s.close();		
		
	}

	@Override
	public void saveTeachBank(Mstbank bankObj) {
		Session s=this.sessionFactory.openSession();
		s.save(bankObj);
		s.close();
		
	}

	@Override
	public void letApprove(int nowId, Date curDt, int approvedStatusId) {
		Session s=this.sessionFactory.openSession();
		String hql="UPDATE Trnteacherleaveapp as t set " +
					"intStatus = :intStatus ," +
					"dtApprovedDate = :dtApprovedDate " +
					"where id = :id";
		
		Query q=s.createQuery(hql);
		q.setParameter("id", nowId);
		q.setParameter("dtApprovedDate", curDt);
		q.setParameter("intStatus", approvedStatusId);
		int aa=q.executeUpdate();
		System.out.println(aa);
		s.close();
	}

	@Override
	public void letReject(int nowId, int approvedStatusId) {
		Session s=this.sessionFactory.openSession();
		String hql="update Trnteacherleaveapp set intStatus = :intStatus where id = :id";
		Query q=s.createQuery(hql);
		q.setParameter("id", nowId);
		q.setParameter("intStatus", approvedStatusId);
		int aa=q.executeUpdate();
		System.out.println(aa);
		s.close();
	}

	@Override
	public Trndocumentupload uploadDocObj(Integer id) {
		Trndocumentupload type=new Trndocumentupload();
		Session s=this.sessionFactory.openSession();
		type=(Trndocumentupload) s.get(Trndocumentupload.class, id);
		s.close();
		return type;
	}

	@Override
	public Tblinvites invObj(Integer id) {
		Tblinvites obj=new Tblinvites();
		Session s=this.sessionFactory.openSession();
		obj=(Tblinvites) s.get(Tblinvites.class, id);
		return obj;
	}

	@Override
	public int getRoleId(String stu) {
		Session s=sessionFactory.openSession();
		
		Query q=s.createQuery("SELECT intRoleId from Tblrolename where txtRoleName=:txtRoleName");
		q.setParameter("txtRoleName", stu);
		List<Integer> list=q.list();
		int id22=0;
		for (Integer id : list) {
			id22=id;
		}
		s.close();
		return id22;
	}

	

	@Override
	public List<Tblbankname> bankname() {
		Session s = this.sessionFactory.openSession();
		List<Tblbankname> list = s.createQuery("from Tblbankname").list();
		s.close();
		return list;
	}

	@Override
	public void addRegister(Mstregistration reg) {
		Session session = this.sessionFactory.openSession();
		session.save(reg);
		session.close();
		
	}

	@Override
	public int getReg(String steno) {
		Session s = this.sessionFactory.openSession();
		Query q = s.createQuery("SELECT a.intRegistrationId from Mstregistration a where a.txtStudentEnrollmentNumber = :txtStudentEnrollmentNumber");
		q.setParameter("txtStudentEnrollmentNumber", steno);
		q.uniqueResult();
		List<Integer> a = q.list();
		int dd=0;
		for (Integer in : a) {
			dd=in;
		}
		s.close();
		return dd;
	}

	@Override
	public void addBankDetails(Mstbank mstbank) {
		Session session = this.sessionFactory.openSession();
		session.save(mstbank);
		session.close();
	}

	@Override
	public void addLoginDetails(Mstlogin mstlogin) {
		Session session = this.sessionFactory.openSession();
		session.save(mstlogin);
		session.close();
	}

	@Override
	public int getClassId(String string) {
		Session s = this.sessionFactory.openSession();
		Query q = s.createQuery("SELECT a.intClassId from Mststudclass a where a.txtClassName = :txtClassName");
		q.setParameter("txtClassName", string);
		q.uniqueResult();
		List<Integer> a = q.list();
		int dd=0;
		for (Integer in : a) {
			dd=in;
		}
		s.close();
		return dd;
	}

	@Override
	public int getSectionId(String string) {
		Session s = this.sessionFactory.openSession();
		Query q = s.createQuery("SELECT a.intSectionId from Mststudclasssection a where a.txtSectionName = :txtSectionName");
		q.setParameter("txtSectionName", string);
		q.uniqueResult();
		List<Integer> a = q.list();
		int dd=0;
		for (Integer in : a) {
			dd=in;
		}
		s.close();
		return dd;
	}

}
