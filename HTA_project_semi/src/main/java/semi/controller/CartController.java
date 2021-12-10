package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cart")
public class CartController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("cart", "/cart/cart.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/cart/cart2.jsp").forward(req, resp);
	}
}
