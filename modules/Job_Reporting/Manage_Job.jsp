<%-- 
    Document   : Alter-Job
    Created on : 2 Aug, 2013, 12:22:19 PM
    Author     : parichit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page import="logic_core.Core_func"%>
<%@page import="JobManagement.JM"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/jobmanage.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Molengo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">

        <title>WImpiBLAST Manage-Job</title>

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
            String[] ppn = null;
            String[] memreqd = null;
            String[] timereqd = null;
            String[] state = null;
            String[] elapsedtime = null;
            String hostip = (String) session.getAttribute("hostip");
            String userName = (String) session.getAttribute("username");
            String passWd = (String) session.getAttribute("password");

            JM jm = JM.getObject();
            jobidpbs = jm.jobID(hostip, userName, passWd);


            if (jobidpbs.length < 1) {
                jobflag = false;

            } else {

                uname = jm.uName(hostip, userName, passWd);
                queue = jm.jobQueue(hostip, userName, passWd);
                jobname = jm.jName(hostip, userName, passWd);
                ppn = jm.ppn(hostip, userName, passWd);
                memreqd = jm.memReq(hostip, userName, passWd);
                timereqd = jm.timeReq(hostip, userName, passWd);
                state = jm.state(hostip, userName, passWd);
                elapsedtime = jm.elaspedTime(hostip, userName, passWd);

                jobflag = true;

            }

        %>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/Job_Manage.js"></script>



    </head>

    <body onload="showstat();">

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
            <br>

            <div id="yes" class="showsuccessstatus">
                <p align="center">
                    Job has been processed successfully!</p>  
            </div>

            <div id="no" class="showerrorstatus">
                <p align="center">
                    We are very sorry but the request can not be processed now. Please try again after sometime</p>  
            </div>

            <div id="excep" class="showerrorstatus">
                <p align="center">
                    There is some technical issues in processing your request. Please try again after some time.<br> 
                    If this issue persists kindly contact our computational biology team. We would sort you out in no time.</p>  
            </div>

            <div id="hint">
                Click for help!
            </div>

            <br><br>
            <div id="sidebar-a">      

                <div class="padding" >

                    <html:form action="/managejob">

                        <fieldset style="border: 1px solid ;border-color: #353539;padding-bottom: 20px;padding-left: 10px;padding-right: 0px;padding-top: 10px;">

                            <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 17px;color: #0772A1;">Control Panel</legend>

                            <table border="0" align="center">
                                <tr>
                                    <td><input type="submit" name="button"  id="button" class="content_button2" value="DELETE" onclick="return checkjob(this)"></td>
                                </tr>

                                <tr>
                                    <td><input type="submit" name="button" id="button" class="content_button2" value="HOLD" onclick="return checkjob(this)"></td>
                                </tr>

                                <tr>
                                    <td><input type="submit" name="button" id="button" class="content_button2" value="RELEASE" onclick="return checkjob(this)"></td>
                                </tr>

                            </table>

                        </fieldset>

                    </div>

                </div>


                <div id="content">

                    <div class="padding" > 
                        <br>
                        <table style="overflow: scroll" border="0">
                            <tr>
                                <td colspan="3">

                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        Select Job </p>
                                </td>

                            <tr>
                                <td colspan="13">
                                    <hr>
                                </td>
                            </tr>

                            <tr>
                                <td><INPUT type="checkbox" name="selectall" id="selectall" onclick="selectallpls(this, 'jobid');"><a>Select</a></td>
                                <td class="contentjm" align="center"><a>Job Id</a></td>
                                <td class="contentjm" align="center"><a>Username</a></td>
                                <td class="contentjm" align="center"><a>Queue</a></td>
                                <td class="contentjm" align="center"><a>Jobname</a></td>
                                <td class="contentjm" align="center"><a>PPN</a></td>
                                <td class="contentjm" align="center"><a>Memory</a></td>
                                <td class="contentjm" align="center"><a>Time</a></td>
                                <td class="contentjm" align="center"><a>State</a></td>
                                <td class="contentjm" align="center"><a>ElapsedTime</a></td>

                            </tr>
                            <% for (int k = 0; k < (jobidpbs.length); k++) {
                                    if (jobidpbs.length == 0) {
                                    } else {%>
                            <tr onmouseover="this.bgColor = 'lightsteelblue';" onMouseOut="this.bgColor = 'white'"  align="center" >                                        
                                <td><input type="checkbox" name="jobid" id="jobid"  value="<%=jobidpbs[k]%>" onclick="collectjobid(this);"></td>
                                <td class="contentjmvalue"><%=jobidpbs[k]%></td>
                                <td class="contentjmvalue"><%=uname[k]%></td>
                                <td class="contentjmvalue"><%=queue[k]%></td>
                                <td class="contentjmvalue"><%=jobname[k]%></td>
                                <td class="contentjmvalue"><%=ppn[k]%></td>
                                <td class="contentjmvalue"><%=memreqd[k]%></td>
                                <td class="contentjmvalue"><%=timereqd[k]%></td>
                                <td class="contentjmvalue"><%=state[k]%></td>
                                <td class="contentjmvalue"><%=elapsedtime[k]%></td>
                            </tr>
                            <% }%>
                            <% }%>

                        </table>

                    </html:form>


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
