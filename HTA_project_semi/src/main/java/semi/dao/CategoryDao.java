package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;

public class CategoryDao {
	public ArrayList<String> getCategory(){
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select concat(genre,'@'||genre_detail) from books"
				+ " group by concat(genre,'@'||genre_detail)"
				+ " order by concat(genre,'@'||genre_detail)";
		ArrayList<String> list=new ArrayList<String>();
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pst, rs);
		}
	}
}
