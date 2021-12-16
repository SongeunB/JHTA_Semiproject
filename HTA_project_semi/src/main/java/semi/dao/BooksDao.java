package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import db.JdbcUtil;
import semi.vo.BooksVo;
import semi.vo.bookDetailVo;

public class BooksDao {
	
	private static BooksDao instance = new BooksDao();
	
	public BooksDao() {}
	
	public static BooksDao getInstance() {
		return instance;
	}
	public void insertBooks(BooksVo vo, bookDetailVo vo1) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		ResultSet rs=null;
		
		try {
			con=JdbcUtil.getCon();
			String sql="insert into books values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			String sql1="insert into book_detail values(?,?,?)";
		
			pstmt=con.prepareStatement(sql);
			pstmt1=con.prepareStatement(sql1);
			pstmt.setString(1, vo.getId_item());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setString(3, vo.getStatus());
			pstmt.setInt(4, vo.getStock());
			pstmt.setString(5, vo.getTitle());
			pstmt.setString(6, vo.getAuthor());
			pstmt.setString(7, vo.getTranslator());
			pstmt.setString(8, vo.getPublisher());
			pstmt.setDate(9, vo.getYmd());
			pstmt.setString(10, vo.getGenre());
			pstmt.setString(11, vo.getGenre_detail());
			pstmt.setString(12, vo.getOrg_title());
			pstmt.setString(13, vo.getOrg_author());
			pstmt1.setString(1, vo1.getId_item());
			pstmt1.setString(2, vo1.getText());
			pstmt1.setInt(3, vo1.getImg_src());
			pstmt.executeUpdate();
			pstmt1.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("오류: " + e.getMessage());
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	
	public ArrayList<BooksVo> search(String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select * from books";
			
			if(keyword.length()>=1) {
				sql += " where lower(title) like lower(?) or lower(author) like lower(?) or lower(genre) like lower(?) or lower(genre_detail) like lower(?) or lower(org_title) like lower(?) or lower(org_author) like lower(?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setString(3, "%"+keyword+"%");
				pstmt.setString(4, "%"+keyword+"%");
				pstmt.setString(5, "%"+keyword+"%");
				pstmt.setString(6, "%"+keyword+"%");
			} else {
				pstmt = con.prepareStatement(sql);
			}
			
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
				String genre = rs.getString("genre");
				String genre_detail = rs.getString("genre_detail");
				String org_title = rs.getString("org_title");
				String org_author = rs.getString("org_author");
				BooksVo vo = new BooksVo(id_item, price, status, stock, title, author, translator, publisher, ymd, genre, genre_detail,
						org_title, org_author);
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
	
	public BooksVo detail(String id_item) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from books where id_item=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id_item);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int price=rs.getInt("price");
				String status=rs.getString("status");
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
	public ArrayList<BooksVo> newList(){
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from (select * from books order by ymd desc)"
				+ " where rownum<6";
		ArrayList<BooksVo> list=new ArrayList<BooksVo>();
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				String id=rs.getString("id_item");
				int price=rs.getInt("price");
				String status=rs.getString("status");
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
				list.add(new BooksVo(id,price,status,stock,title,author,translator,publisher,
						ymd,genre,genre_detail,org_title,org_author));
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pst, rs);
		}
	}
	public ArrayList<BooksVo> bestList(){
		SimpleDateFormat sdt=new SimpleDateFormat("YYYYMM");
		Calendar cal=Calendar.getInstance();
		String maxDate=sdt.format(cal.getTime())+"01";
		cal.add(cal.MONTH, -1);
		String minDate=sdt.format(cal.getTime())+"01";
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from "
				+ "(select id_item from "
				+ "(select id_item, sum(item_count) from "
				+ "(select * from "
				+ "(select order_num from orders "
				+ "where order_date<to_date(?,'yyyymmdd') "
				+ "and order_date>to_date(?,'yyyymmdd'))o1 left outer join order_detail o2 "
				+ "on o1.order_num=o2.order_num) "
				+ "group by id_item order by sum(item_count) desc) "
				+ "where rownum<6) b1 left outer join books b2 "
				+ "on b1.id_item=b2.id_item";
		ArrayList<BooksVo> list=new ArrayList<BooksVo>();
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			pst.setString(1, maxDate);
			pst.setString(2, minDate);
			rs=pst.executeQuery();
			while(rs.next()) {
				String id=rs.getString("id_item");
				int price=rs.getInt("price");
				String status=rs.getString("status");
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
				list.add(new BooksVo(id,price,status,stock,title,author,translator,publisher,
						ymd,genre,genre_detail,org_title,org_author));
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
