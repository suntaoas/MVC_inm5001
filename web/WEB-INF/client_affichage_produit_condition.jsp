<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Untitled Document</title>
    </head>
    <body BGCOLOR="#F0F8FF">
        <h2 align="center">RECHERCHE DU PRODUIT</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ProduitConsulterPourCertainsPourClient?type=rechercheAdvanced" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">DESCRIPTION :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="descripProduit" type="text" id="descripProduit">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">PRIX :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="prixProduit" type="text" id="prixProduit">
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#000000">CATEGORIE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="categorie">
                            <option value="F">FRUITS</option>
                            <option value="L">LEGUMES</option>              			   
                        </select>
                    </td>
                </tr>
                <tr>
                    <td height="52"><div align="right"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale">RETOURNER</a></div></td>
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


