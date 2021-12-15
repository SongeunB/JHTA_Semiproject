package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.vo.BooksVo;

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
	
	public ArrayList<BooksVo> category(String genre) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select * from books where genre like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, genre);
			rs = pstmt.executeQuery();
			ArrayList<BooksVo> list = new ArrayList<BooksVo>();
			while(rs.next()) {
				String id_item = rs.getString("id_item");
				int price = rs.getInt("price");
				String status = rs.getString("status");
				int stock = rs.getInt("stock");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String translator = rs.getString("translator");
				String publisher = rs.getString("publisher");
				Date ymd = rs.getDate("ymd");
				genre = rs.getString("genre");
				String genre_detail = rs.getString("genre_detail");
				String org_title = rs.getString("org_title");
				String org_author = rs.getString("org_author");
				BooksVo vo = new BooksVo(id_item, price, status, stock, title, author, translator, publisher, ymd, genre, genre_detail, org_title, org_author);
				list.add(vo);
			}
			return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<BooksVo> categoryDetail(String genre) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select * from books where genre_detail like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, genre);
			rs = pstmt.executeQuery();
			ArrayList<BooksVo> list = new ArrayList<BooksVo>();
			while(rs.next()) {
				String id_item = rs.getString("id_item");
				int price = rs.getInt("price");
				String status = rs.getString("status");
				int stock = rs.getInt("stock");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String translator = rs.getString("translator");
				String publisher = rs.getString("publisher");
				Date ymd = rs.getDate("ymd");
				genre = rs.getString("genre");
				String genre_detail = rs.getString("genre_detail");
				String org_title = rs.getString("org_title");
				String org_author = rs.getString("org_author");
				BooksVo vo = new BooksVo(id_item, price, status, stock, title, author, translator, publisher, ymd, genre, genre_detail, org_title, org_author);
				list.add(vo);
			}
			return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
