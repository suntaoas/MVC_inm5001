/*
 *   C'est la classe de controlleur du servlet pour consulter des commandes
 *   "menu_gestion.jsp->gestion commande->consulter" ----->  "CommandeConsulterPourCertains.java"  -----> "gestionCommande_consulter.jsp"
 */
package controlleur;

import domain.Clients;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ClientsService;
import service.CommandesService;
import service.MonPanier;
import service.ProduitsService;

public class CommandeConsulterDetailCommande extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String noCommande = request.getParameter("noCommande");

        CommandesService commandeservice = new CommandesService();
        ArrayList arrDetailCommande = commandeservice.getDetailParNoCommande(noCommande);

        request.setAttribute("detailCommande", arrDetailCommande);
        request.getRequestDispatcher("/WEB-INF/gestionCommande_consulter_detailCommande.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
