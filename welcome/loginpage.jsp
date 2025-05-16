<%-- 
    Document   : loginpage
    Created on : 14 Aug, 2013, 10:40:34 AM
    Author     : parichit
--%>


<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html:html>
    <head>

        <script type="text/javascript">


            function login_form() {

                //document.getElementById('hidden').style.display = 'block';

                if ($("#hidden").is(":hidden")) {

                    $("#hidden").slideDown('slow', function() {
                    });

                    return;

                }

                else if ($("#hidden").not(":hidden")) {

                    $("#hidden").slideUp('slow', function() {
                    });
                    return;

                }

            }

            function check_for_empty_fields() {

                if (document.getElementById("username").value === "" || document.getElementById("username").value === null) {

                    $("#req1").hide(200);
                    $("#req3").show(600);
                    $("#username").focus();
                    var warn1 = "username";
                    $("#req3").css({'color': '#CC0000'});

                }

                else {

                    $("#req3").hide(200);
                    $("#req1").show(600);

                    warn1 = "";

                }

                if (document.getElementById("password").value.length === 0) {

                    $("#req2").hide(200);
                    $("#req4").show(600);
                    $("#password").focus();

                    var warn2 = "pass";
                    $("#req4").css({'color': '#CC0000'});
                }

                else {

                    $("#req4").hide(200);
                    $("#req2").show(600);

                    warn2 = "";

                }

                if (warn1 === "" && warn2 === "") {

                 

                    return true;

                }

                else {

                  

                    return false;

                }

            }

            function reset_fields() {

                document.getElementById("username").value = "";
                document.getElementById("password").value = "";

            }
        </script>


        <title>Login- WImpiBLAST</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/loginpage.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Goudy+Bookletter+1911|Molengo|Raleway:100|PT+Sans" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico"> 

        <%
           

            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;

            HttpSession sess = req.getSession();

            System.out.println("inside filter");

            Integer hitsCount =
                    (Integer) application.getAttribute("hitCounter");
            if (hitsCount == null || hitsCount == 0) {

                hitsCount = 1;
            } else {

                hitsCount += 1;
            }
            application.setAttribute("hitCounter", hitsCount);

        %>

        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>

    </head>
    <body>
        <div id="header">

            <div id="header_style"><h1>WImpiBLAST .</h1><br><br><br>
                <h2>Web interface for mpiBLAST to help biologist perform large scale annotation
                    using high performance computing</h2>
            </div>


        </div>

        <div id="page-container">

            <div id="sidebar-a">


                <button type="button" class="showlogin" name="showlogin" id="showlogin" onclick="login_form();">Get Started</button> 

                <div id ="hidden" class="padding">

                    <html:form action="/dologin" method="post">
                        <table align="center">

                            <tr>
                                <td>

                                    <p id="req1" class="special_fonts"> Username </p>
                                    <p id="req3" class="special_fonts_hidden">Please provide Username</p>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="ip_text" id=username name="username" placeholder="Username">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p id="req2" class="special_fonts"> Password </p>
                                    <p id="req4" class="special_fonts_hidden">Please provide Password</p>
                                </td>
                            <tr>
                                <td>
                                    <INPUT type="password" class="ip_text" id=password name="password" placeholder="Password">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            <tr>
                                <td>
                                    <br>
                                    <input type="submit" class="content_button" name="login" id="login" value="LOGIN" onclick="return check_for_empty_fields();"/>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                    <input type="button" class="content_button" name="reset" id="reset" value="RESET" onclick="reset_fields();" />
                                </td>                    
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                        </table>

                    </html:form>
                </div>

            </div>




            <div id="content">
                <h1> Meet WImpiBLAST !</h1>
                <p class="message">
                    WImpiBLAST is a user-friendly interface for biologist to submit mpiBLAST jobs on HPC cluster. The motivation behind
                    WImpiBLAST is to help overcome computational 
                    limitations in using high performance computing cluster for 
                    computationally intensive annotation jobs.<br><br>With WImpiBLAST, We hope 
                    to make biologists more familiar with overall computational
                    biology ecosystem.
                </p>
                <table cellpadding="5" >
                    <tr>
                        <td class="visits">
                            You are visitor: <%= hitsCount%>
                        </td>
                    </tr>
                </table>

            </div>
        </div>

        <div id="footer">

            <div class="altnav">
                <a href="/WImpiBLAST/gen/about.html" target="_blank">About</a> - 
                <a href="/WImpiBLAST/gen/folio.html" target="_blank">Portfolio</a> - 
                <a href="/WImpiBLAST/gen/contact.html" target="_blank">Contact Us</a>-
            </div>
            Powered by <a href="http://www.nabi.res.in" target="_blank">Computational Biology Lab@NABI</a><br/> 
            Browser Compatibility - Site best viewed in Chrome and Mozilla Browser. Mobile device compatible interface coming soon!

        </div>

    </body>

</html:html>