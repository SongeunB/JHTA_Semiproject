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
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/customersUpdate/deleteForm.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
		
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
					session.invalidate();
				}else {
					System.out.println("삭제 실패");
				}
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "home.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.setAttribute("category", new CategoryDao().getCategory());
			req.setAttribute("newList", BooksDao.getInstance().newList(1));
			req.setAttribute("bestList", BooksDao.getInstance().bestList());
			req.setAttribute("banner", BannerDao.getInstance().getBanner());
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}else{
			req.setAttribute("errMsg", "비밀번호가 틀립니다.");
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/customersUpdate/deleteForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
}
