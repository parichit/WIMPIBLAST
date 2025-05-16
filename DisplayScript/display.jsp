<%-- 
    Document   : display
    Created on : 20 Aug, 2013, 1:16:26 PM
    Author     : parichit
--%>


<%--
This jsp file does the function of displaying contents of scripts in modify script module. when user
press 'display' button a call is received by this file to read contents of user specified file and 
return those contents to web browser for display on text area.
--%>

<%@page import="logic_core.Core_func"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = session.getAttribute("username").toString();
    String hostip = session.getAttribute("hostip").toString();
    String password = session.getAttribute("password").toString();
    String homedir = session.getAttribute("homedir").toString();
    String filename = request.getParameter("scriptpath");

    String messages = "";
    String modifydir = "";
   
    StringBuffer content = new StringBuffer();
    Core_func refssh = Core_func.getObject();
    String[] filecontent = {""};
    filecontent = refssh.displayFile(hostip, username, password, filename);
    if (filecontent == null) {
        out.print("File is not a legal Text/Script File or it is empty ....");
    } else {
        for (int i = 0; i < filecontent.length; i++) {
            content.append(filecontent[i].trim()+"\n");
        }
    }

out.print(content);

%>



