<%-- 
    C'est la page de la gestion de client pour ajouter informations de Client
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String noCommande = request.getParameter("noCommande");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date curDate = new Date(System.currentTimeMillis());
    String datetime = formatter.format(curDate);
%>
<html>
    <head>
        <title>Untitled Document</title>
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
    </head>

    <body BGCOLOR="#F0F8FF">
        <h2 align="center">ENTRER LA DATE ET LE TEMPS POUR LIVRAISON</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/LivraisonAjouter?type=livrer" onSubmit="return isValid();">
            <table width="75%" border="0" align="center">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">noCommande :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input readonly="readonly" name="noCommande" type="text" id="noCommande" value="<%=noCommande%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">Le datetime :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="datetime" type="text" id="datetime" value="<%=datetime%>">
                    </td>
                </tr>

                <tr>
                    <td height="52"><div align="right"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerMenuGestion">RETOURNER</a></div></td>
                    <td width="46%" height="52">
                        <div align="left">
                            <input type="submit" name="Submit" value="LIVRER" >
                        </div></td><td width="15%" height="52">&nbsp;</td>
                </tr>
            </table>
        </form>
    </body>
</html>


