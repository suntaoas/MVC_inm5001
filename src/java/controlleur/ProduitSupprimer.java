package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.*;

public class ProduitSupprimer extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String noProduit = request.getParameter("noProduit");

        ProduitsService userservice = new ProduitsService();
        boolean resSupprimer = userservice.supprimerProduitParNoProduit(noProduit);
        if (resSupprimer) {
            request.getRequestDispatcher("/WEB-INF/gestionProduit_modiOuSuppri_conditions.jsp").forward(request, response);
            return;
        } else {
            request.getRequestDispatcher("/WEB-INF/menu_gestion.jsp").forward(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
