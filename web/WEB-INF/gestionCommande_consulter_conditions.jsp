<%-- 
    C'est la page de la gestion de produit pour consulter informations de commande
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

    <body BGCOLOR="green">
        <h2 align="center">RECHERCHE DU COMMANDES</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/CommandeConsulterPourCertains" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">noCommande :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="noCommande" type="text" id="noCommande">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">date :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="date" type="text" id="date">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">noClient :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="noClient" type="text" id="noClient">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">montant :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="montant" type="text" id="montant">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#CC9900">paiement</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="paiement">
                            <option value="1">fini de paiement</option>
                            <option value="0">ne paie pas encore</option>                        
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#CC9900">statut :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="statut">
                            <option value="1">EXITE</option>
                            <option value="0">SUPPRIMANT</option>              			   
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


