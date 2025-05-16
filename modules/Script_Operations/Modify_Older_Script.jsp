<%-- 
    Document   : Modify-Older-Script
    Created on : 2 Aug, 2013, 12:21:43 PM
    Author     : parichit
--%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Modify-Script.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Molengo|Cardo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">
        <title>WImpiBLAST Modify-Script</title>


        <%

            response.setHeader("Cache-Control", "private");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String action_stat;
            String username = session.getAttribute("username").toString();
            String hostname = session.getAttribute("hostip").toString();
            String homedir = session.getAttribute("homedir").toString();
            action_stat = session.getAttribute("action_stat").toString();
            session.setAttribute("action_stat", "dflt");

        %>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery-ui/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/spin.js"></script>
        <script type="text/javascript">
            var dflt_hme = '<%=session.getAttribute("homedir").toString()%>';
        </script>
        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/Modify_Script.js"></script>



    </head>
    <body onload="showstat();">

        <div id="help_menu">

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;;text-decoration: underline;">Help Menu</p>
            <p class="information"> Parameter related information will be displayed in this section. Click on any parameter e.g. 'Script Path, Editing Panel etc.' to display help. 
                <br> <br> Caution: Incorrect information may lead to unsaved changes. Always log out
                after completing your work.<br><br>
                * Def: Definition <a style="text-decoration: none;float: right;cursor: pointer;box-shadow: 1px 2px 1px 1px ;" onclick="showme('wrkflw');">
                    Hide Help</a>
                * Expl: Explanation <br>
            </p> 
            <hr>
            <p id='scrpa' class="helpinfo"> Script Path: Mandatory<br><br>
                Def: The script that you want to change.<br><br>
                Expl: For e.g. If you want to change a script present in your home directory then enter path "/homedirectory/yourscript.sh"<br><br>
                For finding paths, follow <br>
                1. Utility -- > File Manager <br>
                2. Click 'Tree View' <br>
                3. Click on any file in 'Tree View List' <br>
                4. The path to that file will be displayed in 'Get Path'. <br>
                5. Move cursor over path to select it, copy it. <br>
                6. Paste in 'Script Path'.<br>
                7. If script is present inside folder then double click that folder to display its contents.<br>
                8. Click on file, copy its path from "Get Path" and paste here.<br>

            </p>
            <p id='edpnl' class="helpinfo"> Editing Panel: Mandatory <br><br>
                Def: The content of script will be displayed here.<br><br>
                Expl: You can change the contents of script in this panel.

            </p>

            <p id='svas' class="helpinfo"> Save As: Optional <br><br>
                Def: Select 'Yes' if you want to save the changes in new script.<br><br>
                Expl: If you want to save changes in new script then choose 'Yes' for Save As and enter new name for script.<br>
                By default the changes will be overwritten in same script.
            </p>

            <p id='svsrptas' class="helpinfo"> Save Script As: Mandatory if Save As is 'Yes'<br><br>
                Def: The name of new script in which changes will be saved.<br><br>
                Expl: The new script will be created in the same directory as original script. <br>

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

            <div id="main-nav">
                <%@include file="/Navigation_Menu/Navigation-Layout.jsp"%>
            </div>


            <div id ="showemptyfields" class="showemptyfields">

                <p align="center"> It seems you missed a thing.File can not be displayed till you provide the path of that file.
                    <br>Just provide the path and file will display in no time!.</p>
            </div>

            <div id ="showemptyfields1" class="showemptyfields">

                <p align="center"> An empty file can not be changed. Please open a file for making changes.
                    <br>Just fill in the required fields and we will sort you out in no time.</p>
            </div>

            <div id ="showemptyfields2" class="showemptyfields">

                <p align="center"> Please provide new name for file.</p>

            </div>

            <div id ="showemptyfields3" class="showemptyfields">

                <p align="center">An empty file can not be modified.<br>Please click on display after selecting the file!</p>
            </div>

            <div id="yes" class="showsuccessstatus">
                <p align="center">
                    Script Modification was Successful. </p>  
            </div>

            <div id="no" class="showerrorstatus">
                <p align="center">

                    It seems the script you tried changing can not be modified now.<br>
                    Meanwhile you can try to change the script manually.<br> 
                    If you see this error often please report this to Administrator@Computational Biology Team.</p>  
            </div>

            <div id="excep" class="showerrorstatus">
                <p align="center">
                    Maximum file size limit is crossed.You can't modify large scripts on web.!!
                    <br>Please modify this file manually.For further assistance contact Administrator@Computational Biology lab.</p>
            </div>

            <div id="per0" class="showerrorstatus">
                <p align="center">

                    Permission Denied. Path should be within user's home directory.<br></p>  
            </div>

            <div id="light" class='light'><p id='ani' class="ani">Loading ...</p></div>
            <div id="fade" class='fade'></div>

            <div id="hint">
                Click for help!
            </div>

            <div id="content">

                <div class="padding"> 

                    <html:form action="/modifyscript">

                        <table border="0" width="90%" style="white-space: nowrap;">

                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        Initial Details </p>
                                </td>

                            </tr>

                            <tr>
                                <td colspan="2"> 

                                    <hr>

                                </td>
                            </tr>

                            <tr>
                                <td class="content" onclick="showme('scriptpath');">* <a>Script Path</a>

                                </td>

                                <td ><input type="text" id="scriptpath" name="scriptpath" placeholder="Enter Script Path" 
                                            autocomplete='off' style="width:76%;height:70%;">&nbsp;&nbsp;
                                    <input type="button" class="content_button2" name="displayfile" id="displayfile" value="DISPLAY" onclick="loadscript();">

                                </td>
                                <td><div id="req1" class="reqfield"><p>Please fill Scriptpath.</p></div></td>


                            </tr>

                            <tr>
                                <td class="content" onclick="showme('edit');"><a>Editing Panel</a>

                                </td>

                                <td>
                                    <textarea id=editedscript name="editedscript" rows="10" cols="50" class="content_area1" readonly></textarea>
                                </td> 
                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        New Details </p>
                                </td>

                            </tr>

                            <tr>
                                <td colspan="2"> 

                                    <hr>

                                </td>
                            </tr>

                            <tr>
                                <td class="content" onclick="showme('saveas');"><a> Save As</a>


                                </td>

                                <td><input type="radio" id="yes" name="choice" value="Yes" onclick="show_form(this.value);" /><a>Yes</a>
                                    &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" id="no" name="choice" value="No" onclick="show_form(this.value);"><a>No</a>
                                </td>

                            </tr>

                        </table>
                        <div id="hidden_details" class="hidden_details">
                            <table border="0">
                                <tr>
                                    <td class="content" onclick="showme('savescas');">*<a>Save Script As</a>
                                    </td>   
                                    <td>
                                        <INPUT type="text" id=newname name="newname" placeholder="Enter the New Name" 
                                               autocomplete='off' class="text"/> 
                                    </td>
                                    <td><div id="req2" class="reqfield"><p>Please provide new name.</p></div></td>
                                </tr>

                            </table>

                        </div>
                    </div>
                    <br><br><br>
                    <table border="0" class="adjust">

                        <tr>
                            <td> 
                                <input type="submit" class="content_button2" id=button name="button" value="SAVE SCRIPT" onclick="return check_for_empty_fields();">  
                                &nbsp; &nbsp;&nbsp; &nbsp;<input type="button" class="content_button2" name="reset" id="reset" value="RESET" onclick="reset_fields();">
                                <input type="hidden" id="action_stat" name="action_stat" value="<%=action_stat%>" />

                            </td>
                        </tr>

                    </table>

                </html:form>
            </div>
            <br>

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
