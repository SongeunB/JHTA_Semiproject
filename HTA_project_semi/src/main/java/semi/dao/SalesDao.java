package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.vo.SalesDateVo;

public class SalesDao {
	private static SalesDao instance = new SalesDao();
	private SalesDao() {}

	public static SalesDao getInstance() {
		return instance;
	}
	public ArrayList<SalesDateVo> selectDate(String searchDate) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select os.order_date order_date, od.id_item id_item, od.item_price item_price, od.item_count item_count, os.total_price total_price "
					+ "from orders os, order_detail od where order_date=? and os.order_num=od.order_num "
					+ "ORDER BY os.order_date";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, searchDate);
			rs=pstmt.executeQuery();
			ArrayList<SalesDateVo> list=new ArrayList<SalesDateVo>();
			while(rs.next()) {
				Date order_date=rs.getDate("order_date");
				String id_item=rs.getString("id_item");
				int item_price=rs.getInt("item_price");
				int item_count=rs.getInt("item_count");
				list.add(new SalesDateVo(order_date,id_item,item_price,item_count));
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<SalesDateVo> selectMonth(String searchDate,String searchDate2) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select os.order_date order_date, sum(od.item_price) item_price, sum(od.item_count) item_count "
					+ "from orders os, order_detail od "
					+ "where order_date>=? and order_date<? and os.order_num=od.order_num "
					+ "GROUP BY os.order_date ORDER BY os.order_date";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, searchDate);
			pstmt.setString(2, searchDate2);
			rs=pstmt.executeQuery();
			ArrayList<SalesDateVo> list=new ArrayList<SalesDateVo>();
			while(rs.next()) {
				Date order_date=rs.getDate("order_date");
				int item_price=rs.getInt("item_price");
				int item_count=rs.getInt("item_count");
				list.add(new SalesDateVo(order_date,item_price,item_count));
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<SalesDateVo> selectRange(String searchDate,String searchDate2) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select os.order_date order_date, sum(od.item_price) item_price, sum(od.item_count) item_count "
					+ "from orders os, order_detail od "
					+ "where order_date>=? and order_date<? and os.order_num=od.order_num "
					+ "GROUP BY os.order_date ORDER BY os.order_date";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, searchDate);
			pstmt.setString(2, searchDate2);
			rs=pstmt.executeQuery();
			ArrayList<SalesDateVo> list=new ArrayList<SalesDateVo>();
			while(rs.next()) {
				Date order_date=rs.getDate("order_date");
				int item_price=rs.getInt("item_price");
				int item_count=rs.getInt("item_count");
				list.add(new SalesDateVo(order_date,item_price,item_count));
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
