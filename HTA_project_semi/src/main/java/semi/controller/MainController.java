package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class MainController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "home.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
