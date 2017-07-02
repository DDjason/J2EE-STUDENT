package dbcn;

import java.sql.ResultSet;

public class OPAdmin {
	public static boolean CheckLoad(String Aid,String psaa){
		String sql = "SELECT LoadPass FROM XSGL.Admin where LoadId = '"
				+ Aid
				+ "';";
		String check = null;
		ResultSet rs = DbConnet.GetRsQuery(sql);
		try{
			while(rs.next()){
				check = rs.getString(1);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println(check);
		System.out.println(psaa);
		
		if(psaa.equals(check))
			return true;
		return false;
	}
}
