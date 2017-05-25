<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
