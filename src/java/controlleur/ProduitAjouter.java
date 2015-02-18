/*
 *   C'est la classe de controlleur du servlet pour ajouter des produit
 *   "menu_gestion.jsp->gestion clients->ajouter" ----->  "ClientAjouter.java"  -----> "gestionClient_ajouter.jsp"
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
import service.ProduitsService;

public class ProduitAjouter extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        Produits produitNouveau = new Produits();
        System.out.println("objetproduitNouveau est cree !");
        produitNouveau.setDescription(request.getParameter("descripProduit").trim());
        produitNouveau.setPrix(Float.parseFloat(request.getParameter("prixProduit")));
        produitNouveau.setQuantite(Integer.parseInt(request.getParameter("quantite")));
        produitNouveau.setCategorie(request.getParameter("categorie").trim());
        produitNouveau.setPhoto(request.getParameter("photo").trim());
        
        ProduitsService produitsservice = new ProduitsService();
        //ArrayList unClient = clientsservice.getClientById(null);
        boolean res = produitsservice.ajouterProduit(produitNouveau);
        if (res) {
            ArrayList tousProduits = produitsservice.getTousProduits();
            request.setAttribute("produits", tousProduits);
            request.getRequestDispatcher("/WEB-INF/gestionProduit_consulter.jsp").forward(request, response);
        }else{
            System.out.println("c'est echec !");
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}

