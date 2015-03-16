<%-- 
    c'est la page d'ajout de produit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Untitled Document</title>
        
    </head>

    <body BGCOLOR="#F0F8FF">
        <h2 align="center">INSCRIPTION PRODUIT</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ProduitAjouter">
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
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">QUANTITE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="quantite" type="text" id="quantite">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">UNITEMESURE:</font></div>
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
                    <td width="46%" height="43">
                        <div align="right"><font color="#000000">CATEGORIE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="categorie">
                            <option value="001">FRUITS</option>
                            <option value="002">LEGUMES</option>              			   
                        </select>
                    </td>
                </tr>

                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">PHOTO :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="photo" type="text" id="adresse">
                    </td>
                </tr>

                <tr>
                    <td height="52"><div align="right"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion">RETOURNER</a></div></td>
                    <td width="46%" height="52">
                        <div align="left">
                            <input type="submit" name="Submit" value="AJOUTER" >
                            <input type="reset" name="Submit2" value="RECOMMENCER">
                        </div></td><td width="15%" height="52">&nbsp;</td>
                </tr>
            </table>
        </form>
    </body>
</html>
</head>