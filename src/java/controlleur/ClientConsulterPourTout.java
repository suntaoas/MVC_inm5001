/*
 *   C'est la classe de controlleur du servlet pour consulter des clients
 *   "menu_gestion.jsp->gestion clients->consulter" ----->  "ClientConsulter.java"  -----> "gestionClient_consulter.jsp"
 */
package controlleur;

import domain.Clients;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ClientsService;
import service.MonPanier;
import service.ProduitsService;

public class ClientConsulterPourTout extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        ClientsService clientsservice = new ClientsService();
        ArrayList tousClients = clientsservice.getTousClients();

        request.setAttribute("clients", tousClients);

        request.getRequestDispatcher("/WEB-INF/gestionClient_consulter.jsp").forward(request, response);
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
