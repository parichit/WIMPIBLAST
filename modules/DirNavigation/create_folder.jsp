<%-- 
    Document   : create_folder
    Created on : 28 Mar, 2014, 5:36:00 PM
    Author     : parichit
--%>
<%@page import="java.io.File"%>
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

    String folder_loc = request.getParameter("f_loc").toString().trim();
    String folder_name = request.getParameter("f_nm").toString().trim();
    Core_func ref = logic_core.Core_func.getObject();

    if (folder_loc.endsWith("/")) {
    } else {
        folder_loc = folder_loc + "/";
    }

    File file = new File(folder_loc + folder_name);
    String status = null;
    //System.out.println("uuuuuuuuuuuuuu"+folder_name);
    //System.out.println("pppppppppppppp"+folder_loc);
    if (file.exists()) {
        out.print("FolderExists");

    } else {
        status = ref.executecmdstring(hostname, username, password, "mkdir " + folder_loc + folder_name + ";echo $?");
        //out.print("Folder creation status is: "+status.trim());

    }

    if (status.equals("0")) {

%>0<%}%>
