<%-- 
    Document   : Create-Script
    Created on : 2 Aug, 2013, 12:21:17 PM
    Author     : parichit
--%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Create_Script.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Molengo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">

        <title>WImpiBLAST Create-Script</title>

        <%
            response.setHeader("Cache-Control", "private");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String dflt_loc = session.getAttribute("homedir").toString();
            String action_stat = session.getAttribute("action_stat").toString();
            session.setAttribute("action_stat", "dflt");

        %>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>

        <script type="text/javascript">

            var dflt_hme = '<%=session.getAttribute("homedir").toString()%>';

        </script>

        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/Create_Script.js"  ></script>

    </head>

    <body onload="showstat();">

        <div id="help_menu">

            <p style="font-family: sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;text-decoration: underline;">Help Menu</p>
            <p class="information"> Parameter related information will be displayed in this section. Click on any parameter e.g. 'Script Location, Script Name etc.' to display help. 
                <br> <br> Caution: Incorrect parameters may lead to job termination. Always log out
                after completing your work.<br><br>
                * Def: Definition  <a style="text-decoration: none;float: right;cursor: pointer;box-shadow: 1px 2px 1px 2px ;" onclick="showme('wrkflw');">
                    Hide Help</a>
                * Expl: Explanation

            </p>  
            <hr>

            <p id='scrnm' class="helpinfo"> Script Name: Mandatory <br><br>
                Def: The name of your script.<br><br>
                Tip: Do not use special characters e.g. $,^,& etc. or blank space in scriptname.<br>
                Allowed: A-Z , a-z , 0-9 , _ , - , .<br>

            </p>

            <p id='jbnm' class="helpinfo"> Job Name: Mandatory <br><br>
                Def: The name of your job.<br><br>
                Expl: Single script can be submitted by different names for execution.  <br><br>

                For e.g. if same script have to be submitted again by changing location of fasta file
                or output file then it should be submitted with different name to distinguish it from 
                previous runs. <br><br>

                For e.g. If you create a script 'myscript.sh' then it can be submitted with job name 'myjob'. <br><br>
                The same script can also be submitted with job name 'myjob2' after minor changes in script.<br><br>
                Tip: Do not use special characters e.g. $,^,& etc. or blank space in jobname.<br>
                Allowed: A-Z , a-z , 0-9 , _ , - , .<br>

            </p>

            <p id='wlt' class="helpinfo"> Wall Clock Time: Mandatory <br><br>
                Def: Maximum time period for which job will execute.<br><br>
                Expl: If your job will run for 10 hours enter 10:00:00 as wall clock time.
                The format for entering this value is Hour:Minute:Seconds.<br><br>
                Tip: If fasta file consist of
                large no. of sequences then more time is required to ensure complete processing and vice versa.
            </p>
            <p id='nnd' class="helpinfo"> No. of Nodes: Mandatory <br><br>
                Def: The number of nodes required by job.<br><br>
                Expl: A cluster have multiple compute nodes for execution. A parallel application script can
                run on several nodes. <br><br>
                Tip: No. of nodes is fixed at 1 due to demonstration restrictions.
            </p>

            <p id='pn' class="helpinfo"> Process Per Node: Mandatory <br><br>
                Def: The number of cores per compute node required by job.<br><br>
                Expl:  A compute node is independent server or computer. Each node/computer/server may contain multiple cores for execution.<br><br>
                Tip: Currently, Maximum no. of cores is 24. Any job requiring more than 24 cores will be automatically dropped.
            </p>

            <p id='em' class="helpinfo"> Email At: Optional <br><br>
                Def: The event when email will be sent to your emailid (if provided).<br><br>
                Tip: Abort ; Job was aborted. <br>
                Begin; Job started execution.<br>
                End; Job completed execution or terminated.

            </p>

            <p id='emt' class="helpinfo"> Email To: Optional <br><br>
                Def: The emalid where notifications will be sent.<br><br>
                Tip: For multiple email recipients separate emailid by comma without any space. 

            </p>

            <p id="wrkflw" style="width:328px;">
                <img src="../../Design/images/outline.png" />
            </p>    

        </div>

        <div id="page-container">

            <div id="header">

                <div id="header_style"><h1>WImpiBLAST .</h1>
                    <h2>Web interface for mpiBLAST to help biologist perform large scale annotation
                        using high performance computing</h2>
                </div></div>

            <div id="main-nav"> <%@include file="/Navigation_Menu/Navigation-Layout.jsp"%></div>
            <br><br>
            <div id ="showemptyfields" class="showemptyfields">

                <p align="center"> Looks like you missed some thing. Just fill in the fields to get going!.</p>

            </div>

            <div id="no" class="showerrorstatus">
                <p align="center">

                    The script can not be created now. Kindly try again later.<br></p>  
            </div>

            <div id="scrptjbnmovrrite" class="showerrorstatus">
                <p align="center">

                    Both the Scriptname and Jobname can not be same.<br>Provide a different Jobname  
                    to prevent overwriting of standard error and output files.</p>  
            </div>

            <div id="fldrexst" class="showerrorstatus">
                <p align="center">

                    The directory associated with current jobname already exists. Provide another jobname to prevent overwriting.<br></p>  
            </div>
            <div id="fldrexcep" class="showerrorstatus">
                <p align="center">

                    There is some system related problem in creating the folder. Kindly try later.<br></p>  
            </div>

            <div id="dtaexcep" class="showerrorstatus">
                <p align="center">

                    There is some system related error in writing data to the script. Kindly try later.<br></p>  
            </div>

            <div id="fileexst" class="showerrorstatus">
                <p align="center">

                    A script with given name already exist in the folder. For overwriting the script use 'Modify Older Script' option.<br>
                    This form does not support overwriting the scripts.</p>  
            </div>

            <div id="prmcnflct" class="showerrorstatus">
                <p align="center">

                    There is permission conflicts in creating the script.<br></p>  
            </div>

            <div id="excep" class="showerrorstatus">
                <p align="center">
                    Due to technical issues , request can not be processed for this script.
                    <br>If this issue persists kindly contact the Administrator@Computational Biology Lab.</p>
            </div>
            <div id="invld" class="showerrorstatus">
                <p align="center">
                    The data entered contains either blank spaces or special characters.<br>
                    Reenter the highlighted fields and remove any special characters/blank spaces.</p>
            </div>

            <div id="hint" class="hint">
                Click for help!
            </div>

            <div id="schint" class="hint">
                Special characters and blank spaces are not allowed in this field.<br>
                Allowed: A-Z , a-z , 0-9 , _ , - , . <br>Click to temporarily hide this hint.
            </div>

            <div id="content">

                <div class="padding"> 

                    <html:form action="/create_script" method="post" >
                        <br>
                        <table border="0" width="95%">
                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">Job Details </p>
                                </td>
                            <tr>
                                <td colspan="3">
                                    <hr>
                                </td>
                            </tr>

                            <tr>

                                <td class="content" onmouseover="showhint();" onclick="showme('scriptname');">* <a>Script Name</a></td>
                                <td><INPUT type="text" id="scriptname" name="scriptname" placeholder="Script Name" 
                                           autocomplete='off' class="text" onclick="hidehint();">
                                    <div id="req1" class="reqfield"><p>Provide Scriptname !</p></div>
                                    <div id="vldsc" class="reqfield"><p>Enter data in correct format!</p></div></td>
                            </tr> 

                            <tr>
                                <td class="content" onclick="showme('jobname');">* <a>Job Name</a></td>
                                <td><INPUT type="text" id=jobname name="jobname" placeholder="Job Name" 
                                           autocomplete='off' class="text" onclick="hidehint();">
                                    <div id="req2" class="reqfield"><p>Provide Jobname !</p></div>
                                    <div id="vldjb" class="reqfield"><p>Enter data in correct format!</p></div></td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">

                                        Resources </p>
                                </td>
                            <tr>
                                <td colspan="3"> 
                                    <hr>
                                </td>
                            </tr>
                            <tr>
                                <td class="content" onclick="showme('wlt');">* <a>Wall Clock Time</a></td>
                                <td><INPUT type="text" id=wtime name="wtime" placeholder="HH:MM:SS" 
                                           class="text">
                                    <div id="req3" class="reqfield"><p>Provide Wallclocktime</p></div></td>
                            </tr>

                            <tr>

                                <td class="content" onclick="showme('nnodes');">* <a>No. of Nodes</a>
                                   
                                </td>
                                <td><INPUT type="text" id=nnodes name="nnodes" placeholder="Number of Nodes" 
                                           class="text">
                                    <div id="req4" class="reqfield"><p>Fill No. of Nodes</p></div></td>
                            </tr>

                            <tr>

                                <td class="content" onclick="showme('ppn');">* <a>Process Per Node</a>
                                   
                                </td>
                                <td><INPUT type="text" id=ppn name="ppn" placeholder="Process Per Node" 
                                           class="text" value="3">
                                    <div id="req5" class="reqfield"><p>Fill Process per Node !</p></div></td>
                            </tr>

                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        Email Notification </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"> 
                                    <hr>
                            </tr>
                            <tr>
                                <td class="content" onclick="showme('email');"><a>Send Email At</a>
                                </td>
                                <td>
                                    <INPUT type="checkbox" id="start" name="start" value="b" tabindex="15"> <a>Start Of Job</a>
                                    &nbsp; &nbsp;  <INPUT type="checkbox" id="end" name="end" value="e" tabindex="16"> <a>End Of Job</a>
                                    &nbsp; &nbsp;<INPUT type="checkbox" id="abort" name="abort" value="a" tabindex="17"> <a>Abort Of Job</a></td>
                            </tr>

                            <tr>

                                <td class="content" onclick="showme('emailto');"><a>Send Mail To (EmailId)</a> </td>
                                <td><INPUT type="text" id=emailid name="emailid" placeholder="Enter Comma Seperated List" 
                                           class="text"></td>
                            </tr>

                            <tr>
                                <td></td><td>
                                    <br><br>
                                    <input type="submit" class="content_button" name="next" id="next" value="NEXT" onclick="return check_for_empty_fields();">
                                    &nbsp; &nbsp;&nbsp; &nbsp;<input type="button" class="content_button" name="reset" id="reset" value="RESET" onclick="reset_fields();">
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" id="action_stat" name="action_stat" value="<%=action_stat%>" />
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



</html:html>

