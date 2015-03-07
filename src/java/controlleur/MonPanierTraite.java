package controlleur;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProduitsService;
import service.MonPanier;

/**
 *
 * 相应用户购买商品的请求,处理用户购物行为
 *
 */
public class MonPanierTraite extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
        String id = request.getParameter("id");
        if (type.equals("supprimer")) {
			//*******响应购物车商品删除*********

            //获得登陆时创建的购物车
            if (request.getSession().getAttribute("myCart") != null) {
                MonPanier unNouveauPanierAdm = (MonPanier) request.getSession().getAttribute("myCart");
                unNouveauPanierAdm.supprimerProduit(id);

                //把要显示的商品信息放入request
                request.setAttribute("booklist", unNouveauPanierAdm.afficherMonPanier());
                request.setAttribute("toltalPrice", unNouveauPanierAdm.getMontantTotal());
                request.getRequestDispatcher("/WEB-INF/ShowMyCart.jsp").forward(request, response);
            }

        } else if (type.equals("ajouter")) {
			//******响应购物车的商品添加******

            //获得登陆时创建的购物车
            if (request.getSession().getAttribute("monPanier") != null) {
                MonPanier monPanier = (MonPanier) request.getSession().getAttribute("monPanier");
                monPanier.ajouterProduit(id);
                System.out.println("MontantTotal de monPanier1 :"+monPanier.getMontantTotal()+" et quantite de monPanier1 :"+monPanier.quantiteProduit());
            } else {
                MonPanier monPanier = new MonPanier();
                monPanier.ajouterProduit(id);
                System.out.println("monPanier2 :");
                System.out.println(monPanier.getHm(id).getNoProduit());
                System.out.println(monPanier.getHm(id).getPrix());
                System.out.println(monPanier.getHm(id).getQuantite());
                System.out.println(monPanier.getHm(id).getUniteMesure());
            }
            
            //把商品添加到购物车中
            //为了防止某个页面重复刷新，我们可以sendredirect
            response.sendRedirect("/MVC_inm5001/GoAfficherMonPanier");
        } else if (type.equals("modifier")) {
            //得到用户希望得到的书号和数量
            String bookIds[] = request.getParameterValues("id");
            String nums[] = request.getParameterValues("booknum");

            MonPanier myCart = (MonPanier) request.getSession().getAttribute("myCart");
            for (int i = 0; i < bookIds.length; i++) {
                //更新整个购物车
                myCart.modifierProduit(bookIds[i], nums[i]);
            }
            //调回我的购物车
            //把要显示的商品信息放入request
            request.setAttribute("booklist", myCart.afficherMonPanier());
            request.setAttribute("toltalPrice", myCart.getMontantTotal());
            request.getRequestDispatcher("/WEB-INF/ShowMyCart.jsp").forward(request, response);
        } else if (type.equals("show")) {

            //为了防止某个页面重复刷新，我们可以sendredirect
            response.sendRedirect("/MyShopping/GoShowMycart");
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
