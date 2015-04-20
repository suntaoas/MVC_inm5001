package controlleur;

import domain.Clients;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CommandesService;

public class CommandeConsulterPourUnClient extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
        if (request.getSession().getAttribute("loginUser") != null) {
            Clients loginUser = (Clients) request.getSession().getAttribute("loginUser");
            int noClient = loginUser.getNoClient();

            CommandesService commandesservice = new CommandesService();
            ArrayList certainsCommandes = commandesservice.getCommandeByNoClient(noClient);
            request.setAttribute("commandes", certainsCommandes);
            if (type.equals("consulter")) {
                request.getRequestDispatcher("/WEB-INF/Client_commande_consulter.jsp").forward(request, response);
            } else if (type.equals("paiement")) {
                request.getRequestDispatcher("/WEB-INF/gestionCommande_paiement_consulter.jsp").forward(request, response);
            }
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
