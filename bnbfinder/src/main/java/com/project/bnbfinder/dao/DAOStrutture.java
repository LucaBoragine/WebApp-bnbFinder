package com.project.bnbfinder.dao;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import database.Database;


public class DAOStrutture {

    @Autowired
    private Database db;

    public List<Map<String,String>> read(String query, String... params)
    {
        return db.rows(query, params);
    }

    public List<Map<String,String>> leggiTutti()
    {
        String query = "SELECT * FROM strutture";
        return read(query);
    }

    public List<Map<String, String>> cercaPerPrezzo(double prezzomax)
    {
        String query = "SELECT * FROM strutture WHERE prezzo_notte <= ?";

        return db.rows(query, prezzomax + "");
    }

    public List<Map<String, String>> cercaPerCitta(String cittaScelta)
    {
        String query = "SELECT * FROM strutture WHERE citta = ?";

        return db.rows(query, cittaScelta);
    }
    
    public List<Map<String, String>> cercaPerPrezzoECitta(double prezzomax, String citta)
    {
        String query = "SELECT * FROM strutture WHERE prezzo_notte <= ? AND citta = ?";

        return db.rows(query, prezzomax + "", citta);
    }

    public List<Map<String, String>> cercaPerLocation(String locationScelta)
    {
        String query = "SELECT * FROM strutture WHERE location = ?";

        return db.rows(query, locationScelta);
    }
    
    public Map<String, String> cercaId(int id)
    {
        String query = "SELECT * FROM strutture WHERE id = ?";

        return db.row(query,id + "");
    }
    
    public Map<String, String> optionalsPerStruttura(int idStruttura)
    {
        String query = "SELECT * FROM optionals WHERE id_struttura = ?";

        return db.row(query,idStruttura + "");
    }
    
    public boolean prenotaStruttura(Map<String,String> p) {
    	 String query = "insert into prenotazioni (inizio,fine,id_struttura,id_utente) values (?,?,?,?)";
         return db.update(query, p.get("inizio"), p.get("fine"), p.get("id_struttura"), p.get("id_utente"));
    }
    

    public List<Map<String, String>> elencocitta()
    {
        String query = "select s.citta from strutture s group by s.citta order by s.citta; ";

        return db.rows(query);
    }
    
    public boolean create(Map<String,String> m)
    {
        String query = "insert into strutture (nome, citta, indirizzo, location, link_Img, descrizione, prezzo_notte) values (?,?,?,?,?,?,?)";
        return db.update(query, m.get("nome"), m.get("citta"), m.get("indirizzo"), m.get("location"), m.get("link_Img"), m.get("descrizione"), m.get("prezzo_notte"));
    }

    public boolean update(Map<String,String> m)
    {
        String query = "update strutture set nome = ?, citta = ?, indirizzo = ?, location = ?, link_Img = ?, descrizione = ?, prezzo_notte = ? where id = ?";
        return db.update(query, m.get("nome"), m.get("citta"), m.get("indirizzo"), m.get("location"), m.get("link_Img"), m.get("descrizione"), m.get("prezzo_notte"), m.get("id"));
    }

    public boolean delete(int id)
    {
        String query = "delete from strutture where id = ?";
        return db.update(query, id + "");
    }

}