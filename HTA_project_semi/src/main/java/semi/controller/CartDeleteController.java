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

import semi.dao.CartDao;
import semi.vo.CartListVo;

@WebServlet("/cartDelete")
public class CartDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		String id_item=req.getParameter("id_item");
				
		CartDao dao=CartDao.getInstance();
		dao.delete(id_customer,id_item);
		
		resp.sendRedirect(req.getContextPath()+"/cart");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		String id_itemffffddddddddddddddddd=req.getParameter("id_item");
				
		CartDao dao=CartDao.getInstance();
		int n=dao.delete(id_customer,id_itemffffddddddddddddddddd);
		
		
	}
}
