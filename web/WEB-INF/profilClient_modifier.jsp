<%-- 
    C'est la page de la gestion de client pour modifier des informations de Client
    Pas fini !!!
--%>

<%@page import="domain.Clients"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <%
        Clients clientModifier = (Clients) session.getAttribute("clientModifier");
    %>

    <body BGCOLOR="#F0F8FF">
        <h2 align="center">MODIFIER MON PROFIL</h2>

        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ProfilModifierTraite" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">NoClient :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="noClient" type="text" id="nomClient" value="<%=clientModifier.getNoClient()%>" readonly>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">NOM :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="nomClient" type="text" id="nomClient" value="<%=clientModifier.getNom()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">PRENOM :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="prenomClient" type="text" id="prenomClient" value="<%=clientModifier.getPrenom()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">MotDePasse :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="pass" type="text" id="pass" value="<%=clientModifier.getPassword()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">AGE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="age" type="text" id="age" value="<%=clientModifier.getAge()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#000000">SEXE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="sexe" >
                            <option value="<%=clientModifier.getSexe()%>" selected="selected"><%=clientModifier.getSexe()%></option>
                            <option value="M">MASCULIN</option>
                            <option value="F">FEMININ</option>              			   
                        </select>
                    </td>
                </tr>
                <%--
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">STATUT :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="statut" type="text" id="statut" value="<%=clientModifier.getStatut()%>">
                    </td>
                </tr>
                --%>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">ADRESSE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="adresse" type="text" id="adresse" value="<%=clientModifier.getAdresse()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">TELEPHONE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="telephone" type="text" id="telephone" value="<%=clientModifier.getTelephone()%>">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">COURRIEL :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="courriel" type="text" id="courriel" value="<%=clientModifier.getCourriel()%>">
                    </td>
                </tr>
                <%--
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#000000">ADMIN/USAGE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="usager" >
                            <option value="<%=clientModifier.getUsager()%>" selected="selected"><%=clientModifier.getUsager()%></option>
                            <option value="0">USAGE</option>
                            <option value="1">ADMIN</option>              			   
                        </select>
                    </td>
                </tr>
--%>
                <tr>
                    <td height="52"><div align="right"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale">RETOURNER</a></div></td>
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


