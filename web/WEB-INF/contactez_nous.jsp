<%@page import="domain.Clients"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                            <li class="active"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale" title="Home">Acceuil</a></li>
                            <li class=""><a href="category.html" title="Shop by">Tous Les Produits</a>
                                <ul>
                                    <li><a href="/MVC_inm5001/ProduitConsulterPourCertainsPourClient?type=legume">Legumes</a></li>
                                    <li><a href="/MVC_inm5001/ProduitConsulterPourCertainsPourClient?type=fruit">Fruits</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConsulterProduitPourClient" title="Cherche advanced">Recherche advance</a></li>
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
            <section class="content-wrapper">
                <div class="content-container container">
                    <div class="heading-block">
                    </div>
                    <div class="feature-block">
                        <h4>Magasin TAO ET LEILA</h4>
                        <h4> 2802 Rue Sherbrooke Est, Montréal</h4>
                        <h4> H2L 1V2</h4>
                        <h4> 514-999-8888</h4>
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
    </body>
</html>
