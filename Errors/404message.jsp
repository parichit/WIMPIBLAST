<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->

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
                
            </div></div>

            <div id="content">
                <div class="padding">

                    Due to technical issues with server the url could not be find. Please try again later.
                    <br> <br>
                    If this issue persists, kindly inform the administrator@Computational Biology lab about following code and what caused it to happen.
                    <br><br>

                </div>
                <p>
                    <a class="link">CODE: 404</a>
                    <br><br>
                    <a class="link">Your Computational Biology Team</a>
                </p>
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
