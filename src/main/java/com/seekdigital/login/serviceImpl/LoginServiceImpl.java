package com.seekdigital.login.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seekdigital.login.dao.LoginDao;
import com.seekdigital.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao loginDao;

	@Transactional
	public boolean login(int userId, String password) {
		return loginDao.login(userId, password);
	}
}
