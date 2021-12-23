package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.vo.OrdersVo;

public class OrdersDao {
	private static OrdersDao instance=new OrdersDao();
	public static OrdersDao getInstance(){
		return instance;
	}
	public ArrayList<OrdersVo> getList(String status, int page){
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from("
				+ "select o1.*,rownum rnum from("
				+ "select * from orders "
				+ "where order_status=? "
				+ "order by order_num) o1) "
				+ "where rnum between ? and ?";
		ArrayList<OrdersVo> list=new ArrayList<OrdersVo>();
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setInt(2, (page-1)*10+1);
			pst.setInt(3, (page-1)*10+10);
			rs=pst.executeQuery();
			while(rs.next()) {
				list.add(new OrdersVo(rs.getString("order_num"), rs.getString("id_customer"), rs.getString("name_order"), rs.getString("email_order"), rs.getString("phone_order"), rs.getString("address_order"), rs.getInt("total_price"), rs.getDate("order_date"), rs.getString("order_status")));
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pst, rs);
		}
	}
	public int getCount(String status) {
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select nvl(count(*),0) from orders "
				+ "where order_status='"+status+"'";
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pst, rs);
		}
	}
	public int updateOrder(String num_line, String status) {
		Connection con=null;
		PreparedStatement pst=null;
		String sql="update orders set order_status=? where order_num in('"+num_line+"')";
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			return pst.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pst, null);
		}
	}
}
