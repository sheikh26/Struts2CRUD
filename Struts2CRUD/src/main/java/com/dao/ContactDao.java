/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import java.util.List;
import java.util.ArrayList;
import com.pojos.model.Contacts;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Raichand
 */
public class ContactDao extends HibernateUtil{
     
   
    public void add(Contacts newcontact) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String fname = newcontact.getFirstname();
        System.out.println("FirstName=" + fname);
        //int newid = this.getNewContactId();
       // newcontact.setId(newid);
        //int contactid = newcontact.getId();
        //System.out.println("DaoContact id ;-" + contactid);
        System.out.println("From Dao:-" + newcontact);
        session.beginTransaction();
        //session.merge(newcontact);
        session.save(newcontact);
        session.getTransaction().commit();
                session.flush();
                session.close();
        
    }
  
     public void deleteContact(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
          try {
        Contacts contact = (Contacts) session.load(Contacts.class,id);
        if(null != contact) {
            session.delete(contact);
        }
        
         } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
           session.getTransaction().commit();
      
            session.flush();
            session.close();
    }
      
      
      public void update(Contacts contact) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
      //Contacts contact = (Contacts) session.load(Contacts.class, id);
        try {
        if(contact != null) {
            session.saveOrUpdate(contact);
        }
        
        } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
            session.getTransaction().commit();
      
            session.flush();
            session.close();
      }
      

public int getNewContactId() {
             Session session = HibernateUtil.getSessionFactory().getCurrentSession();
             Transaction trans = session.beginTransaction();
     String query = "SELECT max(c.id) FROM Contacts c";
     List list = session.createQuery(query).list();
     int maxId = ((Integer) list.get(0));

        	trans.commit();
                session.close();
		return (maxId+1);
	}


public List<Contacts> list(){
     Session session = HibernateUtil.getSessionFactory().openSession();
          List<Contacts> DaoAllContacts = null;
       
        session.beginTransaction();
     
        try {
                        
           
               DaoAllContacts = session.createCriteria(Contacts.class).list();
               //DaoAllContacts = (List<Contacts>)session.createQuery("from Contacts").list();
                int count =DaoAllContacts.size();
              System.out.println("No of Record From Dao: " + count);
              
        } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
            session.getTransaction().commit();
                session.flush();
                session.close();
        return DaoAllContacts;
       
        
    }
    
}

