<%-- 
    Document   : display
    Created on : 20 Aug, 2013, 1:16:26 PM
    Author     : parichit
--%>

<%--

This file does the function of displaying contents of created script or output file in new browser window
when user clicks on View Script button in 'File Manager' module a call is received by this file to
display contents fo user specified file in web browser window.

It also checks for validity of size of that file to restrict users from opening large file on line so that
bandwidth can be prevented form mis-utiliation.

--%>


<%@page import="java.io.File"%>
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

    StringBuffer content = new StringBuffer();
    String filecontent[];
   
    String key_for_script = request.getParameter("key_for_script");

    realpath = ref.calculaterealpath(hostip, username, password, key_for_script);

    realpath.trim();

    File f = new File(realpath);

    if (f.length() > 1048576) {

%>

<script type="text/javascript">


    alert("Sorry this script can not be opened for display. The maximum script size for displaying in web browser is 1Mb.\n\n\
This script crosses allowed file size limit. For large scripts use View from Top/View from Bottom feature.");


</script>


<%

    out.print("\nSorry could not open this file.\nPlease use View from Top/View from Bottom fetaure of File manager to view large files");


} else if (f.length() <= 1048576) {

    filecontent = ref.displayFile(hostip, username, password, realpath);
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
<%
    }
%>

