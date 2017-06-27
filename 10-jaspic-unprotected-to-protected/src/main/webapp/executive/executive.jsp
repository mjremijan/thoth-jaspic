<!DOCTYPE html>

<html>
    <head>
        <title><%= pageContext.findAttribute("maven.project.artifactId") %> Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style>
            a {color:blue;}
        </style>        
    </head>
    <body>
        <p>
        Yikes!  If you are seeing this, that's bad!
        It means an unprotected Servlet can forward to
        a protected JSP.
        You do not have 'ExecutiveRole' so you shouldn't be able to see this page.
    </body>
</html>
