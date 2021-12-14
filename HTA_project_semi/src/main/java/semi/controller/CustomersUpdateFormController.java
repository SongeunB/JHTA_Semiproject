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
		String id=req.getParameter("id");
		CustomersDao dao=CustomersDao.getInstance();
		CustomersVo vo=dao.select(id);
		if(vo==null) {
			
		}else {
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		
		CustomersVo vo=new CustomersVo(id,pwd,name,email,phone,address);
		int n=CustomersDao.getInstance().update(vo);
		
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
