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
                                    <table border="4" bgcolor="#F0F8FF" frame="border" width="50%" >
                                        <tr>
                                            <th>NoProduit</th>
                                            <th>Description</th>
                                            <th>Prix</th>
                                            <th>Quantite</th>
                                            <th>UniteMesure</th>
                                            <th>Categorie</th>
                                            <th>Photo</th>
                                            <th>Modifier</th>
                                            <th>Supprimer</th>
                                        </tr>
                                        <%  ArrayList al = (ArrayList) request.getAttribute("produits");
                                            for (int i = 0; i < al.size(); i++) {
                                                Produits produitTemp = (Produits) al.get(i);
                                                out.print("<tr><td>" + produitTemp.getNoProduit() + "</td>");
                                                out.print("<td>" + produitTemp.getDescription() + "</td>");
                                                out.print("<td>" + produitTemp.getPrix() + "</td>");
                                                out.print("<td>" + produitTemp.getQuantite() + "</td>");
                                                out.print("<td>" + produitTemp.getUniteMesure() + "</td>");
                                                out.print("<td>" + produitTemp.getCategorie() + "</td>");
                                                out.print("<td>" + produitTemp.getPhoto() + "</td>");
                                                out.print("<td> <a href='/MVC_inm5001/ProduitModifier?noClient=" + produitTemp.getNoProduit() + "'>Modifier</a> </td>");
                                                out.print("<td> <a href='/MVC_inm5001/ProduitSupprimer?noClient=" + produitTemp.getNoProduit() + "'>Supprimer</a> </td></tr>");
                                            }
                                        %>                                        
                                    </table>
                                    <table>
                                        <tr>
                                            <td height="52"><div align="right"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion">RETOURNER</a></div></td>
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

