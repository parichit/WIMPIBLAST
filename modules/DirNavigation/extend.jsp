<%-- 
    Document   : extend
    Created on : Dec 18, 2012, 4:50:09 PM
    Author     : parichit
--%>

<%--
This file is responsible for extending the contents of any directory clicked by user in Tree View 
menu. It receives information form downres.jsp file to extend directory contents based on user choice.
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="ch.ethz.ssh2.StreamGobbler"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="ch.ethz.ssh2.Session"%>
<%@page import="java.io.IOException"%>
<%@page import="ch.ethz.ssh2.Connection"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <style> 

            .extend{

                border:transparent;
                background: #FFFFFF;
                font-size: small;

            }

            .extend:hover{
                background:#FFD39B;  
            }

            .file_make_color{

                border:transparent;
                background: #FFFFFF;
                font-size: small;   

            }


            .file_make_color:hover {

                background:#CFECEC;
            }

        </style>
    </head>
    <body>

        <%

            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String inodevalue = request.getParameter("inode");
            System.out.println(inodevalue);
            inodevalue.trim();
            ArrayList list = new ArrayList();
            ArrayList only_files = new ArrayList();
            ArrayList only_inodes = new ArrayList();
            ArrayList only_files_inodes = new ArrayList();
            ArrayList file_size_list = new ArrayList();
            String path_string = "";
            Connection conn = null;
            Session sess_for_path = null;
            Session sess = null;
            Session sess_for_files = null;
            Session sess_for_inode = null;
            Session sess_for_file_inodes = null;
            Session sess_for_filesize = null;
            InputStream stdout_for_path = null;
            InputStream stdout_for_files = null;
            InputStream stdout_for_inodes = null;
            InputStream stdout_for_files_inodes = null;
            InputStream stdout_for_filessize = null;
            BufferedReader br_for_path = null;
            BufferedReader br = null;
            BufferedReader br_for_files = null;
            BufferedReader br_for_inodes = null;
            BufferedReader br_for_files_inodes = null;
            BufferedReader br_for_filesize = null;
            String hostname = (String) session.getAttribute("hostip");
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");
            String path = session.getAttribute("homedir").toString();

            list.clear();
            only_files.clear();

            int i = 0;



            try {

                conn = new Connection(hostname);

                conn.connect();

                boolean isAuthenticated = conn.authenticateWithPassword(username, password);

                if (isAuthenticated == false) {
                    throw new IOException("Authentication failed.");
                }

                sess_for_path = conn.openSession();
                sess = conn.openSession();
                sess_for_files = conn.openSession();
                sess_for_inode = conn.openSession();
                sess_for_file_inodes = conn.openSession();
                sess_for_filesize = conn.openSession();


                sess_for_path.execCommand("find " + path + " -inum " + inodevalue);

                stdout_for_path = new StreamGobbler(sess_for_path.getStdout());
                br_for_path = new BufferedReader(new InputStreamReader(stdout_for_path));

                while (true) {


                    String line_for_path = br_for_path.readLine();
                    if (line_for_path == null) {
                        break;
                    }

                    path_string = line_for_path;

                    path_string.trim();

                    System.out.println("skndakjlsnhdasndlkandkland" + path_string.trim());

                }

                sess.execCommand("cd " + path_string + "/" + " && ls -dt -- */ | awk -F'/' '{print $1}' ");

                sess_for_files.execCommand("cd " + path_string + "/" + "&& find . -maxdepth 1 -not -path '*/\\.*' -type f -printf \"%T@ %Tc %p\\n\" | sort -nr | awk -F'/' '{print $NF}'");

                sess_for_inode.execCommand("cd " + path_string + " && ls -dt -i -- */ | awk -F' ' '{print $1}' ");

                sess_for_file_inodes.execCommand("cd " + path_string + "/" + " && find . -maxdepth 1 -not -path '*/\\.*' -type f -printf \"%T@ %Tc %p %i\\n\" | sort -nr | awk -F'/' '{print $NF}' | awk '{print $2}'");
                sess_for_filesize.execCommand("cd " + path_string + "/" + " && find . -maxdepth 1 -not -path '*/\\.*' -type f -printf \"%T@ %T@ %p %k KB\\n\" | sort -nr | awk -F'/' '{print $NF}'|awk '{print $2\" \"$3}'");

                InputStream stdout = new StreamGobbler(sess.getStdout());

                stdout_for_files = new StreamGobbler(sess_for_files.getStdout());

                stdout_for_inodes = new StreamGobbler(sess_for_inode.getStdout());

                stdout_for_files_inodes = new StreamGobbler(sess_for_file_inodes.getStdout());

                stdout_for_filessize = new StreamGobbler(sess_for_filesize.getStdout());

                br = new BufferedReader(new InputStreamReader(stdout));

                br_for_files = new BufferedReader(new InputStreamReader(stdout_for_files));

                br_for_inodes = new BufferedReader(new InputStreamReader(stdout_for_inodes));

                br_for_files_inodes = new BufferedReader(new InputStreamReader(stdout_for_files_inodes));

                br_for_filesize = new BufferedReader(new InputStreamReader(stdout_for_filessize));

                list.clear();
                only_files.clear();
                only_inodes.clear();
                only_files_inodes.clear();
                file_size_list.clear();

                while (true) {


                    String line = br.readLine();
                    if (line == null) {
                        break;
                    }
                    list.add(line);
                    //System.out.println("iutioertuoiewytioewuoi"+line);

                }
               
                System.out.println("ExitCode: " + sess.getExitStatus());

                while (true) {

                    String line_for_files = br_for_files.readLine();
                    if (line_for_files == null) {
                        break;
                    }
                    only_files.add(line_for_files);
                    

                }
                
                System.out.println("ExitCode: " + sess_for_files.getExitStatus());

                while (true) {


                    String line_for_inodes = br_for_inodes.readLine();
                    if (line_for_inodes == null) {
                        break;
                    }
                    only_inodes.add(line_for_inodes);
                    // System.out.println(line_for_inodes);

                }

                while (true) {


                    String line_for_files_inodes = br_for_files_inodes.readLine();
                    if (line_for_files_inodes == null) {
                        break;
                    }
                    only_files_inodes.add(line_for_files_inodes);
                    //System.out.println("iutioertuoiewytioewuoi"+line);

                }
               

                System.out.println("ExitCode: " + sess_for_file_inodes.getExitStatus());

                while (true) {


                    String line_for_filesize = br_for_filesize.readLine();
                    if (line_for_filesize == null) {
                        break;
                    }
                    file_size_list.add(line_for_filesize);
                    

                }

                sess.close();
                sess_for_file_inodes.close();
                sess_for_files.close();
                sess_for_inode.close();
                sess_for_path.close();
                sess_for_filesize.close();
                conn.close();
                sess = null;
                sess_for_file_inodes = null;
                sess_for_files = null;
                sess_for_inode = null;
                sess_for_path = null;
                sess_for_filesize = null;
                stdout_for_path.close();
                stdout_for_files.close();
                stdout_for_inodes.close();
                stdout_for_files_inodes.close();
                stdout_for_filessize.close();
                br_for_path.close();
                br.close();
                br_for_files.close();
                br_for_inodes.close();
                br_for_files_inodes.close();
                br_for_filesize.close();
                conn = null;


            } catch (IOException e) {
                sess.close();
                sess_for_file_inodes.close();
                sess_for_files.close();
                sess_for_inode.close();
                sess_for_path.close();
                sess_for_filesize.close();
                conn.close();
                sess = null;
                sess_for_file_inodes = null;
                sess_for_files = null;
                sess_for_inode = null;
                sess_for_path = null;
                sess_for_filesize = null;
                stdout_for_path.close();
                stdout_for_files.close();
                stdout_for_inodes.close();
                stdout_for_files_inodes.close();
                stdout_for_filessize.close();
                br_for_path.close();
                br.close();
                br_for_files.close();
                br_for_inodes.close();
                br_for_files_inodes.close();
                br_for_filesize.close();
                conn = null;
                list.clear();
                only_files.clear();
                only_inodes.clear();
                only_files_inodes.clear();
                file_size_list.clear();
                e.printStackTrace(System.err);
               
            }

        %>



        <%

            for (int j = 0; j < list.size(); j++) {

        %>

        <image src="Design/images/folder.gif" />

        <input type="button" name="<%out.print(only_inodes.get(j));%>" 
               value="<%out.print(list.get(j));%>" onclick="javascript:contentsFunction(this.name, this.value);" class="extend" />

        <div style="margin-left: 20px;" name="nn" id=<%out.print(only_inodes.get(j));%>>

        </div>

     
            <%
                }
                for (int m = 0; m < only_files.size(); m++) {
            %>
            <div><image src="Design/images/file.png" />
                    <input type="button" name="<%out.print(only_files_inodes.get(m));%>" id="<%out.print(m);%>" 
                           value="<%out.print(only_files.get(m));%>" class="file_make_color" 
                           onclick="do_download(this.value, this.name);" /></div>

                           <div style="float: right;"><%out.print(file_size_list.get(m));%></div>
                <%
                    }
                %>
       

    </body>
</html>
