package controlleur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MonPanier;


public class GoMyOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//该Servlet用于处理用户查看订单的请求
		//得到购物车
		MonPanier myCart=(MonPanier)request.getSession().getAttribute("myCart");
		ArrayList al=myCart.afficherMonPanier();
		float totalPrice=myCart.getMontantTotal();
		request.setAttribute("orderinfo", al);
		request.setAttribute("totalPrice", totalPrice);
		//跳到显示我的订单的页面
		request.getRequestDispatcher("/WEB-INF/showMyOrder.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
