package com.seekdigital.student.daoImpl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.seekdigital.student.dao.StudentDao;


@Repository("studentdao")
public class StudentDaoImpl implements StudentDao{
@Autowired
SessionFactory sessionFactory;
//Student Profile
@SuppressWarnings("unchecked")
public List<Mstregistration> getParentInformationByName(){
	Session session = this.sessionFactory.openSession();
	String sn = "from Mstregistration where intRegistrationId=4";
	 org.hibernate.Query query =  session.createQuery(sn);
	 System.out.println("Query=" +query);
	 List<Mstregistration> result= query.list();
	session.close();
	 return result;
}

//student question and answer
/*@Override
public List<Mstsubject> getStudentQuestionByName() {
	
	String sn = "from Mstsubject";
	 org.hibernate.Query query =  this.sessionFactory.getCurrentSession().createQuery(sn);
	 System.out.println("Query=" +query);
	 List<Mstsubject> result= query.list();
	System.out.println("sucess");
	for (Iterator iterator = result.iterator(); iterator.hasNext();) {
		Mstsubject mstsubject = (Mstsubject) iterator.next();
		System.out.println(mstsubject.getTxtSubjectName());
		
	}
	 return result;
}

@Override
public void addQuestion(Mstquestionandanswer mq) {
	
	this.sessionFactory.getCurrentSession().save(mq);
}

@Override
public List<Mstquestionandanswer> getList() {
	String hql = "from Mstquestionandanswer";
	org.hibernate.Query q = this.sessionFactory.getCurrentSession().createQuery(hql);
	List<Mstquestionandanswer> list = q.list();
	for (Iterator iterator = list.iterator(); iterator.hasNext();) {
		Mstquestionandanswer mstquestionandanswer = (Mstquestionandanswer) iterator.next();
		System.out.println(mstquestionandanswer.getTxtQuestion());
	}
	return list;
}*/

@Override
public List<Mstsubject> getStudentQuestionByName() {
	Session session = this.sessionFactory.openSession();
	String sn = " from Mstsubject";
	 org.hibernate.Query query =  session.createQuery(sn);
	 System.out.println("Query=" +query);
	 List<Mstsubject> result= query.list();
	 session.close();
	/*System.out.println("sucess");
	for (Iterator iterator = result.iterator(); iterator.hasNext();) {
		Mstsubject mstsubject = (Mstsubject) iterator.next();
		System.out.println(mstsubject.getTxtSubjectName());
		
	}*/
	 return result;
}

@Override

public List<String> getTeacherName() {
	// TODO Auto-generated method stub
	Session s= this.sessionFactory.openSession();
	String hql = "SELECT m.txtFirstName FROM Mstquestionandanswer AS t,Mstregistration "
			+ "AS m WHERE m.intRegistrationId = t.intTeacherId";
	 org.hibernate.Query q=s.createQuery(hql);
	// List<Mstquestionandanswer> result= q.list();
		List<String> mstquestionandanswers = new ArrayList<>();
		List list = q.list();
		//System.out.println(list);
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] objects = (Object[]) iterator.next();
			Mstquestionandanswer a = new Mstquestionandanswer();
			for (int i = 0; i < objects.length; i++) {
				System.out.println(objects[i]);
				mstquestionandanswers.add((String)objects[0]);
				
			}
		}
		//System.out.println("query success");
	 s.close();
	return list;
}
@Override
public void addQuestion(Mstquestionandanswer mq) {
	Session s=sessionFactory.openSession();
	s.save(mq);
	s.close();
}

@Override
public List<Mstquestionandanswer> getList() {
	//String hql = "from Mstquestionandanswer";
	Session session = this.sessionFactory.openSession();
	String hql = "from  Mstquestionandanswer where txtAnswer is not null  and intTeacherId is not null";
	org.hibernate.Query q = session.createQuery(hql);
	//System.out.println("before list");
	List<Mstquestionandanswer> list = q.list();
	//System.out.println("after list");
	/*for (Iterator iterator = list.iterator(); iterator.hasNext();) {
		Mstquestionandanswer mstquestionandanswer = (Mstquestionandanswer) iterator.next();
		System.out.println("in dao impl " + mstquestionandanswer.getTxtQuestion());
	}
	System.out.println("success");*/
	session.close();
	return list;
}

