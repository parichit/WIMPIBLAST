<%-- 
    Document   : logout
    Created on : 9 May, 2012, 5:50:28 PM
    Author     : parichit
--%>


<%@page import="logic_core.Core_func"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="/Errors/create_error.jsp" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String username = session.getAttribute("username").toString();
    String hostip = session.getAttribute("hostip").toString();
    String password = session.getAttribute("password").toString();
    Core_func refssh = null;

    if (session == null) {
        session = request.getSession();
    }
    refssh = Core_func.getInstance();
    refssh.closeAllconnection(hostip, username, password);
    session.removeAttribute("hostip");
    session.removeAttribute("username");
    session.removeAttribute("password");
    session.removeAttribute("homedir");
    session.removeAttribute("scriptname");
    session.removeAttribute("nnodes");
    session.removeAttribute("ppn");
    session.removeAttribute("jobname");
    session.removeAttribute("action_stat");
    session.removeAttribute("hostnewname");
    session.removeAttribute("ip_path");
    session.invalidate();
    response.sendRedirect("/WImpiBLAST/welcome/loginpage.jsp");
%>
