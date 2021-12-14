package semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.BooksDao;
import semi.dao.CategoryDao;
import semi.vo.BooksVo;

@WebServlet("/header/search")
public class HeaderSearchController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String k = req.getParameter("keyword");
		/*
		String d = "";
		String s = "";
		char c;
		for(int i = 0; i < k.length(); i++) {
			c = k.charAt(i);
			if((65 <= c) && (c <= 90)) { // 대문자를 소문자로
				s += k.valueOf(c).toLowerCase();
			} else if((97 <= c) && (c <= 122)) { // 소문자를 대문자로
				d += k.valueOf(c).toUpperCase();
			}
		}
		System.out.println(s + " " + d);
		*/
		BooksDao dao = BooksDao.getInstance();
		ArrayList<BooksVo> list = dao.search(k);
		int b = 0;
		for(BooksVo a:list) {
			b++;
		}
		req.setAttribute("count", b);
		req.setAttribute("list", list);
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/list/list.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.setAttribute("category", new CategoryDao().getCategory());
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
}
