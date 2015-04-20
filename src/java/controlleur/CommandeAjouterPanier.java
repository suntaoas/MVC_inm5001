package controlleur;

import domain.Produits;
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

public class CommandeAjouterPanier extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        ProduitsService produitsservice = new ProduitsService();

        Map<String, String> nomChampsTemp = new HashMap<String, String>();
        nomChampsTemp.put("description", request.getParameter("descripProduit").trim());
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
            ArrayList certainsProduits = produitsservice.getProduitParCertainsChamps(nomChamps, ValeurChamps);
            for (int j = 0; j < certainsProduits.size(); j++) {
                Produits unproduit = (Produits) certainsProduits.get(j);
                System.out.println(unproduit.getNoProduit());
            }
            request.setAttribute("produitsChoisiPourNouvelleCommande", certainsProduits);
            request.getRequestDispatcher("/WEB-INF/gestionCommande_ajouter.jsp").forward(request, response);
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
