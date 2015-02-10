<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 
<%@page import="domain.Users" %>
<html> 
<head> 
<title>MENU D'ADMINISTRATEUR</title> 
</head> 
<body bgcolor="green">
<br /><br /><br /><br /> 
<center>
<%
out.println("<h1>MENU D'ADMINISTRATEUR</h1>");
//Users loginUser = (Users)request.getAttribute("loginuser");
//String prenom = loginUser.getPrenomClient();
//String nom = (String) session.getAttribute("nom");
String prenom = request.getParameter("prenom");
out.println("BIENVENUE, <b>"+prenom+"</b>");
out.println("<br />");
out.println("<br />");
out.println("<br />");
out.println("<br />");
out.println("<br />");
out.println("<br />");
out.println("<b><a href=user_affichage.jsp?prenom="+prenom+">Information Des Usagers</a></b>");
out.println("<br />");
out.println("<br />");
out.println("<b><a href=inscription_admin.html?prenom="+prenom+">Inscription D'usager</a></b>");
out.println("<br />");
out.println("<br />");
out.println("<b><a href=changement_info_user_admin_input.jsp?prenom="+prenom+">Changement d'information</a></b> ");
out.println("<br />");
out.println("<br />");
out.println("<b><a href=suppresion_info_user_admin_input.jsp?prenom="+prenom+">Suppresion d'information</a></b> ");
out.println("<br />");
out.println("<br />");
out.println("<b><a href=login.jsp>Deconnection</a></b>");

%>
</center>
</body>
</html>

