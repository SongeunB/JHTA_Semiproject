package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.vo.BannerVo;

public class BannerDao {
	private static BannerDao instance = new BannerDao();
	private BannerDao() {}
	public static BannerDao getInstance() {
		return instance;
	}
	public BannerVo getBanner() {
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from ("
				+ "select * from("
				+ "select * from banner "
				+ "order by dbms_random.value"
				+ ") where rownum=1)b1 "
				+ "left outer join ("
				+ "select id_item, title, author from books)b2 "
				+ "on b1.id_item=b2.id_item";
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
	public ArrayList<BannerVo> getList(){
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from banner b1 "
				+ "left outer join ("
				+ "select id_item, title, author from books)b2 "
				+ "on b1.id_item=b2.id_item "
				+ "order by b2.author, b2.title";
		ArrayList<BannerVo> list=new ArrayList<BannerVo>();
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				list.add(new BannerVo(rs.getString("id_item"), rs.getString("sentence"), rs.getString("left_color"), rs.getString("right_color"), rs.getString("font_color"), rs.getString("title"), rs.getString("author")));
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pst, rs);
		}
	}
	public int insert(BannerVo vo) {
		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into banner values(?,?,?,?,?)";
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			pst.setString(1, vo.getId_item());
			pst.setString(2, vo.getSentence());
			pst.setString(3, vo.getLeft_color());
			pst.setString(4, vo.getRight_color());
			pst.setString(5, vo.getFont_color());
			return pst.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pst, null);
		}
	}
	public int update(BannerVo vo) {
		Connection con=null;
		PreparedStatement pst=null;
		String sql="update banner set sentence=?, left_color=?, right_color=?, font_color=? where id_item=?";
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			pst.setString(1, vo.getSentence());
			pst.setString(2, vo.getLeft_color());
			pst.setString(3, vo.getRight_color());
			pst.setString(4, vo.getFont_color());
			pst.setString(5, vo.getId_item());
			return pst.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pst, null);
		}
	}
	public int delete(String id_item) {
		Connection con=null;
		PreparedStatement pst=null;
		String sql="delete from banner where id_item=?";
		try {
			con=JdbcUtil.getCon();
			pst=con.prepareStatement(sql);
			pst.setString(1, id_item);
			return pst.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pst, null);
		}
	}
}
