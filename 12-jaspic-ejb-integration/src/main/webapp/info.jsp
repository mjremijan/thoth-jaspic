<%@ page import="java.security.Principal" %>

<% Principal p = request.getUserPrincipal();%>

<hr/>
<h2>Principal/Role Information</h2>        
<blockquote>
    <p>
        Principal Name: <%= p.getName()%>
    </p>
    <%
        String roles = String.valueOf(session.getAttribute("ferris.auth.groups"));
        if (roles != null) {
    %>
            <table border="1">
                <caption>Roles</caption>
                <tr>
                    <% String theRole = "ExecutiveRole"; %>
                    <td class="code">Request#isUserInRole("<%= theRole %>")&nbsp;</td>
                    <td class="code"><%= request.isUserInRole(theRole)%></td>
                </tr>
                
                <tr>
                    <% theRole = "CustomerSupportRole"; %>
                    <td class="code">Request#isUserInRole("<%= theRole %>")&nbsp;</td>
                    <td class="code"><%= request.isUserInRole(theRole)%></td>
                </tr>
                
                <tr>
                    <% theRole = "SalaryEmployeeRole"; %>
                    <td class="code">Request#isUserInRole("<%= theRole %>")&nbsp;</td>
                    <td class="code"><%= request.isUserInRole(theRole)%></td>
                </tr>
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