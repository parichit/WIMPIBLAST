<%-- 
    Document   : Submit-Job
    Created on : 2 Aug, 2013, 12:22:32 PM
    Author     : parichit
--%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html:html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/submit-job.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Molengo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico"> 
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>
        <title>WImpiBLAST Submit-Job</title>


        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/Submit_job.js"></script>

        <%

            response.setHeader("Cache-Control", "private");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String dflt_loc = session.getAttribute("homedir").toString();
            String action_stat = session.getAttribute("action_stat").toString();
            session.setAttribute("action_stat", "dflt");


        %>



    </head>
    <body onload="showstat();">

        <div id="help_menu">

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;;text-decoration: underline;">Help Menu</p>
            <p class="information"> Click on parameters i.e. 'Random Script' , 'Script Path' etc. to display help.
                <br> <br> Caution: Always Log out after completing your work.<br><br>
                * Def: Definition <a style="text-decoration: none;float: right;cursor: pointer;box-shadow: 1px 2px 1px 1px ;" onclick="showme('wrkflw');">
                    Hide Help</a>
                * Expl: Explanation

            </p> 
            <hr>
            <p id='rsc' class="helpinfo"> Random Script: Mandatory<br><br>
                Def: Select 'No' if you are not an expert user.<br><br>
                Expl: If you have created script through 'Create New Script' module then it is not a random script.
                The term 'Random' is used for scripts which are not created by 'Create New Script'.
                <br><br>Some users may create scripts from command line rather than by WImpiBLAST interface. Such scripts also can
                be submitted for execution. These scripts are referred as 'Random' scripts in WImpiBLAST.<br><br>
                Tip: If you are in doubt or do not understand the definition please choose 'No'.

            </p>
            <p id='scp' class="helpinfo"> Script Path: Mandatory <br><br>
                Def: The path to the script for submission.<br><br>
                Expl: You must provide the script path to submit it for execution. <br><br>
                To find script path, follow<br>
                1. Utility -- > File Manager <br>
                2. Click 'Tree View' <br>
                3. Click on your script in list. <br>
                4. The path to that script will be displayed in 'Get Path'. <br>
                5. Move cursor over path to select it, copy it. <br>
                6. Paste in 'Script Path' field. <br>
                <br><br>
                Tip: You will find the script at the same location as given in Script Location field of 'Create New Script' form.
            </p>

            <p id='jbnm' class="helpinfo"> Job Name: Mandatory <br><br>
                Def: The name of your job.<br><br>
                Expl: Single script can be submitted by different names for execution.  <br><br>

                For e.g. if same script have to be submitted again by changing location of fasta file
                or output file then it should be submitted with different name to distinguish it from 
                previous runs. <br><br>

                For e.g. If you create a script 'myscript.sh' then it can be submitted with job name 'myjob'. <br><br>
                The same script can also be submitted with job name 'myjob2' after minor changes in script.

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

            <p id='oloc' class="helpinfo"> StandardOut Location: Optional <br><br>
                Def: Path of file where output generated during execution will be written.<br><br>
                Default: By default all output files will be generated in your directory with JOBID as name of output file.<br>
                To override default, delete current value from 'StandardOut Location' and enter your own path.<br><br>
                Tip: For selecting own paths follow, <br>
                1. Utility -- > File Manager <br>
                2. Click 'Tree View' <br>
                3. Click on any folder in list. <br>
                4. The path to that folder will be displayed in 'Get Path'. <br>
                5. Move cursor over path to select it, copy it. <br>
                6. Paste in 'StandardOut Location'. <br>
                7. After pasting path in 'StandardOut Location', enter name for output file after it.<br><br>

                Tip: If no name is provided for output file then it will be generated with JOBID as name. 

            </p>

            <p id='eloc' class="helpinfo"> StandardErr Location: Optional<br><br>
                Def: Path of file where errors generated during job execution will be written.<br><br>
                Default: By default all error files will be generated in your directory with JOBID as file name.<br>
                To override default, delete current value from 'StandardErr Location' and enter your own path.<br><br>
                Tip: For selecting own paths follow, <br>
                1. Utility -- > File Manager <br>
                2. Click 'Tree View' <br>
                3. Click on any folder in list. <br>
                4. The path to that folder will be displayed in 'Get Path'. <br>
                5. Move cursor over path to select it, copy it. <br>
                6. Paste in 'StandardErr Location'.<br>
                7. After pasting path in 'StandardErr Location', enter name for error file after it.<br><br>

                Tip: If no name is provided for error file then it will be generated with JOBID as name. 

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

            <div id ="showemptyfields" class="showemptyfields">

                <p align="center"> Looks like you missed some thing. Don't worry! Just fill in the fields to get going!.</p>

            </div>

            <div id="yes" class="showsuccessstatus">
                <p align="center">
                    Job Submission was Successful. </p>  
            </div>

            <div id="no" class="showerrorstatus">
                <p align="center">

                    It seems the job can not be submitted now.We are very sorry for this inconvenience.<br>
                    Meanwhile you can submit the job manually on the cluster.<br> If you see this error often please report this issue to our administrator. We would be more than happy to help you out!.
                    <br>Your Computational Biology Team @ NABI</p>  
            </div>

            <div id="excep" class="showerrorstatus">
                <p align="center">
                    Either the script you submit does not exist or there is some error in parameters of script.<br>Please check your script carefully to remove any unnecessary spaces/blank characters from script.</p>
            </div>

            <div id="content">

                <div class="padding"> 

                    <html:form action="/submitjob">

                        <table border="0" width="90%">

                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        Script Type </p>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <hr>                          
                                </td>
                            </tr>
                            <tr>
                                <td class="content" onclick="showme('rsc');"><a>Random Script</a> </td>
                                <td><input type="radio" id=randomscript name="randomscript" value="Yes" onclick="showform(this.value);"><a>Yes</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id=randomscript name="randomscript" value="No" onclick="showform(this.value);"><a>No</a>
                                </td>
                            </tr> 
                        </table>

                        <div id ="hiddenform" class="hidden_details">
                            <table border="0" width='90%'>
                                <tr>
                                    <td>
                                        <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                            Job Details </p>
                                    </td>
                                <tr>
                                    <td colspan="3">
                                        <hr>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="content" onclick="showme('scp');">*<a>Script Path</a></td>
                                    <td><input type="text" id=scriptpath name="scriptpath" 
                                               placeholder="Path to the Script" autocomplete='off' class="text">
                                        <div id="req1" class="reqfield"><p>Please fill Scripath!</p></div></td>
                                </tr>

                                <tr>
                                    <td class="content" onclick="showme('jbnm');">* <a>Job Name</a></td>
                                    <td><input type="text" id=jobname name="jobname" placeholder="The Job Name" 
                                               autocomplete='off' class="text">
                                        <div id="req2" class="reqfield"><p>Please fill Jobname!</p></div></td>
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
                                    <td><input type="text" id=wtime name="wtime" placeholder="HH:MM:SS" 
                                               autocomplete='off' class="text">
                                        <div id="req3" class="reqfield"><p>Please provide WallClockTime!</p></div></td>
                                </tr>

                                <tr>

                                    <td class="content" onclick="showme('nnd');">* <a>No. of Nodes</a>

                                    </td>
                                    <td><input type="text" id=nnodes name="nnodes" placeholder="Number of Nodes" 
                                               autocomplete='off' class="text">
                                        <div id="req4" class="reqfield"><p>Please provide No. of Nodes!</p></div></td>
                                </tr>

                                <tr>
                                    <td class="content" onclick="showme('pn');">* <a>Process Per Node </a>

                                    </td>
                                    <td><input type="text" id=ppn name="ppn" placeholder="Process Per Node" 
                                               autocomplete='off' class="text" value="3">
                                        <div id="req5" class="reqfield"><p>Please provide Process per Node!</p></div></td>
                                </tr>

                                <tr>
                                    <td>
                                        <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                            Data Management </p>

                                    </td>

                                </tr>

                                <tr>
                                    <td colspan="3"> 

                                        <hr>
                                    </td>
                                </tr>

                                <tr>

                                    <td class="content" onclick="showme('oloc');"><a>StandardOut Location</a> </td>
                                    <td><input type="text" id=outputloc name="outputloc" placeholder="Standard Output" 
                                               value="<%=dflt_loc%>" autocomplete='off' class="text"></td>
                                </tr>

                                <tr>

                                    <td class="content" onclick="showme('eloc');"><a>StandardErr Location</a> </td>
                                    <td><input type="text" id=errorloc name="errorloc" placeholder="Standard Error" 
                                               value="<%=dflt_loc%>" autocomplete='off' class="text"></td>
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
                                    </td>
                                </tr>

                                <tr>

                                    <td class="content" onclick="showme('em');"><a>Send Email at</a>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="start" name="start" value="b" > <a>Start Of Job</a>
                                        &nbsp; &nbsp;<input type="checkbox" id="end" name="end" value="e" > <a>End Of Job</a>
                                        &nbsp; &nbsp;<input type="checkbox" id="abort" name="abort" value="a" > <a>Abort Of Job</a></td>
                                </tr>

                                <tr>

                                    <td class="content" onclick="showme('emt');"><a>Send Mail To (EmailId)</a> </td>
                                    <td><input type="text" id=emailid name="emailid" placeholder="Enter Email Id" 
                                               autocomplete='off' class="text"></td>
                                </tr>

                                <tr>
                                    <td></td><td>
                                        <br><br><br>
                                        <input type="submit" class="content_button" name="button" id=button value="SUBMIT" onclick="return check_for_empty_fields();">
                                        &nbsp; &nbsp;&nbsp; &nbsp;<input type="button" class="content_button" name="reset" id=reset value="RESET" onclick="reset_fields();">
                                    </td>
                                </tr>

                            </table> 

                        </div>


                        <div id ="hiddenform1" class="hidden_details">
                            <table width='90%'>

                                <tr>
                                    <td>

                                        <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                            Job Details </p>

                                    </td>

                                <tr>
                                    <td colspan="3">
                                        <hr>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="content" onclick="showme('scp');">*<a> Script Path</a>  </td>
                                    <td><INPUT type="text" id=scriptpath1 name="scriptpath1" placeholder="Path to the Script" 
                                               autocomplete='off' class="text"></td>
                                    <td><div id="req6" class="reqfield"><p>Please fill Scripath!</p></div></td>
                                </tr>

                                <tr>
                                    <td></td><td>
                                        <br><br><br>
                                        <input type="submit" class="content_button" name="button" id="button" value="SUBMIT" onclick="return check_for_empty_fields1();">
                                        &nbsp; &nbsp;&nbsp; &nbsp;<input type="button" class="content_button" name="reset" id=reset value="RESET" onclick="reset_fields();">
                                        <input type="hidden" id="action_stat" name="action_stat" value="<%=action_stat%>" />

                                    </td>
                                </tr>

                            </table>

                        </html:form>

                    </div>


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
