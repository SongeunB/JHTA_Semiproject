package semi.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.CartDao;
import semi.dao.CustomersDao;
import semi.dao.OrdersDao;
import semi.vo.CartListVo;
import semi.vo.CustomersVo;
import semi.vo.OrderCartVo;
import semi.vo.OrderHistoryVo;
import semi.vo.OrderVo;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/order/order.jsp");
		req.setAttribute("footer", "/footer.jsp");
		
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		CustomersDao cdao=CustomersDao.getInstance();
		CustomersVo cVo = cdao.select(id_customer); 
		req.setAttribute("cVo", cVo);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/order/order.jsp");
		req.setAttribute("footer", "/footer.jsp");
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		String name_order = req.getParameter("name_order");
		String email_order = req.getParameter("email_order") ;
		String phone_order = req.getParameter("phone_order");
		String address_order = req.getParameter("address_order");
		
		OrdersDao dao = OrdersDao.getInstance();
		String id_item = req.getParameter("id_item");
		int item_price = Integer.parseInt(req.getParameter("item_price"));
		int item_count = Integer.parseInt(req.getParameter("item_count"));
		int total_price = item_price * item_count;
		String order_status = "주문대기";
		OrderVo vo = new OrderVo(0, id_customer, name_order, email_order, phone_order, address_order, total_price,null,order_status);
		dao.insert(vo, id_item, item_price, item_count);
		
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
		//resp.sendRedirect("/index.jsp");
	}
}
