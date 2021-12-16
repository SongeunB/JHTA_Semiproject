package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.dao.BooksDao;
import semi.vo.BooksVo;
import semi.vo.bookDetailVo;


@WebServlet("/goods/insert")
public class GoodsInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/goods/goodsUp.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filePath="goods\\update";
		String realPath = req.getRealPath(filePath);
		int fileSize = 1024 * 1024 * 5;
		try {
			MultipartRequest multi= new MultipartRequest(req, realPath,fileSize,"UTF-8", new DefaultFileRenamePolicy());

			String ymd=multi.getParameter("ymd");
			java.util.Date d= new java.util.Date(ymd);
			long t=d.getTime();
			java.sql.Date ymd1=new java.sql.Date(t);
			BooksVo vo=new BooksVo(multi.getParameter("id_item"),
					Integer.parseInt(multi.getParameter("price")),
					multi.getParameter("status"),
					Integer.parseInt(multi.getParameter("stock")),
					multi.getParameter("title"),
					multi.getParameter("author"),
					multi.getParameter("translator"),					
					multi.getParameter("publisher"),
					ymd1,
					multi.getParameter("genre"),
					multi.getParameter("genre_detail"),	
					multi.getParameter("org_title"),
					multi.getParameter("org_author"));
			
			bookDetailVo vo1= new bookDetailVo(multi.getParameter("id_item"),
					multi.getParameter("text"),
					Integer.parseInt(multi.getParameter("img_src")));
					BooksDao dao= new BooksDao();
					dao.insertBooks(vo, vo1);
		}catch(IOException e) {
			e.printStackTrace();
			System.out.println("오류: " +e.getMessage());
		}
	}
}
