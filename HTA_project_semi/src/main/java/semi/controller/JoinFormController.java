package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/joinForm")
public class JoinFormController extends HttpServlet{
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		resp.setCharacterEncoding("utf-8");
//		
//		
//		req.setAttribute("header1", "/header.jsp");
//		req.setAttribute("joinForm", "/join/joinForm.jsp");
//		req.setAttribute("footer", "/footer.jsp");
//		req.getRequestDispatcher("/join/joinForm2.jsp").forward(req, resp);
//	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("joinForm", "/join/joinForm.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/join/joinForm2.jsp").forward(req, resp);
	}
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
	
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("joinForm", "/join/joinForm.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/join/joinForm2.jsp").forward(req, resp);
		}
}
