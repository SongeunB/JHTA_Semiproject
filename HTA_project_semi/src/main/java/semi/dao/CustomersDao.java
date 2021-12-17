package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import db.JdbcUtil;
import semi.vo.CustomersVo;

public class CustomersDao {
	private static CustomersDao instance=new CustomersDao();
	public static CustomersDao getInstance() {
		return instance;
	}
	private CustomersDao() {}
	
	public int insert(CustomersVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="insert into customers values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId_customer());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getAddress());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally{
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public boolean isMember(HashMap<String,String> map) {
		String id_customer=map.get("id_customer");
		String pwd=map.get("pwd");
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			try {
				con=JdbcUtil.getCon();
				String sql="select * from customers where id_customer=? and pwd=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id_customer);
				pstmt.setString(2, pwd);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
				return false;
			}catch(SQLException se) {
				se.printStackTrace();
				return false;
			}finally {
				JdbcUtil.close(con, pstmt, rs);
			}
	}
	
	public int update(CustomersVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="update customers set pwd=?,name=?,email=?,phone=?,address=? where id_customer=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getAddress());
			pstmt.setString(6, vo.getId_customer());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	
	public CustomersVo select(String id_customer) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from customers where id_customer=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id_customer);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String phone=rs.getString("phone");
				String address=rs.getString("address");
				
				CustomersVo vo=new CustomersVo(id_customer,pwd,name,email,phone,address);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	
	public int joinIdCheck(String id_customer){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result = -1;
		try {
			con = JdbcUtil.getCon();
			String sql = "select id_customer from customers where id_customer=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id_customer);
			rs = pstmt.executeQuery();
			if(rs.next()){	
				result = 0;
			}else{
				result = 1;
			}
			System.out.println("���̵� �ߺ�üũ ��� : "+ result);
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return result;
	}
	
	public String findId(String name, String email) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select id_customer from customers where name=? and email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("id_customer");	
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public String findPwd(String id_customer, String email) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select pwd from customers where id_customer=? and email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id_customer);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("pwd");	
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int delete(String id_customer) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="delete from customers where id_customer=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id_customer);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
