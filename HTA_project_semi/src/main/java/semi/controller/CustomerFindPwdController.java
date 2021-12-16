package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.CustomersDao;

@WebServlet("/findPwd")
public class CustomerFindPwdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "header.jsp");
		req.setAttribute("body", "/customerFind/findPwdForm.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_customer=req.getParameter("id_customer");
		String email=req.getParameter("email");
		
		String pwd=CustomersDao.getInstance().findPwd(id_customer, email);
		
		if(pwd==null) {
			req.setAttribute("findResult", "조회된 정보가 없습니다.");
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/customerFind/findPwdForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		} else{
			req.setAttribute("findResult", "비밀번호가 이메일로 전송되었습니다.");
			req.setAttribute("header1", "header.jsp");
			req.setAttribute("body", "/customerFind/findPwdForm.jsp");
			req.setAttribute("footer", "footer.jsp");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
}
