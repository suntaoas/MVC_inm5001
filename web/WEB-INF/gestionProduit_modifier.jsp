<%-- 
    C'est la page de la gestion de produit pour modifier des informations du Produit
    Pas fini !!!
--%>

<%@page import="domain.Produits"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Untitled Document</title>
        
    </head>
    <%
        Produits produitModifier = (Produits) session.getAttribute("produitModifier");
    %>

    <body BGCOLOR="grey">
        <h2 align="center">MODIFIER LE PRODUIT</h2>

        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ProduitModifierTraite" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">NoProduit :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="noProduit" type="text" id="descripProduit" value="<%=produitModifier.getNoProduit()%>" readonly>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">DESCRIPTION :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="descripProduit" type="text" id="descripProduit" value="<%=produitModifier.getDescription()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">PRIX :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="prixProduit" type="text" id="prixProduit" value="<%=produitModifier.getPrix()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">QUANTITE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="quantite" type="text" id="quantite" value="<%=produitModifier.getQuantite()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">UNITEMESURE:</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="unitemesure" >
                            <option value="<%=produitModifier.getUniteMesure()%>" selected="selected"><%=produitModifier.getUniteMesure()%></option>
                            <option value="LB">LIVRE</option>
                            <option value="KG">KILOGRAMME</option>
                            <option value="CHQ">CHAQUE</option>                            
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#CC9900">CATEGORIE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="categorie" >
                            <option value="<%=produitModifier.getCategorie()%>" selected="selected"><%=produitModifier.getCategorie()%></option>
                            <option value="M">FRUITS</option>
                            <option value="F">LEGUMES</option>             			   
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">STATUT :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="statut" type="text" id="statut" value="<%=produitModifier.getStatut()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">PHOTO :</font></div>
                    </td>
                    <td width="46%" height="43">
                        <input name="photo" type="text" id="photo">
                        <input name="photo" type="text" id="photo" value="<%=produitModifier.getPhoto()%>">
                    </td>
                </tr>
                <tr>
                    <td height="52"><div align="right"><a href="index.html">RETOURNER</a></div></td>
                    <td width="46%" height="52">
                        <div align="left">
                            <input type="submit" name="Submit" value="MODIFIER" >
                            <input type="reset" name="Submit2" value="RECOMMENCER">
                        </div></td><td width="15%" height="52">&nbsp;</td>
                </tr>
            </table>
        </form>
    </body>
</html>


