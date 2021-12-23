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

@WebServlet("/loginForm")
public class CustomerLoginFormController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/login/loginForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id_customer=req.getParameter("id_customer");
		String pwd=req.getParameter("pwd");
		
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id_customer", id_customer);
		map.put("pwd", pwd);
		
		CustomersDao dao=CustomersDao.getInstance();
		boolean b=dao.isMember(map);
		if(b) {
			HttpSession session=req.getSession(); 
			session.setAttribute("id_customer", id_customer);
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "home.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.setAttribute("category", new CategoryDao().getCategory());
			req.setAttribute("newList", BooksDao.getInstance().newList(1));
			req.setAttribute("bestList", BooksDao.getInstance().bestList());
			req.setAttribute("banner", BannerDao.getInstance().getBanner());
			req.getRequestDispatcher("index.jsp").forward(req, resp);
			
		}else { 	
			req.setAttribute("errMsg", "아이디나 비밀번호가 틀립니다");
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/login/loginForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}

}
