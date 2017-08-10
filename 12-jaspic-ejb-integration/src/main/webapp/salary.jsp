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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Salary)</h1>
        
        <jsp:include page="/meta.jsp"/>

        <h2>Yes!!</h2>
        <blockquote>
            <p>
                Here is your salary:
            </p>
            <p>
                salary.name = "<%= pageContext.findAttribute("salary.name") %>" // Should be the same as "Principal Name" below! <br/>
                salary.amount = "<%= pageContext.findAttribute("salary.amount") %>"
            </p>
            <p>
                <a href="<%= request.getContextPath() %>/">&lt;&lt; back</a>
            </p>
            
        </blockquote>
        
        <jsp:include page="/info.jsp"/>
    </body>
</html>
