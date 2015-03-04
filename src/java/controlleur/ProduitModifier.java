/*
 *   C'est la classe de controlleur du servlet pour valider le produit
 *   "gestionProduit_modiOuSuppri_affichage.jsp" ----->  "ProduitModifier.java"  -----> "gestionProduit_modiOuSuppri_conditions.jsp"
 */
package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Produits;
import service.*;

public class ProduitModifier extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        //obtenir noProduit 
        String noProduit = request.getParameter("noProduit");
        System.out.println("noProduit = " + noProduit);

        ProduitsService userservice = new ProduitsService();
        Produits produit = userservice.getProduitById(noProduit);
        System.out.println("DESCRIPTION=" + produit.getDescription());
        if (produit.getStatut()!= null) {
            request.getSession().setAttribute("produitModifier", produit);
            request.getRequestDispatcher("/WEB-INF/gestionProduit_modifier.jsp").forward(request, response);
            return;

        } else {
            //illegal
            request.getRequestDispatcher("/WEB-INF/menu_gestion.jsp").forward(request, response);

        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}