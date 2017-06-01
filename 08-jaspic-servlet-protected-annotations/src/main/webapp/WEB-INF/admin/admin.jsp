<!DOCTYPE html>

<html>
    <head>
        <title><%= pageContext.findAttribute("maven.project.artifactId") %> Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Admin)</h1>
        <jsp:include page="/meta.jsp"/>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Fail!!
            </p>
            <p>
                This is the admin page loaded by AdminServlet.  If you are seeing 
                this page, something has gone terribly wrong!  This servlet is 
                protected by the <span style="font-family: courier">GROUP_ADMINS</span> 
                identity management group.
                You are <b>not</b> in this group so you should <b>not</b> be able
                to see this page!
            </p>
        </blockquote>
        
        <jsp:include page="/info.jsp"/>
    </body>
</html>
