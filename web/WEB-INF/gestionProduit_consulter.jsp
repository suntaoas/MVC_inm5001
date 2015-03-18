<%-- 
    C'est la page de la gestion de produit pour consulter 
--%>

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
            <!--Header Block-->

            <div class="header-wrapper">
                <header class="container">
                    <div class="head-right">
                    </div>
                    <h1 class="logo"><a href="index-2.html" title="Logo">
                            <img title="Logo" alt="Logo" src="images/logo_2.jpe" />
                        </a></h1>
                    <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
                        <!--
                        <ul id="nav">
                            <li class="active"><a href="index-2.html" title="Gestion Clients">Gestion Clients</a>
                                <ul>
                                    <li><a href="category.html">Ajouter client</a></li>
                                    <li><a href="category.html">Modifier client</a></li>
                                    <li><a href="category.html">Supprimer client</a></li>
                                    <li><a href="/MVC_inm5001/ClientConsulter">Consulter client</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="category.html" title="Gestion Produits">Gestion Produits</a>
                                <ul>
                                    <li><a href="category.html">Ajouter produit</a></li>
                                    <li><a href="category.html">Modifier produit</a></li>
                                    <li><a href="category.html">Supprimer produit</a></li>
                                    <li><a href="category.html">Consulter produit</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="blog.html" title="Gestion Commandes">Gestion Commandes</a>
                                <ul>
                                    <li><a href="category.html">Ajouter commande</a></li>
                                    <li><a href="category.html">Modifier commande</a></li>
                                    <li><a href="category.html">Supprimer commande</a></li>
                                    <li><a href="category.html">Consulter commande</a></li>
                                    <li><a href="category.html">Paiement pour commande</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="faq.html" title="Gestion Livraison">Gestion Livraison</a>
                                <ul>
                                    <li><a href="category.html">Ajouter livraison</a></li>
                                    <li><a href="category.html">Consulter livraison</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="about_us.html" title="Gestion System">Gestion System</a>
                                <ul>
                                    <li><a href="category.html">Maintenance de type produit</a></li>
                                    <li><a href="category.html">Maintenance de numero de client</a></li>
                                    <li><a href="category.html">Maintenance de taxe</a></li>
                                    <li><a href="category.html">Statistique de paiement</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="contact_us.html" title="Retourner">Retourner</a></li>
                        </ul>
                        -->
                    </nav>

                </header>
            </div>
            <!--Content Block-->
               <h2 align="center">LISTE DES PRODUITS</h2>
            <section>
                <div >
                    <div >
                        <div >
                            <div >
                                <div>
                                    <table align="center" border="4" bgcolor="#F0F8FF" frame="border" width="50%" >
                                        <tr>
                                            <th>NoProduit</th>
                                            <th>Description</th>
                                            <th>Prix</th>
                                            <th>Quantite</th>
                                             <th>UniteMesure</th>
                                            <th>Categorie</th>
                                            <th>Photo</th>
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
                                                out.print("<td>" + produitTemp.getPhoto() + "</td></tr>");
                                                
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

