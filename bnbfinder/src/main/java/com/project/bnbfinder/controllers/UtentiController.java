package com.project.bnbfinder.controllers;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bnbfinder.dao.DAOStrutture;
import com.project.bnbfinder.dao.DAOUtenti;

@Controller
@RequestMapping("/utenti")
public class UtentiController
{	
	@Autowired
	private DAOUtenti du;
	
	
	@GetMapping("profilo")
	public String profilo(@RequestParam("id") int idUtente, Model model, HttpServletRequest request) {
		HomeController.setModelUtente(model,request);
		model.addAttribute("elencopronotbnb",du.prenotPerUtente(idUtente));		
		return "profilo.jsp";
	}
	
	@GetMapping("eliminaprenot")
	public String profilo(@RequestParam("id") int idPrenot, HttpServletRequest request) {
		if(du.eliminaPrenot(idPrenot)) {
			System.out.println("Prenotazione eliminata con successo.");			
		}
		else {
			System.out.println("Impossibile eliminare prenotazione");			
		}
		return "redirect:"+request.getHeader("Referer"); 
	}
	
	@GetMapping("formnuovoutente")
	public String formNuovoUtente()
	{
		return "/utenti/formnuovoutente.jsp";
	}
	
	@PostMapping("registrati")
	public String registrati( @RequestParam Map<String,String> nuovoUtente, HttpServletRequest request, Model model)
	{
		if(du.create(nuovoUtente)) {
			System.out.println("Utente creato con successo");
			model.addAttribute("message", "Utente creato con successo!");
		}
		else {
			System.out.println("Impossibile creare l'utente");
			model.addAttribute("message", "Impossibile creare l'utente");
		}
		
		return "/utenti/formnuovoutente.jsp";
	}
	
	@GetMapping("formlogin")
	public String formlogin()
	{
		return "/utenti/formlogin.html";
	}
	
	@PostMapping("login")
	public String login(	@RequestParam("username") String u,
							@RequestParam("password") String p,
							HttpServletRequest request, Model model)
	{
		Map<String,String> utente = du.trovaUtente(u, p);
		System.out.println("Utente: " + utente);
		if(utente != null)
		{	
			HttpSession session = request.getSession(true);
			session.setAttribute("utenteloggato",utente);
		}
		return "redirect:"+request.getHeader("Referer");
	}

	private void deleteCookies(	HttpServletRequest request,
								HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie : cookies){
            cookie.setMaxAge(0);
            cookie.setPath(request.getContextPath() + "/");
            response.addCookie(cookie);
        }
	}

	@GetMapping("logout")
	public String logout(HttpServletRequest request,
	                     HttpServletResponse response) {
	    HttpSession	session = request.getSession(false);
	    try {
	    	System.out.println(session.getAttribute("utenteloggato"));
	        if (session != null) {
	            session.invalidate();
	            deleteCookies(request, response);
	            System.out.println("Sessione invalidata con successo");
	        }
	        
	    } catch (IllegalStateException e) {
	        e.printStackTrace();
	        System.out.println("Impossibile chiudere la sessione");
	    }
	    return "redirect:"+request.getHeader("Referer");
	}
}