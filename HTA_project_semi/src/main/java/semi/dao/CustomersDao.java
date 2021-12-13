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
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getAddr());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally{
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public boolean isMember(HashMap<String,String> map) {
		String id=map.get("id");
		String pwd=map.get("pwd");
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			try {
				con=JdbcUtil.getCon();
				String sql="select * from customers where id=? and pwd=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
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
}
