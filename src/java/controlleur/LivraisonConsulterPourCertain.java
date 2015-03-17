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
import service.LivraisonService;
import service.MonPanier;
import service.ProduitsService;

public class LivraisonConsulterPourCertain extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
        //ClientsService clientsservice = new ClientsService();
        //ArrayList tousCommandes = clientsservice.getTousClients();
        // ArrayList<String> nomChampsTemp = new ArrayList<String>();
        Map<String, String> nomChampsTemp = new HashMap<String, String>();
        nomChampsTemp.put("noCommande", request.getParameter("noCommande").trim());
        nomChampsTemp.put("noClient", request.getParameter("noClient").trim());
        nomChampsTemp.put("paiement", request.getParameter("paiement").trim());
        nomChampsTemp.put("statut", request.getParameter("statut").trim());

        int nombre = nomChampsTemp.size();

        String[] nomChamps = new String[nombre];
        String[] ValeurChamps = new String[nombre];
        int i = 0;
        Iterator iter = nomChampsTemp.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry entry = (Map.Entry) iter.next();
            Object key = entry.getKey();
            Object val = entry.getValue();
            if (!val.toString().isEmpty()) {
                nomChamps[i] = (String) key;
                ValeurChamps[i] = (String) val;
            } else {
                nomChamps[i] = "1";
                ValeurChamps[i] = "1";
            }
            i++;
        }
        LivraisonService livraisonservice = new LivraisonService();
        if (null != nomChamps) {
            ArrayList certainsCommandes = livraisonservice.getCommandePourLivraison(nomChamps, ValeurChamps);
            request.setAttribute("commandes", certainsCommandes);
            if (type.equals("consulter")) {
                request.getRequestDispatcher("/WEB-INF/gestionLivraison_consulter.jsp").forward(request, response);
            } else if (type.equals("ajouter")) {
                request.getRequestDispatcher("/WEB-INF/gestionLivraison_ajouter_consulter.jsp").forward(request, response);
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
