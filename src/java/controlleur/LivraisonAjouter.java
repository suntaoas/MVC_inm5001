package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.*;

public class LivraisonAjouter extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");
        String noCommande = request.getParameter("noCommande");
        if (type.equals("ajouterDatetime")) {
            request.setAttribute("noCommande", noCommande);
            request.getRequestDispatcher("/WEB-INF/gestionLivraison_ajouter_datetime.jsp").forward(request, response);
        } else if (type.equals("livrer")) {
            String datetime = request.getParameter("datetime");
            LivraisonService livraisonservice = new LivraisonService();
            boolean res = livraisonservice.ajouterLivraison(noCommande, datetime);
            if (res) {
                request.getRequestDispatcher("/WEB-INF/gestionLivraison_consulter_conditions.jsp").forward(request, response);
            } else {
                System.out.println("c'est echec !");
            }
            return;
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
