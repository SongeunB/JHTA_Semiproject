<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id_customer=request.getParameter("id_customer");
	boolean exist=false;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		con=JdbcUtil.getCon();
		String sql="select * from customers where id_customer=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id_customer);
		rs=pstmt.executeQuery();
		if(rs.next()){
			exist=true;
		}
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		JdbcUtil.close(con, pstmt, rs);
	}
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<result>");
	pw.print("<exist>" + exist + "</exist>");
	pw.print("</result>");
%>