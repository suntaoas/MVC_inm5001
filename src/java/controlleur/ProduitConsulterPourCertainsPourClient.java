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
import service.ProduitsService;

public class ProduitConsulterPourCertainsPourClient extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        ProduitsService produitsservice = new ProduitsService();
        String type = request.getParameter("type");
        if ("rechercheAdvanced".equals(type)) {
            Map<String, String> nomChampsTemp = new HashMap<String, String>();
            nomChampsTemp.put("description", request.getParameter("descripProduit").trim());
            nomChampsTemp.put("prix", request.getParameter("prixProduit").trim());
            nomChampsTemp.put("categorie", request.getParameter("categorie").trim());
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
                ArrayList certainsClients = produitsservice.getProduitParCertainsChamps(nomChamps, ValeurChamps);

                request.setAttribute("produits", certainsClients);
                request.getRequestDispatcher("/WEB-INF/client_affichage_produit.jsp").forward(request, response);
            }
        }
        if ("fruit".equals(type)) {
            String[] nomChamps = {"categorie"};
            String[] ValeurChamps = {"F"};
            ArrayList certainsClients = produitsservice.getProduitParCertainsChamps(nomChamps, ValeurChamps);
            request.setAttribute("produits", certainsClients);
            request.getRequestDispatcher("/WEB-INF/client_affichage_produit.jsp").forward(request, response);
        }
        if ("legume".equals(type)) {
            String[] nomChamps = {"categorie"};
            String[] ValeurChamps = {"L"};
            ArrayList certainsClients = produitsservice.getProduitParCertainsChamps(nomChamps, ValeurChamps);
            request.setAttribute("produits", certainsClients);
            request.getRequestDispatcher("/WEB-INF/client_affichage_produit.jsp").forward(request, response);
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
