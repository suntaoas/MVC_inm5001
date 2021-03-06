<%@page import="domain.Produits"%>
<%@page import="domain.Clients"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Magasin de Fruits & Légumes</title>
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
                //alert(noProduit);
                var nombre = 0;
                var id = 0;
                var tableId = document.getElementById("tbl");
                //nombre = document.getElementById("tb").rows[1].cells[6].innerHTML;
                for (var i = 0; i < tableId.rows.length; i++) {
                    if (tableId.rows[i].cells[0].innerHTML == noProduit) {
                        nombre = tableId.rows[i].cells[4].innerHTML;
                        id = i;
                        break;
                    }
                }
                alert("traitement fini");
                location.href = "/MVC_inm5001/MonPanierTraite?type=modifier&id=" + noProduit + "&quantite=" + nombre;
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
                                    <form name="form" method="post" action="/MVC_inm5001/CommandeCreer">
                                        <table border="4" bgcolor="#F0F8FF" frame="border" width="50%" id="tbl">
                                            <tr>
                                                <th>NoProduit</th>
                                                <th>DescriptionProduit</th>
                                                <th>Prix</th>
                                                <th>Quantite</th>
                                                <th>METTRE A JOUR</th>
                                                <th>SUPPRIMER</th>
                                            </tr>
                                            <%
                                                float montantTotal = Float.parseFloat(request.getAttribute("MontantTotal").toString());
                                                ArrayList al = (ArrayList) request.getAttribute("listeDeProduit");
                                                System.out.println("al size : " + al.size());
                                                for (int i = 0; i < al.size(); i++) {
                                                    Produits produit = (Produits) al.get(i);
                                                    out.print("<tr><td>" + produit.getNoProduit() + "</td>");
                                                    out.print("<td>" + produit.getDescription() + "</td>");
                                                    out.print("<td>" + produit.getPrix() + "</td>");
                                                    out.print("<td><input type='text' id='nombreProduit' name='nombreProduit' value=" + produit.getShoppingNum() + " onkeyup='return Text_OnChange(this)'/></td>");
                                                    out.print("<td style='display:none;'><input type='text' id='nombreTemp' name='nombreTemp' readonly /></td>");
                                                    out.print("<td><a href='javascript: modifierNombreProduit(" + produit.getNoProduit() + ")' id=" + produit.getNoProduit() + ">METTRE A JOUR</a> </td>");
                                                    out.print("<td><a href='/MVC_inm5001/MonPanierTraite?type=supprimer&id=" + produit.getNoProduit() + "'>SUPPRIMER</a> </td></tr>");
                                                }
                                            %>
                                            <tr><td colspan="2">MontantTotal ：  </td>
                                                <td colspan="4"><input type="text" id="montant" name="montant" value="<%=(float) (Math.round(montantTotal * 100)) / 100%>"/></td></tr>
                                            <tr><td colspan="2">Numero De Client ：</td>
                                                <td colspan="4"><input type="text" id="noClient" name="noClient"/></td></tr>
                                            <tr><td colspan="6"><input type="submit" value="CREER UNE COMMANDE"></td></tr>
                                        </table>
                                    </form>
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

