package com.seekdigital.parent.daoImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transaction;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.seekdigital.parent.dao.ParentDAO;

@Repository("parentdao")
@Transactional
public class ParentDAOImpl implements ParentDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * Session session = null; Transaction tx = null;
	 */

	@Override
	public List<Mstregistration> getStudentInformationByName() {
		Session session = this.sessionFactory.openSession();

		String sn = "FROM Mstregistration as m where m.tblrolename.intRoleId = 1";

		/*
		 * org.hibernate.Query query =
		 * this.sessionFactory.getCurrentSession().createQuery(sn);
		 */
		org.hibernate.Query query = session.createQuery(sn);
		List<Mstregistration> result = query.list();
		session.close();
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Mstregistration> getStudentDetailByName(String studentName) {
		Session session = this.sessionFactory.openSession();
		String sn = "from Mstregistration c where c.txtFirstName like '" + studentName + "%'";
		org.hibernate.Query query = session.createQuery(sn);
		System.out.println("Query=" + query);
		List<Mstregistration> result = query.list();
		session.close();
		return result;
	}

	@Override
	public List<Trnattendancerecord> getStudentAttendanceByName() {
		Session session = this.sessionFactory.openSession();
		String sn = "from Trnattendancerecord";
		org.hibernate.Query query = session.createQuery(sn);
		System.out.println("Query=" + query);
		List<Trnattendancerecord> result = query.list();
		session.close();
		return result;
	}

	/*@Override
	public List<Mstregistration> getStudentMarksByName() {
		// TODO Auto-generated method stub
		String sn = "from Mstregistration";
		org.hibernate.Query query = this.sessionFactory.getCurrentSession().createQuery(sn);
		System.out.println("Query=" + query);
		List<Mstregistration> result = query.list();

		return result;
	}
*/
	//a
	@Override
	public List<Mstuploadstudmarksheet> getStudentMarksByName() {
		Session session = this.sessionFactory.openSession();
		String sn = "from Mstuploadstudmarksheet";
		 org.hibernate.Query query =  session.createQuery(sn);
		 System.out.println("Query=" +query);
		 List<Mstuploadstudmarksheet> result= query.list();
		 session.close();
		
		 return result;
	}
	@Override
	public void leaveApp(Trnstudentleaveapp trnLeave) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		trnLeave.setIntStatus(1);
		session.saveOrUpdate(trnLeave);
		session.close();
	}

	@Override
	public List<Mstleave> getLeave() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		String sn = "from Mstleave";
		org.hibernate.Query query = session.createQuery(sn);
		List<Mstleave> result = query.list();
		session.close();
		return result;
	}

	@Override
	public List<Mststudenttimetable> getStudentTimeTable(String studentName) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		String hql = "from Mststudenttimetable ";
		org.hibernate.Query query = session.createQuery(hql);

		List<Mststudenttimetable> result = query.list();
		session.close();
		return result;
	}

	@Override
	public List<Trnattendancerecord> getStudentAttendanceBetweenTwoDates(Date d1, Date d2) {
		/*
		 * List<Trnattendancerecord> list =
		 * this.sessionFactory.getCurrentSession()
		 * .createCriteria(Trnattendancerecord.class).add(Restrictions.between(
		 * "dtSlotDate", d1, d2)).list();
		 */
		Session session = this.sessionFactory.openSession();
		/*
		 * String hql =
		 * "FROM Trnattendancerecord AS t WHERE t.mstregistration.intRegistrationId = 2 and "
		 * + "t.dtSlotDate between '" + d1 + "' and  '" + d2 + "' ";
		 */
		String hql = "FROM Trnattendancerecord AS t WHERE "
				+ "t.mstregistration.intRegistrationId = 4 and t.dtSlotDate between '" + d1 + "' and '" + d2 + "'";

		org.hibernate.Query query = session.createQuery(hql);
		List<Trnattendancerecord> result = query.list();

		session.close();
		return result;
	}

	@Override
	public List<Tblhomework> getStudentHomeWorkByName(String studentName, Date date) {

		Session session = this.sessionFactory.openSession();
		String hql = "from Mstregistration  m INNER JOIN Tblhomework ON m.intClassId = Tlhomework.intClassId"
				+ "and m.intSectionId = Tblhomework.intSectionId where m.txtFirstName ='" + studentName + "'";

		String hql1 = "select t.txtSubject,t.txtHomeWork,t.dtDueDate from Mstregistration m,Tblhomework t where"
				+ " (m.mststudclass.intClassId = t.mststudclass.intClassId and m.mststudclasssection.intSectionId"
				+ "=t.mststudclasssection.intSectionId) and m.txtFirstName ='" + studentName
				+ "' AND t.dtAssignDate =:d";
		
		/*String s = "SELECT t.txtSubject,t.txtHomeWork,t.dtDueDate FROM Mstregistration m,Tblhomework t "
				+ "WHERE (m.intClassId = t.intClassId AND m.intSectionId=t.intSectionId) "
				+ "AND m.txtFirstName ='"+studentName+"' AND t.dtAssignDate = '"+date+"'";*/
		org.hibernate.Query query = session.createQuery(hql1);
		query.setDate("d", date);
		
		List<Tblhomework> homeworkList = new ArrayList<>();
		List<Object[]> list = query.list();
		System.out.println("list:"+list);
		session.close();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Tblhomework tblhomework = new Tblhomework();
			for (int i = 0; i < objects.length; i++) {
				System.out.println("........"+objects[i]);

				tblhomework.setTxtSubject((String) objects[0]);
				tblhomework.setTxtHomeWork((String) objects[1]);
				tblhomework.setDtDueDate((Date) objects[2]);
			}
			homeworkList.add(tblhomework);
		}
		System.out.println("query success");
		return homeworkList;
	}

	@Override
	public List<Tblhomework> getStudentHomeWorkByName(String studentName) {

		Session session = this.sessionFactory.openSession();
		String hql = "from Mstregistration  INNER JOIN Tblhomework ON intClassId = Tlhomework.intClassId"
				+ "and m.intSectionId = Tblhomework.intSectionId where m.txtFirstName ='" + studentName + "'";

		String hql1 = "select t.txtSubject,t.txtHomeWork,t.dtDueDate from Mstregistration m,Tblhomework t where"
				+ " (m.mststudclass.intClassId = t.mststudclass.intClassId and m.mststudclasssection.intSectionId"
				+ "=t.mststudclasssection.intSectionId) and m.txtFirstName ='" + studentName + "'";
		org.hibernate.Query query = session.createQuery(hql1);
		List<Tblhomework> homeworkList = new ArrayList<>();
		List<Object[]> list = query.list();
		session.close();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Tblhomework tblhomework = new Tblhomework();
			for (int i = 0; i < objects.length; i++) {
				System.out.println(objects[i]);

				tblhomework.setTxtSubject((String) objects[0]);
				tblhomework.setTxtHomeWork((String) objects[1]);
				tblhomework.setDtDueDate((Date) objects[2]);
			}
			homeworkList.add(tblhomework);
		}
		System.out.println("query success");
		return homeworkList;
	}

	@Override
	public List<Mstteacherproject> getStudentProjectByName(String studentName) {
		Session session = this.sessionFactory.openSession();
		String hql1 = "select t.txtProjectName,t.txtProjectDescription,t.dtDueDate from Mstregistration m,Mstteacherproject t where"
				+ " (m.mststudclass.intClassId = t.mststudclass.intClassId and m.mststudclasssection.intSectionId"
				+ "=t.mststudclasssection.intSectionId) and m.txtFirstName ='" + studentName + "'";
		org.hibernate.Query query = session.createQuery(hql1);
		List<Mstteacherproject> projectWorkList = new ArrayList<>();
		List<Object[]> list = query.list();
		session.close();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Mstteacherproject mstteacherproject = new Mstteacherproject();
			for (int i = 0; i < objects.length; i++) {
				System.out.println(objects[i]);

				mstteacherproject.setTxtProjectName((String) objects[0]);
				mstteacherproject.setTxtProjectDescription((String) objects[1]);
				mstteacherproject.setDtDueDate((Date) objects[2]);
			}
			projectWorkList.add(mstteacherproject);
		}
		System.out.println("query success");
		return projectWorkList;
	}

	@Override
	public List<Trnattendancerecord> getStudentAttendanceByName(String studentName) {

		Session session = this.sessionFactory.openSession();
		String hql1 = "Select dtSlotTime, dtSlotDate,mstregistration from Trnattendancerecord as t where t.mstregistration.txtFirstName "
				+ "= '" + studentName + "' and t.dtSlotDate = current_date()";
		org.hibernate.Query query = session.createQuery(hql1);
		// List<Trnattendancerecord> result = query.list();
		// return result;
		List<Trnattendancerecord> atdList = new ArrayList<>();
		List<Object[]> list = query.list();
		session.close();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Trnattendancerecord trnattendancerecord = new Trnattendancerecord();
			for (int i = 0; i < objects.length; i++) {
				System.out.println(objects[i]);
				trnattendancerecord.setDtSlotTime((String) objects[0]);
				trnattendancerecord.setDtSlotDate((Date) objects[1]);
			}
			atdList.add(trnattendancerecord);
		}
		System.out.println("query success");
		return atdList;
	}

	@Override
	public List<Tblinvites> getNotificationByStudentName(String studentName) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		/*String hql = "SELECT distinct t.txtInvitationTitle,t.txtBody,t.dtDate FROM Mstregistration m , Tblinvites t WHERE "
				+ "(m.mststudclass.intClassId = t.mststudclass.intClassId AND "
				+ "m.mststudclasssection.intSectionId=t.mststudclasssection.intSectionId)"
				+ " AND m.txtFirstName='"
				+ studentName + "' OR (t.mststudclass.intClassId =13) OR (m.mststudclass.intClassId = t.mststudclass.intClassId"
						+ " AND t.mststudclasssection.intSectionId = 5)";*/
		
		String hql= "SELECT i.dtDate, i.txtInvitationTitle , i.txtBody,i.intInvitesId FROM Tblinvites"
				+ " AS i INNER JOIN Mstregistration AS r ON ((i.intClassId=r.intClassId "
				+ "AND i.intSectionId=r.intSectionId) "
				+ "OR (i.intSectionId=5 AND i.intClassId=r.intClassId) OR ( "
				+ "i.intClassId=13)) WHERE r.txtFirstName='"
				+ studentName + "'";

		org.hibernate.Query query = session.createSQLQuery(hql);
		
		
		List<Tblinvites> tblntfList = new ArrayList<>();
		List<Object[]> list = query.list();
		session.close();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Tblinvites tblinvites = new Tblinvites();
			for (int i = 0; i < objects.length; i++) {
				//System.out.println("================="+objects[i]);
				tblinvites.setTxtInvitationTitle((String) objects[1]);
				tblinvites.setTxtBody((String) objects[2]);
				tblinvites.setDtDate((Date) objects[0]);
				tblinvites.setIntInvitesId((Integer) objects[3]);
			}
			tblntfList.add(tblinvites);
		}
		System.out.println("query success for invitation sent to student");
		return tblntfList;
	}
	
	
	@Override
	public List<Mstteacherinvite> getNotificationToStudentNameByTeacher(String studentName) {
		Session session = this.sessionFactory.openSession();
		//AND m.intRegistrationId = t.mstregistration.intRegistrationId
		String hql = "SELECT t.dtInvitesDate,t.txtMessage FROM Mstregistration m , Mstteacherinvite t WHERE "
				+ "(m.mststudclass.intClassId = t.mststudclass.intClassId AND "
				+ "m.mststudclasssection.intSectionId=t.mststudclasssection.intSectionId"
				+ " )  AND m.txtFirstName='"
				+ studentName + "'";

		org.hibernate.Query query = session.createQuery(hql);
		List<Mstteacherinvite> tblntfListSentByTeacher = new ArrayList<>();
		List<Object[]> list = query.list();
		session.close();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Mstteacherinvite mstteacherinvite = new Mstteacherinvite();
			for (int i = 0; i < objects.length; i++) {
				//System.out.println("====== "+objects[i]);
				mstteacherinvite.setDtInvitesDate((Date)objects[0]);
				mstteacherinvite.setTxtMessage((String)objects[1]);
			}
			tblntfListSentByTeacher.add(mstteacherinvite);
		}
		System.out.println("query success for invitation sent by teacher");
		return tblntfListSentByTeacher;
	}
	@Override
	public void update(Mstregistration m, int id) {
	
		Session session = this.sessionFactory.openSession();
		String hql = "update from Mstregistration set txtPerAddress=:address,txtFmobileNumber=:Fnumber,"
				+ "txtMmobileNumber=:Mnumber,txtFotherNumber=:emergencyFNumber,txtMotherNumber=:emergencyMNumber where intRegistrationId=:id";
		
		org.hibernate.Query query = session.createQuery(hql);
		
		query.setParameter("address", m.getTxtPerAddress());
		query.setParameter("Fnumber", m.getTxtFmobileNumber());
		query.setParameter("Mnumber", m.getTxtMmobileNumber());
		query.setParameter("emergencyFNumber", m.getTxtFotherNumber());
		query.setParameter("emergencyMNumber", m.getTxtMotherNumber());
		query.setParameter("id", m.getIntRegistrationId());
		int i= query.executeUpdate();
		session.close();

	}

	/*
	 * @Override public List<Object[]> getStuTimeTablebyClass() { String sn =
	 * "Select txtClassTimings, mstsubject.txtSubjectName, tbldaysofweek.txtDay from"
	 * +
	 * " Mststudenttimetable where mststudclass.intClassId=9 and mststudclasssection.intSectionId=1 ORDER "
	 * +
	 * "BY txtClassTimings, FIELD(tbldaysofweek.txtDay, 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')"
	 * ; org.hibernate.Query query =
	 * this.sessionFactory.getCurrentSession().createQuery(sn); List<Object[]>
	 * result = query.list(); return result;
	 * 
	 * }
	 */

	//a
	public List<Object[]> getStuTimeTablebyClass() {
		Session session = this.sessionFactory.openSession();
		/*String sn = "Select txtClassTimings, mstsubject.txtSubjectName, tbldaysofweek.txtDay from Mststudenttimetable where mststudclass.intClassId=2 and mststudclasssection.intSectionId=2 ORDER BY txtClassTimings, FIELD(tbldaysofweek.txtDay, 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')";*/
		String sn = "SELECT t.txtClassTimings,s.txtSubjectName,w.txtDay FROM Mststudenttimetable as t,Tbldaysofweek as w,"
				+ "Mstsubject as s , Mststudclass as c,Mststudclasssection as sec WHERE c.intClassId=t.mststudclass.intClassId AND "
				+ "sec.intSectionId=t.mststudclasssection.intSectionId AND w.intDaysId = t.tbldaysofweek.intDaysId "
				+ "AND s.intSubjectId= t.mstsubject.intSubjectId ORDER BY t.txtClassTimings,"
				+ "FIELD(w.txtDay, 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')";		
		org.hibernate.Query query =session.createQuery(sn);
		List<Object[]> result = query.list();
		session.close();
		//..........
		List l = new ArrayList();
		for (Iterator iterator = result.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Mststudenttimetable tblinvites = new Mststudenttimetable();
			for (int i = 0; i < objects.length; i++) {
				System.out.println(objects[i]);
				tblinvites.setTxtClassTimings((String) objects[0]);
				
				//tblinvites.setTxtBody((String) objects[1]);
				//tblinvites.setDtDate((Date) objects[2]);
			}
			l.add(tblinvites);
		}

		return result;
	}

	@Override
	public List<Trnstudentleaveapp> getStudentLeaveInbox(int id) {
		Session session = this.sessionFactory.openSession();
		/*
		 * List<Trnstudentleaveapp> list =
		 * session.createCriteria(Trnstudentleaveapp.class)
		 * .add(Restrictions.eq("mstregistration.intRegistrationId",
		 * id)).list();
		 */
		// SELECT
		// t.dtAppliedDate,t.dtFromDate,t.dtToDate,t.txtReason,t.intStatus,t.dtApprovedDate
		// from
		String hql = " from Trnstudentleaveapp t WHERE t.mstregistration.intRegistrationId='" + id + "'";
		org.hibernate.Query query = session.createQuery(hql);
		List<Trnstudentleaveapp> list = query.list();

		session.close();
		return list;
	}
	
	
	@Override
    public Mstuploadstudmarksheet getMarkSheet(int id) {
            Session s = this.sessionFactory.openSession();
            Mstuploadstudmarksheet m = (Mstuploadstudmarksheet) s.get(Mstuploadstudmarksheet.class, id);
            s.close();
            return m;

    }

    @Override
    public Tblinvites getNotificationById(int id) {
            Session s = this.sessionFactory.openSession();
            Tblinvites m = (Tblinvites) s.get(Tblinvites.class, id);
            s.close();
            return m;
    }

}