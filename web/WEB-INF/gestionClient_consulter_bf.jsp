<%-- 
    C'est la page de la gestion de client pour consulter 
--%>

<%@page import="domain.Clients"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->

<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Magasin de Fruits & Légumes</title>

        <!--js-->
        <script src="js/jquery-1.8.2.min.js"></script>
        <script src="js/common.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/ddsmoothmenu.js"></script>
        <script src="js/jquery.flexslider.js"></script>
        <script src="js/jquery.elastislide.js"></script>
        <script src="js/jquery.jcarousel.min.js"></script>
        <script src="js/jquery.accordion.js"></script>
        <script src="js/light_box.js"></script>
        <script type="text/javascript">$(document).ready(function() {
                $(".inline").colorbox({inline: true, width: "50%"});
            });</script>
        <!--end js-->

        <!-- Mobile Specific Metas ================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- CSS ================================================== -->

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/layout.css">
        <link rel="stylesheet" href="css/ddsmoothmenu.css"/>
        <link rel="stylesheet" href="css/elastislide.css"/>
        <link rel="stylesheet" href="css/home_flexslider.css"/>

        <link rel="stylesheet" href="css/light_box.css"/>
        <script src="js/html5.js"></script>

        <!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

        <!--[if lt IE 9]>
                                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                        <![endif]-->

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
            <section >
                <div >
                    <div >
                        <div >
                            <div >
                                <div>
                                    <table border="4" bgcolor="#00FF00" frame="border" width="50%" >
                                        <tr>
                                            <th>NoClient</th>
                                            <th>Nom</th>
                                            <th>Prenom</th>
                                            <th>MotDePasse</th>
                                            <th>Sexe</th>
                                            <th>Age</th>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>

