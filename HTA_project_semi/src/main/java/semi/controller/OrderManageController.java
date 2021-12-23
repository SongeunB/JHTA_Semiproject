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

import semi.dao.BannerDao;
import semi.dao.BooksDao;
import semi.dao.OrderDetailDao;
import semi.dao.OrdersDao;
import semi.vo.BannerVo;
import semi.vo.BooksVo;
import semi.vo.OrderDetailVo;
import semi.vo.OrdersVo;
@WebServlet("/OrderManage")
public class OrderManageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/order/order_manage.jsp");
		req.setAttribute("footer", "footer.jsp");
		
		OrdersDao dao=OrdersDao.getInstance();
		int area1_table1_count=dao.getCount("주문대기");
		req.setAttribute("area1_table1_list", dao.getList("주문대기", 1));
		req.setAttribute("area1_table1_count", area1_table1_count);
		req.setAttribute("area1_table1_pageCount", (int)Math.ceil(area1_table1_count/10.0));
		int area1_table2_count=dao.getCount("배송중");
		req.setAttribute("area1_table2_list", dao.getList("배송중", 1));
		req.setAttribute("area1_table2_count", area1_table2_count);
		req.setAttribute("area1_table2_pageCount", (int)Math.ceil(area1_table2_count/10.0));
		int area2_table3_count=dao.getCount("취소신청");
		req.setAttribute("area2_table3_list", dao.getList("취소신청", 1));
		req.setAttribute("area2_table3_count", area2_table3_count);
		req.setAttribute("area2_table3_pageCount", (int)Math.ceil(area2_table3_count/10.0));
		
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int n=Integer.parseInt(req.getParameter("checkFunc"));
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject jo=new JSONObject();
		int result=0;
		String msg="오류발생";
		switch(n) {
			case 1: ArrayList<OrderDetailVo> list=OrderDetailDao.getInstance().getBook(req.getParameter("order_num"));
					if(list==null) { //주문 세부정보 조회
						result=-1;
					}else {
						JSONArray ja=new JSONArray();
						for(OrderDetailVo vo:list) {
							JSONObject innerJo=new JSONObject();
							innerJo.put("isbn",vo.getId_item());
							innerJo.put("item_price",vo.getItem_price());
							innerJo.put("item_count",vo.getItem_count());
							innerJo.put("title",vo.getTitle());
							innerJo.put("author",vo.getAuthor());
							ja.put(innerJo);
						}
						jo.put("list", ja);
						result=1;
						msg="조회성공";
					}
					break;
			case 2: String[] s=lineParse(req.getParameter("line"));
					ArrayList<OrdersVo> list2=OrdersDao.getInstance().getList(s[2], Integer.parseInt(s[0]));
					if(list2==null) { //페이지 이동
						result=-1;
					}else {
						JSONArray ja=new JSONArray();
						for(OrdersVo vo:list2) {
							JSONObject innerJo=new JSONObject();
							innerJo.put("order_num",vo.getOrder_num());
							innerJo.put("id_customer",vo.getId_customer());
							innerJo.put("name_order",vo.getName_order());
							innerJo.put("email_order",vo.getEmail_order());
							innerJo.put("phone_order",vo.getPhone_order());
							innerJo.put("address_order",vo.getAddress_order());
							innerJo.put("total_price",vo.getTotal_price());
							innerJo.put("order_date",vo.getOrder_date());
							ja.put(innerJo);
						}
						jo.put("list", ja);
						jo.put("id_table", s[1]);
						result=1;
						msg="조회성공";
					}
					break;
			case 3: ArrayList<OrdersVo> list3=OrdersDao.getInstance().getList(req.getParameter("order_status"), 1);
					if(list3==null) { //테이블 새로고침
						result=-1;
					}else {
						JSONArray ja=new JSONArray();
						for(OrdersVo vo:list3) {
							JSONObject innerJo=new JSONObject();
							innerJo.put("order_num",vo.getOrder_num());
							innerJo.put("id_customer",vo.getId_customer());
							innerJo.put("name_order",vo.getName_order());
							innerJo.put("email_order",vo.getEmail_order());
							innerJo.put("phone_order",vo.getPhone_order());
							innerJo.put("address_order",vo.getAddress_order());
							innerJo.put("total_price",vo.getTotal_price());
							innerJo.put("order_date",vo.getOrder_date());
							ja.put(innerJo);
						}
						int count=OrdersDao.getInstance().getCount(req.getParameter("order_status"));
						jo.put("list", ja);
						jo.put("count", count);
						jo.put("page_count", (int)Math.ceil(count/10.0));
						result=1;
						msg="조회성공";
					}
					break;
			case 4: result=OrdersDao.getInstance().updateOrder(req.getParameter("num_line"), req.getParameter("update_status"));
					msg="업데이트 완료";
					break;
			default: msg="전송오류발생";
					break;
		}
		if(result>0) {
			jo.put("code", "success");
			jo.put("msg", msg);
		}else {
			jo.put("code", "fail");
			jo.put("msg", "SQL오류발생");
		}
		pw.print(jo);
	}
	public String[] lineParse(String line) {
		String[] s=line.split("@");
		switch(Integer.parseInt(s[2])) {
			case 1: s[1]="area1_table1";
					s[2]="주문대기";
					break;
			case 2: s[1]="area1_table2";
					s[2]="배송중";
					break;
			case 3: s[1]="area2_table3";
					s[2]="취소신청";
					break;
		}
		return s;
	}
}
