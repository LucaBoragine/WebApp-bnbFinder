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
        String query = "SELECT * FROM strutture WHERE citta <= ?";

        return db.rows(query, cittaScelta);
    }

    public List<Map<String, String>> cercaPerLocation(String locationScelta)
    {
        String query = "SELECT * FROM strutture WHERE location <= ?";

        return db.rows(query, locationScelta);
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