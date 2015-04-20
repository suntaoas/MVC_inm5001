package controlleur;

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

public class CommandeCreer extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        int noClient = Integer.parseInt(request.getParameter("noClient"));
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

        ArrayList<Commandes> tousCommandes = commandesservice.getTousCommandes();
        request.setAttribute("commandes", tousCommandes);
        request.getRequestDispatcher("/WEB-INF/gestionCommande_consulter_conditions.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
