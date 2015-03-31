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
            function js_method(){
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
                            <!--
                            <div class="cart-block">
                                <ul>
                                    
                                    <li><a href="cart.html" title="Item"><img title="Item" alt="Item" src="images/item_icon.png" /></a></li>
                                    <li>Mon panier</li>
                                </ul>
                                
                                <div id="minicart" class="remain_cart" style="display: none;">
                                    <p class="empty">You have 2 items in your shopping cart.</p>
                                    <ol>
                                        <li>
                                            <div class="img-block"><img src="images/small_img.png" title="" alt="" /></div>
                                            <div class="detail-block">
                                                <h4><a href="#" title="Htc Mobile 1120">Htc Mobile 1120</a></h4>
                                                <p>
                                                    <strong>1</strong> x $900.00
                                                </p>
                                                <a href="#" title="Details">Details</a>
                                            </div>
                                            <div class="edit-delete-block">
                                                <a href="#" title="Edit"><img src="images/edit_icon.png" alt="Edit" title="Edit" /></a>
                                                <a href="#" title="Remove"><img src="images/delete_item_btn.png" alt="Remove" title="Remove" /></a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="img-block"><img src="images/small_img.png" title="" alt="" /></div>
                                            <div class="detail-block">
                                                <h4><a href="#" title="Htc Mobile 1120">Htc Mobile 1120</a></h4>
                                                <p>
                                                    <strong>1</strong> x $900.00
                                                </p>
                                                <a href="#" title="Details">Details</a>
                                            </div>
                                            <div class="edit-delete-block">
                                                <a href="#" title="Edit"><img src="images/edit_icon.png" alt="Edit" title="Edit" /></a>
                                                <a href="#" title="Remove"><img src="images/delete_item_btn.png" alt="Remove" title="Remove" /></a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="total-block">Total:<span>$1,900.00</span></div>
                                            <a href="cart.html" title="Checkout" class="colors-btn">Checkout</a>
                                            <div class="clear"></div>
                                        </li>
                                    </ol>
                                </div>
                                
                            </div> 
                            
                            <div class="search-block">
                                <input type="text" value="Nom de produit seulment" />
                                <input type="submit" value="Search" title="Search" />
                            </div>
                            -->
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
                                    <li><a href="category.html">Legumes</a>
                                        <ul>
                                            <li><a href="category.html">Tomate</a></li>
                                            <li><a href="category.html">Pomme De Terre</a></li>
                                            <li><a href="category.html">Poivron</a></li>
                                            <li><a href="category.html">Brocoli</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="category.html">Fruits</a>
                                        <ul>
                                            <li><a href="category.html">Pomme</a></li>
                                            <li><a href="category.html">Melon D'eau</a></li>
                                            <li><a href="category.html">Banana</a></li>
                                            <li><a href="category.html">Orange</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="category.html">Autre Produits</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="blog.html" title="Cherche advanced">Cherche advanced</a></li>
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
            <!--Banner Block-->
            <section class="banner-wrapper">
                <div class="banner-block container">
                    <div class="flexslider">
                        <ul class="slides">
                            <li><img title="Banner" alt="Banner" src="images/pomme.jpe" /></li>
                            <li><img title="Banner" alt="Banner" src="images/tomate.jpe" /></li>
                            <li><img title="Banner" alt="Banner" src="images/pomme.jpe" /></li>
                            <li><img title="Banner" alt="Banner" src="images/tomate.jpe" /></li>
                        </ul>
                    </div>
                    <ul class="banner-add">
                        <li class="add1"><a href="#" title=""><img title="add1" alt="add1" src="static1.jpg" /></a></li>
                        <li class="add2"><a href="#" title=""><img title="add2" alt="add2" src="static2.jpg" /></a></li>
                    </ul>
                </div>
            </section>
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
                    <div class="heading-block">
                        <h1>New Product</h1>
                    </div>
                    <div class="new-product-block">
                        <ul class="product-grid">
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> 
                                    <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> 
                                    <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                        </ul>
                        <ul class="product-grid">
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="pro-img">
                                    <img title="Freature Product" alt="Freature Product" src="images/default_img.png" />
                                </div>
                                <div class="pro-content">
                                    <p>produit</p>
                                </div>
                                <div class="pro-price">$1.99</div>
                                <div class="pro-btn-block"> <a class="add-cart left" href="#" title="Add to Cart">Add to Cart</a> <a class="add-cart right quickCart inline" href="#quick-view-container" title="Quick View">Quick View</a> </div>
                                <div class="pro-link-block"> <a class="add-wishlist left" href="#" title="Add to wishlist">Add to wishlist</a> <a class="add-compare right" href="#" title="Add to Compare">Add to Compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
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
        <!--Quick view Block-->
        <!--
        <script type="text/javascript">
            jQuery(function() {
                var tabContainers = jQuery('div.tabs > div');
                tabContainers.hide().filter(':first').show();
                jQuery('div.tabs ul.tabNavigation a').click(function() {
                    tabContainers.hide();
                    tabContainers.filter(this.hash).show();
                    jQuery('div.tabs ul.tabNavigation a').removeClass('selected');
                    jQuery(this).addClass('selected');
                    return false;
                }).filter(':first').click();
            });
        </script>
        <article style="display:none;">
            <section id="quick-view-container" class="quick-view-wrapper">
                <div class="quick-view-container">
                    <div class="quick-view-left">
                        <h2>Sunglass RB3184</h2>
                        <div class="product-img-box">
                            <p class="product-image">
                                <img src="images/sale_icon_img.png" title="Sale" alt="Sale" class="sale-img" />
                                <a href="view.html" title="Image"><img src="images/quick_view_img.png" title="Image" alt="Image" /></a>				</p>
                            <ul class="thum-img">
                                <li><img  src="images/quick_thum_img.png" title="" alt="" /></li>
                                <li><img  src="images/quick_thum_img.png" title="" alt="" /></li>
                            </ul>
                        </div>
                    </div>
                    <div class="quick-view-right tabs">
                        <ul class="tab-block tabNavigation">
                            <li><a class="selected" title="Overview" href="#tabDetail">Overview</a></li>
                            <li><a title="Description" href="#tabDes">Description</a></li>
                        </ul>
                        <div id="tabDetail" class="tabDetail">
                            <div class="first-review">Be the first to review this product</div>
                            <div class="price-box">
                                <span class="price">$1.99</span>			</div>
                            <div class="availability">In stock</div>
                            <div class="color-size-block">
                                <div class="label-row">
                                    <label><em>*</em> color</label>
                                    <span class="required">* Required Fields</span>				</div>
                                <div class="select-row">
                                    <select><option>-- Please Select --</option></select>
                                </div>
                                <div class="label-row">
                                    <label><em>*</em> size</label>
                                </div>
                                <div class="select-row">
                                    <select><option>-- Please Select --</option></select>
                                </div>
                            </div>
                            <div class="add-to-cart-box">
                                <span class="qty-box">
                                    <label for="qty">Qty:</label>
                                    <a class="prev" title="" href="#"><img alt="" title="" src="images/qty_prev.png"></a>
                                    <input type="text" name="qty" class="input-text qty" id="qty" maxlength="12" value="1">
                                    <a class="next" title="" href="#"><img alt="" title="" src="images/qty_next.png"></a>				</span>
                                <button title="Add to Cart" class="form-button"><span>Add to Cart</span></button>
                            </div>
                        </div>
                        <div id="tabDes" class="tabDes">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas erat odio, suscipit eu porta et, ultricies id sapien. Quisque posuere odio eget lectus suscipit sodales. Sed consequat, leo ut varius scelerisque, augue massa tincidunt est, et tincidunt enim tortor a metus. In sit amet diam in tellus tincidunt mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi hendrerit eleifend tortor, a dapibus tellus suscipit porta. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In mollis adipiscing mi et volutpat. Aliquam vitae dui nunc. Nulla ac ante eu massa dictum volutpat. Sed mauris sem, posuere sit amet pretium consectetur, ullamcorper vel orci. Aenean feugiat luctus lectus ac hendrerit. Fusce pulvinar, mauris eget sodales suscipit, diam neque condimentum lectus, id imperdiet felis turpis egestas neque. In aliquet orci eget nisl sollicitudin sed gravida tortor commodo</p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </section>
        </article>   
        -->
        <!--Footer Block-->
        <section class="footer-wrapper">

        </section>
    </body>
</html>
