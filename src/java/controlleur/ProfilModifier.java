package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.Clients;
import service.*;

public class ProfilModifier extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String noClient = request.getParameter("noClient");
        System.out.println("noClient = " + noClient);
        ClientsService userservice = new ClientsService();
        Clients client = userservice.getClientById(noClient);
        System.out.println("NOM=" + client.getNom());
        if (client.getCourriel() != null) {
            request.getSession().setAttribute("clientModifier", client);
            request.getRequestDispatcher("/WEB-INF/profilClient_modifier.jsp").forward(request, response);
            return;
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
