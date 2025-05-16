<%-- 
    Document   : pathfinder
    Created on : 17 Oct, 2013, 10:24:23 AM
    Author     : parichit
--%>

<%--
This file generates path related information when user selects any directory from Tree view menu.
A call is received by this file through ajax to generate path information of specific directory.
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

    String dir_k = request.getParameter("d_p_k").toString().trim();
    Core_func ref = logic_core.Core_func.getObject();
    String dir_path = ref.calculaterealpath(hostname, username, password, dir_k);

    out.print(dir_path.trim());
%>

