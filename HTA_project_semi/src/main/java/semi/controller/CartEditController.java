package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import semi.dao.CartDao;

@WebServlet("/cartEdit")
public class CartEditController  extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		String id_item=req.getParameter("id_item");
		int item_count=Integer.parseInt(req.getParameter("item_count"));
				
		CartDao dao=CartDao.getInstance();
		dao.update(id_customer,id_item,item_count);
		
		resp.sendRedirect(req.getContextPath()+"/cart");
	}
	
	
	
}
