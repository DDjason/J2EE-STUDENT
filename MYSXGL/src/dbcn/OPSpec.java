package dbcn;

import java.sql.ResultSet;

public class OPSpec {

	public static String GetSpecid(String Specid){
		String name = null;
		ResultSet rs = GetSpecnameInf(Specid);
		try{
			while(rs.next()){
				name = rs.getString("专业ID");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return name;
	}
	public static String GetSpecName(String Specid){
		String name = null;
		ResultSet rs = GetSpecInf(Specid);
		try{
			while(rs.next()){
				name = rs.getString("专业名称");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return name;
	}
	public static boolean UpdateSpec(String Specid,String newSpecid,String SpecName,String SpecDirec, String Did){
		String sql = "UPDATE `XSGL`.`Spec`SET`专业ID` = '"
				+ newSpecid
				+ "',`专业名称` = '"
				+ SpecName
				+ "',`专业方向` = '"
				+ SpecDirec
				+ "',`学院ID` = '"
				+ Did
				+ "'WHERE `专业ID` = '"
				+ Specid
				+ "';";
		if(DbConnet.PsQuery(sql))
		{
			return true;
		}
		return false;
	}
	public static String GetDid(String Specid){
		String sql = "SELECT `Spec`.`学院ID`FROM `XSGL`.`Spec` Where Spec.专业ID = '"
				+ Specid
				+ "';";
		String name = null;
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
	public static ResultSet GetSpecInf(String Specid){
		ResultSet rs;
		String sql = "SELECT * FROM XSGL.Spec where 专业ID = '"
				+ Specid
				+ "';";
		rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	public static ResultSet GetSpecnameInf(String Specid){
		ResultSet rs;
		String sql = "SELECT * FROM XSGL.Spec where 专业名称 = '"
				+ Specid
				+ "';";
		rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	public static boolean DeleSpec(String Specid){
		String sql = "DELETE FROM `XSGL`.`Spec`WHERE 专业ID = '"
				+ Specid
				+ "';";
		if(DbConnet.PsQuery(sql))
		{
			return true;
		}
		return false;
	}
	public static ResultSet GetSpecAll()
	{
		ResultSet rs;
		String sql = "SELECT * FROM XSGL.Spec;";
		
		rs = DbConnet.GetRsQuery(sql);
		
		return rs;
	}
	
	public static boolean AddSpec(String Specid,String SpecName,String direc,String Did){
		String sql = "INSERT INTO `XSGL`.`Spec`(`专业ID`,`专业名称`,`专业方向`,`学院ID`)VALUES('"
				+ Specid
				+ "','"
				+ SpecName
				+ "','"
				+ direc
				+ "','"
				+ Did
				+ "');";
		
		if(DbConnet.PsQuery(sql))
		{
			return true;
		}
		return false;
	}
}
