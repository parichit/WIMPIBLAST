<%-- 
    Document   : List-Job
    Created on : 2 Aug, 2013, 12:22:09 PM
    Author     : parichit
--%>

<%@page import="sun.security.util.Length"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/app.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Molengo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">
        <title> WImpiBLAST mpiblast - script </title>

        <%
            response.setHeader("Cache-Control", "private");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String homedir = session.getAttribute("homedir").toString();
            String job_dir = session.getAttribute("jobname").toString();
            String action_stat = session.getAttribute("action_stat").toString();
            String ippath = "";
            String op_path = "";
            if (action_stat.equals("yesupld")) {
                ippath = session.getAttribute("ippath").toString();
                
                op_path = ippath.substring(0, ippath.lastIndexOf("/")) + "/" + ippath.substring(ippath.lastIndexOf("/") + 1, ippath.length()) + "_result";

            }
            session.setAttribute("action_stat", "dflt");
           
        %>

        <script type="text/javascript">

            var homedir = '<%=homedir%>';
            var job_dir = '<%=job_dir%>';
        </script>

        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js" ></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/Mpiblast.js"  ></script>

    </head>
    <body onload="showstat();">

        <div id="help_menu">

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;;text-decoration: underline;">Help Menu</p>
            <p class="information"> Parameter related information will be displayed in this section. Click on any parameter e.g. 'Blast Database, Blast Program etc.' to display help. 
                <br> <br> Caution: Incorrect parameters may lead to job termination. Always log out
                after completing your work.<br><br>
                * Def: Definition  <a style="text-decoration: none;float: right;cursor: pointer;box-shadow: 1px 2px 1px 2px ;" onclick="showme('wrkflw');">
                    Hide Help</a>
                * Expl: Explanation
            </p>       
            <hr>
            <p id='bdb' class="helpinfo"> Blast Database: Mandatory<br><br>
                Def: The database in which sequences will be searched.<br><br>
                Expl: This is a mandatory parameter. The sequences present in your fasta file will be
                searched in this database.<br><br>

            </p>
            <p id='if' class="helpinfo"> Input File: Mandatory <br><br>
                Def: Path to your fasta file.<br><br>
                Expl: You must provide a fasta file that consist of sequences to be searched. <br><br>
                To upload files, follow <br>
                1. Click on 'Browse'. It will open files present on your system. <br>
                2. Navigate and select file that you want to upload. <br>
                3. Click on 'Upload File' to start uploading.<br>
                4. The file path will appear in Inut File field.<br><br>
                Tip: If you don't have files but sequences then you should copy those sequences in plain text file and upload that file.
                Do not attempt repetitive uploads if previous upload is processing. It may also corrupt your files.
                Sometimes due to network issues, it may take longer for uploading.
            </p>

            <p id='of' class="helpinfo"> Output File: Mandatory <br><br>
                Def: Path for output file.<br><br>
                Expl: You must provide a valid path and name for your output file. <br><br>
                After uploading input file, a default output file path will be enabled.<br>
                For selecting your own path, follow<br>
                1. Open File Manager in new tab. <br>
                2. Click 'Tree View' button. <br>
                3. Click on folder in which you want the output file to be created. <br>
                4. The path to that folder will appear in 'Get Path'.<br>
                5. Copy that path and paste here. After the path enter your desired file name.<br><br>
                Tip: You can create output file at any location. The default location is home directory.
            </p>

            <p id='bp' class="helpinfo"> Blast program: Mandatory <br><br>
                Def: The blast program to use.<br><br>
                Tip: See list of current supported programs in drop down menu adjacent to this field.
            </p>
            <p id='ap' class="helpinfo"> Advanced Parameters: Optional <br><br>
                Def: Provide any additional parameters to customize search.<br><br>
                Expl: These parameters may include 'expect value, output format' etc. 
                Simply enter desirable values to customize search criteria.
                <br><br>
                Tip: Click 'Advance Parameter' text for list of supported parameters values.
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
                </div>

            </div>
            <div id="main-nav"><%@include file="/Navigation_Menu/Navigation-Layout.jsp"%></div><br>
            <br>
            <div id ="showemptyfields" class="showemptyfields"><p align="center">
                    It Seems you missed some thing. Just fill in the fields to complete your script.</p>
            </div>

            <div id="yes" class="showsuccessstatus">
                <p align="center">
                    Script creation successful.</p>  
            </div>

            <div id="no" class="showerrorstatus">
                <p align="center">

                    The script can't be created now! Kindly try again later.<br></p>  
            </div>

            <div id="param" class="showerrorstatus">
                <p align="center">

                    There seems to be some issue with parameter settings in configuration file. Please check the parameter values in '.WImpiBLAST.conf'<br>
                    file to ensure all parameters are properly filled. Also ensure that the file exists at default location.
                    <br>In case of any doubt please contact system administrator.
                </p>  
            </div>

            <div id="excep" class="showerrorstatus">
                <p align="center">
                    Due to technical issues ,your request can not be processed now!!Please try again later.
                    <br>If this issue persists kindly contact the Administrator@Computational Biology lab.</p>
            </div>

            <div id="excepupld" class="showerrorstatus">
                <p align="center">
                    Due to technical issues upload for this file can not be processed.<br>
                    For further assistance please contact the Administrator@Computational Biology lab.
                </p>
            </div>

            <div id="noupld" class="showerrorstatus">
                <p align="center">
                    The file upload request can not be processed for this file.
                    Either the same file already exist at the destination or the file name is empty.<br>
                    Try again by changing file name.
                </p>

            </div>

            <div id="yesupld" class="showsuccessstatus">
                <p align="center">
                    File will be uploaded to '<%=homedir + "WIMPIHome" + "/" + job_dir%>'<br>
                    The result file will be created in'<%=homedir + "WIMPIHome" + "/" + job_dir%>'<br></p> 
            </div>

            <div id="jobfail" class="showerrorstatus">
                <p align="center">
                    Job Submission Unsuccessful. </p>  
            </div>

            <div id="upfilesize" class="showerrorstatus">
                <p align="center">
                    This file violates upload limit of 200Mb. Please select file of lesser size.<br>
                </p>

            </div>

            <div id="hint">
                Click for help!
            </div>

            <div id="light" class='light'>Advance Parameter Help<br>
                When done click anywhere outside this box to close parameter help.<table> 
                    <div class="prmtrinfo"> <br>Expectation value [Real]
                        <br>default = 10.0<br>
                    </div>
                    <div class="prmtrinfo"> <br>alignment view options: (output file format) <br>
                        0 = pairwise,<br>
                        1 = query-anchored showing identities,<br>
                        2 = query-anchored no identities,<br>
                        3 = flat query-anchored, show identities,<br>
                        4 = flat query-anchored, no identities,<br>
                        5 = query-anchored no identities and blunt ends,<br>
                        6 = flat query-anchored, no identities and blunt ends,<br>
                        7 = XML Blast output,<br>
                        8 = tabular,<br>
                        9 tabular with comment lines<br>
                        10 ASN, text<br>
                        11 ASN, binary [Integer]<br>
                        default = 9,range from 0 to 11<br>
                    </div>
                    <div class="prmtrinfo"><br> Number of database sequences to show one-line descriptions for [Integer]<br>
                        default = 1 <br>
                    </div>
                    <div class="prmtrinfo">Number of database sequence to show alignments for [Integer]<br>
                        default = 1<br>
                    </div>
                </table>

            </div>
            <div id="fade" class='fade' onclick="hideparam();"></div>
            <div id="content">
                <div class="padding"> 
                    <html:form action="/blastscript" method="post" enctype="multipart/form-data">
                        <table border="0" width="95%">
                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        Mpiblast Details </p>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr>
                                    <br>
                                </td>
                            </tr>
                            <tr>
                                <td class="content" onclick="showme('if');"><a>Input File</a> </td>
                                <td> <INPUT type="text" id=inputfilepath name="inputfilepath" placeholder="Upload i/p file" autocomplete='off' 
                                            value="<%=ippath%>" class="text"/> &nbsp;
                                    <input type="file" name="uploadFile" id="uploadFile" class="file" onchange="return do_upload(this.value);"/>
                                    <input type="button" value="Browse" class="content_button2" onclick="do_click();"/> 
                                    <div id="req2" class="reqfield"><p>Please select InputFile!</p></div>
                                </td>

                            </tr> 
                            <tr>
                                <td class="content" onclick="showme('of');"><a>Output File</a></td>
                                <td><INPUT type="text" id=outputfilepath name="outputfilepath" placeholder="o/p file" autocomplete='off'
                                           value="<%=op_path%>" class="text">
                                    <div id="req3" class="reqfield"><p>Please select OutputFile!</p></div></td>
                            </tr>

                            <tr>
                                <td class="content" onclick="showme('bdb');"><a>Blast Database</a> </td>
                                <td><SELECT id=blastdb name="blastdb" class="drpdwn">
                                        <OPTION value="nr" selected>nr</OPTION>
                                    </SELECT>
                                    <div id="req1" class="reqfield"><p>Please Select Database!</p></div></td>
                            </tr>

                            <tr>
                                <td class="content" onclick="showme('bp');"><a>Blast Program</a></td>
                                <td><SELECT id=blastbinary name="blastbinary" class="drpdwn">
                                        <OPTION value="blastx" selected>blastx</OPTION>
                                        <OPTION value="blastn">blastn</OPTION>
                                        <OPTION value="blastp">blastp</OPTION>                                                
                                    </SELECT></td>
                            </tr>

                            <tr>
                                <td colspan="4">
                                    <hr>
                                </td>
                            </tr>

                            <tr>
                                <td class="content" onclick="showhelp();"><a>Advance Parameter</a> &nbsp; &nbsp;  
                                </td>
                                <td>
                                    <input type="button" class="helpbutton" id="showap" value="Fill Advance Parameters" onclick="showme('ap');" title="Click to start filling.">  
                                    <input type="button" class="helpbutton" id="hideap" style="display: none" value="Hide Advance Parameter" onclick="showme('hideap');" title="Click for Help!">  
                                </td>
                            </tr>
                            <tr>

                                <td class="advanceparam">

                                    Expectation Value<br>
                                    (Default = 10.0)


                                </td>
                                <td>

                                    <INPUT type="text" id=evalue name="evalue" placeholder="E Value" 
                                           autocomplete='off' class="advancetext"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="advanceparam">
                                    Alignment View Options<br>
                                    (Default = 9)
                                </td>
                                <td>
                                    <INPUT type="text" id=outfmt name="outfmt" placeholder="Output Format" 
                                           autocomplete='off' class="advancetext"/>
                                </td></tr>
                            <tr>
                                <td class="advanceparam">
                                    Database Sequences to Show One-Line Descriptions For
                                    (Default = 1)
                                </td>
                                <td>
                                    <INPUT type="text" id=numdesc name="numdesc" placeholder="Enter value" 
                                           autocomplete='off' class="advancetext"/>
                                </td></tr>
                            <tr>
                                <td class="advanceparam">

                                    Number of Sequence to Show Alignments For
                                    (Default = 1)
                                </td>
                                <td>
                                    <INPUT type="text" id=numalgn name="numalgn" placeholder="Enter Value" 
                                           autocomplete='off' class="advancetext"/>
                                </td></tr>

                            <td></td><td>
                                <input type="submit" name="button" id="button" value="SAVE & SUBMIT" class="content_button" onclick="return check_for_empty_fields();">
                                &nbsp;&nbsp;&nbsp;<input type="button" class="content_button" name="reset" id="reset" value="RESET" onclick="reset_fields();">
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
</html>
