<%@page import="domain.Livraison"%>
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
                                            <th>noLivraison</th>
                                            <th>noCommande</th>
                                            <th>datetime</th>
                                        </tr>
                                        <%  ArrayList al = (ArrayList) request.getAttribute("livraison");
                                            for (int i = 0; i < al.size(); i++) {
                                                Livraison livraiosnTemp = (Livraison) al.get(i);
                                                out.print("<tr><td>" + livraiosnTemp.getNoLivraison() + "</td>");
                                                out.print("<td>" + livraiosnTemp.getNoCommande() + "</td>");
                                                out.print("<td>" + livraiosnTemp.getDateLivraison() + "</td>");
                                            }
                                        %> 
                                    </table>
                                    <div align="center"><a  href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion" title="Retourner">Retourner</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>

