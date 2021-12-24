package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import semi.dao.CartDao;
import semi.dao.CustomersDao;
import semi.dao.OrdersDao;
import semi.vo.CartListVo;
import semi.vo.CustomersVo;
import semi.vo.OrderHistoryVo;
import semi.vo.OrderVo;

@WebServlet("/orderHistory/delete")
public class OrderHistoryDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/order/orderHistory.jsp");
		req.setAttribute("footer", "/footer.jsp");
		
	
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		int order_num = Integer.parseInt(req.getParameter("order_num"));
		OrdersDao dao = OrdersDao.getInstance();
		int n = dao.delete(order_num);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONObject json = new JSONObject();
		if(n>0) {
			json.put("result", "success");
		} else {
			json.put("result", "fail");
		}
		pw.print(json);
	}
}
