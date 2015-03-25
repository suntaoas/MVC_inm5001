<%-- 
    C'est la page de la gestion de commande pour consulter 
--%>

<%@page import="domain.Commandes"%>
<%@page import="domain.Produits"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Magasin de Fruits & Légumes</title>

    </head>
    <body style="background:url('images/photo5.jpg')">
        <div class="mainContainer sixteen container">
            <!--Header Block-->

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
            <!--Content Block-->
            <section >
                <div >
                    <div >
                        <div >
                            <div >
                                <div>
                                    <table border="4" bgcolor="#F0F8FF" frame="border" width="50%" >
                                        <tr>
                                            <th>noCommande</th>
                                            <th>datetime</th>
                                            <th>noClient</th>
                                            <th>montant</th>
                                            <th>paiement</th>
                                            <th>noLivraison</th>
                                            <th>dateLivraison</th>
                                            <th>detail de commande</th>
                                        </tr>
                                        <%  ArrayList al = (ArrayList) request.getAttribute("commandes");
                                            for (int i = 0; i < al.size(); i++) {
                                                Commandes commandeTemp = (Commandes) al.get(i);
                                                out.print("<tr><td>" + commandeTemp.getNoCommande() + "</td>");
                                                out.print("<td>" + commandeTemp.getDatetime() + "</td>");
                                                out.print("<td>" + commandeTemp.getNoClient() + "</td>");
                                                out.print("<td>" + commandeTemp.getMontant() + "</td>");
                                                out.print("<td>" + commandeTemp.getPaiement() + "</td>");
                                                out.print("<td>" + commandeTemp.getNoLivraison() + "</td>");
                                                out.print("<td>" + commandeTemp.getDateLivraison() + "</td>");
                                                out.print("<td> <a href='/MVC_inm5001/CommandeConsulterDetailCommande?noCommande=" + commandeTemp.getNoCommande() + "'>DETAIL</a> </td></tr>");

                                            }
                                        %> 
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

