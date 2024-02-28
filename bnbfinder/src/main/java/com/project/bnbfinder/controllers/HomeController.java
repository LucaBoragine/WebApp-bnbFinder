package com.project.bnbfinder.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.bnbfinder.dao.DAOStrutture;

@Controller
public class HomeController {
	
	@Autowired
	private DAOStrutture ds;
	
	@GetMapping("/")
	public String home(Model model) {
		
		model.addAttribute("elencobnb", ds.leggiTutti());
		model.addAttribute("elencocitta", ds.elencocitta());
		
//		HttpSession session = request.getSession(false);
//		
//		if(session == null)
//			return "utenti/formlogin.html";
		
		return "home.jsp";		
	}
	
	
}
