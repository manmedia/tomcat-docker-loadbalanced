<%@ page import="java.net.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>

<%
   out.write("********* Hostname **********"+"<br>"+System.getenv("HOSTNAME")+"<br>"+"********************"+"<br>");
   out.write("<br>");
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS zzzz");
   out.write("<b>"+formatter.format(new Date(System.currentTimeMillis()))+"</b>");	
   out.write("<br>");
%>