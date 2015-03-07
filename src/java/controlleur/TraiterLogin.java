/*
 *   C'est la classe de controlleur du servlet pour valider le client
 *   "account_login.jsp" ----->  "TraiterLogin.java"  -----> "main.jsp"
 */

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

        //obtenir courriel et password 
        String courriel = request.getParameter("courriel");
        String p = request.getParameter("password");

        System.out.println(courriel);
        System.out.println(p);

        //D'abord déterminer si l'utilisateur est connecté ou l'utilisateur se est connecté session a expiré
        if (request.getSession().getAttribute("loginUser") != null) {
            //preparer des donnees dans le page main.jsp
            ProduitsService produitservice = new ProduitsService();
            ArrayList al = produitservice.getTousProduits();

            request.setAttribute("produits", al);

            request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
            return;
        }

        //creer un objet CLients
        Clients loginuser = new Clients(courriel, p);
        //verifier usage legal
        ClientsService userservice = new ClientsService();
        if (userservice.verifierClient(loginuser)) {
            //si legal , donc entrer main.jsp
            System.out.println("login sucess !");

            request.getSession().setAttribute("loginUser", loginuser);

            //creer un shopping cart
            MonPanier unpanier = new MonPanier();
            request.getSession().setAttribute("monPanier", unpanier);

            ProduitsService produitsservice = new ProduitsService();
            ArrayList al = produitsservice.getTousProduits();

            request.setAttribute("produits", al);

            request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
            return;

        } else {
            //illegal
            request.getRequestDispatcher("/WEB-INF/account_login.jsp").forward(request, response);

        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
