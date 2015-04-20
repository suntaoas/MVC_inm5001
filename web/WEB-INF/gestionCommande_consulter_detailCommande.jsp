<%@page import="domain.Clients"%>
<%@page import="service.*"%>
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
            <section >
                <div >
                    <div >
                        <div >
                            <div >
                                <div>
                                    <table align="center" border="4" bgcolor="#F0F8FF" frame="border" width="50%" >
                                        <tr>
                                            <th>NoCommande</th>
                                            <th>NoProduit</th>
                                            <th>Prix</th>
                                            <th>Quantite</th>
                                            <th>Montant</th>
                                        </tr>
                                        <%  ArrayList al = (ArrayList) request.getAttribute("detailCommande");
                                            System.out.println("gestionCommande_consulter_detailcommande.jsp=======al.size()=" + al.size());
                                            for (int i = 0; i < al.size(); i++) {
                                                DetailCommande detailCommande = (DetailCommande) al.get(i);
                                                out.print("<tr><td>" + detailCommande.getNoCommande() + "</td>");
                                                out.print("<td>" + detailCommande.getNoProduit() + "</td>");
                                                out.print("<td>" + detailCommande.getPrixProduit() + "</td>");
                                                out.print("<td>" + detailCommande.getQuantiteProduit() + "</td>");
                                                out.print("<td>" + detailCommande.getMontantProduit() + "</td></tr>");
                                            }
                                        %> 
                                    </table>
                                    <table>
                                        <tr>
                                            <%
                                                Clients client = (Clients) session.getAttribute("loginUser");
                                                if ("1".equals(client.getUsager())) {
                                            %>
                                        <div align="center"><a  href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion" title="Retourner">Retourner</a></div>
                                        <%
                                        } else {
                                        %>
                                        <div align="center"><a  href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale" title="Retourner">Retourner</a></div>
                                        <%}%>
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

