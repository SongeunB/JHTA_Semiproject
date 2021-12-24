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

@WebServlet("/orderHistory")
public class OrderHistoryController extends HttpServlet {
	
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
		OrdersDao dao = OrdersDao.getInstance();
		ArrayList<OrderHistoryVo> list = dao.select(id_customer);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONArray jsonArray = new JSONArray();
		for(OrderHistoryVo vo : list) {
			JSONObject json = new JSONObject();
			json.put("id_item", vo.getId_item());
			json.put("order_date", vo.getOrder_date());
			json.put("total_price", vo.getTotal_price());
			json.put("item_count", vo.getItem_count());
			json.put("order_status", vo.getOrder_status());
			json.put("order_num", vo.getOrder_num());
			json.put("item_price", vo.getItem_price());
			json.put("title", vo.getTitle());
			jsonArray.put(json);
		}
		pw.print(jsonArray);
	}
}
