package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.CustomersDao;

@WebServlet("/findId")
public class CustomerFindIdController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/customerFind/findIdForm.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		
		String id_customer=CustomersDao.getInstance().findId(name, email);
		
		if(id_customer==null) {
			req.setAttribute("findResult", "일치하는 아이디가 없습니다.");
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/customerFind/findIdForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		} else{
			req.setAttribute("findResult", "아이디 : " + id_customer);
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/customerFind/findIdForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
}
