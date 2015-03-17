package controlleur;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CommandesService;

import service.ProduitsService;
import service.MonPanier;

public class CommandePaiementTraite extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String noCommande = request.getParameter("noCommande");
        CommandesService commandesservice = new CommandesService();
        //ArrayList unClient = clientsservice.getClientById(null);
        boolean res = commandesservice.payerCommande(noCommande);
        if (res) {
            request.getRequestDispatcher("/WEB-INF/gestionCommande_paiement_conditions.jsp").forward(request, response);
        }else{
            System.out.println("c'est echec !");
        }
        return;

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
    }
}
