package com.seekdigital.login.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seekdigital.entity.Mstlogin;
import com.seekdigital.login.dao.LoginDao;

@Repository
public class LoginDaoImpl implements LoginDao
{

	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public boolean login(int userId, String password) {
		boolean b = false;
		Session session = this.sessionFactory.openSession();
		String hql = "from Mstlogin where mstregistration.intRegistrationId='" + userId + "' AND txtPassword='" + password + "'";
		List<Mstlogin> list = session.createQuery(hql).list();
		if(!(list.isEmpty()))
		{
			b = true;
		}
		return b;
	}

}
