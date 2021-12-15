package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import semi.vo.BannerVo;

public class BannerDao {
	public BannerVo getBanner() {
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from banner left outer join ("
				+ "select id_item, title, author from books)b1 "
				+ "on banner.id_item=b1.id_item";
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()) {
				return new BannerVo(rs.getString("id_item"), rs.getString("sentence"), rs.getString("left_color"), rs.getString("right_color"), rs.getString("font_color"), rs.getString("title"), rs.getString("author"));
			}else {
				return null;
			}
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pst, rs);
		}
	}
}
