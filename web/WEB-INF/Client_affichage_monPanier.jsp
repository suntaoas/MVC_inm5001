<%@page import="domain.Produits"%>
<%@page import="domain.Clients"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Magasin de Fruits & Légumes</title>

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/layout.css">
        <link rel="stylesheet" href="css/ddsmoothmenu.css"/>
        <link rel="stylesheet" href="css/elastislide.css"/>
        <link rel="stylesheet" href="css/home_flexslider.css"/>

        <script language="javascript" type="text/javascript">
            function getRowObj(obj)
            {
                var i = 0;
                while (obj.tagName.toLowerCase() != "tr")
                {
                    obj = obj.parentNode;
                    if (obj.tagName.toLowerCase() == "table")
                        return null;
                }
                return obj;
            }
            function getRowNo(obj)
            {
                var trObj = getRowObj(obj);
                var trArr = trObj.parentNode.children;
                for (var trNo = 0; trNo < trArr.length; trNo++)
                {
                    if (trObj == trObj.parentNode.children[trNo])
                    {
                        alert(trNo + 1);
                    }
                }
            }
            function Text_OnChange(obj)
            {
                var no;
                var trObj = getRowObj(obj);
                var trArr = trObj.parentNode.children;
                for (var trNo = 0; trNo < trArr.length; trNo++)
                {
                    if (trObj == trObj.parentNode.children[trNo])
                    {
                        no = trNo;
                    }
                }
                var nombre = obj.value;
                document.getElementById("tbl").rows[no].cells[4].innerHTML = nombre;
            }

            function modifierNombreProduit(noProduit) {
                var nombre = 0;
                var id = 0;
                var tableId = document.getElementById("tbl");
                for (var i = 0; i < tableId.rows.length; i++) {
                    if (tableId.rows[i].cells[0].innerHTML == noProduit) {
                        nombre = tableId.rows[i].cells[4].innerHTML;
                        id = i;
                        break;
                    }
                }
                alert("traitement fini");
                location.href = "/MVC_inm5001/MonPanierTraiterPourClient?type=modifier&id=" + noProduit + "&quantite=" + nombre;
            }
        </script>
    </head>
    <body>
        <div class="mainContainer sixteen container">
            <div class="header-wrapper">
                <header class="container">
                    <div class="head-right">
                    </div>
                    <h1 class="logo"><a href="index-2.html" title="Logo">
                            <img title="Logo" alt="Logo" src="images/logo_2.jpe" />
                        </a>
                    </h1>
                    <%
                        if (request.getSession().getAttribute("loginUser") == null) {
                    %>
                    <ul class="top-nav">
                        <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerInscription" title="Inscription">Inscription</a></li>
                        <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerConnection" title="Connection">Connection</a></li>
                        <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale" title="Continue">CONTINUE</a></li>
                    </ul>
                    <%
                    } else {
                    %>
                    <ul class="top-nav">
                        <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerDeconnection" title="Deconnection">Deconnexion</a></li>
                        <li class="log-in"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale" title="Continue">Continue</a></li>
                    </ul>
                    <%
                        }
                    %>
                    <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
                        <h4 align="center">MON PANIER</h4>
                    </nav>

                </header>
            </div>
            <section >
                <div align="center" >
                    <form name="form" method="post" action="/MVC_inm5001/CommandeCreerPourClient">
                        <table align="center" border="1" bgcolor="#F0F8FF" frame="border" width="50%" id="tbl">
                            <tr>
                                <th>NoProduit</th>
                                <th>DescriptionProduit</th>
                                <th>Prix</th>
                                <th>Quantite</th>
                                <th>Modifier</th>
                                <th>Supprimer</th>
                            </tr>
                            <%
                                float montantTotal = Float.parseFloat(request.getAttribute("MontantTotal").toString());
                                ArrayList al = (ArrayList) request.getAttribute("listeDeProduit");
                                System.out.println("al size : " + al.size());
                                for (int i = 0; i < al.size(); i++) {

                                    Produits produit = (Produits) al.get(i);
                                    //System.out.println("affichage : " + produit.getDescription());
                                    out.print("<tr><td>" + produit.getNoProduit() + "</td>");
                                    out.print("<td>" + produit.getDescription() + "</td>");
                                    out.print("<td>" + produit.getPrix() + "</td>");
                                    out.print("<td><input type='text' id='nombreProduit' name='nombreProduit' value=" + produit.getShoppingNum() + " onkeyup='return Text_OnChange(this)'/></td>");
                                    out.print("<td style='display:none;'><input type='text' id='nombreTemp' name='nombreTemp' readonly /></td>");
                                    out.print("<td><a href='javascript: modifierNombreProduit(" + produit.getNoProduit() + ")' id=" + produit.getNoProduit() + ">Modifer</a> </td>");
                                    out.print("<td><a href='/MVC_inm5001/MonPanierTraiterPourClient?type=supprimer&id=" + produit.getNoProduit() + "'>Supprimer</a> </td></tr>");
                                }
                            %>
                            <tr><td colspan="2">MontantTotal ：  </td>
                                <td colspan="4"><input type="text" id="montant" name="montant" value="<%=(float) (Math.round(montantTotal * 100)) / 100%>"/></td></tr>
                                    <%
                                        if (al.size() != 0) {
                                    %>
                            <tr>
                                <td colspan="3"><input type="submit" value="CREER UNE COMMANDE"></td>
                            </tr>
                            <%
                            } else {
                            %>
                            <tr>
                                <td colspan="3"><input type="submit" value="CREER UNE COMMANDE" disabled></td>
                            </tr>
                            <%}%>
                        </table>
                    </form>
                </div>
            </section>
        </div>
    </body>
</html>

