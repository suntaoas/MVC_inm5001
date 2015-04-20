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
import service.CommandesService;
import service.MonPanier;

public class CommandeCreerPourClient extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        if (request.getSession().getAttribute("loginUser") == null) {
            request.getRequestDispatcher("/WEB-INF/account_login.jsp").forward(request, response);
        } else {
            Clients loginUser = (Clients) request.getSession().getAttribute("loginUser");
            int noClient = loginUser.getNoClient();
            float montant = Float.parseFloat(request.getParameter("montant"));
            System.out.println("CommandeCreer.java------noClient and montantTotal :" + noClient + "---" + montant);

            MonPanier monPanier = (MonPanier) request.getSession().getAttribute("monPanier");
            System.out.println("CommandeCreer.java------ get.MmontantTotal() :" + monPanier.getMontantTotal());

            Commandes nouveauCommande = new Commandes();
            nouveauCommande.setNoClient(noClient);
            nouveauCommande.setMontant(montant);

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date curDate = new Date(System.currentTimeMillis());
            String datetime = formatter.format(curDate);
            nouveauCommande.setDatetime(datetime);
            System.out.println("CommandeCreer.java------ datetime :" + nouveauCommande.getDatetime());

            CommandesService commandesservice = new CommandesService();
            int orderId = commandesservice.ajouterCommande(monPanier, nouveauCommande);
            System.out.println("Nouveau noCommande : " + orderId);

            ArrayList certainsCommandes = commandesservice.getCommandeByNoClient(noClient);
            request.setAttribute("commandes", certainsCommandes);
            request.getRequestDispatcher("/WEB-INF/Client_commande_consulter.jsp").forward(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
