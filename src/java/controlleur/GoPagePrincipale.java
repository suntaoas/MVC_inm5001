/*
 *   C'est la classe de controlleur du servlet pour entrer la page principale
 *   "index.jsp" ----->  "GoPagePrincipale.java"  -----> "main.jsp"
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

public class GoPagePrincipale extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        ProduitsService produitservice = new ProduitsService();
        ArrayList al = produitservice.getTousProduits();
        request.setAttribute("produits", al);

        request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);

        //creer un shopping cart
        MonPanier myCart = new MonPanier();
        request.getSession().setAttribute("myCart", myCart);

        request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
        return;

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
