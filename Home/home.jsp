<%-- 
    Document   : home
    Created on : 14 Aug, 2013, 3:37:43 PM
    Author     : parichit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/home.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">
        <link href="http://fonts.googleapis.com/css?family=Molengo" rel="stylesheet" type="text/css">
        <title>WImpiBLAST Home</title>

        <%

            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            String username = "";
            String hostname = "";
            String homedir = "";
            if (session.getAttribute("username") == null && session.getAttribute("hostip") == null && session.getAttribute("homedir") == null) {
                username = "";
                hostname = "";
                homedir = "";
            } else {
                username = session.getAttribute("username").toString();
                hostname = session.getAttribute("hostnewname").toString();
                homedir = session.getAttribute("homedir").toString();
            }
        %>


    </head>
    <body>


        <div id="help_menu">

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: 
               bold;color:#6082B6;font-size: 20px; text-align: center;">Work Flow</p>
            <p class="information"> Please see following sequence of steps to submit jobs.
                <br><br> Caution: Always Log out after completing your work.<br><br>
            </p>       
            <hr>
            <br>

            <img src="../Design/images/outline.png" width="328" /> 

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
            <br>
            <div id="sidebar-a">      

                <div class="padding" >

                    <fieldset style="border: 0px solid ;border-color: #353539;padding-bottom: 20px;padding-left: 10px;padding-right: 0px;padding-top: 10px;">

                        <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 17px;color: #0772A1;">Instructions</legend>

                        <table border="0" align="center">

                            <tr>
                                <td><p class="information1"> --> All uploaded files will be present in 'WIMPIUpload' folder of home directory.</p></td>
                            </tr>

                            <tr>
                                <td><p class="information1"> --> For WImpiBLAST user manual, installation manual and Quick start guide documents please write to ict[at]nabi[dot]res[dot]in or
                                        use 'Contact us' link.</p></td>
                            </tr>

                            <tr>
                                <td><p class="information1"> --> For any request/query/issue, please use 'Contact Us' link in footer.</p></td>
                            </tr>

                        </table>

                    </fieldset>

                </div>

            </div>

            <div id="content">

                <div class="padding"> 

                    <p> <strong>Welcome <%=username%> !</strong> </p>

                    <table style="width: auto;height: auto;" border="0">
                        <tr>
                            <td><p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 15px;color: #0772A1; font-weight: bold;">
                                    Cluster Name:</p></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 16px;color: black; padding-bottom: 8px;"><%=hostname%></p></td>
                        </tr>

                        <tr>
                            <td><p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 15px;color: #0772A1;font-weight: bold;">Username:</p></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 16px;color: black;padding-bottom: 8px;"><%=username%></p></td>
                        </tr>
                        <tr>
                            <td><p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 15px;color: #0772A1;font-weight: bold;">Home Directory:</p></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 16px;color: black;padding-bottom: 8px;"><%=homedir%></p></td>
                        </tr>
                    </table>

                </div>

            </div>
            <br>

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: bold;
               color: #0772A1;margin-left: 3%;font-size: 18px;">New Features </p>

            <div class="features">

                <div class="featurehead">
                    Try the All New Turbo Submit (Highly Recommended)<br>[Announced: April/7/2014]
                </div>

                <div class="featuredesc">
                    Turbo Submit reduces the script creation and submit time cycle manifold, now users only need to 
                    browse for their input query file and Click on 'Turbo Submit'. Explore 'Turbo Submit'

                </div>

                <div class="featurehead">
                    Experience the Organized Job Directory Structure<br>[Announced: April/4/2014]
                </div>

                <div class="featuredesc">
                    Now, with each successful job, a dedicated directory is created for holding all 
                    the files for that job. The directory bears the same name as jobname given by user, to help
                    in remembering the particular files. The jobs directories are  
                    created inside 'WIMPIHome' directory of user's home.
                </div>

                <div class="featurehead">
                    Find Scriptname Information of Jobs<br>[Announced: March/31/2014]
                </div>

                <div class="featuredesc">
                    The script associated with each job is now displayed in "View Job". Helps you to 
                    remember which scripts are associated with the running jobs.
                </div>

                <div class="featurehead">
                    Explore New Way of Browsing Files/Folders<br>[Announced: March/29/2014]
                </div>

                <div class="featuredesc">
                    All the files are now sorted by last modification time, so you don't
                    have to look for newly created files every time you submit a job. You will find new
                    files/folders at the top of Tree View. Additionally size of each file is 
                    now displayed besides the file to help in assessing the progress of result. Explore utilities --> File Manager --> Tree View.
                </div>
                <div class="featurehead">
                    Create & Download Folder<br>[Announced: March/23/2014]
                </div>

                <div class="featuredesc">
                    Now you can create your own folder to house different files or data at one place.
                    Also, just click on any folder to download it in compressed form. Explore Utilities --> File manager --> Tree View
                    --> Create Folder.
                </div>
                <div class="featurehead">
                    Check out sample files.<br>[Announced: March/20/2014]
                </div>

                <div class="featuredesc">
                    Before creating or submitting scripts, check out how the final job script and result files will 
                    look like. Explore 'demo_run' folder in Utilities --> File Manager for details.
                </div>

                <div class="featurehead">
                    Save & Submit Script in One Go! <br>[Announced: Feb/14/2014]
                </div>

                <div class="featuredesc">
                    After completing second form of 'Create New Script', Just Click on 'Save & Submit' to save
                    and submit script. You will be taken to 'Job Reporting' page directly.
                </div>

                <div class="featurehead">
                    Upload Files Directly.<br> [Announced: Feb/12/2014]
                </div>

                <div class="featuredesc">
                    Upload input files (fasta, fna, fa) directly while creating script. No more need to visit
                    'File Manager' every time you want to upload a input file.
                </div>

                <div class="featurehead">
                    Try New Way of Entering Advance Parameters.<br> [Announced: Feb/12/2014]
                </div>

                <div class="featuredesc">
                    The old textbox is replaced by new form including help information of supported parameters.
                </div>

                <div class="featurehead">
                    Find Workflow Diagram on Every Page.<br> [Announced: Feb/10/2014]
                </div>

                <div class="featuredesc">
                    A workflow diagram to let you understand how to submit scripts. 
                </div>

                <div class="featurehead">
                    Quick Access 'Help Menu' on Each Page.<br> [Announced: Feb/01/2014]
                </div>

                <div class="featuredesc">
                    Just click on any parameter on page to display parameter information
                    . Hide help anytime using 'Hide Help' in top right hand side of 'Help Menu'.
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

