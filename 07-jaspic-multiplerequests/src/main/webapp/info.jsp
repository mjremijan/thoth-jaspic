<%@ page import="java.security.Principal" %>

<% Principal p = request.getUserPrincipal(); %>
<% if (p != null) { %>
    <a name="results" />
    
    
    <p>
        <b>2nd</b>, verify this information:.   
    </p>
    <blockquote>
        <p>
            <a href="clear.jsp">Clear user/session info</a>
        </p>
        <p>
            <b>Principal Information</b>
        </p>
        <p>
            Name: <%= p.getName() %>
        </p>


        <p>
            <b>Session Information</b>
        </p>
        <p>
            ID: <%= session.getId() %>
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
                    <td><%= name %></td>
                    <td><%= value %></td>
                </tr>
            <% } %>
        </table>

        
        <p>
            <b>Role Information</b>
        </p>
        <%
            String roles = String.valueOf(session.getAttribute("ferris.auth.groups"));
            if (roles != null) {
                String[] tokens = roles.split(","); %>
                <table border="1">
            <%  for (String token : tokens) { %>
                    <tr>
                        <td style="font-family:courier">Request#isUserInRole("<%= token %>")&nbsp;</td>
                        <td style="font-family:courier"><%= request.isUserInRole(token) %></td>
                    </tr>
             <% } %>
                </table>
         <% } %>
    </blockquote>
    
    
    <p>
        <b>3rd</b>, make another request to a different page:
        <br />
        <a href="index.jsp">Index</a>
        <br />
        <a href="b.jsp">Page (B)</a>
        <br />
        <a href="c.jsp">Page (C)</a>
    </p>
                        
<% } %>
