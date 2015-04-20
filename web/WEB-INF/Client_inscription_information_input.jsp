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
            function estValidePourCourriel(value) {
                var patrn = /[a-z0-9-]{1,30}@[a-z0-9-]{1,65}.[a-z]{3}/;
                if (!patrn.exec(value)) {
                    window.alert("Courriel n'est pas valide ! ");
                    document.form.courriel.focus();
                    return false;
                }
            }
            function estValidePourNom(id) {
                var patrn = /^[a-zA-Z]+$/;
                if (!patrn.exec(id)) {
                    window.alert("NomClient n'est pas valide ! Il faut commencer par une lettre !");
                    document.form.nomClient.focus();
                    return false;
                }
            }
            function estValidePourPasse(id) {
                var patrn = /^[\s\S]+$/;
                if (!patrn.exec(id)) {
                    window.alert("MotDePasse ne peut pas etre NULL ! ");
                    document.form.pass1.focus();
                    return false;
                }
            }
            function estConfirmerPasse(pass2) {
                var pass1 = document.getElementById("pass1").value;
                if (pass1 != pass2) {
                    window.alert("MotDePasse ne correspond pas  ! ");
                    document.form.pass2.focus();
                    return false;
                }
            }
            function estValidePourPrenom(id) {
                var patrn = /^[a-zA-Z]+$/;
                if (!patrn.exec(id)) {
                    window.alert("Prenom n'est pas valide ! Il faut commencer par une lettre !");
                    document.form.prenom.focus();
                    return false;
                }
            }
            function estValidePourAge(id) {
                var patrn = /[0-9]/;
                if (!patrn.exec(id)) {
                    window.alert("Age n'est pas valide ! Il faut etre chiffre !");
                    document.form.age.focus();
                    return false;
                }
            }
            function estValidePourAdresse(id) {
                var patrn = /^[\s\S]+$/;
                if (!patrn.exec(id)) {
                    window.alert("Adresse ne peut pas etre NULL !");
                    document.form.adresse.focus();
                    return false;
                }
            }
            function estValidePourTelephone(id) {
                var patrn = /^[\s\S]+$/;
                if (!patrn.exec(id)) {
                    window.alert("Telephone ne peut pas etre NULL !");
                    document.form.telephone.focus();
                    return false;
                }
            }
        </script>
    </head>

    <body bgcolor="#F0F8FF">
        <h2 align="center">INSCRIPTION DU CLIENT</h2>
        <hr />
        <form name="form" method="post" action="/MVC_inm5001/ClientInscription" onSubmit="return isValid();">
            <table width="75%" border="0" align="left">
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black"><b>Information pour login :</b></font></div>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black">COURRIEL :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="courriel" type="text" id="courriel" onblur=estValidePourCourriel(this.value);>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black">MotDePasse :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="pass1" type="password" id="pass1" onblur=estValidePourPasse(this.value);>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black">Confirmer MotDePasse :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="pass2" type="password" id="pass2" onblur=estConfirmerPasse(this.value);>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black"><b>Information pour profile :</b></font></div>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black">NOM :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="nomClient" type="text" id="nomClient" onblur=estValidePourNom(this.value);>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black">PRENOM :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="prenomClient" type="text" id="prenomClient" onblur=estValidePourPrenom(this.value);>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black">AGE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="age" type="text" id="age" onblur=estValidePourAge(this.value);>
                    </td>
                </tr>
                <tr> 
                    <td width="46%" height="43">
                        <div align="right"><font color="black">SEXE :</font></div>
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
                        <div align="right"><font color="black">ADRESSE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="adresse" type="text" id="adresse" onblur=estValidePourAdresse(this.value);>
                    </td>
                </tr>
                <tr> 
                    <td width="39%" height="43"> 
                        <div align="right"><font color="black">TELEPHONE :</font></div>
                    </td>
                    <td width="46%" height="43"> 
                        <input name="telephone" type="text" id="telephone" onblur=estValidePourTelephone(this.value);>
                    </td>
                </tr>
                <tr>
                    <td height="52"><div align="right"><a href="/MVC_inm5001/TournerUnePageWeb?type=tournerPagePrincipale">RETOURNER</a></div></td>
                    <td width="46%" height="52">
                        <div align="left">
                            <input type="submit" name="Submit" value="INSCTIPTION" >
                            <input type="reset" name="Submit2" value="RECOMMENCER">
                        </div></td><td width="15%" height="52">&nbsp;</td>
                </tr>
            </table>
        </form>
    </body>
</html>


