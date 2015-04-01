<%-- 
    C'est la page principale du site web 
--%>

<%@ page language="java" import="java.util.*,domain.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->

<%
    //Clients client = new Clients();
    //if (session.getAttribute("loginUser") != null) {
    //    client = (Clients) session.getAttribute("loginUser");
    //}
%>
<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Megashop</title>

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
        <%
            Produits produitTemp = new Produits();
        %>
        <script language="javascript" type="text/javascript">
            var id = 0;
            function js_method() {
                id = this.title.value;
            }
        </script>
    </head>
    <body>

        <div class="mainContainer sixteen container">
            <!--Header Block-->
            <div class="header-wrapper">
                <header class="container">
                    <div class="head-right">
                        <ul class="top-nav">
                            <%
                                if (session.getAttribute("loginUser") != null) {
                                    Clients client = new Clients();
                                    client = (Clients) session.getAttribute("loginUser");
                                    if ("1".equals(client.getUsager())) {
                            %>
                            <li> <a class="mainCurrency" href="#">BIENVNU ADMINISTRATREUR: <%=client.getPrenom()%></a></li>
                            <li class=""><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion" title="Gestion">Gestion</a></li>
                                <%
                                } else {
                                %>
                            <li> <a class="mainCurrency" href="#">BIENVNU CLIENT: <%=client.getPrenom()%></a></li>
                                <%
                                    }
                                %>
                            <li class=""><a href="/MVC_inm5001/ProfilModifierOuSupprimer?type=consulter" title="Mon Profil">Mon Profil</a></li>
                            <li class=""><a href="/MVC_inm5001/CommandeConsulterPourUnClient?type=consulter" title="Mes Commandes">Mes Commandes</a></li>
                            <li class="my-wishlist"><a href="/MVC_inm5001/GoAfficherMonPanierPourClient" title="Mon Panier">Mon Panier</a></li>
                            <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerDeconnection" title="Deconnection">Deconnection</a></li>
                                <%
                                } else {
                                %>
                            <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerInscription" title="Inscription">Inscription</a></li>
                            <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConnection" title="Connection">Connection</a></li>
                                <%
                                    }
                                %>
                        </ul>
                        <section class="header-bottom">

                        </section>
                    </div>
                    <h1 class="logo"><a href="index-2.html" title="Logo">
                            <img title="Logo" alt="Logo" src="images/logo_2.jpe" />

                        </a></h1>

                    <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
                        <ul id="nav">
                            <li class="active"><a href="index-2.html" title="Home">Liquidation</a></li>
                            <li class=""><a href="category.html" title="Shop by">Tous Les Produits</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/ProduitConsulterPourCertainsPourClient?type=legume">Legumes</a></li>
                                    <li><a href="/MVC_inm5001/ProduitConsulterPourCertainsPourClient?type=fruit">Fruits</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConsulterProduitPourClient" title="Cherche advanced">Cherche advanced</a></li>
                            <li class=""><a href="about_us.html" title="Quant A Nous">Quant A Nous</a></li>
                            <li class=""><a href="contact_us.html" title="Contact Nous">Contact Nous</a></li>
                        </ul>
                    </nav>

                    <div class="mobMenu">
                        <h1>
                            <span>Menu</span>
                            <a class="menuBox highlight" href="javascript:void(0);">ccc</a>
                            <span class="clearfix"></span>
                        </h1>
                    </div>

                </header>
            </div>
            <!--Banner Block-->

            <!--Content Block-->
            <section class="content-wrapper">
                <div class="content-container container">
                    <div class="heading-block">
                        <h1>Freatured Products</h1>
                        <ul class="pagination">
                            <li class="grid"><a href="#" title="Grid">Grid</a></li>
                        </ul>
                    </div>
                    <div class="feature-block">
                        <%
                            ArrayList al = (ArrayList) request.getAttribute("produits");
                            int i = 0;
                            while (i < al.size()) {
                        %>
                        <ul id="mix" class="product-grid">
                            <%
                                do {
                                    Produits produit = (Produits) al.get(i);
                            %>
                            <li>
                                <div class="pro-img"><img title="Freature Product" alt="Freature Product" src="images/<%=String.valueOf(produit.getPhoto())%>" /></div>
                                <div class="pro-hover-block">
                                    <h4 class="pro-name"><%=produit.getDescription()%></h4>
                                    <div class="link-block"> 
                                        <a href="/MVC_inm5001/ProduitConsulterDetail?noProduit=<%=produit.getNoProduit()%>" class="quickproLink" title="Link">Product link</a></div>
                                    <input style="display:none;" type="text" id="id_al" name="id_al" readonly value="<%=i%>"/>
                                    <div class="pro-price"><%=produit.getPrix()%></div>
                                </div>
                            </li>
                            <%
                                    i++;
                                } while ((i % 3 != 0) && (i < al.size()));
                            %>
                        </ul>
                        <%
                            }
                        %>
                    </div>
                    <div class="news-letter-container">
                        <div class="free-shipping-block">
                            <h1>Profitez de la livraison gratuite</h1>
                            <p></p>
                        </div>                       
                    </div>
                </div>
            </section>
        </div> 

        <section class="footer-wrapper">

        </section>
    </body>
</html>
