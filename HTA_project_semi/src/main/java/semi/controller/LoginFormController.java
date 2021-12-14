package semi.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.dao.CustomersDao;

@WebServlet("/loginForm")
public class LoginFormController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/login/loginForm.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		CustomersDao dao=CustomersDao.getInstance();
		boolean b=dao.isMember(map);
		if(b) {
			HttpSession session=req.getSession(); 
			session.setAttribute("id", id);
			resp.sendRedirect(req.getContextPath() +"/index.jsp");
		}else {
			req.setAttribute("errMsg","아이디나 비밀번호가 맞지 않습니다");
			req.setAttribute("header1", "/header.jsp");
			req.setAttribute("body", "/login/loginForm.jsp");
			req.setAttribute("footer", "/footer.jsp");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
		
		}
		
}
