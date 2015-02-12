package controlleur;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Clients;
import service.MyCart;
import service.CommandesService;

public class SubmitOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//该Servlet处理下订单的请求
		try {
			CommandesService orderservice=new CommandesService();
			MyCart myCart=(MyCart)request.getSession().getAttribute("myCart");
			Clients user=(Clients)request.getSession().getAttribute("loginUser");
			orderservice.submitOrder(myCart, user);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/WEB-INF/errInfo.jsp");
			// TODO: handle exception
		}
		
		
		request.getRequestDispatcher("/WEB-INF/OrderOK.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
