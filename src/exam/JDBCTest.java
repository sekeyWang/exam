package exam;
import java.sql.*;
  
public class JDBCTest{  
    public static final String url = "jdbc:mysql://127.0.0.1:3306/examination?useUnicode=true&characterEncoding=UTF-8";  
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "";  
  
    public Connection conn = null;  
  
    public void open() {  
        try {  
            Class.forName(name);//指定连接类型  
            conn = DriverManager.getConnection(url, user, password);//获取连接    
            System.out.println("success");
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }
    public ResultSet select(String sql) throws Exception{
    	ResultSet rs = null;
    	try{
    		Statement stat = conn.createStatement();
    		rs = stat.executeQuery(sql);
    		System.out.println("查询成功");
    	}
    	catch (Exception e) {  
            e.printStackTrace();
            throw e;
        }
		return rs;
    }
    
    public void insert(String sql) throws Exception{
    	try{
    		Statement stat = conn.createStatement();
    		int i = stat.executeUpdate(sql);
    		System.out.println("改变了" + i + "条数据");
    	}
    	catch (Exception e) {  
            e.printStackTrace();
            System.out.println("nonono");//如何弹出错误？？
            throw e;
        }
    }
    
    public void close() {  
        try {  
            conn.close();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
    }  
}  