package it.rdev.rubrica.model.util;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class DBUtil {
	
	public static final String RUBRICA_WEB_PU = "RubricaWebMaven";

	public static EntityManager getEntityManager(String s) {
		return Persistence.createEntityManagerFactory(s).createEntityManager();
	}

}
