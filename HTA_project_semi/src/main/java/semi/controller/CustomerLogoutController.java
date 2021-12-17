package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.dao.BannerDao;
import semi.dao.BooksDao;
import semi.dao.CategoryDao;
@WebServlet("/logout")
public class CustomerLogoutController extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession();
		session.invalidate();
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "home.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.setAttribute("category", new CategoryDao().getCategory());
		req.setAttribute("newList", BooksDao.getInstance().newList());
		req.setAttribute("bestList", BooksDao.getInstance().bestList());
		req.setAttribute("banner", BannerDao.getInstance().getBanner());
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
