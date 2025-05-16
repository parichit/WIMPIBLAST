<%-- 
    Document   : Download
    Created on : 2 Aug, 2013, 12:23:01 PM
    Author     : parichit
--%>

<%@page import="Utility.UploadAction"%>
<%@page import="Utility.DownloadAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page import="logic_core.Core_func"%>
<%@page import="java.util.ArrayList" language="java" %>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/utilities.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Molengo|Cabin" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">

        <title>WImpiBLAST File-Manage</title>

        <style>


            .extend{

                border:transparent;
                background: #FFFFFF;
                font-size: small;
                -webkit-font-smoothing: antialiased;
                -moz-font-smoothing:antialiased;
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

            .fakefile {
                position: absolute;
                top: 0px;
                left: 0px;
                z-index: 1;
            }

            .fileinputs {
                position: relative;
            }

            .file {
                position: relative;
                text-align: right;
                -moz-opacity:0 ;
                opacity: 0;
                z-index: 2;
            }



        </style>

        <%

            response.setHeader("Cache-Control", "private");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            int i;
            int j;
            int k;
            int file_list_size;
            String action_stat = session.getAttribute("action_stat").toString();
            session.setAttribute("action_stat", "dflt");

        %>
        <script type="text/javascript">

            var dflt_hme = '<%=session.getAttribute("homedir").toString()%>';

        </script>

        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery-ui/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/spin.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/Utility.js"></script>

    </head>
    <body onload="showstat();">

        <div id="help_menu">

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;text-decoration: underline;">Help Menu</p>
            <p class="information"> Parameter related information will be displayed in this section. Click on any parameter e.g. 'Upload Files, View Script, File Path etc.' to display help. 
                <br> <br> Caution: Always Log out after completing your work.<br><br>
                * Def: Definition <a style="text-decoration: none;float: right;cursor: pointer;box-shadow: 1px 2px 1px 1px ;" onclick="showme('wrkflw');">
                    Hide Help</a>
                * Expl: Explanation

            </p>       
            <hr>
            <p id='bhm' class="helpinfo"> Browse Home: Mandatory<br><br>
                Def: Displays list of files and folders in your home directory sorted in descending order by last modification date .<br><br>
                Expl: For e.g. For viewing files and folders click on 'Tree View'. Without list of files or folders no download/upload/viewing can be performed.<br><br> 
                Tip: Double click on folder to see inside it and single click to hide.<br>
                After downloading or uploading files, click 'Tree View' again to see recently uploaded files.
            </p>
            <p id='df' class="helpinfo"> Directory/File Selected<br><br>
                Def: The file to be downloaded.<br><br>
                To download files, follow<br>
                1. Click on any file. <br>
                2. The file name will be displayed under 'Directory/File Selected'. <br>
                3. Click on 'Download' to start download.<br><br>
                Tip: Do not attempt repetitive downloads if previous download is processing. It may also corrupt your files.
                Sometimes due to network issues, it may take longer for downloading.

            </p>

            <p id='uf' class="helpinfo"> Upload Files <br><br>
                Def: The file to be uploaded.<br><br>
                To upload files, follow <br>
                1. Click on 'Browse'. It will open files present on your system. <br>
                2. Navigate and select file that you want to upload. <br>
                3. The file name will appear under 'Upload Files'.<br>
                4. Click on 'Upload File' to start uploading.<br><br>
                Tip: Do not attempt repetitive uploads if previous upload is processing. It may also corrupt your files.
                Sometimes due to network issues, it may take longer for uploading.

            </p>

            <p id='nfl' class="helpinfo"> Create New Folder <br><br>
                Def: To create new folder.<br>
                Expl: Select desired folder from left panel to create new folder. You can also 
                select home directory by clicking on 'Home' button.<br><br>
                To create folder, follow <br>
                1. Click on desired folder inside which you want to create the new folder or click on 'Home' button to for home directory. <br>
                2. The folder path will appear under <b>'New Folder Location'</b> field.<br>
                3. Click on 'Create Folder' button. Enter name for the folder in the dialog box that opens.<br>
                4. Wait until the processing completes.<br>
                5. Click on 'Tree View' button to see your folder.<br><br>
                Tip: Do not attempt repetitive folder creation if previous request is unprocessed. It may also corrupt folder configurations.
                Sometimes due to network issues, it may take longer for creating the folder.

            </p>

            <p id='vs' class="helpinfo"> View Script<br><br>
                Def:The script you want to view.<br>
                Expl: Only scripts can be viewed not large files. For large files use 'See Inside Your Files' option.<br><br>
                For viewing scripts, follow<br>
                1. Click on any file.<br>
                2. File name will appear under 'View Script'.<br>
                3. Clcik 'View Script' to open script.<br><br>
                Tip: Once script is opened you can copy its contents also to paste in another script.

            </p>
            <p id='vft' class="helpinfo"> View File From Top <br><br>
                Def: For displaying selective portion of files.<br>
                Expl: For large files only selective portion of that can be displayed.<br><br>
                To see selective file, follow, <br>
                1. Click on any file.<br>
                2. File name will appear under 'View Script'.<br>
                3. Select criteria i.e. how many lines to show viz. 50 , 200 , 500 .<br>
                4. Click 'View File'.<br><br>
                Tip: You can use this feature to see earliest sequences processed by mpiBLAST by viewing output file.
            </p>

            <p id='vfb' class="helpinfo">View File From Bottom<br><br>
                Def: For displaying selective portion of files.<br>
                Expl: For large files only selective portion of that can be displayed.<br><br>
                To see selective file, follow, <br>
                1. Click on any file.<br>
                2. File name will appear under 'View Script'.<br>
                3. Select criteria i.e. how many lines to show viz. 50 , 200 , 500 .<br>
                4. Click 'View File'.<br><br>
                Tip: You can use this feature to see latest sequences processed by mpiBLAST by viewing output file.
            </p>

            <p id='dp' class="helpinfo"> Directory Path<br><br>
                Def: The path for selected directory.<br><br>
                Expl: This utility is very useful in several operations. For e.g. In Create New Script, you need to provide
                location to create script. By default script will be created in home directory. If you want to create script in other location then
                path to that folder must be provided. The utility generates path to folders.<br><br>
                Tip: For finding folder paths follow, <br>
                1. Click on any folder in list. <br>
                2. The path to that folder will be displayed under 'Directory Path'. <br>
                3. Move cursor over path to select it, right click and copy it. <br>
                4. Paste wherever you want. <br><br>
                Tip: Sometimes due to network issues this utility may not work properly, we request you to try later.
                Also, do not attempt to repetitively find paths if previous request is not complete.
            </p>

            <p id='fp' class="helpinfo"> File Path<br><br>
                Def: The path for selected file.<br><br>
                Expl: This utility is very useful in several operations. For e.g. In Modify Older Script, you need to provide
                path to script for modifying it. The utility generates path to scripts or files.<br><br>
                Tip: For finding file paths follow, <br>
                1. Click on any file or script in list. <br>
                2. The path to that file will be displayed under 'File Path'. <br>
                3. Move cursor over path to select it, right click and copy it. <br>
                4. Paste wherever you want. <br><br>
                Tip: Sometimes due to network issues this utility may not work properly, we request you to try later.
                Also, do not attempt to repetitively find paths if previous request is not complete.
            </p>

            <p id="wrkflw" style="width:320px;">
                <img src="/WImpiBLAST/Design/images/outline.png" />
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
                <%@include file="/Navigation_Menu/Navigation-Layout.jsp"%></div>

            <div id ="showmissingfield1" class="showemptyfields">

                <p align="center"> You did not select any file for download. Please select the file from left panel to download.</p>
            </div>

            <div id ="showmissingfield2" class="showemptyfields">

                <p align="center"> You did not select any file to upload. Please select the file using "Browse" button.</p>
            </div>

            <div id ="showmissingfield3" class="showemptyfields">

                <p align="center"> You did not select any script. Please select the script from left panel to view it.</p>
            </div>

            <div id ="showmissingfield5" class="showemptyfields">

                <p align="center"> You did not select any file. Please select the file from left panel to view it.</p>
            </div>   


            <div id ="showmissingfield4" class="showemptyfields">

                <p align="center"> You did not select criteria for viewing file. Please select a criteria from "See Inside Your Files" menu to display file.</p>
            </div>


            <div id="yesupld" class="showsuccessstatus">
                <p align="center">
                    File Upload was Successful. </p>  
            </div>   

            <div id="nodwn" class="showerrorstatus">
                <p align="center">
                    Sorry but the file download request can not be processed for this file.
                    This file violates maximum file download limits of 100Mb.<br>
                    For further assistance kindly contact Administrator@Computational Biology Lab.
                </p>

            </div>

            <div id="noupld" class="showerrorstatus">
                <p align="center">
                    Sorry but the file upload request can not be processed for this file.
                    Either same file already exist at destination or the file name is empty.<br>
                    Please try again by changing file name.
                </p>

            </div>

            <div id="upfilesize" class="showerrorstatus">
                <p align="center">
                    File upload for the file can not be processed.This file violates upload limit of 200Mb.<br>
                    Upload button will be disabled now. Please select other file of lesser size to enable Upload button.<br>
                </p>

            </div>

            <div id="excepdwn" class="showerrorstatus">
                <p align="center">
                    Sorry, due to technical issues download for this file can not be processed.<br>
                    For further assistance please contact the Administrator@Computational Biology lab.
                </p>
            </div>

            <div id="excepupld" class="showerrorstatus">
                <p align="center">
                    Sorry, due to technical issues upload for this file can not be processed.<br>
                    For further assistance please contact the Administrator@Computational Biology lab.
                </p>
            </div>

            <div id="fldrwarn" class="showerrorstatus">
                <p align="center">
                    Folder location is empty. Select a location from left panel or click on 'Home' button for creating the new folder.</p>  
            </div>
            <div id="flderr" class="showerrorstatus">
                <p align="center">
                    Folder can not be created now. Kindly try again later.</p>  
            </div> 

            <div id="fldrexist" class="showerrorstatus">
                <p align="center">
                    The folder already exists in selected destination. Try again with different name.</p>  
            </div>

            <div id="fldsucc" class="showsuccessstatus">
                <p align="center">
                    Folder creation successful. Please navigate to specified location to see your folder.</p>  
            </div>
            <div id="light" class='light'><p id='ani' class="ani">Creating Folder...</p>
                <p id="ani1" class="ani1">Done.</p></div>
            <div id="fade" class='fade'></div>

            <div id="hint">
                Click for help!
            </div>

            <fieldset style="border: 1px solid ;border-color: #353539;margin-left: 25%;width: 50%;">
                <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">Path Information</legend>
                <table>
                    <tr>
                        <td class="contentdnld" onclick="showme('dp')"><a>Directory Path</a></td>
                        <td class="contentdnld" onclick="showme('fp')"><a>File Path</a>
                        </td>
                    <tr>
                    <tr>
                        <td>
                            <textarea cols="30" rows="3" id="directory_path" name="directory_path" onmouseover="this.select();"
                                      style="z-index:1; " placeholder="Click on desired folder in left panel to display its path"></textarea>

                        </td>
                        <td> 
                            <textarea cols="30" rows="3" id="file_path" name="file_path" onmouseover="this.select();"
                                      placeholder="Click on desired file in left panel to display its path"></textarea>
                        </td>
                    </tr>
                </table>
            </fieldset>

            <div id="sidebar-a">

                <fieldset style="border: 1px solid ;border-color: #353539;padding-bottom: 10px;padding-left: 30px;padding-right: 20px;padding-top: 10px;">

                    <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 18px;color: #0772A1;">Download/Upload Files or Create New Folder</legend>

                    <table>

                        <html:form action="/normaldownload" method="post" enctype='multipart/form-data'>

                            <tr>
                                <td class="contentdnld" onclick="showme('df')"><a>Directory/File Selected</a></td>
                            </tr>
                            <tr><td></td><tr>
                            <tr>
                                <td>
                                    <input type="text" size="30" name="file_to_be_downloaded" id="file_to_be_downloaded"
                                           class="text" placeholder="Select a file from left panel" />
                                </td>

                                <td>
                                    <input type="submit" name="button" id="button" value="Download" class="content_button2" onclick="return chkfile(this.value);"/>
                                </td>
                            </tr>               
                            <tr>
                                <td>
                                    <input type="hidden" name="unique_key_for_directory" id="unique_key_for_directory" /> 
                                    <input type="hidden" name="unique_key_for_files" id="unique_key_for_files" />
                                    <input type="hidden" name="files_or_directories" id="files_or_directories" />    
                                </td>
                            </tr>
                            <tr>
                                <td class="contentdnld" onclick="showme('uf')"><a>Upload Files</a></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" size="30" name="file_to_be_uploaded" id="file_to_be_uploaded" 
                                           class="text" placeholder="Click on 'Browse' button"/>   
                                </td>
                            </tr>
                        </html:form>    
                        <tr>
                            <td>
                                <br>
                                <div class="fileinputs">
                                    <html:form action="/uploadfile" method="post" enctype='multipart/form-data'>
                                        <input type="file" name="uploadFile" id="uploadFile" class="file" onchange="do_upload(this.value);"/>
                                        <div class="fakefile">
                                            <input type="button" value="Browse" class="content_button2"/> 
                                        </div>
                                    </div>
                                    <br>
                                </td>
                                <td>    
                                    <br> 

                                    <input type="submit" name="uploadfile" id ="upldfile" value="Upload File" class="content_button2" onclick="return chkfile(this.value);"/>
                                </html:form>
                            </td>
                        </tr>
                        <tr>
                            <td class="contentdnld" onclick="showme('nfl');"><a>New Folder Location</a></td>
                        </tr>
                        <tr><td>
                                <p id="showloc" class="showload">Loading ...</p>
                            </td><tr>
                        <tr>
                            <td>
                                <input type="text" size="30" name="folder_location" id="folder_location"
                                       class="text" placeholder="Click on desired folder in left panel"/>  
                                <input type="button" name="button" id="button" style="font-family: 'Molengo', Helvetica, Arial, sans-serif;
                                       font-weight: normal;font-size: 12px; alignment-adjust: central;
                                       color: white;border-width: 1px;width:50px;padding-bottom: 5px;padding-top:5px;
                                       background:  #218559;" value="Home" onclick="sethome();"/>
                            </td>

                            <td>
                                <input type="submit" name="button" id="button" value="Create Folder" class="content_button2" onclick="return createfolder();"/>
                                <input type="hidden" name="foldername" id="foldername" />
                            </td>
                        </tr>


                    </table>
                </fieldset>

                <br>

                <fieldset style="border: 1px solid ;border-color: #353539;padding-bottom: 20px;padding-left: 30px;padding-right: 20px;padding-top: 10px;">
                    <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">View Your Scripts!</legend>
                    <table>
                        <tr>
                            <td class="contentdnld" onclick="showme('vs')"><a>View Script</a></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" size="30" name="new" id="new" class="text" placeholder="Click on desired script in left panel"/> 
                            </td>
                            <td>
                                <input type="submit" name="button" id="button" value="View Script" class="content_button2" onclick="return openscript();"/>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <br>
                <fieldset style="border: 1px solid ;border-color: #353539;padding-bottom: 20px;padding-left: 30px;padding-right: 20px;padding-top: 10px;">
                    <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">See Inside the Files!</legend>
                    <table>
                        <tr><td></td><tr>
                        <tr>
                            <td class="contentdnld" onclick="showme('vft')"><a>View File From Top</a> </td>
                        </tr>
                        <tr>
                            <td><input type="radio" id=50t name="start" value="50" onclick="unselectother(this.id);"><a>50 Lines</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id=200t name="start" value="200" onclick="unselectother(this.id);"><a>200 Lines</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id=500t name="start" value="500" onclick="unselectother(this.id);"><a>500 Lines</a>
                            </td>
                        </tr> 
                        <tr><td></td><tr>
                        <tr>
                            <td class="contentdnld" onclick="showme('vfb')"><a>View File From Bottom</a></td>
                        </tr>
                        <tr>
                            <td><input type="radio" id=50b name="bottom" value="50" onclick="unselectother(this.id);"><a>50 Lines</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id=200b name="bottom" value="200" onclick="unselectother(this.id);"><a>200 Lines</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id=500b name="bottom" value="500" onclick="unselectother(this.id);"><a>500 Lines</a>
                            </td>

                        </tr> 
                        <tr><td></td><tr>
                        <tr>
                            <td>
                                <input type="hidden" name="selectedfilepart" id="selectedfilepart" />
                                <input type="submit" name="button" id="button" value="View File" class="content_button2" onclick="openselectivefile();"/>
                                <input type="hidden" id="action_stat" name="action_stat" value="<%=action_stat%>" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br>

            </div>

            <div id="content">
                <br>
                <p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;cursor: pointer" onclick="showme('bhm');">Browse Home</p>
                <br>
                <html:form action="/directory" method="post" enctype='multipart/form-data'>
                    <input type="submit" name="treeview" id="treeview" value="TreeView" class="content_button2" style="margin-left: 5%;"/>
                    <!--<a href="#" onclick="document.forms[0].submit();"> Show TreeView</a>-->
                </html:form>


                <div id="controltreeviewlook"> 

                    <div style="text-align:left; height:550px; overflow: scroll;" > 


                        <%

                            j = Directory.DirectoryTreeAction.list.size();

                            file_list_size = Directory.DirectoryTreeAction.file_list.size();


                            for (i = 0; i < j; i++) {

                                try {
                        %>  

                        <image src="Design/images/folder.gif" id="<%out.print(i);%>" /> 

                        <input type="button" name="<%out.print(Directory.DirectoryTreeAction.tree_contents.get(i));%>"
                               value="<%out.print(Directory.DirectoryTreeAction.list.get(i));%>" 
                               onclick="javascript:contentsFunction(this.name, this.value);" 
                               class="extend" />

                        <div style="margin-left: 20px;" name="nn" id=<%out.print(Directory.DirectoryTreeAction.tree_contents.get(i));%>>

                        </div>

                        <%
                                } catch (ArrayIndexOutOfBoundsException e) {
                                    e.printStackTrace();
                                }

                            }
                            k = Directory.DirectoryTreeAction.file_list.size();
                            for (int m = 0; m < k; m++) {

                        %>   

                        <div><image src="Design/images/file.png"/> 
                            <input type="button" id="<%out.print(m);%>" name="<%out.print(Directory.DirectoryTreeAction.file_list_inodes.get(m));%>"
                                   value ="<%out.print(Directory.DirectoryTreeAction.file_list.get(m));%>"
                                   class="file_make_color" onclick="do_download(this.value, this.name);"></input> </div>

                        <div style="float: right;"><%out.print(Directory.DirectoryTreeAction.file_size_list.get(m));%></div>
                        <%
                                Directory.DirectoryTreeAction.tree_contents.clear();
                                Directory.DirectoryTreeAction.list.clear();
                                //Directory.DirectoryTreeAction.file_list_inodes.clear();
                                //Directory.DirectoryTreeAction.file_list.clear();
                            }

                        %>

                    </div>   

                </div>
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
