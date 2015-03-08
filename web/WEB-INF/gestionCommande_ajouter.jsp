<%-- 
    c'est la page d'ajout de produit
--%>

<%@page import="service.*"%>
<%@page import="domain.Produits"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Untitled Document</title>
        <script language="javascript" type="text/javascript">
            //obtenir l'objet ligne
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
            //obtenir le numero de ligne selon l'objet de ligne
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
                //alert(no);
                var price = document.getElementById("tb").rows[no].cells[2].innerHTML;
                //alert(price);
                //var nombre = document.getElementById("tb").rows[no].cells[3].innerHTML;
                var nombre = obj.value;
                //alert(nombre);
                //alert(price * nombre);
                document.getElementById("tb").rows[no].cells[5].innerHTML = parseFloat((price * nombre).toFixed(2));
                document.getElementById("tb").rows[no].cells[6].innerHTML = nombre;
            }

            function ajouterProduit(noProduit) {
                //alert(noProduit);
                var nombre = 0;
                //var id = 0;
                var tableId = document.getElementById("tb");
                //nombre = document.getElementById("tb").rows[1].cells[6].innerHTML;
                for(var i=0;i<tableId.rows.length;i++){
                    if(tableId.rows[i].cells[0].innerHTML == noProduit){
                        nombre = tableId.rows[i].cells[6].innerHTML;
                        //id = i;
                        break;
                    }
                }
                location.href = "/MVC_inm5001/MonPanierTraite?type=ajouter&id="+noProduit+"&quantite=" + nombre;
                //alert(nombre);
                //alert(id);
                
            }
        </script>
    </head>

    <body BGCOLOR="green">
        <h2 align="center">CHOISIR PRODUITS POUR UNE COMMANDE</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/CommandeAjouterPanier">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">DESCRIPTION :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="descripProduit" type="text" id="descripProduit">
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#CC9900">CATEGORIE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="categorie">
                            <option value="001">FRUITS</option>
                            <option value="002">LEGUMES</option>              			   
                        </select>
                    </td>
                </tr>
                <tr>
                    <td height="52"><div align="right"><a href="index.html">RETOURNER</a></div></td>
                    <td width="46%" height="52">
                        <div align="left">
                            <input type="submit" name="Submit" value="CHERCHER" >
                            <input type="reset" name="Submit2" value="RECOMMENCER">
                        </div></td><td width="15%" height="52">&nbsp;</td>
                </tr>
            </table>
        </form>
        <section >
            <div style="text-align:center;">
                <table border="4" bgcolor="grey" frame="border" width="60%" style="margin:auto" id="tb">
                    <tr>
                        <th>NoProduit</th>
                        <th>Description</th>
                        <th>Prix</th>
                        <th>UniteMesure</th>
                        <th>Quantite</th>
                        <th>Montant</th>
                        <th>Ajouter Dans Panier</th>
                    </tr>
                    <%  if (request.getAttribute("produitsChoisiPourNouvelleCommande") != null) {
                            ArrayList al = (ArrayList) request.getAttribute("produitsChoisiPourNouvelleCommande");
                            for (int i = 0; i < al.size(); i++) {
                                Produits produitTemp = (Produits) al.get(i);
                                out.print("<tr><td>" + produitTemp.getNoProduit() + "</td>");
                                out.print("<td>" + produitTemp.getDescription() + "</td>");
                                out.print("<td>" + produitTemp.getPrix() + "</td>");
                                out.print("<td>" + produitTemp.getUniteMesure() + "</td>");
                                out.print("<td><input type='text' id='nombreProduit' name='nombreProduit' value='0' onkeyup='return Text_OnChange(this)'/></td>");
                                out.print("<td><input type='text' id='montant' name='montant' readonly /></td>");
                                out.print("<td style='display:none;'><input type='text' id='nombreTemp' name='nombreTemp' readonly /></td>");
                                out.print("<td><a href='javascript: ajouterProduit("+produitTemp.getNoProduit()+")' id=" + produitTemp.getNoProduit() + ">AJOUTER</a> </td></tr>");
                            }
                        }
                    %> 
                </table>

            </div>
        </section>
    </body>
</html>