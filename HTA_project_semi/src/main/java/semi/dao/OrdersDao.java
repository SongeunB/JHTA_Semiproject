package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.vo.OrderCartVo;
import semi.vo.OrderHistoryVo;
import semi.vo.OrderVo;
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
	
	public int insert(OrderVo vo,String id_item, int item_price, int item_count) {
		Connection con=null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			con=JdbcUtil.getCon();
			String sql = "insert into orders values(ordernum_seq.nextval,?,?,?,?,?,?,sysdate,?)";
			String sql2 = "insert into order_detail values(orderdetail_seq.nextval,ordernum_seq.currval,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt2 = con.prepareStatement(sql2);
			pstmt.setString(1, vo.getId_customer());
			pstmt.setString(2, vo.getName_order());
			pstmt.setString(3, vo.getEmail_order());
			pstmt.setString(4, vo.getPhone_order());
			pstmt.setString(5, vo.getAddress_order());
			pstmt.setInt(6, vo.getTotal_price());
			pstmt.setString(7, vo.getOrder_status());
			
			pstmt2.setString(1, id_item);
			pstmt2.setInt(2, item_price);
			pstmt2.setInt(3, item_count);
			
			int n = pstmt.executeUpdate();
			int n2 = pstmt2.executeUpdate();
			
			if(n==1 && n2==1) {
				return 1;
			} else {
				return -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public ArrayList<OrderHistoryVo> select(String id_customer) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select aa.id_item,aa.order_date,aa.total_price,aa.item_count,aa.order_status,aa.order_num,aa.item_price,aa.id_customer,b.title from(\r\n"
					+ "select o.order_num,o.id_customer,o.name_order,o.email_order,o.phone_order,o.address_order,o.total_price,o.order_date,o.order_status,od.order_detail,od.id_item,od.item_price,od.item_count\r\n"
					+ "from orders o, order_detail od\r\n"
					+ "where o.order_num = od.order_num(+) and o.id_customer like ?\r\n"
					+ "order by order_date desc\r\n"
					+ ")aa, books b\r\n"
					+ "where aa.id_item = b.id_item(+)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id_customer);
			rs=pstmt.executeQuery();
			ArrayList<OrderHistoryVo> list=new ArrayList<OrderHistoryVo>();
			while(rs.next()) {
				int order_num = rs.getInt("order_num");
				//String name_order = rs.getString("name_order");
				//String email_order = rs.getString("email_order");
				//String phone_order = rs.getString("phone_order");
			    //String address_order = rs.getString("address_order");
				int total_price = rs.getInt("total_price");
				Date order_date = rs.getDate("order_date");
				String order_status = rs.getString("order_status");
				//int order_detail = rs.getInt("order_detail");
				String id_item = rs.getString("id_item");
				int item_price = rs.getInt("item_price");
				int item_count = rs.getInt("item_count");
				String title = rs.getString("title");
				list.add(new OrderHistoryVo(order_num, total_price, order_date, order_status,id_item, item_price, item_count,id_customer,title));
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public int delete(int order_num) {
		Connection con=null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			con=JdbcUtil.getCon();
			String sql2 = "update orders set order_status = '주문취소대기' where order_num = ?";
			
			pstmt2 = con.prepareStatement(sql2);
			
			pstmt2.setInt(1, order_num);
			
			int n2 = pstmt2.executeUpdate();
			
			if(n2==1) {
				return 1;
			} else {
				return -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public ArrayList<OrderCartVo> orderCart(String id_customer, String id_cart) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql = "select b.id_item,title,price,item_count,id_cart,id_customer "
					+ "from cart c, books b "
					+ "where c.id_item = b.id_item and id_customer like ? and id_cart in ("+id_cart+")"
					+ "order by title";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id_customer);
			rs=pstmt.executeQuery();
			ArrayList<OrderCartVo> list = new ArrayList<OrderCartVo>();
			while(rs.next()) {
				String id_item = rs.getString("id_item");
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int item_count = rs.getInt("item_count");
				list.add(new OrderCartVo(id_item, title, price, item_count, id_cart, id_customer));
			}
			System.out.println(list);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
