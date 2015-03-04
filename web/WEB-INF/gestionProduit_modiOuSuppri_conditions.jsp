<%-- 
    C'est la page de la gestion de produit pour modifier ou supprimer informations du Produit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Untitled Document</title>
        <%--
        <script>
            function isValid() {
                if (document.form.nom.value == "") {
                    window.alert("Nom S.V.P!");
                    document.form.nom.focus();
                    return false;
                }
                if (document.form.pass.value == "")
                {
                    window.alert("MotDePasse S.V.P!");
                    document.form.pass.focus();
                    return false;
                }
            }
        </script>
        --%>
    </head>

    <body BGCOLOR="grey">
        <h2 align="center">RECHERCHE DU PRODUIT</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ProduitModifierOuSupprimer" onSubmit="return isValid();">
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
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">PRIX :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="prixProduit" type="text" id="prixProduit">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">QUANTITE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="quantite" type="text" id="quantite">
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#CC9900">UNITEMESURE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="unitemesure">
                            <option value="LB">LIVRE</option>
                            <option value="KG">KILOGRAMME</option>
                            <option value="CHQ">CHAQUE</option>                            
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">CATEGORIE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="categorie">
                            <option value="M">FRUITS</option>
                            <option value="F">LEGUMES</option>              			   
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">PHOTO :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="photo" type="text" id="photo">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">STATUT :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="statut" type="text" id="statut">
                    </td>
                </tr>
                <tr>
                    <td height="52"><div align="right"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion">RETOURNER</a></div></td>
                    <td width="46%" height="52">
                        <div align="left">
                            <input type="submit" name="Submit" value="CHERCHER" >
                            <input type="reset" name="Submit2" value="RECOMMENCER">
                        </div></td><td width="15%" height="52">&nbsp;</td>
                </tr>
            </table>
        </form>
    </body>
</html>


