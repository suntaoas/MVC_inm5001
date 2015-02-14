/*
 *   C'est la classe de controlleur du servlet pour tourner la page web "menu_gestion.jsp"
 *   "main.jsp->gestion" ----->  "GomenuGestion.java"  -----> "menu_gestion.jsp"
 */
package controlleur;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TournerUnePageWeb extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");

        switch (type) {
            case "tournerDeconnection":
                request.getRequestDispatcher("/WEB-INF/account_login.jsp").forward(request, response);
                break;
            case "tournerMenuGestion":
                request.getRequestDispatcher("/WEB-INF/menu_gestion.jsp").forward(request, response);
                break;
            case "tournerAjouterUnClient" :
                request.getRequestDispatcher("/WEB-INF/gestionClient_ajouter.jsp").forward(request, response);
                break;
                
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
