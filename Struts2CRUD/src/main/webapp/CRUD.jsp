<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net" %>


    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Contact List</title>
        
        <sj:head></sj:head>
        
    </head>
    
        <h1>Contact Manager</h1>


<s:actionerror/>
 
<s:form action="add" method="post"  style="align:
        center">
    <s:textfield name="contact.firstname" label="Firstname"/>
    <s:textfield name="contact.lastname" label="Lastname"/>
    <s:radio name="contact.sex" label="Gender" 
        	list="{'Male','Female'}" />
    <s:textfield name="contact.emailId" label="Email"/>
    <s:select name="contact.country" list="{'India','USA','UK'}" 
        	headerKey="" headerValue="Select" 
            label="Select a country" />
    <s:textfield name="contact.cellNo" label="Cell No."/>
    <s:textfield name="contact.website" label="Homepage"/>
    <sj:datepicker id="5" name="birthdate" label="Date of Birth" yearRange="-90:" changeMonth="true" changeYear="true" displayFormat= "yy-mm-dd" showButtonPanel="true"/>
    <s:submit value="Add Contact" align="center"/>
</s:form>

 <%
int count = 0; 

   
%>
<s:form action="removeContact">
<s:submit   type="button"    value="DeleteSelected" align="left"
  onClick="return confirm('Do you want to delete these contacts?');"/>
<display:table id="row" class="dataTable" export="true"  name="contactList"   size="auto"   pagesize="5" cellpadding="5px;"
                cellspacing="5px;" style="margin-left:25px;margin-top:20px;width:120%" requestURI="">
    <display:setProperty  name="paging.banner.placement" value="bottom"  />
<display:column title="Select">
        <s:checkbox  id="check" name="Checkbox"  fieldValue="%{#attr.row.id}" theme="simple" value="#{attr.row.check}"/>
    </display:column>
<display:column property="id" class="hidden" headerClass="hidden"  media="none"  title="ID" paramId="id" />
<display:column property="firstname" title="First Name" sortable="true"/>    
<display:column property="lastname" title="Last Name"/>
<display:column property="sex" class="hidden" headerClass="hidden"  media="none" title="Gender"/>
<display:column property="emailId" title="Email"/>
<display:column property="country"  title="Country"/>
<display:column property="cellNo" title="Cell No"/> 
<display:column property="website"  title="HomePage"/>
<display:column property="birthdate" class="hidden" headerClass="hidden"  media="none" format="{0,date,dd-MMM-yyyy}"  title="BirthDate"/>
<display:setProperty name="export.excel.filename" value="ContactDetails.xls" />
<display:setProperty name="export.pdf.filename" value="ContactDetails.pdf" />
<display:setProperty  name="export.csv.filename" value="ContactDetails.csv" />

<s:url id="editUrl" action="editLink">
<s:param name="id" value="%{#attr.row.id}"/>
<s:param name="firstname" value="%{#attr.row.firstname}"/>
<s:param name="lastname" value="%{#attr.row.lastname}"/>
<s:param name="sex" value="%{#attr.row.sex}"/>
<s:param name="emailId" value="%{#attr.row.emailId}"/>
<s:param name="country" value="%{#attr.row.country}"/>
<s:param name="cellNo" value="%{#attr.row.cellNo}"/>
<s:param name="website" value="%{#attr.row.website}"/>
<s:param name="birthdate" value="%{#attr.row.birthdate}"/>
</s:url>

<display:column title="Action">
    <s:a href="%{editUrl}">Display&AMP;Edit</s:a>
</display:column>


<s:url id="delContact" action="deleteContact">
        <s:param name="contact.id" value="%{#attr.row.id}" />
        </s:url>
<display:column title="Action">
 <s:a href="%{delContact}" onclick="return confirm('Are you sure you want to delete this record')">Delete</s:a>
</display:column>
 </display:table>
 </s:form>
