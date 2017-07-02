package dbcn;
import java.sql.*;

import dbcn.*;
public class SearchStu {
	private static String sql = "SELECT 学号,姓名,性别,手机号,班级名称 FROM XSGL.S ";
	
	public static String retuSuc(String ope){
		String name = "";
		int t = ope.length();
		int i = 0;
		for(i = 1;i<t;i++){
			name += ope.charAt(i);
		}
		return name;
	}
	
	public static ResultSet Search(){
		ResultSet rs = null;
	
		rs = DbConnet.GetRsQuery(sql);
		return rs;
	}
	public static ResultSet SearchByDname(String Dname){
		ResultSet rs = null;
		String add = "SELECT 学号,姓名,性别,手机号,班级名称 FROM XSGL.S where 班级名称 in "
				+ "(SELECT `Class`.`班级名称`FROM `XSGL`.`Class` where 专业ID in"
				+ " (Select 专业ID From Spec where 学院ID in "
				+ "(SELECT 学院ID FROM XSGL.D Where 学院名称 = '"
				+ Dname
				+ "')));";
		
		System.out.println(add);
		rs = DbConnet.GetRsQuery(add);
		return rs;
	}
	public static ResultSet SearchByClassname(String classname){
		ResultSet rs = null;
		String add = "where 班级名称 = '"
				+ classname
				+ "'";
		String Lsql = sql + add;
		System.out.println(Lsql);
		rs = DbConnet.GetRsQuery(Lsql);
		return rs;
	}
	
	public static ResultSet SearchBySpecname(String Specname){
		ResultSet rs = null;
		String specid = OPSpec.GetSpecid(Specname);
		String add = "where 班级名称 in (SELECT `Class`.`班级名称`FROM `XSGL`.`Class` where 专业ID = '"
				+ specid
				+ "')";
		String Lsql = sql + add;
		System.out.println(Lsql);
		rs = DbConnet.GetRsQuery(Lsql);
		return rs;
	}
}
