package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.Clients;
import service.*;

public class TraiterLogin extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String courriel = request.getParameter("courriel");
        String p = request.getParameter("password");
        System.out.println("-----TrarterLogin.java------" + request.getSession().getAttribute("monPanier"));
        System.out.println(courriel);
        System.out.println(p);
        if (request.getSession().getAttribute("loginUser") != null) {
            ProduitsService produitservice = new ProduitsService();
            ArrayList al = produitservice.getTousProduits();
            request.setAttribute("produits", al);
            request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
            return;
        }
        Clients loginuser = new Clients(courriel, p);
        ClientsService userservice = new ClientsService();
        if (userservice.verifierClient(loginuser)) {
            System.out.println("login sucess !");
            request.getSession().setAttribute("loginUser", loginuser);
            if (request.getSession().getAttribute("monPanier") == null) {
                MonPanier unpanier = new MonPanier();
                request.getSession().setAttribute("monPanier", unpanier);
                System.out.println("---------------monPanier est cree par TraiterLogin.java ----------------");
            }
            if (request.getSession().getAttribute("produits") == null) {
                ProduitsService produitsservice = new ProduitsService();
                ArrayList al = produitsservice.getTousProduits();
                request.setAttribute("produits", al);
            }
            request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
            return;
        } else {
            request.getRequestDispatcher("/WEB-INF/account_login.jsp").forward(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
