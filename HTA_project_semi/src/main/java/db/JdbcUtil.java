package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {

	public static Connection getCon() {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url="jdbc:oracle:thin:@192.168.124.100:1521:xe";
			con=DriverManager.getConnection(url,"C##SCOTT","TIGER");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩실패 " + e.getMessage());
		}catch(SQLException se) {
			System.out.println("db접속실패: " +se.getMessage());
		}
		return con;
	}
	public static void close(Connection con) {
		try {
			if(con!=null)con.close();
		}catch(SQLException s) {
			s.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null) stmt.close();
		}catch(SQLException s) {
			s.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs!=null)rs.close();
		}catch(SQLException s) {
			s.printStackTrace();
		}
	}
	public static void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(rs!=null)rs.close();
		}catch(SQLException s) {
			s.printStackTrace();
		}
	}
}
