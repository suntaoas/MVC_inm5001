/*
 *   C'est la classe de controlleur du servlet pour consulter des clients
 *   "menu_gestion.jsp->gestion clients->consulter" ----->  "ClientConsulter.java"  -----> "gestionClient_consulter.jsp"
 */
package controlleur;

import domain.Produits;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ClientsService;
import service.MonPanier;
import service.ProduitsService;

public class ProduitConsulterPourTout extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        ProduitsService produitsservice = new ProduitsService();
        ArrayList tousProduits = produitsservice.getTousProduits();
        //for(int i=0;i<tousProduits.size();i++){
           // Produits produitTemp = (Produits) tousProduits.get(i);
            //System.out.println(produitTemp.getNoProduit());
            //System.out.println(produitTemp.getDescription());
            //System.out.println(produitTemp.getUniteMesure());
        //}

        request.setAttribute("produits", tousProduits);

        request.getRequestDispatcher("/WEB-INF/gestionProduit_consulter.jsp").forward(request, response);
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
