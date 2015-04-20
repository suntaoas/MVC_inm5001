package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.LivraisonService;

public class LivraisonConsulterPourTout extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        LivraisonService livraisonservice = new LivraisonService();
        ArrayList tousLivraisons = livraisonservice.getTousLivraisons();

        request.setAttribute("livraison", tousLivraisons);

        request.getRequestDispatcher("/WEB-INF/gestionLivraison_consulter_tout.jsp").forward(request, response);
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
