<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Untitled Document</title>
    </head>
    <body BGCOLOR="#F0F8FF">
        <h2 align="center">RECHERCHE DE COMMANDES POUR PAIEMENT</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/CommandeConsulterPourPaiement?type=paiement" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">noCommande :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="noCommande" type="text" id="noCommande">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">noClient :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="noClient" type="text" id="noClient">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">paiement</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="paiement">
                            <option value="0">ne paie pas encore</option>                        
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#000000">statut :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="statut">
                            <option value="1">EXITE</option>            			   
                        </select>
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


