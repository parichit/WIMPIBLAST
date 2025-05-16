<%-- 
    Document   : pathfinder
    Created on : 17 Oct, 2013, 10:24:23 AM
    Author     : parichit
--%>

<%--
This file generates path related information when user selects any fiel from Tree view menu.
A call is received by this file through ajax to generate path information of specific file.
--%>


<%@page import="logic_core.Core_func"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);


    String hostname = (String) session.getAttribute("hostip");
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    String f_p_k = request.getParameter("f_p_k").toString().trim();
    Core_func ref = Core_func.getObject();
    String f_path = ref.calculaterealpath(hostname, username, password, f_p_k);
    out.print(f_path.trim());
%>

