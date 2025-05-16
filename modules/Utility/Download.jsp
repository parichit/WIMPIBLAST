<%-- 
    Document   : Download
    Created on : 2 Aug, 2013, 12:23:01 PM
    Author     : parichit
--%>

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
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/utilities.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Molengo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">

        <title>WImpiBLAST File-Manage</title>

        <style>

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
            String temp;

        %>

        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>


    </head>
    <body onload="showstat();">

        <div id="help_menu">

            <p style="font-family: 'Molengo', Helvetica, Arial, sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;">Help Menu</p>
            <p class="information"> Click on 'Tree View' button to generate files and folders in your home directory.
                <br> <br> Caution: Always Log out after completing your work.<br><br>
                * Def: Definition
                * Expl: Explanation
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

            <div id ="showdownloadfile" class="showemptyfields">

                <p align="center"> Oops! you missed on filename. Please select the file from left panel to download it!</p>
            </div>

            <div id ="showuploadfile" class="showemptyfields">

                <p align="center"> Oops! you missed on filename. Please browse the file from your system to upload it!</p>
            </div>



            <div id="sidebar-a">

                <fieldset style="border: 1px solid ;border-color: #353539;padding-bottom: 70px;padding-left: 30px;padding-right: 20px;padding-top: 10px;">

                    <legend style="border: 1px solid #CFECEC;font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">Get Your Files Here!</legend>

                    <table>

                        <tr>
                            <td class="contentdnld"><a>Directory/File Selected</a></td>
                        </tr>

                        <br>

                        <tr>
                            <td>
                                <input type="text" size="30" name="file_to_be_downloaded" id="file_to_be_downloaded"/>
                            </td>

                            <td>
                                <input type="submit" name="button" id="button" value="Download" class="content_button2" />
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
                            <td class="contentdnld"><a>Upload Files</a></td>
                        </tr>

                        <tr>
                            <td>
                                <input type="text" size="30" name="file_to_be_uploaded" id="file_to_be_uploaded" />   
                            </td>

                        </tr>

                        <tr>
                            <td>
                                <br>
                                <div class="fileinputs">
                                    <input type="file" name="uploadFile" id="uploadFile" class="file" onchange="do_upload(this.value);"/>
                                    <div class="fakefile">
                                        <input type="button" value="Browse" class="content_button2"/>   
                                    </div>
                                </div>
                                <br>
                            </td>

                            <td>    
                                <br>  
                                <input type="submit" name="button" id ="button" value="Upload File" class="content_button2" />
                            </td>
                        </tr>


                        <tr>
                            <td class="contentdnld"><a>View File</a></td>
                        </tr>

                        <tr>
                            <td>
                                <input type="text" size="30" name="new" id="new" /> 
                            </td>
                            <td>
                                <input type="submit" name="button" id="button" value="View This File" class="content_button2" onclick="openfile();"/>

                            </td>
                        </tr>

                    </table>
                </fieldset>

            </div>

            <div id="content">

                <br>

                <p style="font-family: 'Droid', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">Browse Home</p>
                <br>
                <html:form action="/directory" method="post" enctype='multipart/form-data'>
                    <input type="submit" name="treeview" id="treeview" value="TreeView" class="content_button2" style="margin-left: 5%;"/>
                    <!--<a href="#" onclick="document.forms[0].submit();"> Show TreeView</a>-->
                </html:form>


                <div id="controltreeviewlook" class="padding"> 



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
