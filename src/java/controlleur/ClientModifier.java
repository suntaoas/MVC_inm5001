/*
 *   C'est la classe de controlleur du servlet pour valider le client
 *   "gestionClient_modiOuSuppri_affichage.jsp" ----->  "ClientModifier.java"  -----> "gestionClient_modiOuSuppri_conditions.jsp"
 */
package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Clients;
import service.*;

public class ClientModifier extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        //obtenir noClient 
        String noClient = request.getParameter("noClient");
        System.out.println("noClient = " + noClient);

        ClientsService userservice = new ClientsService();
        Clients client = userservice.getClientById(noClient);
        System.out.println("NOM=" + client.getNom());
        if (client.getCourriel() != null) {
            request.getSession().setAttribute("clientModifier", client);
            request.getRequestDispatcher("/WEB-INF/gestionClient_modifier.jsp").forward(request, response);
            return;

        } else {
            //illegal
            request.getRequestDispatcher("/WEB-INF/menu_gestion.jsp").forward(request, response);

        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
