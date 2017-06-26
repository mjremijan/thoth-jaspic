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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Manager)</h1>
        
        <jsp:include page="/bin/meta.jsp"/>

        <h2>Test Results</h2>
        <blockquote>
            <p>
                Success!
            </p>
            <p>
                This is the manager page loaded by /manager/manager.jsp.  It is protected
                by the <span style="font-family: courier">GROUP_MANAGERS</span> 
                identity management group. You 
                in this group so you can see this page!
            </p>
            <p>
                <a href="<%= request.getContextPath() %>/">&lt;&lt; back</a>
            </p>
        </blockquote>
        
        <jsp:include page="/bin/info.jsp"/>
    </body>
</html>
