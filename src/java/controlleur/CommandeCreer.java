/*
 *   C'est la classe de controlleur du servlet pour ajouter des clients
 *   "menu_gestion.jsp->gestion clients->ajouter" ----->  "ClientAjouter.java"  -----> "gestionClient_ajouter.jsp"
 */
package controlleur;

import domain.Clients;
import domain.Commandes;
import domain.Produits;
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
import service.SendMailToSomeone;

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
        System.out.println("Nouveau noCommande : "+orderId);

        //envoyer le courriel pour client
        /*
        SendMailToSomeone smts = new SendMailToSomeone();

        String mailbody = "<table width=\"70%\" border=\"1\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"comm\">"
                + "<tr>"
                + "<td align=\"center\">NoCommande</td>"
                + "<td align=\"center\">DescriptionProduit</td>"
                + "<td align=\"center\">PrixProduit</td>"
                + "<td align=\"center\">Quantite</td>"
                + "</tr>";
        
        
        ArrayList al = (ArrayList) monPanier.afficherMonPanier();
        for (int i = 0; i < al.size(); i++) {
            Produits produit = (Produits) al.get(i);

            mailbody += "<tr>"
                    + "<td align=\"center\">" + orderId + "</td>"
                    + "<td align=\"center\">" + produit.getNoProduit()  + "</td>"
                    + "<td align=\"center\">" + produit.getDescription() + "</td>"
                    + "<td align=\"center\">" + produit.getPrix() + "</td>"
                    + "<td align=\"center\">" + produit.getShoppingNum() + "</td>"
                    + "</tr>";

        }

        mailbody += "</table>";

	smts.send("你在时尚购物网有订单", mailbody, "suntaoas@hotmail.com","inm5001@sohu.com","qwer@1234","smtp.sohu.com");
        */
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
