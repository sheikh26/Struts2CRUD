/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author Raichand
 */

public class HibernateUtil {

private static SessionFactory sessionFactory;
private static ServiceRegistry serviceRegistry;

private static SessionFactory  createSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            Configuration config = new Configuration();
            config.configure();
            // local SessionFactory bean created
            SessionFactory sessionFactory = config.buildSessionFactory();
             
            return sessionFactory;
        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
  
}
       public static SessionFactory getSessionFactory() {
        if(sessionFactory == null) sessionFactory = createSessionFactory();
        return sessionFactory;
    }
  }
