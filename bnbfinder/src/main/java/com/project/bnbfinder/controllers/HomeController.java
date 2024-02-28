package com.project.bnbfinder.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null)
			return "utenti/formlogin.html";
		else
		return "home.jsp";		
	}
	
	@GetMapping("elencocitta")
	public String elencocitta()
	{
		return "elencocitta.html";
	}
	
}