@Override
public List<Mstquestionandanswer> getTeacherNameAll(int classjj) {
	// TODO Auto-generated method stub
	Session s= this.sessionFactory.openSession();
	
	String hql = "from Mstquestionandanswer where intClassId=:intClassId";
	org.hibernate.Query q=s.createQuery(hql);
	q.setParameter("intClassId", classjj);
	List<Mstquestionandanswer> list= q.list();
	System.out.println("dao...................");
	System.out.println(list);
	s.close();
	return list;
	/*String hql = "SELECT m.txtFirstName,t.txtQuestion,t.txtAnswer,m.tblrolename.intRoleId FROM Mstquestionandanswer as t,Mstregistration as m WHERE"
			+ " t.intTeacherId = m.intRegistrationId OR t.mstregistration.intRegistrationId= m.intRegistrationId";
	org.hibernate.Query q=s.createQuery(hql);
	List<Mstquestionandanswer> homeworkList = new ArrayList<>();
	List<Object[]> list = q.list();
	for (Iterator iterator = list.iterator(); iterator.hasNext();) {
		Object[] objects = (Object[]) iterator.next();
		Mstquestionandanswer tblhomework = new Mstquestionandanswer();
		Mstregistration mstregistration = new Mstregistration();
		Tblrolename tblrolename = new Tblrolename();
		for (int i = 0; i < objects.length; i++) {
			//System.out.println(objects[i]);
			mstregistration.setTxtFirstName((String)objects[0]);
			
			tblhomework.setTxtQuestion((String)objects[1]);
			tblhomework.setTxtAnswer((String)objects[2]);
			tblrolename.setIntRoleId((Integer)objects[3]);
			mstregistration.setTblrolename(tblrolename);
			tblhomework.setMstregistration(mstregistration);
			
		}
		homeworkList.add(tblhomework);
	}
	System.out.println("query success");
	return homeworkList;*/
}


@Override
public String getTeachName(int teachId) {
Session s= this.sessionFactory.openSession();
	
	String hql = "SELECT a.txtFirstName FROM Mstregistration a where a.intRegistrationId=:intRegistrationId";
	org.hibernate.Query q=s.createQuery(hql);
	q.setParameter("intRegistrationId", teachId);
	q.uniqueResult();
	List<String> nameList=q.list();
	String res=null;
	for(String ss:nameList){
		res=ss;
	}
	s.close();
return res;
}

@Override
public Mstregistration getClass(int stuId) {
Session s= this.sessionFactory.openSession();
System.out.println("bfr............");
Mstregistration aa=(Mstregistration) s.get(Mstregistration.class, stuId);
System.out.println("after..............");
System.out.println(aa);
s.close();
	return aa;
}

//student timetable

