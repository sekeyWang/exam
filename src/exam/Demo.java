package exam;

import java.sql.*;

public class Demo {  
  
    public static void main(String[] args) throws Exception {  
    	JDBCTest Link = new JDBCTest();
    	Link.open();
    	ResultSet rs = Link.select("select * from student;");
    	while (rs.next()) {
			System.out.println(rs.getString(2));
		}
    	String sql = "insert into student values('4', '老王', '')";
    	System.out.println(sql);
        Link.insert(sql);
        Link.close();
    }
}  