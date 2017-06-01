<%@ page import="java.security.Principal" %>

<% Principal p = request.getUserPrincipal();%>

<h2>Principal/Role Information</h2>        
<blockquote>
    <p>
        Principal Name: <%= p.getName()%>
    </p>
    <%
        String roles = String.valueOf(session.getAttribute("ferris.auth.groups"));
        if (roles != null) {
            String[] tokens = roles.split(","); 
    %>
            <table border="1">
                <caption>Roles</caption>
                <%  for (String token : tokens) {%>
                <tr>
                    <td style="font-family:courier">Request#isUserInRole("<%= token%>")&nbsp;</td>
                    <td style="font-family:courier"><%= request.isUserInRole(token)%></td>
                </tr>
                <% } %>
            </table>
        <% } %>
</blockquote>


<h2>Session Information</h2>        
<blockquote>
    <p>
        ID: <%= session.getId()%>
    </p>
    <table border="1">
        <caption>Attributes</caption>
        <tr>
            <th>NAME</th>
            <th>VALUE</th>
        </tr>
        <%
            java.util.Enumeration enames = session.getAttributeNames();
            while (enames.hasMoreElements()) {
                String name = (String) enames.nextElement();
                String value = String.valueOf(session.getAttribute(name));
        %>
        <tr>
            <td><%= name%></td>
            <td><%= value%></td>
        </tr>
        <% } %>
    </table>
</blockquote>