public List<Object[]> getStuTimeTablebyClass() {
	Session session = this.sessionFactory.openSession();
	/*String sn = "Select txtClassTimings, mstsubject.txtSubjectName, tbldaysofweek.txtDay from Mststudenttimetable "
			+ "where mststudclass.intClassId=2 and mststudclasssection.intSectionId=2 ORDER BY txtClassTimings, "
			+ "FIELD(tbldaysofweek.txtDay, 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')";*/
	
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
//student notification
public List<Tblinvites> getStudentNotificationByName() {

    Session s = this.sessionFactory.openSession();

    

    String hql= "SELECT i.intInvitesId,i.dtDate, i.txtInvitationTitle , i.txtBody FROM Tblinvites"+
    " AS i INNER JOIN Mstregistration AS r ON ((i.intClassId=r.intClassId "
                 + "AND i.intSectionId=r.intSectionId) "
                 + "OR (i.intSectionId=5 AND i.intClassId=r.intClassId) OR ( "
                  + "i.intClassId=13)) WHERE r.intRegistrationId=4";



    org.hibernate.Query query = s.createSQLQuery(hql);

    List<Tblinvites> tblntfList = new ArrayList<>();
    List<Object[]> list = query.list();
    s.close();
    for (Iterator iterator = list.iterator(); iterator.hasNext();)
{
           Object[] objects = (Object[]) iterator.next();
           Tblinvites tblinvites = new Tblinvites();
           for (int i = 0; i < objects.length; i++) {
System.out.println("================="+objects[i]);
                 tblinvites.setTxtInvitationTitle((String)
objects[2]);
                 tblinvites.setTxtBody((String) objects[3]);
                 tblinvites.setDtDate((Date) objects[1]);
                 tblinvites.setIntInvitesId((Integer) objects[0]);
           }
           tblntfList.add(tblinvites);
    }
    System.out.println("query success for invitation sent student");
    return tblntfList;







}


@Override
public Tblinvites getAdminNotification(Integer id) {
	Session s = this.sessionFactory.openSession();
	Tblinvites m = (Tblinvites) s.get(Tblinvites.class, id);
	s.close();
	return m;
}

@Override
public List<Mstteacherinvite> getTeacherNotificationByName() {
	Session s= this.sessionFactory.openSession();
	 org.hibernate.Query q=s.createQuery("from Mstteacherinvite");
	 List<Mstteacherinvite> result= q.list();
	 s.close();
	 return result;
}

//student marks



@Override
public Mstuploadstudmarksheet getMarkSheet(int id) {
	Session s = this.sessionFactory.openSession();
	Mstuploadstudmarksheet m = (Mstuploadstudmarksheet) s.get(Mstuploadstudmarksheet.class, id);
	s.close();
	return m;

}

@SuppressWarnings("unchecked")
@Override
public List<Mstuploadstudmarksheet> getStudentMarksByName() {	
	 Session s= this.sessionFactory.openSession();
	 org.hibernate.Query q=s.createQuery("from Mstuploadstudmarksheet");
	 List<Mstuploadstudmarksheet> result= q.list();
	 s.close();
	 return result;
}

/*@Override
public List<Object[]> getStuTimeTablebyClass() {
	// TODO Auto-generated method stub
	return null;
}*/

//student attendance
@SuppressWarnings("unchecked")
@Override
public List<Trnattendancerecord> getStudAttendance(int studId, java.util.Date curDt) {
	Session session = this.sessionFactory.openSession();
	String hql = "from Trnattendancerecord t where t.mstregistration.intRegistrationId= :intRegistrationId and t.dtSlotDate= :dtSlotDate"; //
	org.hibernate.Query q = session.createQuery(hql);

	q.setParameter("intRegistrationId", studId);
	q.setParameter("dtSlotDate", curDt);
	List<Trnattendancerecord> list = q.list();
	session.close();
	return list;
}

@SuppressWarnings("unchecked")
@Override
public String getStuNames(int studId) {
	Session session = this.sessionFactory.openSession();
	String hql = "SELECT a.txtFirstName FROM Mstregistration a where a.intRegistrationId= :intRegistrationId";
	org.hibernate.Query q = session.createQuery(hql);
	q.setParameter("intRegistrationId", studId);
	q.uniqueResult();

	List<String> results = q.list();
	session.close();
	System.out.println(results);
	String res = null;
	for (String s : results) {
		res = s;
	}
	System.out.println(res);
	return res;
}

@SuppressWarnings("unchecked")
@Override
public List<Integer> getStudentListe(int intRegistrationId) {
	Session session = this.sessionFactory.openSession();
	String hql = "SELECT p.intRegistrationId FROM Mstregistration p where p.intRegistrationId= :intRegistrationId";
	org.hibernate.Query q = session.createQuery(hql);
	/*q.setParameter("intClassId", intClassId);
	q.setParameter("intSectionId", intSectionId);*/
	q.setParameter("intRegistrationId", intRegistrationId);
	q.uniqueResult();

	List<Integer> lists = q.list();
	session.close();
	return lists;
}

@SuppressWarnings("unchecked")
@Override
public List<Trnattendancerecord> getStudentAttendFromToDate(java.util.Date startDate, java.util.Date endDate, int id) {
	Session session = this.sessionFactory.openSession();
	List<Trnattendancerecord> list =session
			.createQuery("FROM Trnattendancerecord AS c WHERE c.dtSlotDate BETWEEN :startDate AND :endDate and c.mstregistration.intRegistrationId= :id")
			.setParameter("startDate", startDate)
			.setParameter("endDate", endDate)
			.setParameter("id", id)
			
			/*.createCriteria(Trnattendancerecord.class)
			.add(Restrictions.between("dtSlotDate", startDate, endDate))*/
			 
			.list();
	session.close();
	return list;

}

//homework
@SuppressWarnings("unchecked")
public List<Tblhomework> getHW(java.util.Date aDt) {
	Session session = sessionFactory.openSession();
	String hql = "from Tblhomework where dtAssignDate= :dtAssignDate"; //
	org.hibernate.Query q = session.createQuery(hql);

	q.setParameter("dtAssignDate", aDt);

	List<Tblhomework> list = q.list();
	System.out.println(list.size());
	session.close();
	return list;

}

@Override
public List<Mstteacherproject> getProject(java.util.Date curDt) {
	String hql = "from Mstteacherproject t where t.dtAssignDate= :dtAssignDate";
	org.hibernate.Query q = sessionFactory.getCurrentSession().createQuery(hql);

	q.setParameter("dtAssignDate", curDt);

	List list = q.list();
	return list;
}

@Override
public List<Tblhomework> getHWFromTo(Date oneWeekBefore, Date curDt, int id) {
	Session session = sessionFactory.openSession();
	List<Tblhomework> list = session
			.createQuery(
					"FROM Tblhomework AS c WHERE c.dtAssignDate BETWEEN :oneWeekBefore AND :curDt and c.mstregistration.intRegistrationId= :id")
			.setParameter("oneWeekBefore", oneWeekBefore).setParameter("curDt", curDt).setParameter("id", id)
			.list();
	session.close();

	return list;
}

@Override
public List<Mstteacherproject> getProFromTo(Date oneWeekBefore, Date curDt, int id) {
	Session session = sessionFactory.openSession();
	List<Mstteacherproject> list = session
			.createQuery(
					"FROM Mstteacherproject AS c WHERE c.dtAssignDate BETWEEN :oneWeekBefore AND :curDt and c.mstregistration.intRegistrationId= :id")
			.setParameter("oneWeekBefore", oneWeekBefore).setParameter("curDt", curDt).setParameter("id", id)
			.list();
	session.close();

	return list;
}

@Override
public String getTeacherName(int teachId) {
	Session session = sessionFactory.openSession();

	String hql = "SELECT a.txtFirstName FROM Mstregistration a where a.intRegistrationId= :intRegistrationId";
	org.hibernate.Query q = session.createQuery(hql);
	q.setParameter("intRegistrationId", teachId);
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






}
