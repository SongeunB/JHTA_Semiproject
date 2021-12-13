package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import semi.vo.BooksVo;

public class BooksDao {
	public BooksVo detail(Long id_item) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from books where id_item=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, id_item);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int price=rs.getInt("price");
				int status=rs.getInt("status");
				int stock=rs.getInt("stock");
				String title=rs.getString("title");
				String author=rs.getString("author");
				String translator=rs.getString("translator");
				String publisher=rs.getString("publisher");
				Date ymd=rs.getDate("ymd");
				String genre=rs.getString("genre");
				String genre_detail=rs.getString("genre_detail");
				String org_title=rs.getString("org_title");
				String org_author=rs.getString("org_author");
				BooksVo vo=new BooksVo
						(id_item,price,status,stock,title,author,translator,publisher,ymd,
								genre,genre_detail,org_title,org_author);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
