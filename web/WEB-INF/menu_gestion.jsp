<%-- 
    C'est la page de menu de gestion pour administrateur 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<%
    System.out.println("entrer account_login.jsp !");
%>
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
                        <ul id="nav">
                            <li class="active"><a href="index-2.html" title="Gestion Clients">Gestion Clients</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerAjouterUnClient">Ajouter client</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerModifierOuSupprimerClients">Modifier & Supprimer client</a></li>
                                    <li><a href="/MVC_inm5001/ClientConsulterPourTout">Consulter Tous les clients</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConsulterCertainsClients">Consulter Certains clients</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="category.html" title="Gestion Produits">Gestion Produits</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerAjouterUnProduit">Ajouter produit</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerModifierOuSupprimerProduits">Modifier & Supprimer produit</a></li>
                                    <li><a href="/MVC_inm5001/ProduitConsulterPourTout">Consulter Tous les produits</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConsulterCertainsProduits">Consulter Certains produits</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="blog.html" title="Gestion Commandes">Gestion Commandes</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerAjouterUneCommande">Ajouter commande</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerSupprimerCondition">Supprimer commande</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConsulterCertainsCommandes">Consulter commande</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPaiementCondition">Paiement pour commande</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="faq.html" title="Gestion Livraison">Gestion Livraison</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerLivraisonCondition">Ajouter livraison</a></li>
                                    <li><a href="/MVC_inm5001/LivraisonConsulterPourTout">Consulter livraison</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="about_us.html" title="Gestion System">Gestion System</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMessageErreur">Maintenance de type produit</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMessageErreur">Maintenance de taxe</a></li>
                                    <li><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMessageErreur">Statistique de paiement</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale" title="Retourner">Retourner</a></li>
                        </ul>
                    </nav>

                </header>
            </div>
            <!--Content Block-->
            <section class="content-wrapper">
                <div class="content-container container">
                    <div class="main">
                        <h1 class="page-title">GESTION DE BASE DE DONNEES</h1>
                        <div class="account-login">
                            <div class="col-1 new-users">
                                <div class="content">
                                    <h2>Fonctionnalite Pour Administrateur</h2>
                                    <p>Réaliser de la maintenance et la gestion de la base de données.</p>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="news-letter-container">
                    </div>	
                </div>
            </section>
        </div>
    </body>
</html>
