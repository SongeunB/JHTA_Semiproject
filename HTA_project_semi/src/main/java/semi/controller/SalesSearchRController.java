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

@WebServlet("/searchR")
public class SalesSearchRController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/admin/sales_range.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sYear1=req.getParameter("sYear1");
		String sMonth1=req.getParameter("sMonth1");
		String sDate1=req.getParameter("sDate1");
		String sYear2=req.getParameter("sYear2");
		String sMonth2=req.getParameter("sMonth2");
		String sDate2=req.getParameter("sDate2");
		System.out.println(sYear1+sMonth1+sDate1+"/"+sYear2+sMonth2+sDate2);
		int sD1=Integer.parseInt(sYear1+sMonth1+sDate1);
		int sD2=Integer.parseInt(sYear2+sMonth2+sDate2);
		System.out.println(sD1+" "+sD2);
		
		if(sD1>sD2) {
			JSONObject json=new JSONObject();
			json.put("err_msg","조회기간을 확인해주세요.");
			
			resp.setContentType("text/plain;charset=utf-8");
			PrintWriter pw=resp.getWriter();
			pw.print(json);
		}else {
			String searchDate=sYear1+"/"+sMonth1+"/"+sDate1;
			String searchDate2=sYear2+"/"+sMonth2+"/"+sDate2;
			
			SalesDao dao=SalesDao.getInstance();
			ArrayList<SalesDateVo> list=dao.selectRange(searchDate,searchDate2); 
			
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
}
