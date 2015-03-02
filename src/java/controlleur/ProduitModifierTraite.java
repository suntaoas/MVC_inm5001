/*
 *   
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

public class ProduitModifierTraite extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
       
        Produits produitModifierTemp = new Produits();
        produitModifierTemp.setNoProduit(Integer.parseInt(request.getParameter("noProduit").trim()));
        produitModifierTemp.setDescription(request.getParameter("descripProduit").trim());
        produitModifierTemp.setPrix(Float.parseFloat(request.getParameter("prixProduit")));
        produitModifierTemp.setQuantite(Integer.parseInt(request.getParameter("quantite")));
        produitModifierTemp.setUniteMesure(request.getParameter("unitemesure").trim()); 
        produitModifierTemp.setCategorie(request.getParameter("categorie").trim());
        produitModifierTemp.setPhoto(request.getParameter("photo").trim());
        
        ProduitsService produitsservice = new ProduitsService();
        //ArrayList unClient = clientsservice.getClientById(null);
        boolean res = produitsservice.modifierProduit(produitModifierTemp);
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
