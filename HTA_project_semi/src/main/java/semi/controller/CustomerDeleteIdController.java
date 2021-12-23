package semi.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.dao.BannerDao;
import semi.dao.BooksDao;
import semi.dao.CategoryDao;
import semi.dao.CustomersDao;
@WebServlet("/deleteId")
public class CustomerDeleteIdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/customersUpdate/deleteForm.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id_customer=req.getParameter("id_customer");
		String pwd=req.getParameter("pwd");
		HttpSession session= req.getSession();
		
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id_customer", id_customer);
		map.put("pwd", pwd);
		CustomersDao dao=CustomersDao.getInstance();
		boolean b=dao.isMember(map);
		
		if(b) {
			int n=dao.delete(id_customer);
			if(n>0) {
				req.setAttribute("result", "success");
				session.invalidate();
			}else {
				req.setAttribute("result", "fail");
			}
			req.setAttribute("header1", "/header.jsp");
			req.setAttribute("body", "/customersUpdate/deleteResult.jsp");
			req.setAttribute("footer", "/footer.jsp");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	}
}
