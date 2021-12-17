package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.CustomersDao;
import semi.vo.CustomersVo;

@WebServlet("/updateForm")
public class CustomersUpdateFormController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/customersUpdate/updateForm.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
		
		String id_customer=req.getParameter("id_customer");
		CustomersDao dao=CustomersDao.getInstance();
		CustomersVo vo=dao.select(id_customer);
		if(vo==null) {
			req.setAttribute("result", "fail");
		}else {
			req.setAttribute("vo", vo);
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/customersUpdate/updateForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id_customer=req.getParameter("id_customer");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String address1=(String)req.getParameter("address1");
		String address2=(String)req.getParameter("address2");
		String address=address1+address2;
		
		CustomersVo vo=new CustomersVo(id_customer,pwd,name,email,phone,address);
		int n=CustomersDao.getInstance().update(vo);
		if(n>0) {
			req.setAttribute("result", "success");
		}else {
			req.setAttribute("result", "fail");
		}
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/customersUpdate/updateResult.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
