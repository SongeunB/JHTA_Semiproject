package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import semi.dao.BannerDao;
import semi.dao.BooksDao;
import semi.vo.BannerVo;
import semi.vo.BooksVo;

@WebServlet("/banner")
public class BannerController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/banner/banner.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.setAttribute("bannerList", BannerDao.getInstance().getList());
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	@Override //Ajax처리만
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int n=Integer.parseInt(req.getParameter("checkFunc"));
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject jo=new JSONObject();
		int result=0;
		String msg="오류발생";
		switch(n) {
			case 1: result=BannerDao.getInstance().insert(new BannerVo(req.getParameter("isbn"), req.getParameter("sentence"), req.getParameter("left_color"), req.getParameter("right_color"), req.getParameter("font_color")));
					msg="등록완료"; //배너등록
					break;
			case 2: result=BannerDao.getInstance().update(new BannerVo(req.getParameter("isbn"), req.getParameter("sentence"), req.getParameter("left_color"), req.getParameter("right_color"), req.getParameter("font_color")));
					msg="수정완료"; //배너수정
					break;
			case 3: result=BannerDao.getInstance().delete(req.getParameter("isbn"));
					msg="삭제완료"; //배너삭제
					break;
			case 4: String isbn=req.getParameter("isbn"); //도서정보 조회
					BooksVo bookVo=new BooksDao().detail(isbn);
					if(bookVo==null) {
						result=-1;
					}else {
						result=1;
						msg="조회성공";
						jo.put("isbn", bookVo.getId_item());
						jo.put("title", bookVo.getTitle());
						jo.put("author", bookVo.getAuthor());
					}
			case 5: ArrayList<BannerVo> list=BannerDao.getInstance().getList();
					if(list==null) { //배너리스트 조회
						result=-1;
					}else {
						JSONArray ja=new JSONArray();
						for(BannerVo banVo:list) {
							JSONObject innerJo=new JSONObject();
							innerJo.put("isbn", banVo.getId_item());
							innerJo.put("sentence", banVo.getSentence());
							innerJo.put("left_color", banVo.getLeft_color());
							innerJo.put("right_color", banVo.getRight_color());
							innerJo.put("font_color", banVo.getFont_color());
							innerJo.put("title", banVo.getTitle());
							innerJo.put("author", banVo.getAuthor());
							ja.put(innerJo);
						}
						jo.put("list", ja);
						result=1;
						msg="조회성공";
					}
			default: msg="전송오류발생";
					break;
		}
		if(result>0) {
			jo.put("code", "success");
			jo.put("msg", msg);
		}else {
			jo.put("code", "fail");
			jo.put("msg", "SQL오류발생");
		}
		pw.print(jo);
	}
}
