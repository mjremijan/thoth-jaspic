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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Stockholder)</h1>
        
        <jsp:include page="/bin/meta.jsp"/>

        <h2>Test Results</h2>
        <blockquote>
            <p>
                Success!
            </p>
            <p>
                This is the stockholder page loaded by /WEB-INF/stockholder/stockholder.jsp.  It is protected
                by the <span style="font-family: courier">StockholderServlet</span>  and
                the <span style="font-family: courier">GROUP_STOCKHOLDERS</span> 
                identity management group. You are
                in this group so you can see this page!
            </p>
            <p>
                <a href="<%= request.getContextPath() %>/">&lt;&lt; back</a>
            </p>
        </blockquote>
        
        <jsp:include page="/bin/info.jsp"/>
    </body>
</html>
