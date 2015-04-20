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
    <body BGCOLOR="#F0F8FF">
        <h2 align="center">INSCRIPTION DU CLIENT</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ClientAjouter" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">NOM :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="nomClient" type="text" id="nomClient">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">PRENOM :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="prenomClient" type="text" id="prenomClient">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">AGE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="age" type="text" id="age">
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#000000">SEXE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="sexe">
                            <option value="M">MASCULIN</option>
                            <option value="F">FEMININ</option>              			   
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">MotDePasse :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="pass" type="password" id="pass">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">ADRESSE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="adresse" type="text" id="adresse">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">TELEPHONE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="telephone" type="text" id="telephone">
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">COURRIEL :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="courriel" type="text" id="courriel">
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="#000000">ADMIN/USAGE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <select name="flagUsage">
                            <option value="0">USAGE</option>
                            <option value="1">ADMIN</option>              			   
                        </select>
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


