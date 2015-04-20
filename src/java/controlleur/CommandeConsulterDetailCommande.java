package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CommandesService;

public class CommandeConsulterDetailCommande extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String noCommande = request.getParameter("noCommande");
        System.out.println("CommandeConsulterDetailCommande.java=======noCommnade=" + noCommande);

        CommandesService commandeservice = new CommandesService();
        ArrayList arrDetailCommande = commandeservice.getDetailParNoCommande(noCommande);
        System.out.println("CommandeConsulterDetailCommande.java=======arrDetailCommande.size()=" + arrDetailCommande.size());

        request.setAttribute("detailCommande", arrDetailCommande);
        request.getRequestDispatcher("/WEB-INF/gestionCommande_consulter_detailCommande.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }
}
