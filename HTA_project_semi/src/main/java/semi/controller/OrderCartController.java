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

import semi.dao.CustomersDao;
import semi.dao.OrdersDao;
import semi.vo.CustomersVo;
import semi.vo.OrderCartVo;
import semi.vo.OrderVo;

@WebServlet("/order/cart")
public class OrderCartController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/order/orderCart.jsp");
		req.setAttribute("footer", "/footer.jsp");
		String id_customer=(String)req.getSession().getAttribute("id_customer");
		
		CustomersDao cdao=CustomersDao.getInstance();
		CustomersVo cVo = cdao.select(id_customer); 
		req.setAttribute("cVo", cVo);
		
		OrdersDao dao = OrdersDao.getInstance();
		
		String a = req.getParameter("id_cart");
		System.out.println(a.length());
		String b = "";
		if(a.length()==3) {
			b =  a.replace(",","");
			ArrayList<OrderCartVo> list = dao.orderCart(id_customer,b);
			req.setAttribute("list", list);
		} else if(a.length()==6) {
			ArrayList<OrderCartVo> list = dao.orderCart(id_customer,a.substring(0,a.length()-1));
			req.setAttribute("list", list);
		} else {
			ArrayList<OrderCartVo> list = dao.orderCart(id_customer,a);
			req.setAttribute("list", list);
		}
		
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
