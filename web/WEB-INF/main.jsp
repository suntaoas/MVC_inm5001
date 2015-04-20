<%@ page language="java" import="java.util.*,domain.*" pageEncoding="UTF-8"%>
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
                            <li> <a class="mainCurrency" href="#">BIENVNU GESTIONNAIRE: <%=client.getPrenom()%></a></li>
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
                            <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerDeconnection" title="Deconnection">Déconnexion</a></li>
                                <%
                                } else {
                                %>
                            <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerInscription" title="Inscription">INSCRIPTION</a></li>
                            <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConnection" title="Connection">CONNEXION</a></li>
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
                            <li class="active"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale" title="Home">Accueil</a></li>
                            <li class=""><a href="" title="Shop by">Tous Les Produits</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/ProduitConsulterPourCertainsPourClient?type=legume">Légumes</a></li>
                                    <li><a href="/MVC_inm5001/ProduitConsulterPourCertainsPourClient?type=fruit">Fruits</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConsulterProduitPourClient" title="Recherche advance">Recherche Avancé</a></li>
                            <li class=""><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerContactezNous" title="Contact Nous">Contact Nous</a></li>
                        </ul>
                    </nav>
                    <div class="mobMenu">
                        <h1>
                            <span>Menu</span>
                            <a class="menuBox highlight" href="javascript:void(0);">ccc</a>
                            <span class="clearfix"></span>
                        </h1>
                        <div id="menuInnner" style="display:none;">
                            <ul class="accordion">
                                <li class="active"><a href="index-2.html" title="Home">Home</a></li>
                                <li class="parent"><a href="category.html" title="Shop by">Shop by</a>
                                    <ul>
                                        <li><a href="category.html">Woman Collection</a></li>
                                        <li><a href="category.html">Men Collection</a></li>
                                        <li><a href="category.html">Accessories</a></li>
                                        <li><a href="category.html">Mobile</a>
                                            <ul>
                                                <li><a href="category.html">Second level</a></li>
                                                <li><a href="category.html">Second level</a></li>
                                                <li><a href="category.html">Second level</a></li>
                                                <li><a href="category.html">Second level</a></li>
                                                <li><a href="category.html">Second level</a></li>
                                                <li><a href="category.html">Second level</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="category.html">Shoes</a></li>
                                        <li><a href="category.html">Others</a></li>
                                    </ul>
                                </li>
                                <li class=""><a href="blog.html" title="Blog">Blog</a></li>
                                <li class=""><a href="faq.html" title="Faq">Faq</a></li>
                                <li class=""><a href="about_us.html" title="About us">About us</a></li>
                                <li class=""><a href="404_error.html" title="Pages">Pages</a></li>
                                <li class=""><a href="contact_us.html" title="Footwear">Contact us</a></li>
                            </ul>
                        </div>      
                    </div>
                </header>
            </div>
            <section class="banner-wrapper">
                <div class="banner-block container">
                    <div class="flexslider">
                        <ul class="slides">
                            <li><img title="Banner" alt="Banner" src="images/topfruitetlegume1.jpg" /></li>
                            <li><img title="Banner" alt="Banner" src="images/topfruitetlegume2.jpg" /></li>
                            <li><img title="Banner" alt="Banner" src="images/topfruitetlegume3.jpg" /></li>
                            <li><img title="Banner" alt="Banner" src="images/topfruitetlegume4.jpg" /></li>
                        </ul>
                    </div>
                    <ul class="banner-add">
                        <li class="add1"><a href="#" title=""><img title="add1" alt="add1" src="images/topfruitetlegume6.jpg" /></a></li>
                        <li class="add2"><a href="#" title=""><img title="add2" alt="add2" src="images/topfruitetlegume5.jpg" /></a></li>
                    </ul>
                </div>
            </section>
            <section class="content-wrapper">
                <div class="content-container container">
                    <div class="heading-block">
                        <h1>Nos produits</h1>
                        <ul class="pagination">
                            <li class="grid"><a href="#" title="Grid">Grid</a></li>
                        </ul>
                    </div>
                    <div class="feature-block">
                        <ul id="mix" class="product-grid">
                            <%
                                ArrayList al = (ArrayList) request.getAttribute("produits");
                                for (int i = 0; i < al.size(); i++) {
                                    Produits produit = (Produits) al.get(i);
                                    System.out.println(produit.getPhoto());
                                    System.out.println(produit.getPrix());
                                    System.out.println(produit.getDescription());
                            %>
                            <li>
                                <div class="pro-img"><img title="Freature Product" alt="Freature Product" src="images/<%=String.valueOf(produit.getPhoto())%>" /></div>
                                <div class="pro-hover-block">
                                    <h4 class="pro-name"><%=produit.getDescription()%></h4>
                                    <div class="link-block"> 
                                        <!--<a href="#quick-view-container" class="quickllook inline" title="Quick View">Quick View</a> -->
                                        <a href="/MVC_inm5001/ProduitConsulterDetail?noProduit=<%=produit.getNoProduit()%>" class="quickproLink" title="Link">Product link</a></div>
                                    <input style="display:none;" type="text" id="id_al" name="id_al" readonly value="<%=i%>"/>
                                    <div class="pro-price"><%=produit.getPrix()%></div>
                                </div>
                            </li>
                            <%}%>
                        </ul>
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
