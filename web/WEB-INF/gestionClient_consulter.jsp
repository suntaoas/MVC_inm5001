<%@page import="domain.Clients"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Magasin de Fruits & Légumes</title>
    </head>
    <body>
        <div class="mainContainer sixteen container">
            <div class="header-wrapper">
                <header class="container">
                    <div class="head-right">
                    </div>
                    <h1 class="logo"><a href="index-2.html" title="Logo">
                            <img title="Logo" alt="Logo" src="images/logo_2.jpe" />
                        </a></h1>
                    <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
                    </nav>
                </header>
            </div>
            <h2 align="center">LISTE DES CLIENTS</h2>
            <section >
                <div >
                    <div >
                        <div >
                            <div >
                                <div>
                                    <table align="center"  border="4" bgcolor="#F0F8FF" frame="border" width="50%" >
                                        <tr>
                                            <th>NoClient</th>
                                            <th>Nom</th>
                                            <th>Prenom</th>
                                            <th>MotDePasse</th>
                                            <th>Age</th>
                                            <th>Sexe</th>
                                            <th>Adresse</th>
                                            <th>Telephone</th>
                                            <th>Courriel</th>
                                            <th>Admin/client</th>
                                        </tr>
                                        <%  ArrayList al = (ArrayList) request.getAttribute("clients");
                                            for (int i = 0; i < al.size(); i++) {
                                                Clients client = (Clients) al.get(i);
                                                out.print("<tr><td>" + client.getNoClient() + "</td>");
                                                out.print("<td>" + client.getNom() + "</td>");
                                                out.print("<td>" + client.getPrenom() + "</td>");
                                                out.print("<td>" + client.getPassword() + "</td>");
                                                out.print("<td>" + client.getAge() + "</td>");
                                                out.print("<td>" + client.getSexe() + "</td>");
                                                out.print("<td>" + client.getAdresse() + "</td>");
                                                out.print("<td>" + client.getTelephone() + "</td>");
                                                out.print("<td>" + client.getCourriel() + "</td>");
                                                out.print("<td>" + client.getUsager() + "</td></tr>");
                                            }
                                        %> 
                                    </table>
                                    <table>
                                        <tr>
                                        <div align="center"><a  href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion" title="Retourner">Retourner</a></div>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>

