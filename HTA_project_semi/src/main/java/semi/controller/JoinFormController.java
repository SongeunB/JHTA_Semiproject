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
public class JoinFormController extends HttpServlet{
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		resp.setCharacterEncoding("utf-8");
//		
//		
//		req.setAttribute("header1", "/header.jsp");
//		req.setAttribute("joinForm", "/join/joinForm.jsp");
//		req.setAttribute("footer", "/footer.jsp");
//		req.getRequestDispatcher("/join/joinForm2.jsp").forward(req, resp);
//	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("joinForm", "/join/joinForm.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/join/joinForm2.jsp").forward(req, resp);
	}
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header1", "/header.jsp");
		req.setAttribute("joinForm", "/join/joinForm.jsp");
		req.setAttribute("footer", "/footer.jsp");
		
		resp.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String addr=req.getParameter("addr");
		
		CustomersVo vo=new CustomersVo(id,pwd,name,email,phone,addr);
		CustomersDao dao=CustomersDao.getInstance();
		int n=dao.insert(vo);
		
		if(n>0) {
			req.setAttribute("result", "success");
		}else {
			req.setAttribute("result", "fail");
		}
		req.getRequestDispatcher("index.jsp").forward(req, resp);
		
		}
}
