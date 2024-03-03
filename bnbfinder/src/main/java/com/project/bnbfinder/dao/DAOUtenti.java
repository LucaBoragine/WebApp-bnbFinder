package com.project.bnbfinder.dao;
import java.util.List;
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
	
    public List<Map<String,String>> prenotPerUtente(int id){
    	String query = "select p.id, p.inizio, p.fine, p.id_struttura,s.nome,s.citta,s.indirizzo,s.location,s.link_Img,s.descrizione,s.prezzo_notte  \r\n"
    			+ "from utenti u join prenotazioni p ON u.id = p.id_utente \r\n"
    			+ "	join strutture s on p.id_struttura = s.id \r\n"
    			+ "where u.id = ?;";
    	return db.rows(query, id + "");
    }
    
    public boolean eliminaPrenot(int idPrenot, int idUtente) {
    	String query = "delete from prenotazioni where id=? and id_utente = ?";
    	return db.update(query, idPrenot+"", idUtente+"");   			
    }
}