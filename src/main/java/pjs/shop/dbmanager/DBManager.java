package pjs.shop.dbmanager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DBManager {
    private DBManager(){}
    private static DBManager instance =new DBManager();
    public static DBManager getInstance(){
        return instance;
    }


    public Connection getConnection(){
        Connection conn = null;
        String driver ="org.mariadb.jdbc.Driver";
        String url ="jdbc:mariadb://125.138.95.21:3307/shop";
        String usr ="pjs_maria";
        String pw ="Qkrwhdtn1!";

        try{
        Class.forName(driver);
        conn =DriverManager.getConnection(url, usr, pw);
        }catch(Exception e){e.printStackTrace();}
        return conn;
    } 


	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
