<%-- 
    Document   : Navigation-Layout
    Created on : 2 Aug, 2013, 12:25:04 PM
    Author     : parichit
--%>

<%@page import="ch.ethz.ssh2.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        
        
        <%
            session = request.getSession(true);
            String user = session.getAttribute("username").toString();
            
        %>
    </head>
    <body>
        <ul class="nav_bar">
            <li style="margin-left:10%;"><a href="/WImpiBLAST/Home/home.jsp">Home</a></li>
            <li><a href="#">Turbo Submit</a>
            <ul>
                    <li><a href="/WImpiBLAST/modules/Script_Operations/goTurbo.jsp">Turbo Submit</a></li>
                    </ul>
            </li>
            <li><a href="#">Script Operations</a>
                <ul>
                    <li><a href="/WImpiBLAST/modules/Script_Operations/Create_New_Script.jsp">Create & Submit Script</a></li>
                    <li><a href="/WImpiBLAST/modules/Script_Operations/Modify_Older_Script.jsp">Modify Older Script</a></li>
                </ul>
            </li>
            <li><a href="#">Job</a>
                <ul>
                    <li><a href="/WImpiBLAST/modules/Job/Submit_Job.jsp">Submit Job</a></li>
                </ul>
            </li>
            <li><a href="#">Job Reporting</a>

                <ul>
                    <li><a href="/WImpiBLAST/modules/Job_Reporting/List_Job.jsp">View Jobs</a>
                    <li><a href="/WImpiBLAST/modules/Job_Reporting/Manage_Job.jsp">Manage Jobs</a>

                </ul>

            </li>

            <li><a href="#">Utilities</a>

                <ul>
                    <li><a href="/WImpiBLAST/modules/Utility/Download.jsp">File Manager</a>
                </ul>   

            </li>

            <li><a href="#"><%=user%></a>

                <ul>
                    <li><a href="/WImpiBLAST/welcome/logout.jsp">Logout</a>
                </ul>

            </li>

        </ul>

    </body>
</html>
