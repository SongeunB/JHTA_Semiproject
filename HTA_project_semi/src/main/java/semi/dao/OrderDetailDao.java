package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.vo.OrderDetailVo;

public class OrderDetailDao {
	private static OrderDetailDao instance=new OrderDetailDao();
	public static OrderDetailDao getInstance(){
		return instance;
	}
	public ArrayList<OrderDetailVo> getBook(String order_num){
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from("
				+ "select * from order_detail "
				+ "where order_num=?) b1 left outer join books b2 "
				+ "on b1.id_item=b2.id_item";
		ArrayList<OrderDetailVo> list=new ArrayList<OrderDetailVo>();
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			pst.setString(1, order_num);
			rs=pst.executeQuery();
			while(rs.next()) {
				list.add(new OrderDetailVo(null,null,rs.getString("id_item"),rs.getInt("item_price"),rs.getInt("item_count"),rs.getString("title"),rs.getString("author")));
			}
			return list;
		}catch(SQLException se){
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pst, rs);
		}
	}
}
