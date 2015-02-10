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
                </header>
            </div>
            <!--Content Block-->
            <section class="content-wrapper">
                <div class="content-container container">
                    <div class="main">
                        <h1 class="page-title">Connectez-vous ou créez un compte</h1>
                        <div class="account-login">
                            <div class="col-1 new-users">
                                <div class="content">
                                    <h2>Nouveaux Clients</h2>
                                    <p>En créant un compte sur notre boutique, vous serez en mesure de se déplacer à travers le processus de paiement plus rapide, stocker des adresses d'expédition multiples, consulter et suivre vos commandes dans votre compte et plus encore.</p>
                                </div>
                                <div class="buttons-set">
                                    <a class="colors-btn" title="Creer un compte" href="account_create.html"><span><span>Create an Account</span></span></a>
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <form action="/MVC_inm5001/GoHallUI" method="post" class="style2">
                                <div class="col-2 registered-users">
                                    <div class="content">
                                        <h2>Clients Enregistrés</h2>
                                        <p>Si vous avez un compte avec nous, se il vous plaît vous connecter.</p>
                                        <ul class="form-list">
                                            <li>
                                                <label class="required" for="noClient">NoClient:<em>*</em></label>
                                                <div class="input-box">
                                                    <input type="text" title="NoClient" name="noClient" class="input-text required-entry validate-email" value="" />
                                                </div>
                                                <div class="clear"></div>
                                            </li>
                                            <li>
                                                <label class="required" for="password">MotDePasse:<em>*</em></label>
                                                <div class="input-box">
                                                    <input type="password" title="Password" name="password" class="input-text required-entry validate-password" />
                                                </div>
                                                <div class="clear"></div>
                                            </li>
                                            <li>
                                                <input type="submit" value="envoyer"/>
                                                <input type="reset" value="recommencer"/>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </form>
                            <div class="clear"></div>
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
