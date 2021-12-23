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

@WebServlet("/searchM")
public class SalesSearchMController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/admin/sales_month.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sYear=req.getParameter("sYear");
		String sMonth=req.getParameter("sMonth");
		String searchDate=sYear+"/"+sMonth+"/01";
		int sYear2=Integer.parseInt(sYear);
		int sMonth2=Integer.parseInt(sMonth)+1;
		if(Integer.parseInt(sMonth)==12) {
			sYear2+=1;
			sMonth2=1;
		}
		String searchDate2=sYear2+"/"+sMonth2+"/01";
		
		SalesDao dao=SalesDao.getInstance();
		ArrayList<SalesDateVo> list=dao.selectMonth(searchDate,searchDate2); 
		//System.out.println(list);
		
		JSONArray jsonArray=new JSONArray();
		for(SalesDateVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("order_date",vo.getOrder_date());
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
