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
import service.MyCart;
import service.ProduitsService;

public class CommandeConsulterPourCertains extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        //ClientsService clientsservice = new ClientsService();
        //ArrayList tousCommandes = clientsservice.getTousClients();
        // ArrayList<String> nomChampsTemp = new ArrayList<String>();
        Map<String, String> nomChampsTemp = new HashMap<String, String>();
        nomChampsTemp.put("noCommande", request.getParameter("noCommande").trim());
        nomChampsTemp.put("date", request.getParameter("date").trim());
        //nomChampsTemp.add(request.getParameter("age").trim());
        nomChampsTemp.put("noClient", request.getParameter("noClient").trim());
        nomChampsTemp.put("montant", request.getParameter("montant").trim());
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
        /*
         for(int j=0;j<nomChamps.length;j++){
         System.out.println("nomChamps["+j+"]="+nomChamps[j]+"    "+"ValeurChamps["+j+"]="+ValeurChamps[j]);
         }
         */
        CommandesService commandesservice = new CommandesService();
        if (null != nomChamps) {
                ArrayList certainsCommandes = commandesservice.getCommandeParCertainsChamps(nomChamps, ValeurChamps);
                request.setAttribute("commandes", certainsCommandes);
                request.getRequestDispatcher("/WEB-INF/gestionCommande_consulter.jsp").forward(request, response);
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
