/*
 *   C'est la classe de controlleur du servlet pour ajouter des clients
 *   "menu_gestion.jsp->gestion clients->ajouter" ----->  "ClientAjouter.java"  -----> "gestionClient_ajouter.jsp"
 */
package controlleur;

import domain.Clients;
import domain.Commandes;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ClientsService;
import service.CommandesService;
import service.MonPanier;

public class CommandeCreer extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        int noClient = Integer.parseInt(request.getParameter("nomClient").trim().toString());
        float montant = Float.parseFloat(request.getParameter("montant").trim().toString());
        MonPanier monPanier = (MonPanier) request.getSession().getAttribute("monPanier");
        
        Commandes commande = new Commandes();
        commande.setNoClient(noClient);
        commande.setMontant(montant);
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
        Date curDate = new Date(System.currentTimeMillis());
        String datetime = formatter.format(curDate);
        commande.setDatetime(datetime);

        CommandesService commandesservice = new CommandesService();
        boolean res = commandesservice.ajouterCommande(monPanier,noClient);
        if (res) {
            ArrayList<Commandes> tousCommandes = commandesservice.getTousCommandes();
            request.setAttribute("commandes", tousCommandes);
            request.getRequestDispatcher("/WEB-INF/gestionClient_consulter.jsp").forward(request, response);
        }else{
            System.out.println("c'est echec !");
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
