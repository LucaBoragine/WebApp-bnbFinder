package com.project.bnbfinder.controllers;

import java.util.Map;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("filter")
	public String filter(@RequestParam Map<String,String> map, Model model) {
		model.addAttribute("elencocitta", ds.elencocitta());
		if(!map.get("prezzo_max").equalsIgnoreCase("Prezzo Massimo") && !map.get("citta").equalsIgnoreCase("Citta'") ) {
			model.addAttribute("elencobnb", ds.cercaPerPrezzoECitta(Double.parseDouble(map.get("prezzo_max")), map.get("citta")));
		}else {
			if(!map.get("citta").equalsIgnoreCase("Citta'"))
				model.addAttribute("elencobnb", ds.cercaPerCitta(map.get("citta")));
			if(!map.get("prezzo_max").equalsIgnoreCase("Prezzo Massimo"))
				model.addAttribute("elencobnb",ds.cercaPerPrezzo(Double.parseDouble(map.get("prezzo_max"))));
		}		
		return "home.jsp";
	}
}