<%-- 
    Document   : update
    Created on : Feb 18, 2016, 2:37:15 PM
    Author     : Raichand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Detail & Update</title>
        
        <script type="text/javascript">
            //to go back two pages before
            function goBack(){
               
            <!--This one opens CRUD.jsp page with all records in database when back button is clicked-->
             window.open("/Struts2HibernateCRUD/index.jsp","_self");
             
            }
          
        </script>
        <sj:head></sj:head>
    
    </head>
    <body>
      
        <h1> Contact Detail & Update</h1>
        
    <s:form action="update" method="post" >
            
            <s:textfield name="contact.firstname" label="Firstname" value="%{#parameters.firstname}"/>
            <s:textfield name="contact.lastname" label="Lastname" value="%{#parameters.lastname}"/>
            <s:radio name="contact.sex" label="Gender" list="{'Male','Female'}" value="%{#parameters.sex}" />
            <s:textfield name="contact.emailId" label="Email" value="%{#parameters.emailId}" />
    <s:select name="contact.country" list="{'India','USA','UK'}" 
              headerKey="" headerValue="Select" label="Select a country" value="%{#parameters.country}" />
    <s:textfield name="contact.cellNo" label="Cell No" value="%{#parameters.cellNo}" />
    <s:textfield name="contact.website" label="Homepage" value="%{#parameters.website}"/>
     <sj:datepicker id="5" name="birthdate" label="Date of Birth" changeMonth="true" changeYear="true" displayFormat= "yy-mm-dd" showButtonPanel="true"/>
    <s:hidden name="contact.id" value="%{#parameters.id}" label="Primary Key" />
    <table >
        <tr>
           <td colspan="2">
               <s:submit value="Update Contact" theme="simple" />
               <input type="button" value="Back" onclick="goBack()"/>
                  
       
            </td>  
        </tr>   
        
    </table>
     
</s:form>
         
    </body>
</html>
