package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.vo.BooksVo;
import semi.vo.CartListVo;
import semi.vo.CartVo;
import semi.vo.CustomersVo;

public class CartDao {
	private static CartDao instance = new CartDao();
	private CartDao() {}

	public static CartDao getInstance() {
		return instance;
	}
	
	public int insert(String id_customer,String id_item,int item_count) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="insert into cart values(cart_seq.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id_customer);
			pstmt.setString(2, id_item);
			pstmt.setInt(3, item_count);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally{
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public ArrayList<CartListVo> select(String id_customer) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select c.id_item id_item,item_count,price,title from cart c, books b where c.id_customer=? and c.id_item=b.id_item";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id_customer);
			rs=pstmt.executeQuery();
			ArrayList<CartListVo> list=new ArrayList<CartListVo>();
			while(rs.next()) {
				String id_item=rs.getString("id_item");
				int item_count=rs.getInt("item_count");
				int price=rs.getInt("price");
				String title=rs.getString("title");
				list.add(new CartListVo("1",id_customer,id_item,item_count,price,title));
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
