package com.seekdigital.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seekdigital.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	@RequestMapping(value = "check.web")
	public String login(HttpServletRequest request,ModelMap map)
	{
		boolean login = loginService.login(Integer.parseInt(request.getParameter("username")),request.getParameter("password"));
		if(login)
		{
			return "ad_index";
			
		}

		else
		{
			map.addAttribute("msg", "Invalid username or password");
			return "login";
		}
		
	}
}
