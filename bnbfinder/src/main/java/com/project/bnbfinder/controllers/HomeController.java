package com.project.bnbfinder.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	public static void setModelUtente(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			 Map<String,String> utente = (Map<String,String>) session.getAttribute("utenteloggato");
			 model.addAttribute("utenteloggato",utente);
		}
	}
	
	@GetMapping("/")
	public String home(Model model, HttpServletRequest request) {
		model.addAttribute("elencobnb", ds.leggiTutti());
		model.addAttribute("elencocitta", ds.elencocitta());
		model.addAttribute("elencolocation", ds.elencolocation());
		model.addAttribute("labelsOptionals", ds.labelsOptionals());
		setModelUtente(model,request);
		
		return "home.jsp";		
	}

	@GetMapping("filter")
	public String filter(@RequestParam Map<String,String> map, Model model, HttpServletRequest request) {
		setModelUtente(model,request);
		model.addAttribute("elencocitta", ds.elencocitta());
		model.addAttribute("elencolocation", ds.elencolocation());
		model.addAttribute("elencobnb", ds.leggiTutti());
		model.addAttribute("labelsOptionals", ds.labelsOptionals());
		
		if(map.size()!=0) {
			model.addAttribute("elencobnb", ds.filtroHome(map));
		}
		
		/*
		 * if(!map.containsValue("Prezzo Massimo") && !map.containsValue("Citta'") ) {
		 * model.addAttribute("elencobnb",
		 * ds.cercaPerPrezzoECitta(Double.parseDouble(map.get("prezzo_max")),
		 * map.get("citta"))); }else { if(!map.containsValue("Citta'"))
		 * model.addAttribute("elencobnb", ds.cercaPerCitta(map.get("citta")));
		 * if(!map.containsValue("Prezzo Massimo"))
		 * model.addAttribute("elencobnb",ds.cercaPerPrezzo(Double.parseDouble(map.get(
		 * "prezzo_max")))); }
		 * 
		 * if(map.containsValue("1")) { Map<String,String> ris = (Map<String,String>)
		 * model.getAttribute("elencobnb"); Map<String,String> optionalsFilter =
		 * ds.optionalsPerStruttura(0); }
		 */
		return "home.jsp";
	}
}