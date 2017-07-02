package dbcn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DbConnet {
	private final static String URL = "jdbc:mysql://localhost:3306/XSGL?characterEncoding=UTF-8";
	private final static String USER_NAME = "root";
	private final static String PASSWORD = "ww6217795";
		
		public static Connection GetConn()
		{
			Connection conn = null;
			try{
				Class.forName("com.mysql.jdbc.Driver");//注册驱动程序
				conn = DriverManager.getConnection(URL,USER_NAME,PASSWORD);//获取链接
			}catch(Exception e){
				System.out.println("链接失败！");
				e.printStackTrace();
			}
			if(conn != null){
				System.out.println("链接成功！");
			}
			
			return conn;
		}
		
		
		public static Statement GetStmt(){
			Statement stmt = null;
			Connection conn;
			conn = GetConn();

			try {
				stmt = conn.createStatement();
			}catch(SQLException e){
				System.out.println("获取stmt失败！");
				e.printStackTrace();
			}
			if(stmt != null){
				System.out.println("获取stmt成功！");
			}
			return stmt;
		}
		
		public static ResultSet GetRsQuery(String sql){
			ResultSet rs = null;
			
			Statement stmt;
			stmt = GetStmt();
			try{
				rs = stmt.executeQuery(sql);
			}catch(SQLException e){
				System.out.println(sql);
				System.out.println("执行sql语句失败！");
				e.printStackTrace();
			}
			return rs;
		}
		public static boolean PsQuery(String sql){
			try{
				PreparedStatement ps =  GetPsQuery(sql);
				int row = ps.executeUpdate();
				if(row > 0){
					System.out.println("成功添加了 " + row + " 条数据!");
					return true;
				}
				}catch(Exception e){
					System.out.println(sql);
					System.out.println("添加信息失败！");
					//System.out.println(sql);
					e.printStackTrace();
					
				}return false;
		}
		public static PreparedStatement GetPsQuery(String sql){
			PreparedStatement ps = null;
			Connection conn;
			conn = GetConn();
			
			try{
				ps = conn.prepareStatement(sql);
			}catch(SQLException Se){
				System.out.println(sql);
				Se.printStackTrace();
				
			}
			
			return ps;
		}
		
		/*关闭链接*/
		public static void closers (ResultSet rs){
			if(rs != null)
				try{
					rs.close();
				}catch(SQLException e){
					
					e.printStackTrace();
				}
			
		}
		public static void closeconn (Connection conn){
			
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
		}
		public static void closeps (Statement ps){
		
			if(ps != null)
				try{
					ps.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			
		}
		
		public static int GetQueryCount(String sql){
			int row = 0;
			ResultSet rs = null;
			rs = GetRsQuery(sql);
			
			try {
				
				while(rs.next()){
					row = rs.getInt(1);
					System.out.println("读取" + row + "条数据");
					return row;
				}
			}catch(Exception e){
				System.out.println(sql);
				e.printStackTrace();
			}
			return row;
		}

}
