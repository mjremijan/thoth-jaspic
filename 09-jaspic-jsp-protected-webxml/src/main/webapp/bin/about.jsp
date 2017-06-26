<!DOCTYPE html>
<html>
    <head>
        <title><%= pageContext.findAttribute("maven.project.artifactId") %> Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style>
            a {color:blue;}
            .code {font-family: courier;}
        </style>        
    </head>
    <body>
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (About)</h1>
        
        <jsp:include page="/bin/meta.jsp"/>
        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Success!
            </p>
            <p>
                This is the about page loaded by /bin/about.jsp.  
                It has no protection so is accessible by any user
            </p>
            <p>
                <a href="<%= request.getContextPath() %>/">&lt;&lt; back</a>
            </p>
        </blockquote>
        
        <jsp:include page="/bin/info.jsp"/>
    </body>
</html>
