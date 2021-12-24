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

import semi.dao.CustomersDao;
import semi.dao.OrdersDao;
import semi.vo.CustomersVo;
import semi.vo.OrderCartVo;
import semi.vo.OrderVo;

@WebServlet("/order/cart/insert")
public class OrderCartInsertController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.setAttribute("header1", "/header.jsp");
		//req.setAttribute("body", "/order/orderHistory.jsp");
		//req.setAttribute("footer", "/footer.jsp");
		
		req.setCharacterEncoding("utf-8");
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		
		String name_order = req.getParameter("name_order");
		String email_order = req.getParameter("email_order") ;
		String phone_order = req.getParameter("phone_order");
		String address_order = req.getParameter("address_order");
		
		//CustomersDao cdao=CustomersDao.getInstance();
		//CustomersVo cVo = cdao.select(id_customer); 
		//req.setAttribute("cVo", cVo);
		
		OrdersDao dao = OrdersDao.getInstance();
		
		//String a = req.getParameter("id_cart");
		//ArrayList<OrderCartVo> list = dao.orderCart(id_customer,a);
		//req.setAttribute("list", list);
		
		//for(OrderCartVo vo:list) {
			
			String id_item = req.getParameter("id_item");
			
			String ip = req.getParameter("item_price");
			String ic = req.getParameter("item_count");
			
			String it = id_item.replace("undefined", "");
			String p = ip.replace("undefined", "");
			String c = ic.replace("undefined", "");
			
			String[] a1 = it.split(",");
			String[] a2 = p.split(",");
			String[] a3 = c.split(",");
			
			int n=0;
			for(int i = 0; i < a1.length; i++) {
				int item_price = Integer.parseInt(a2[i]);
				int item_count =Integer.parseInt(a3[i]);
				int total_price = item_price * item_count;
				String order_status = "주문대기";
				OrderVo ov = new OrderVo(0, id_customer, name_order, email_order, phone_order, address_order, total_price,null,order_status);
				n = dao.insert(ov, a1[i], item_price, item_count);
			}
			
			resp.setContentType("text/plain;charset=utf-8");
			PrintWriter pw = resp.getWriter();
			JSONObject json = new JSONObject();
			if(n>0) {
				json.put("code", "success");
			} else {
				json.put("code", "fail");
			}
			pw.print(json);
		//}
		
		//req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
