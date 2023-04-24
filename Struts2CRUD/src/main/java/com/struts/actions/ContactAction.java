
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.struts.actions;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.dao.ContactDao;
import com.pojos.model.Contacts;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 *
 * @author Raichand
 */
public class ContactAction extends ActionSupport   {
     private static final long serialVersionUID = 9149826260758390091L;
    private Contacts contact= new Contacts();
    private List<Contacts> ContactList= new ArrayList<Contacts>();

    
    
    private int id;
    private String birthdate;
    private Date date = new Date();
    private ContactDao dao; 
    private Integer[] Checkbox;//stores id of selected(checked) records for deletion.
    
    public ContactAction() {
         dao= new ContactDao();
    }
  
    
    @Override
    public String execute() {
    	System.out.println("hiiaaiiaaaaaaaaaaaaaa");
        this.ContactList =  dao.list();
      
        int count = ContactList.size();
      System.out.println("contactList Size"+ count);
        //System.out.println("execute called");
        return SUCCESS;
    }
    
   
 
    public String add() throws ParseException {
       
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.ENGLISH);
        Date dob = sdf.parse(getBirthdate());
       
         contact.setCreated(date);
         contact.setBirthdate(dob);
              
        System.out.println(birthdate);
              
        System.out.println(contact);
        try {
           
             dao.add(contact);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.ContactList =  dao.list();
        return SUCCESS;
    }
   
    public String update() throws ParseException{
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = sdf.parse(getBirthdate());
        contact.setBirthdate(dob);
        contact.setCreated(date);
         System.out.println(getContact());
        try {
            
             dao.update(contact);
        } catch (Exception e) {
            e.printStackTrace();
        }
       this.ContactList =  dao.list();
        return SUCCESS;
    }
    
     public String removeContact() throws ParseException {
             
        try {
          
            System.out.println("No of Selected Record:-" + Checkbox.length);
            for (int i=0;i<Checkbox.length; i++){
               System.out.println("Selected RecordId:-" + Checkbox[i]);
              dao.deleteContact((Checkbox[i]));
            
            }   
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.ContactList =  dao.list();
        return SUCCESS;
    }
     
     
      public String deleteContact() {
        
        System.out.println("id value="+contact.getId());
        int id = contact.getId();
        try {
            
             dao.deleteContact(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.ContactList =  dao.list();
        return SUCCESS;
    }
   
    
 
    public Contacts getContact() {
        return contact;
    }

    public void setContact(Contacts contact) {
        this.contact = contact;
    }

   public List<Contacts> getContactList() {
        return ContactList;
    }

    public void setContactList(List<Contacts> ContactList) {
        this.ContactList = ContactList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }
    
     public Integer[] getCheckbox() {
        return Checkbox;
    }

    public void setCheckbox(Integer[] Checkbox) {
        this.Checkbox = Checkbox;
    }   

    
}
