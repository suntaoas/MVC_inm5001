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
import service.MonPanier;
import service.ProduitsService;

public class ClientConsulterPourCertains extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        ClientsService clientsservice = new ClientsService();
        ArrayList tousClients = clientsservice.getTousClients();

        Map<String, String> nomChampsTemp = new HashMap<String, String>();
        nomChampsTemp.put("nom", request.getParameter("nomClient").trim());
        nomChampsTemp.put("prenom", request.getParameter("prenomClient").trim());
        nomChampsTemp.put("sexe", request.getParameter("sexe").trim());
        nomChampsTemp.put("adresse", request.getParameter("adresse").trim());
        nomChampsTemp.put("telephone", request.getParameter("telephone").trim());
        nomChampsTemp.put("courriel", request.getParameter("courriel").trim());
        nomChampsTemp.put("usager", request.getParameter("usager").trim());
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
        if (null != nomChamps) {
            ArrayList certainsClients = clientsservice.getClientParCertainsChamps(nomChamps, ValeurChamps);

            request.setAttribute("clients", certainsClients);
            request.getRequestDispatcher("/WEB-INF/gestionClient_consulter.jsp").forward(request, response);
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
