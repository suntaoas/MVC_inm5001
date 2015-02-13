/*
 *    C'est la classe de controlleur du servlet pour tourner la page web "gestionClient_ajouter.jsp"
 *   "menu_gestion.jsp->gestion Client -> ajouter" ----->  "GoClientAjouter.java"  -----> "gestionClient_ajouter.jsp"
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

import service.MyCart;


public class GoClientAjouter extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
                
                
		
		request.getRequestDispatcher("/WEB-INF/gestionClient_ajouter.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
