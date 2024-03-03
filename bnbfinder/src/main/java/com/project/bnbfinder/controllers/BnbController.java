package com.project.bnbfinder.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bnbfinder.dao.DAOStrutture;

@Controller
@RequestMapping("/bnb")
public class BnbController {

	@Autowired
	private DAOStrutture ds;

	@GetMapping("infobnb")
	public String elencobnb(@RequestParam("id") int idBnb, Model model, HttpServletRequest request)
	{
		model.addAttribute( "mappabnb" ,ds.cercaId(idBnb));
		model.addAttribute("optionals", ds.optionalsPerStruttura(idBnb));
		model.addAttribute( "altribnb" ,ds.cercaPerCitta(ds.cercaId(idBnb).get("citta")));
		HomeController.setModelUtente(model,request);
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			 String messPrenot = (String) session.getAttribute("messagep");
			 model.addAttribute("messagep",messPrenot);
			 session.removeAttribute("messagep");
		}
		
		return "infobnb.jsp";
	}

	@GetMapping("prenotazione")
	public String prenotazioni(@RequestParam Map<String,String> prenotazione, Model model, HttpServletRequest request)
	{	
		HttpSession session = request.getSession(false);
		Map<String,String> utente = (Map<String,String>) session.getAttribute("utenteloggato");
		prenotazione.put("id_utente", utente.get("id"));
		if(ds.prenotaStruttura(prenotazione)) {
			System.out.println("Prenotazione effettuata con successo");
			session.setAttribute("messagep", "Prenotazione effettuata con successo!");
		}
		else {
			System.out.println("Impossibile effetuare la prenotazione");
			session.setAttribute("messagep", "Impossibile effetuare la prenotazione");
		}		
		return "redirect:"+request.getHeader("Referer");
		
	}

	@GetMapping("formnuovo")
	public String formnuovo()
	{
		return "formnuovobnb.html";
	}

	@GetMapping("nuovobnb")
	public String nuovobnb(@RequestParam Map<String,String> inputform)
	{
		if(ds.create(inputform))
		{
			System.out.println("BNB inserito con successo");
			return "redirect:elencobnb";
		}
		else
		{
			System.out.println("BNB non inserito;: " + inputform);
			return "redirect:/";
		}
	}

	@GetMapping("eliminabnb")
	public String elimina(@RequestParam("id") int idElimina)
	{
		if(ds.delete(idElimina))
		{
			System.out.println("Eliminazione avvenuta ");
			return "redirect:elencobnb";
		}
		else
		{
			System.out.println("Errore nell'eliminazione del bnb con id: " + idElimina);
			return "redirect:/";
		}
	}
}