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
        <h2 align="center"> PROFIL</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ProfilModifierOuSupprimer" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="#000000">COURRIEL :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="courriel" type="text" id="courriel">
                    </td>
                </tr>
                <tr>
                    <td height="52"><div align="right"><a href="/MVC_inm5001/TraiterLogin">RETOURNER</a></div></td>
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


