package controlleur;

import domain.Produits;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ProduitsService;

public class ProduitConsulterDetail extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String noProduit = request.getParameter("noProduit");

        ProduitsService produitsservice = new ProduitsService();
        Produits produitDetail = produitsservice.getProduitById(noProduit);
        request.setAttribute("produitDetail", produitDetail);
        request.getRequestDispatcher("/WEB-INF/Client_detail_produit.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
