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
        <sj:head/>
        <title>Delete Contact</title>
    </head>
    <body>
        <h1>Delete Contact</h1>
        
        <s:form action="delete"   method="post">
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
    <s:submit value="Delete" onclick="return confirm('Are you sure you want to delete this record ?');" align="center"/>
 
 
</s:form>
    </body>
</html>
