package controlleur;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MonPanier;

public class GoAfficherMonPanier extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        if (request.getSession().getAttribute("monPanier") != null) {
            MonPanier monPanier = (MonPanier) request.getSession().getAttribute("monPanier");

            //System.out.println("GoShowMonPanier :"+monPanier.getMontantTotal());
            request.setAttribute("listeDeProduit", monPanier.afficherMonPanier());
            request.setAttribute("MontantTotal", monPanier.getMontantTotal());

        } else {
            System.out.println("---------------monPanier est null dans GoAfficherMonPanier.java ----------------");
        }

        request.getRequestDispatcher("/WEB-INF/gestionCommande_affichageMonPanier.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
