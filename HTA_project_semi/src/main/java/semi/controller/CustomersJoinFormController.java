package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.CustomersDao;
import semi.vo.CustomersVo;
@WebServlet("/joinForm")
public class CustomersJoinFormController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/join/joinFormCss.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String id_customer=req.getParameter("id_customer");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("name");
		String email1=req.getParameter("email1");
		String email2=req.getParameter("email2");
		String email=email1+"@"+email2;
		String phone1=req.getParameter("phone1");
		String phone2=req.getParameter("phone2");
		String phone3=req.getParameter("phone3");
		String phone=phone1+"-"+phone2+"-"+phone3;
		String addrNum=req.getParameter("addrNum");
		String address1=req.getParameter("address1");
		String address2=req.getParameter("address2");
		String address=addrNum+"@"+address1+"@"+address2;
		
		CustomersVo vo=new CustomersVo(id_customer,pwd,name,email,phone,address);
		int n=CustomersDao.getInstance().insert(vo);
		if(n>0) {
			req.setAttribute("result", "success");
			req.setAttribute("id_customer", id_customer);
			req.setAttribute("name", name);
			req.setAttribute("email", email);
		}else {
			req.setAttribute("result", "fail");
		}
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("body", "/join/joinResult.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
