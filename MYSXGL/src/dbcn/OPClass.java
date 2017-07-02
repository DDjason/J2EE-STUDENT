package dbcn;

import java.sql.ResultSet;

public class OPClass {
	public static boolean AddClass(String sql)
	{
		if(DbConnet.PsQuery(sql))
		{
			return true;
		}
		return false;
	}
	public static ResultSet SearchClassByDid(String spec_id){
		String sql = "SELECT *FROM `XSGL`.`Class` where 专业ID = '"
				+ spec_id
				+ "';";
		
		ResultSet rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	public static ResultSet SearchClassAll(){
		String sql = "SELECT *FROM `XSGL`.`Class`";
		
		ResultSet rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
}
