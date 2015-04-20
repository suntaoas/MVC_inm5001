package controlleur;

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
import service.CommandesService;

public class CommandeConsulterPourSupprimer extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
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
        CommandesService commandesservice = new CommandesService();
        if (null != nomChamps) {
            ArrayList certainsCommandes = commandesservice.getCommandeParCertainsChamps(nomChamps, ValeurChamps);
            request.setAttribute("commandes", certainsCommandes);
            if (type.equals("consulter")) {
                request.getRequestDispatcher("/WEB-INF/gestionCommande_consulter.jsp").forward(request, response);
            } else if (type.equals("supprimer")) {
                request.getRequestDispatcher("/WEB-INF/gestionCommande_supprimer_consulter.jsp").forward(request, response);
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
