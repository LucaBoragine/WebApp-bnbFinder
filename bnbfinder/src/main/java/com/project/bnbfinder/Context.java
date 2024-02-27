package com.project.bnbfinder;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import database.Database;

@Configuration
public class Context 
{
	@Bean
	public Database db() {
		return new Database("");
		
	}

}
