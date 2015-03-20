package controlleur;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProduitsService;
import service.MonPanier;

public class MonPanierTraiterPourClient extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
        String id = request.getParameter("id");
        if (type.equals("supprimer")) {
            System.out.println("MonPanier--supprimeer :");
            //obtenir le monPanier
            if (request.getSession().getAttribute("monPanier") != null) {
                MonPanier unNouveauPanierAdm = (MonPanier) request.getSession().getAttribute("monPanier");
                unNouveauPanierAdm.supprimerProduit(id);
                System.out.println("MonPanier--supprimeer : size of monPanier : " + unNouveauPanierAdm.afficherMonPanier().size());

                //request.setAttribute("listeDeProduit", unNouveauPanierAdm.afficherMonPanier());
                //request.setAttribute("MontantTotal", unNouveauPanierAdm.getMontantTotal());
                //request.getRequestDispatcher("/WEB-INF/affichageMonPanier.jsp").forward(request, response);
                request.getSession().setAttribute("monPanier", unNouveauPanierAdm);
                response.sendRedirect("/MVC_inm5001/GoAfficherMonPanierPourClient");
            }

        } else if (type.equals("ajouter")) {
            int nombre = Integer.parseInt(request.getParameter("quantite"));
            if (request.getSession().getAttribute("monPanier") != null) {
                MonPanier monPanier = (MonPanier) request.getSession().getAttribute("monPanier");
                monPanier.ajouterProduit(id, nombre);
                System.out.println("MontantTotal de monPanier1 :" + monPanier.getMontantTotal() + " et quantite de monPanier1 :" + monPanier.quantiteProduit());
            } else {
                MonPanier monPanier = new MonPanier();
                monPanier.ajouterProduit(id, nombre);
                request.getSession().setAttribute("monPanier", monPanier);
                System.out.println("monPanier2 :");
                System.out.println(monPanier.getHm(id).getNoProduit());
                System.out.println(monPanier.getHm(id).getPrix());
                System.out.println(monPanier.getHm(id).getQuantite());
                System.out.println(monPanier.getHm(id).getUniteMesure());
                System.out.println(monPanier.getHm(id).getShoppingNum());
            }
            response.sendRedirect("/MVC_inm5001/GoAfficherMonPanierPourClient");
        } else if (type.equals("modifier")) {
            int nombre = Integer.parseInt(request.getParameter("quantite"));

            MonPanier monPanier = (MonPanier) request.getSession().getAttribute("monPanier");

            monPanier.modifierProduit(id, nombre);

            System.out.println("MonPanierTraite.java--nombre =======" + nombre);
            request.getSession().setAttribute("monPanier", monPanier);
            response.sendRedirect("/MVC_inm5001/GoAfficherMonPanierPourClient");
        } else if (type.equals("show")) {

            response.sendRedirect("/MyShopping/GoShowMycart");
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
