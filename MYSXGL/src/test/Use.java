package test;
import dbcn.OPS;
import java.sql.ResultSet;

import datainfo.*;
import dbcn.SearchStu;
import dbcn.ReturnDRs;
public class Use {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	ResultSet rs = null;
	//rs = SearchStu.SearchBySpecname("计算机科学与技术");
	//rs = SearchStu.SearchByClassname("计算机141");
	//rs = SearchStu.SearchByDname("林业与生物技术学院");
	String sq = "1林业与生物技术学院";
	System.out.println(SearchStu.retuSuc(sq));
	if(sq.charAt(0) == '1')
	{
		System.out.println("xasx");
	}
	}
}
//,rss.getString(i)