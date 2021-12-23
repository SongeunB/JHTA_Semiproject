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

import semi.dao.SalesDao;
import semi.vo.SalesDateVo;

@WebServlet("/searchD")
public class SalesSearchDController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/admin/sales_date.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchDate=req.getParameter("searchDate");
		
		SalesDao dao=SalesDao.getInstance();
		ArrayList<SalesDateVo> list=dao.selectDate(searchDate); 
		//System.out.println(list);
		
		JSONArray jsonArray=new JSONArray();
		for(SalesDateVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("order_date",vo.getOrder_date());
			json.put("id_item",vo.getId_item());
			json.put("item_price",vo.getItem_price());
			json.put("item_count",vo.getItem_count());
			json.put("total_price",vo.getTotal_price());
			jsonArray.put(json);
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print(jsonArray);
		
	}
}
