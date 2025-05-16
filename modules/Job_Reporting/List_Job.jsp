<%-- 
    Document   : List-Job
    Created on : 2 Aug, 2013, 12:22:09 PM
    Author     : parichit
--%>

<%@page import="com.sun.org.apache.xml.internal.serializer.ElemDesc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logic_core.Core_func"%>
<%@page import="JobManagement.JM"%>
<%@page import="java.lang.Thread"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/joblist.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Molengo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">
        <title>WImpiBLAST List-Job</title>

        <%

            response.setHeader("Cache-Control", "private");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            boolean jobflag = false;
            String[] jobidpbs = null;
            String[] uname = null;
            String[] queue = null;
            String[] jobname = null;
            String[] state = null;
            String[] scriptname = null;
            String elem = null;
            String hostip = session.getAttribute("hostip").toString();
            String userName = session.getAttribute("username").toString();
            String passWd = session.getAttribute("password").toString();
            final JM jm = JM.getObject();
            jobidpbs = jm.jobID(hostip, userName, passWd);

            if (jobidpbs.length < 1) {
                jobflag = false;

            } else {

                scriptname = jm.scriptname(hostip, userName, passWd);
                uname = jm.uName_short(hostip, userName, passWd);
                queue = jm.jobQueue_short(hostip, userName, passWd);
                jobname = jm.jName_short(hostip, userName, passWd);
                state = jm.state_short(hostip, userName, passWd);
                for (int i = 0; i < (jobidpbs.length); i++) {

                    if (scriptname[i].startsWith("/")) {
                        int last = scriptname[i].lastIndexOf("/");
                        scriptname[i] = scriptname[i].substring(last + 1);
                      
                    }

                 
                }


                jobflag = true;
            }

        %>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/Job_Reporting.js"></script>

    </head>
    <body>

        <div id="help_menu">

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;;text-decoration: underline;">Help Menu</p>
            <p class="information"> Parameter information will be displayed in this section. Click on any parameter e.g. 'job ID, User Name etc.' to display help. <br><br>
                Caution: Always log out after completing your work.<br><br> 
                * Def: Definition <a style="text-decoration: none;float: right;cursor: pointer;box-shadow: 1px 2px 1px 1px ;" onclick="showme('wrkflw');">
                    Hide Help</a>
                * Expl: Explanation

            </p>       
            <hr>
            <p id='jid' class="helpinfo"> Job Id<br><br>
                Def: The unique identifier for your job.<br><br>
                Expl: Each job is assigned a unique identifier by system. In case of any issues or problem with job execution please use this
                job id for reference with system administrator.

            </p>
            <p id='usnm' class="helpinfo"> User Name<br><br>
                Def: Your username.<br><br>

            </p>

            <p id='que' class="helpinfo"> Queue<br><br>
                Def: The curent queue assigned to your job<br><br>
                Expl: While communicating any issues with technical support you should also quote queue name.
            </p>

            <p id='jbnm' class="helpinfo"> Job Name<br><br>
                Def: The job name that you assigned to script in 'Create Script' phase.
            </p>
            <p id='scnm' class="helpinfo"> Script Name<br><br>
                Def: Name of the submitted script.
            </p>
            <p id='st' class="helpinfo"> State<br><br>
                Def: The current state of your job.<br><br>
                Expl: A job can be in Queue (Q), Hold (H), Running (R), Completed (C) and Exiting (E) state.<br><br>
                Tip: If your job is stuck in (Q) state for very long e.g for days then contact Technical Support.
                Please use 'Contact Us' link in bottom to raise issue in group or directly email.
            </p>

            <p id="wrkflw" style="width:328px;">
                <img src="../../Design/images/outline.png" />
            </p>

        </div>

        <div id="hint">
            Click for help!
        </div>

        <div id="page-container">

            <div id="header">

                <div id="header_style"><h1>WImpiBLAST .</h1>
                    <h2>Web interface for mpiBLAST to help biologist perform large scale annotation
                        using high performance computing</h2>
                </div>

            </div>

            <div id="main-nav">
                <%@include file="/Navigation_Menu/Navigation-Layout.jsp"%>
            </div>


            <div id="sidebar-a"> 
                <fieldset style="border: 1px solid ;border-color: #353539;padding-bottom: 10px;padding-left: 4px;padding-top: 10px;">

                    <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">State Info.</legend>
                    <table>
                        <tr> <td class="contentinfo"><a>Q: Job in queue </a></td></tr>
                        <tr> <td class="contentinfo"><a>R: Job is running </a></td></tr>   
                        <tr> <td class="contentinfo"><a>H: Job is on hold </a></td></tr> 
                        <tr> <td class="contentinfo"><a>E: Job is exiting </a></td></tr>
                        <tr> <td class="contentinfo"><a>C: Job is completed </a></td></tr>
                        <tr> <td style="font-weight: normal;font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 10px;color: #0772A1;"><a>Ref: www.clusterresources.com</a></td></tr>
                    </table>
                </fieldset>

            </div>

            <div id="content">
                <table border="0" style="width:95%;margin-left: 2%;">
                    <tr>
                        <td>
                            <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                Job Details </p>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="5">
                            <hr>
                        </td>
                    </tr>


                </table>

                <div class="padding"> 

                    <table border="0" style="width: 97%;margin-left: 1%;">

                        <tr align="center">
                            <td class="contentjm" onclick="showme('jid');"><a>Job Id</a></td>
                            <td class="contentjm" onclick="showme('scnm');"><a>Script Name</a></td>
                            <td class="contentjm" onclick="showme('usnm');"><a>Username</a></td>
                            <td class="contentjm" onclick="showme('que');"><a>Queue</a></td>
                            <td class="contentjm" onclick="showme('jbnm');"><a>Jobname</a></td>
                            <td class="contentjm" onclick="showme('st');"><a>State</a></td>
                        </tr>

                        <% for (int k = 0; k < (jobidpbs.length); k++) {
                                if (jobidpbs.length == 0) {
                                } else {%>

                        <tr onmouseover="this.bgColor = '#ebe9f9';" onMouseOut="this.bgColor = 'white'" align="center">
                            <td class="contentjmvalue"><%=jobidpbs[k]%></td>
                            <td class="contentjmvalue"><%=scriptname[k]%></td>
                            <td class="contentjmvalue"><%=uname[k]%></td>
                            <td class="contentjmvalue"><%=queue[k]%></td>
                            <td class="contentjmvalue"><%=jobname[k]%></td>
                            <td class="contentjmvalue"><%=state[k]%></td>
                        </tr>

                        <% }%>
                        <% }%>
                    </table>

                </div>
            </div>
            <div id="footer">

                <div id="altnav">
                    <a href="/WImpiBLAST/gen/about.html" target="_blank">About</a> - 
                    <a href="/WImpiBLAST/gen/folio.html" target="_blank">Portfolio</a> - 
                    <a href="/WImpiBLAST/gen/contact.html" target="_blank">Contact Us</a> 

                </div>
                <div id="copyright">
                    NABI<br/>
                    Powered by <a href="http://www.nabi.res.in" target="_blank">Computational Biology Lab@NABI</a> 
                </div>
            </div>
        </div>
    </body>
</html>
