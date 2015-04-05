/*
 *   C'est la classe de controlleur du servlet pour tourner une page web 
 */
package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MonPanier;
import service.ProduitsService;

public class TournerUnePageWeb extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");

        switch (type) {
            case "tournerConnection":
                request.getRequestDispatcher("/WEB-INF/account_login.jsp").forward(request, response);
                break;
            case "tournerDeconnection":
                request.getSession().removeAttribute("loginUser");
                request.getSession().removeAttribute("monPanier");
                request.getRequestDispatcher("/WEB-INF/account_login.jsp").forward(request, response);
                break;
            case "tournerMenuGestion":
                request.getRequestDispatcher("/WEB-INF/menu_gestion.jsp").forward(request, response);
                break;
            case "tournerAjouterUnClient":
                request.getRequestDispatcher("/WEB-INF/gestionClient_ajouter.jsp").forward(request, response);
                break;
            case "tournerConsulterCertainsClients":
                request.getRequestDispatcher("/WEB-INF/gestionClient_consulter_conditions.jsp").forward(request, response);
                break;
            case "tournerAjouterUnProduit":
                request.getRequestDispatcher("/WEB-INF/gestionProduit_ajouter.jsp").forward(request, response);
                break;
            case "tournerConsulterCertainsProduits":
                request.getRequestDispatcher("/WEB-INF/gestionProduit_consulter_conditions.jsp").forward(request, response);
                break;
            case "tournerModifierOuSupprimerClients":
                request.getRequestDispatcher("/WEB-INF/gestionClient_modiOuSuppri_conditions.jsp").forward(request, response);
                break;
            case "tournerModifierOuSupprimerProduits":
                request.getRequestDispatcher("/WEB-INF/gestionProduit_modiOuSuppri_conditions.jsp").forward(request, response);
                break;
            case "tournerConsulterCertainsCommandes":
                request.getRequestDispatcher("/WEB-INF/gestionCommande_consulter_conditions.jsp").forward(request, response);
                break;
            case "tournerAjouterUneCommande":
                request.getRequestDispatcher("/WEB-INF/gestionCommande_ajouter.jsp").forward(request, response);
                break;
            case "tournerPaiementCondition":
                request.getRequestDispatcher("/WEB-INF/gestionCommande_paiement_conditions.jsp").forward(request, response);
                break;
            case "tournerSupprimerCondition":
                request.getRequestDispatcher("/WEB-INF/gestionCommande_supprimer_conditions.jsp").forward(request, response);
                break;
            case "tournerLivraisonCondition":
                request.getRequestDispatcher("/WEB-INF/gestionLivraison_consulter_conditions.jsp").forward(request, response);
                break;
            case "tournerInscription":
                request.getRequestDispatcher("/WEB-INF/Client_inscription_information_input.jsp").forward(request, response);
                break;
            case "tournerConsulterProduitPourClient":
                request.getRequestDispatcher("/WEB-INF/client_affichage_produit_condition.jsp").forward(request, response);
                break;
            case "tournerContactezNous":
                request.getRequestDispatcher("/WEB-INF/contactez_nous.jsp").forward(request, response);
                break;
            case "tournerPagePrincipale":
                if (request.getAttribute("myCart") == null) {
                    MonPanier myCart = new MonPanier();
                    request.getSession().setAttribute("myCart", myCart);
                }
                if (request.getAttribute("produits") == null) {
                    ProduitsService produitsservice = new ProduitsService();
                    ArrayList al = produitsservice.getTousProduits();
                    request.setAttribute("produits", al);
                }
                request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
                break;

        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
