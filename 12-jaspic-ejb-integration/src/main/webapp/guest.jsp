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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Guest)</h1>
        
        <jsp:include page="/meta.jsp"/>

        <h2>Yikes!!</h2>
        <blockquote>
            <p>
                If you got here that's bad :(
            </p>
            <p>
                executive.isApproved = "<%= pageContext.findAttribute("executive.isApproved") %>"
            </p>
            <p>
                <a href="<%= request.getContextPath() %>/">&lt;&lt; back</a>
            </p>
            
        </blockquote>
        
        <jsp:include page="/info.jsp"/>
    </body>
</html>
