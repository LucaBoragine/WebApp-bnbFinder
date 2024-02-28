package com.project.bnbfinder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.project.bnbfinder.dao.DAOStrutture;
import com.project.bnbfinder.dao.DAOUtenti;

import database.Database;

@Configuration
public class Context 
{
		
	@Bean
	public Database db() {
		return new Database("Bnb");
	}
	
	@Bean
	public DAOStrutture ds() {
		return new DAOStrutture();
	}
	
	@Bean
	public DAOUtenti du() {
		return new DAOUtenti();
	}
}
