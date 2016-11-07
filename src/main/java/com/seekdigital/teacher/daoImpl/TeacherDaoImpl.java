   package com.seekdigital.teacher.daoImpl;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


/* This class acts as a dao(Data Access Object)layer and is responsible to
 * interact with the database 
*/
@SuppressWarnings("unchecked")
@Repository
public class TeacherDaoImpl implements TeacherDao, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private SessionFactory sessionFactory;

	//this method is for fetching the profile details of a teacher
	public List<Mstregistration> Profile(int registrationId) {
		System.out.println("begin dao method");
		Session session = this.sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Mstregistration.class);
		criteria.add(Restrictions.eq("intRegistrationId", registrationId));
		System.out.println("end dao method");
		List<Mstregistration> list = criteria.list();
		session.close();
		return list;

	}

	//this method is to update the teacher profile
	public void update(Mstregistration mstregistration) {
		Session session = this.sessionFactory.openSession();
		String hql = "update from Mstregistration set txtPerAddress=:add,txtTempAddress=:add2,txtEmailId=:em,txtFotherNumber=:no where intRegistrationId=:id";
		Query q = session.createQuery(hql);
		q.setParameter("add", mstregistration.getTxtPerAddress());
		q.setParameter("em", mstregistration.getTxtEmailId());
		q.setParameter("no", mstregistration.getTxtFotherNumber());
		q.setParameter("add2", mstregistration.getTxtTempAddress());
		q.setParameter("id", mstregistration.getIntRegistrationId());
		int i = q.executeUpdate();
		session.close();
		System.out.println("success" + i);

	}

	//this method is to fetch all the classes
	public List<Mststudclass> getAllClasses() {
		Session session = this.sessionFactory.openSession();
		List<Mststudclass> classList = session.createCriteria(Mststudclass.class).list();
		session.close();
		return classList;
	}
	//this method is to fetch the section
	public List<Mststudclasssection> getAllSections() {
		Session session = this.sessionFactory.openSession();
		List<Mststudclasssection> sectionList = session.createCriteria(Mststudclasssection.class).list();
		session.close();
		return sectionList;
	}

	//this method is used to post the homework
	public void homeworkPost(Tblhomework tblhomework) {
		Session session = this.sessionFactory.openSession();
		session.save(tblhomework);
		System.out.println("home work saved successfully");
		session.close();
	}

	//this method is used to display the history of posted homework's
	public List<Tblhomework> getHomeworkHistory(int registrationId, Date fromDate, Date toDate) {
		Session session = this.sessionFactory.openSession();
		String hql = "from Tblhomework where dtAssignDate between :f and :t";
		List<Tblhomework> homeworkHistoryList = session.createQuery(hql).setParameter("f", fromDate).setParameter("t", toDate).list();
		
		/*List<Tblhomework> homeworkHistoryList = session.createCriteria(Tblhomework.class).add(Restrictions.between("dtAssignDate", fromDate, toDate)).
				add(Restrictions.eq("mstregistration.intRegistrationId", registrationId)).list();*/
		session.close();
		return homeworkHistoryList;
	}

	//this method is used to post the project
	public void projectPost(Mstteacherproject mstteacherproject) {
		Session session = this.sessionFactory.openSession();
		session.save(mstteacherproject);
		System.out.println("project details saved successfully");
		session.close();
		
	}

	//this method is used to display the history of posted project's
	public List<Mstteacherproject> getProjectHistory(int registrationId, Date fromDate, Date toDate) {
		Session session = this.sessionFactory.openSession();
		String hql = "from Mstteacherproject where dtAssignDate between :f and :t";
		List<Mstteacherproject> projectHistoryList = session.createQuery(hql).setParameter("f", fromDate).setParameter("t", toDate).list();
		/*List<Mstteacherproject> projectHistoryList = session.createCriteria(Mstteacherproject.class)
				.add(Restrictions.between("dtAssignDate", fromDate, toDate)).
				add(Restrictions.eq("mstregistration.intRegistrationId", registrationId))
				.list();*/
		session.close();
		return projectHistoryList;
	}

	//this method is to fetch the leave type for teacher
	public List<Mstleave> getAllLeaveTypes() {
		Session session = this.sessionFactory.openSession();
		List<Mstleave> leaveTypeList = session.createCriteria(Mstleave.class).list();
		session.close();
		return leaveTypeList;
		
	}

	//this method is used to apply for leave
	public void applyLeave(Trnteacherleaveapp trnteacherleaveapp) {
		Session session = this.sessionFactory.openSession();
		session.save(trnteacherleaveapp);
		System.out.println("leave request sent successfully");
		session.close();
		
	}

	//this method is used to fetch the types of exam terms
	public List<Mstterms> getExamTerms() {
		Session session = this.sessionFactory.openSession();
		List<Mstterms> examTypeList = session.createCriteria(Mstterms.class).list();
		session.close();
		return examTypeList;
	}

	//this method is used to fetch the timetable of the teacher
	public List<Mstteachertimetable> getTimetable(int registrationId) {
		Session session = this.sessionFactory.openSession();
		String hql = "from Mstteachertimetable as m where mstregistration.intRegistrationId =:id";
		List <Mstteachertimetable> timetable = session.createQuery(hql).setParameter("id", registrationId).list();
		session.close();
		
		return timetable;
	}

	//this method records the class check in time of the teacher
		public void recordCheckInTime(Mstteachercheckin mstteachercheckin)
		{
			Session session = this.sessionFactory.openSession();
			session.save(mstteachercheckin);
			session.close();
		}
		
		// this method is used to display class check-in time history
		public List<Mstteachercheckin> getClassCheckInTimeHistory(int registrationId, Date fromDate, Date toDate)
		{
			Session session = this.sessionFactory.openSession();
			String hql = "from Mstteachercheckin as m where m.mstteachertimetable.mstregistration.intRegistrationId=:id and "
					+ "(m.dtCheckIn >= :stDate AND m.dtCheckIn <= :edDate)";
			List<Mstteachercheckin> list = session.createQuery(hql).
					setParameter("id", registrationId).
					setParameter("stDate", fromDate)
			.setParameter("edDate", toDate).list();
			System.out.println("query success");
			
			session.close();
			/*for (Iterator<Mstteachercheckin> iterator = list.iterator(); iterator.hasNext();) {
				Mstteachercheckin mstteachercheckin = (Mstteachercheckin) iterator.next();
				System.out.println("..."+mstteachercheckin.getDtCheckIn());
				System.out.println(".."+mstteachercheckin.getMstteachertimetable().getMststudclass().getTxtClassName());
				System.out.println("*************************************");
			}*/
			
			return list;
		}

		//this method is used to get the nofitication sent by admin to teacher
		public List<Tblinvites> getTeacherNotification(int roleId) {
			Session session = this.sessionFactory.openSession();
			List<Tblinvites> nofitication = session.createCriteria(Tblinvites.class).
					add(Restrictions.eq("tblrolename.intRoleId", roleId)).list();
			session.close();
			return nofitication;
		}

		//this method is used to post the invite to the entire class
		public void postTeacherInvite(Mstteacherinvite mstteacherinvite) {
			Session session = this.sessionFactory.openSession();
			session.save(mstteacherinvite);
			session.close();
			/*String studentName = "Naren";
		java.util.Date d = new java.util.Date();
		Date sqldate = new Date(d.getTime());
			 String hql1 = "select t.txtSubject,t.txtHomeWork,t.dtDueDate from Mstregistration m,Tblhomework t where"
                     + " (m.mststudclass.intClassId = t.mststudclass.intClassId and m.mststudclasssection.intSectionId"
                     + "=t.mststudclasssection.intSectionId) and (m.txtStudentFirstName ='"+studentName+"' and t.dtAssignDate='"+sqldate+"')";
    Query query = this.factory.getCurrentSession().createQuery(hql1);
     List<Tblhomework> homeworkList = new ArrayList<>();
     List<Object[]> list = query.list();
     for (Iterator iterator = list.iterator(); iterator.hasNext();) {
             Object[] objects = (Object[]) iterator.next();
             Tblhomework tblhomework = new Tblhomework();
             for (int i = 0; i < objects.length; i++) {
                     System.out.println(objects[i]);

                     tblhomework.setTxtSubject((String)objects[0]);
                     tblhomework.setTxtHomeWork((String)objects[1]);
                     tblhomework.setDtDueDate((Date)objects[2]);
             }
             homeworkList.add(tblhomework);
     }
     System.out.println("query success");
		*/}

		//this method is to upload marksheet of students
		public void uploadStudentMarksheet(Mstuploadstudmarksheet mstuploadstudmarksheet) {
			Session session = this.sessionFactory.openSession();
			session.save(mstuploadstudmarksheet);
			session.close();
			
		}

		//this method is used to fetch teacher leave inbox
		public List<Trnteacherleaveapp> getTeacherLeaveInbox(int registrationId) {
			Session session = this.sessionFactory.openSession();
			String hql = "from Trnteacherleaveapp where intRegistrationId=:id";
			List<Trnteacherleaveapp> leaveInbox = session.createQuery(hql).setParameter("id",registrationId).list();
			/*List<Trnteacherleaveapp> leaveInbox = session.createCriteria(Trnteacherleaveapp.class).add(Restrictions.eq("mstregistration.intRegistrationId", registrationId))
			.list();*/
			session.close();
			return  leaveInbox;
		}

		//this method is used to fetch student leave request sent by parents
		public List<Trnstudentleaveapp> getStudentLeaveRequest() {
			Session session = this.sessionFactory.openSession();
			List<Trnstudentleaveapp> studentLeave = session.createQuery("from Trnstudentleaveapp").list();
		//	List<Trnstudentleaveapp> studentLeave = session.createCriteria(Trnstudentleaveapp.class).list();
			session.close();
			return studentLeave;
		}

		//this method is used to reject/approve leave
		public void approveOrRejectStudentLeave(int id, int status, Date appOrRejDate) {
			Session session = this.sessionFactory.openSession();
			String hql  = "update from Trnstudentleaveapp set intStatus=:p1,dtApprovedDate=:p2 where intStudentLeaveAppId=:p3";
			Query query = session.createQuery(hql);
			query.setParameter("p1", status);
			query.setParameter("p2", appOrRejDate);
			query.setParameter("p3", id);
			query.executeUpdate();
			session.close();
		}

		//this method is used to get all the searched leave request by date
		public List<Trnstudentleaveapp> getAllSearchedLeaveReq(Date fromDate, Date toDate) {
			Session session = this.sessionFactory.openSession();
			String hql = "from Trnstudentleaveapp where dtAppliedDate between :d1 and :d2 ";
			Query query = session.createQuery(hql);
			query.setParameter("d1", fromDate);
			query.setParameter("d2", toDate);
			List<Trnstudentleaveapp> list = query.list();
			session.close();
			return list;
		}

		//this method is used to get searched leave request by status and date
		public List<Trnstudentleaveapp> getSearchedLeaveReq(int status, Date fromDate, Date toDate) {
			Session session = this.sessionFactory.openSession();
			String hql = "from Trnstudentleaveapp where intStatus=:s and dtAppliedDate between :d1 and :d2 ";
			Query query = session.createQuery(hql);
			query.setParameter("s"	, status);
			query.setParameter("d1", fromDate);
			query.setParameter("d2", toDate);
			List<Trnstudentleaveapp> list = query.list();
			session.close();
			return list;
		}

		//this method is used to fetch the questions posted by students
		public List<Mstquestionandanswer> getStudentQuestions() {
			Session session = this.sessionFactory.openSession();
			String hql = "from Mstquestionandanswer where txtAnswer is NULL";
			List<Mstquestionandanswer> list = session.createQuery(hql).list();
			
		//	List<Mstquestionandanswer> list = session.createQuery("from Mstquestionandanswer").list();
			session.close();
			return list;
		}

		//this method is used to answer the question 
		public void postAnswer(int questionId, String answer, int teacherId) {
			Session session = this.sessionFactory.openSession();
			String hql = "update from Mstquestionandanswer set intTeacherId=:tid,txtAnswer=:ans  where intQuestionAndAnswerId=:qid ";
			session.createQuery(hql).setParameter("tid", teacherId)
			.setParameter("ans", answer).setParameter("qid", questionId).executeUpdate();
			
			session.close();
		}

		//this method is used to fetch marksheet of students by exam type
		public List<Mstuploadstudmarksheet> getStudentMarksheet(int examId) {
			Session session = this.sessionFactory.openSession();
			String hql = "from Mstuploadstudmarksheet where mstterms.intTermId=:id";
			List<Mstuploadstudmarksheet> list = session.createQuery(hql).setParameter("id", examId).list();
			session.close();
			return list ;
		}
		
		
		//this method is used to fetch all the students
		public List<Mstregistration> getStudents()
		{
			Session session = this.sessionFactory.openSession();
			String hql = "from Mstregistration where intRoleId=:id";
			List<Mstregistration> list = session.createQuery(hql).setParameter("id", 1).list();
			session.close();
			return list ;
		}
		
		//this method is used to fetch the marksheet to download or view
		public Mstuploadstudmarksheet getMarksheet(int id)
		{
			Session session = this.sessionFactory.openSession();
			//String hql = "from Mstuploadstudmarksheet where intUploadStudMarksheetId=:id ";
			Mstuploadstudmarksheet mst = (Mstuploadstudmarksheet)session.get(Mstuploadstudmarksheet.class, id);
			session.close();
			return mst;
		}
		
		//this method is used to get the file related to notification
		public Tblinvites getNotificationFile(int id)
		{
			Session session = this.sessionFactory.openSession();
			Tblinvites invite = (Tblinvites)session.get(Tblinvites.class, id);
			session.close();
			return invite;
			
		}
		

		
		
}
