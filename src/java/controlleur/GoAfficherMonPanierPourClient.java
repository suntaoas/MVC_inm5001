package controlleur;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MonPanier;

public class GoAfficherMonPanierPourClient extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		MonPanier monPanier=(MonPanier)request.getSession().getAttribute("monPanier");

                //System.out.println("GoShowMonPanier :"+monPanier.getMontantTotal());
		request.setAttribute("listeDeProduit", monPanier.afficherMonPanier());
		request.setAttribute("MontantTotal", monPanier.getMontantTotal());

		request.getRequestDispatcher("/WEB-INF/Client_affichage_monPanier.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
