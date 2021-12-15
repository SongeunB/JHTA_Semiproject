package semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.CategoryDao;
import semi.vo.BooksVo;

@WebServlet("/category")
public class CategoryController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/category/category.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.setAttribute("category", new CategoryDao().getCategory());
		String genre = req.getParameter("genre");
		String genreDetail = req.getParameter("genreDetail");
		System.out.println(genre);
		CategoryDao dao = new CategoryDao();
		ArrayList<BooksVo> genreList = dao.category(genre);
		ArrayList<BooksVo> genreDetailList = dao.categoryDetail(genreDetail);
		req.setAttribute("genre", genre);
		req.setAttribute("genreDetail", genreDetail);
		req.setAttribute("genreList", genreList);
		req.setAttribute("genreDetailList", genreDetailList);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
