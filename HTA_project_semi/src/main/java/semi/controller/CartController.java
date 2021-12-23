 package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import semi.dao.BooksDao;
import semi.dao.CartDao;
import semi.vo.BooksVo;
import semi.vo.CartListVo;
import semi.vo.CartVo;


@WebServlet("/cart")
public class CartController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/cart/cart.jsp");
		req.setAttribute("footer", "/footer.jsp");
		
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		
		CartDao dao=CartDao.getInstance();
		ArrayList<CartListVo> list=dao.select(id_customer); 
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		String id_item=req.getParameter("id_item");
		int item_count=Integer.parseInt(req.getParameter("item_count"));
				
		CartDao dao=CartDao.getInstance();
		int n=dao.insert(id_customer,id_item,item_count);
		JSONObject json=new JSONObject();
		if(n!=-1) {
			json.put("result", true);
		}else {
			json.put("result", false);
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print(json);
	}
}
