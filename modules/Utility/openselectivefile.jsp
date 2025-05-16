<%-- 
    Document   : display
    Created on : 20 Aug, 2013, 1:16:26 PM
    Author     : parichit
--%>

<%--
This file does the job of displaying selective portion  of file in web browser window. When size of 
selected file in file manager module ecxeeds specific limit then user can use option of View Selective
part. This file displays either top 50,200,500 line or bottom 50,200,500 lines.

--%>

<%@page import="com.sun.org.apache.xml.internal.serialize.LineSeparator"%>
<%@page import="ch.ethz.ssh2.Session"%>
<%@page import="ch.ethz.ssh2.Connection"%>
<%@page import="logic_core.Core_func"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    Core_func ref = Core_func.getObject();
    String realpath = null;
    String username = session.getAttribute("username").toString();
    String hostip = session.getAttribute("hostip").toString();
    String password = session.getAttribute("password").toString();
    String homedir = session.getAttribute("homedir").toString();
    String key_for_files = request.getParameter("key_for_files");
    String filesection = request.getParameter("filesection");
    String cmd = null;

    realpath = ref.calculaterealpath(hostip, username, password, key_for_files);

    realpath.trim();

    if (filesection.equals("50t")) {

        cmd = "head -50 ";

    } else if (filesection.equals("200t")) {

        cmd = "head -200 ";
    } else if (filesection.equals("500t")) {

        cmd = "head -500 ";
    } else if (filesection.equals("200b")) {

        cmd = "tail -200 ";
    } else if (filesection.equals("500b")) {

        cmd = "tail -500 ";
    } else if (filesection.equals("50b")) {

        cmd = "tail -50 ";
    }

    StringBuffer content = new StringBuffer();

    String filecontent[];

    filecontent = ref.executecmd(hostip, username, password, cmd+realpath);
    
    System.out.println("This is the formed command for file view"+cmd+realpath);
    
    if (filecontent == null) {
        out.print("File is not a legal Text/Script File or it is empty ....");
    } else {
        for (int i = 0; i < filecontent.length; i++) {
            content.trimToSize();
            content.append(filecontent[i].trim());
            content.append("\n");

        }
    }
%>
<pre><%out.print(content);%></pre>
