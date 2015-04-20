<%@page import="domain.Produits"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Produits produitDetail = (Produits) request.getAttribute("produitDetail");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header-wrapper">
            <header class="container">
                <div class="head-right">
                </div>
                <h1 class="logo"><a href="index-2.html" title="Logo">
                        <img title="Logo" alt="Logo" src="images/logo_2.jpe" />
                    </a>
                </h1>
                <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
                </nav>
            </header>
        </div>
        <section >
            <div align="center">
                <form name="form" method="post" action="/MVC_inm5001/MonPanierTraiterPourClient?type=ajouter" >
                    <table align="center" border="0" bgcolor="#F0F8FF" frame="border" width="50%" >
                        <tr>
                            <td colspan="4" align="center"><h2><%=produitDetail.getDescription()%></h2></td>
                        </tr>
                        <tr>
                            <td rowspan="5"><img src="images/<%=String.valueOf(produitDetail.getPhoto())%>" title="Sale" alt="Sale" /></td>
                            <td align="right"><b>Numero produit: </b></td>
                            <td><input type="text" name="id" readonly value="<%=produitDetail.getNoProduit()%>"/></td>
                        </tr>
                        <tr>
                            <td align="right"><b>Prix produit: </b></td>
                            <td colspan="2"><h4><%=produitDetail.getPrix()%></h4></td>
                        </tr>
                        <tr>
                            <td align="right"><b>Nombre Produit: </b></td>
                            <td><input type="text" name="quantite" value="1"/></td>
                            <td><%=produitDetail.getUniteMesure()%></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right" width="46%" height="52">
                                <div align="right">
                                    <input type="submit" name="Submit" value="AJOUTER" >
                                    <input type="reset" name="Submit2" value="RECOMMENCER">
                                </div>
                            </td>
                        </tr>
                    </table>  
                </form>
            </div>
        </section>
    </body>
</html>
