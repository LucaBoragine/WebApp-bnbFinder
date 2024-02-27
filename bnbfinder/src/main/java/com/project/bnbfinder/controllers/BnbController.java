package com.project.bnbfinder.controllers;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/bnb")
public class BnbController {
	
	@Autowired
	private DAOStrutture ds;
	
	@GetMapping("elencobnb")
	public String elencobnb(Model model)
	{
		model.addAttribute("NomeSito", "AirBNB");
		model.addAttribute("elencobnb", ds.leggiTutti());
		return"elencobnb.jsp";
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
