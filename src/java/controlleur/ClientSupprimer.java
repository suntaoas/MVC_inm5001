/*
 *   C'est la classe de controlleur du servlet pour valider le client
 *   "gestionClient_modiOuSuppri_affichage.jsp" ----->  "ClientSupprimer.java"  -----> "gestionClient_modiOuSuppri_conditions.jsp"
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

public class ClientSupprimer extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        //obtenir noClient
        String noClient = request.getParameter("noClient");



        ClientsService userservice = new ClientsService();
        boolean resSupprimer = userservice.supprimerClientParNoClient(noClient);
        if (resSupprimer) {
            

            request.getRequestDispatcher("/WEB-INF/gestionClient_modiOuSuppri_conditions.jsp").forward(request, response);
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
