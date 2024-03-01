package com.project.bnbfinder.controllers;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bnbfinder.dao.DAOUtenti;

@Controller
@RequestMapping("/utenti")
public class UtentiController
{	
	@Autowired
	private DAOUtenti du;
	
	@GetMapping("formnuovoutente")
	public String formNuovoUtente()
	{
		return "/utenti/formnuovoutente.html";
	}
	
	@GetMapping("registrati")
	public String registrati( @RequestParam Map<String,String> nuovoUtente)
	{
		if(du.create(nuovoUtente))
			System.out.println("Utente creato con successo");
		else
			System.out.println("Impossibile creare l'utente");
		return "redirect:/";
	}
	
	@GetMapping("formlogin")
	public String formlogin()
	{
		return "/utenti/formlogin.html";
	}
	
	@GetMapping("login")
	public String login(	@RequestParam("username") String u,
							@RequestParam("password") String p,
							HttpServletRequest request)
	{
		Map<String,String> utente = du.trovaUtente(u, p);
		System.out.println("Utente: " + utente);
		if(utente != null)
		{	
			HttpSession session = request.getSession(true);
			session.setAttribute("utenteloggato",utente);
		}
		return "redirect:/";
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
	        } else {
	            System.out.println("Sessione non trovata");
	        }
	    } catch (IllegalStateException e) {
	        e.printStackTrace();
	        System.out.println("Impossibile chiudere la sessione");
	    }
	    return "redirect:/";
	}
}