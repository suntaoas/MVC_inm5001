/*
 *  
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

public class ProfilModifierTraite extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        Clients clientModifierTemp = new Clients();
        clientModifierTemp.setNoClient(Integer.parseInt(request.getParameter("noClient").trim()));
        clientModifierTemp.setNom(request.getParameter("nomClient").trim());
        clientModifierTemp.setPrenom(request.getParameter("prenomClient").trim());
        clientModifierTemp.setPassword(request.getParameter("pass"));
        clientModifierTemp.setAge(Integer.parseInt(request.getParameter("age")));
        clientModifierTemp.setSexe(request.getParameter("sexe").trim());
        clientModifierTemp.setAdresse(request.getParameter("adresse").trim());
        clientModifierTemp.setTelephone(request.getParameter("telephone").trim());
        clientModifierTemp.setCourriel(request.getParameter("courriel").trim());
        //clientModifierTemp.setUsager(request.getParameter("usager").trim());

        ClientsService clientsservice = new ClientsService();
        //ArrayList unClient = clientsservice.getClientById(null);
        boolean res = clientsservice.modifierProfil(clientModifierTemp);
        if (res) {
            ArrayList tousClients = clientsservice.getTousClients();
            request.setAttribute("clients", tousClients);
            request.getRequestDispatcher("/WEB-INF/profilClient_consulter.jsp").forward(request, response);
        }else{
            System.out.println("c'est echec !");
        }
        return;
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
