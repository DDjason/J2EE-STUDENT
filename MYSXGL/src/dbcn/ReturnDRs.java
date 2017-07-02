package dbcn;

import java.sql.ResultSet;

public class ReturnDRs {
	public static ResultSet GetDRs()
	{
		ResultSet rs;
		String sql = "SELECT * FROM XSGL.D;";
		
		rs = DbConnet.GetRsQuery(sql);
		
		return rs;
	}

	public static ResultSet GetSpecbyDRs(String id)
	{
		ResultSet rs;
		String sql = "SELECT * FROM XSGL.Spec where 学院ID = '"
				+ id
				+ "';";
		
		rs = DbConnet.GetRsQuery(sql);
		
		return rs;
	}
	
}
