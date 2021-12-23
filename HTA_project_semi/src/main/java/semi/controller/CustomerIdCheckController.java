package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.CustomersDao;
@WebServlet("/idCheck")
public class CustomerIdCheckController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/cart/cart.jsp");
		req.setAttribute("footer", "/footer.jsp");
		
		req.setCharacterEncoding("UTF-8");
		String id_customer=req.getParameter("id_customer");
		CustomersDao dao=CustomersDao.getInstance();
		boolean exist=false;
		int n=dao.idCheck(id_customer);
		if(n>0) {
			exist=true;
		}else {
			exist=false;
		}
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		pw.print("<exist>" + exist + "</exist>");
		pw.print("</result>");
	}
}