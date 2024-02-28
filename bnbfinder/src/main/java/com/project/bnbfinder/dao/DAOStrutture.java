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

}