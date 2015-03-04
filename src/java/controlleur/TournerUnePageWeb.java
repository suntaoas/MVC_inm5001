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
import service.MyCart;
import service.ProduitsService;

public class TournerUnePageWeb extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");

        switch (type) {
            case "tournerDeconnection":
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
            case "tournerPagePrincipale":
                MyCart myCart = new MyCart();
                request.getSession().setAttribute("myCart", myCart);
                ProduitsService produitsservice = new ProduitsService();
                ArrayList al = produitsservice.getTousProduits();
                request.setAttribute("produits", al);
                request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
                break;

        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
