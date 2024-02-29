package com.project.bnbfinder.dao;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import database.Database;

public class DAOUtenti
{
	@Autowired
	private Database db;
	
	public Map<String,String> trovaUtente(String username, String password)
	{
		String query = 	"select	*\r\n" + 
						"from	utenti\r\n" + 
						"where	username = ?\r\n" + 
						"		and\r\n" + 
						"        password = ?";
		Map<String,String> utente = db.row(query,username,password);
		return utente;
	}
	
	public boolean create(Map<String,String> m)
	{
		System.out.println("Nuovo utente: " + m);
		String query = 	"insert into utenti\r\n" + 
						"(username,password,nome,cognome,data_nascita,email)\r\n" + 
						"values\r\n" + 
						"(?,?,?,?,?,?)";
		return db.update(query, m.get("username"),
								m.get("password"),
								m.get("nome"),
								m.get("cognome"),
								m.get("data_nascita"),
								m.get("email"));
	}
}