package dbcn;
import dbcn.DbConnet;
import java.sql.*;
public class OPS {
	public static boolean foundI(int i){
		
		if(i == 35 || i == 36 || i == 64 || i==41 || i==42 ||i == 44)
			return true;
		return false;
	}
	public static boolean Changestuinfo(String sql)
	{
		if(DbConnet.PsQuery(sql))
		{
			return true;
		}
		return false;
	}
	public static boolean LoadCheck(String id,String pass){
		String sql = "Select PassWord from S where S.学号 = '"
				+ id
				+ "';";
		ResultSet rs = null;
		rs = DbConnet.GetRsQuery(sql);
		String get = null;
		try{
			while(rs.next()){
				get = rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		if(pass.equals(get))
			return true;
		return false;
	}
	public static ResultSet GetColumn(){
		ResultSet rs = null;
		String sql = "SELECT COLUMN_NAME FROM"
				+ "`information_schema`.`COLUMNS`where`TABLE_SCHEMA`='XSGL' and `TABLE_NAME`='S';";
		
		rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	
	public static ResultSet GetSinfbyId(String id){
		ResultSet rs = null;
		String sql = "select * From S where S.学号 = '"
				+ id
				+ "';";
		
		rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	
}
