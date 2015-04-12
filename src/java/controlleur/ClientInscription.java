/*
 *   C'est la classe de controlleur du servlet pour ajouter des clients
 *   "menu_gestion.jsp->gestion clients->ajouter" ----->  "ClientAjouter.java"  -----> "gestionClient_ajouter.jsp"
 */
package controlleur;

import domain.Clients;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ClientsService;

public class ClientInscription extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        Clients clientNouveau = new Clients();
        clientNouveau.setNom(request.getParameter("nomClient").trim());
        clientNouveau.setPrenom(request.getParameter("prenomClient").trim());
        clientNouveau.setPassword(request.getParameter("pass1"));
        clientNouveau.setAge(Integer.parseInt(request.getParameter("age")));
        clientNouveau.setSexe(request.getParameter("sexe").trim());
        clientNouveau.setAdresse(request.getParameter("adresse").trim());
        clientNouveau.setTelephone(request.getParameter("telephone").trim());
        clientNouveau.setCourriel(request.getParameter("courriel").trim());
        clientNouveau.setUsager("0");

        String[] champs = {"courriel"};
        String[] paras = {clientNouveau.getCourriel()};

        ClientsService clientsservice = new ClientsService();
        ArrayList<Clients> al = clientsservice.getClientParCertainsChamps(champs, paras);
        System.out.println("al.size() = "+al.size());
        if (al.size() == 0) {
            boolean res = clientsservice.ajouterClient(clientNouveau);
            if (res) {
                ArrayList tousClients = clientsservice.getTousClients();
                request.setAttribute("clients", tousClients);
                request.getRequestDispatcher("/WEB-INF/succes_message.jsp").forward(request, response);
            } else {
                System.out.println("c'est echec !");
            }
        }else{
            request.getRequestDispatcher("/WEB-INF/erreur_message_inscriptionClient.jsp").forward(request, response);
        }
        //ArrayList unClient = clientsservice.getClientById(null);

        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
