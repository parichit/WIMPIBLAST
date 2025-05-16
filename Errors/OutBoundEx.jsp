<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
    <head>
        <title>Error</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Exception.css" media="screen"/> 
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico"> 
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>

    </head>
    <body>


        <div id="page-container">

            <div id="header">

                <div id="header_style"><h1>WImpiBLAST .</h1>
                    <h2>Web interface for mpiBLAST to help biologist perform large scale annotation
                        using high performance computing</h2>

                </div>
            </div>

            <div id="content">
                <div class="padding"> 
                    There is some technical issue with the request you just made. It can not be processed.
                    Either the session is timed out or there is some other issue. Please try again later.
                    <br><br>
                    If this issue persists please contact administrator@Computational Biology lab with following code and what caused this error to happen.
                    <br><br>

                    <p>  
                        <a class="link">CODE: IndexOutOfBoundException</a>
                        <br> <br>
                        Please use browser's back button to go to previous page.
                    </p>

                </div>

            </div>

            <div id="footer">

                <div id="altnav">
                    <a href="/WImpiBLAST/gen/about.jsp" target="_blank">About</a> - 
                    <a href="/WImpiBLAST/gen/folio.jsp" target="_blank">Portfolio</a> - 
                    <a href="http://www.nabi.res.in/Technical.aspx" target="_blank">Contact Us</a> 

                </div>
                <div id="copyright">
                    NABI<br/>
                    Powered by <a href="http://www.nabi.res.in" target="_blank">Computational Biology Lab@NABI</a> 

                </div>



            </div>

        </div>
    </body>
</html>
