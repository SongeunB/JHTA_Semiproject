package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/goodsUp")
public class GoodsController extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("goodsUp", "goodsUp.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("goods/goodsUp.jsp").forward(req, resp);
	
}
	
	
}


