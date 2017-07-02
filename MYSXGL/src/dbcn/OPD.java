package dbcn;

import java.sql.ResultSet;

public class OPD {
	public static boolean ChanDinfo(String Did,String Dname){
		String sql = "UPDATE `XSGL`.`D`SET`学院名称` = '"
				+ Dname
				+ "'WHERE `学院ID` = '"
				+ Did
				+ "';";
		
		if(DbConnet.PsQuery(sql))
		{
			return true;
		}
		return false;
	}
	public static boolean AddD(String Did,String Dname){
		String sql = "INSERT INTO `XSGL`.`D`(`学院ID`,`学院名称`)VALUES('"
				+ Did
				+ "','"
				+ Dname
				+ "');";
		
		if(DbConnet.PsQuery(sql))
		{
			return true;
		}
		return false;
	}
	public static void DeleteDid(String Did){
		String sql = "DELETE FROM `XSGL`.`D`WHERE 学院ID = '"
				+ Did
				+ "';";
		DbConnet.PsQuery(sql);
	}
	public static ResultSet SearchByDid(String d_id){
		String sql = "select * from D where 学院ID ='"
				+ d_id
				+ "'ORDER BY 学院ID;";
		
		ResultSet rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	public static String GetDnameByDid(String d_id){
		String name = null;
		ResultSet rs = SearchByDid( d_id);
		
		try{
			while(rs.next()){
				name = rs.getString(2);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return name;
	}
	public static ResultSet SearchAllD(){
		String sql = "select * from D ORDER BY 学院ID;";
		
		ResultSet rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	
	public static String SonSearchByDid(String d_id){
		String sql = "select * from D where 学院ID ='"
				+ d_id
				+ "';";
		return sql;
	}
	public static String SonSearchAllD(){
		String sql = "select * from D;";
		return sql;
	}
	public static String SearchOneDname(String D_id){
		String name = null;
		String sql = "SELECT `D`.`学院名称`FROM `XSGL`.`D` Where `D`.`学院ID` = '"
				+ D_id
				+ "';";
		ResultSet rs = DbConnet.GetRsQuery(sql);
		try{
			while(rs.next()){
				name = rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return name;
	}
	
}
