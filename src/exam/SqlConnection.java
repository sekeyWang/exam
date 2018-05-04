package exam;

import java.sql.*;

public class SqlConnection {
	    private static final String URL="jdbc:mysql://localhost:3306/examination?";//数据库连接字符串，这里的deom为数据库名  
	    private static final String NAME="root";//登录名  
	    private static final String PASSWORD="";//密码  
	      
	    public void TheSqlConnection()  
	    {  
	        //1.加载驱动  
	        try {  
	            Class.forName("com.mysql.jdbc.Driver");  
	        } catch (ClassNotFoundException e) {  
	            System.out.println("未能成功加载驱动程序，请检查是否导入驱动程序！");  
	                        //添加一个println，如果加载驱动异常，检查是否添加驱动，或者添加驱动字符串是否错误  
	            e.printStackTrace();  
	        }  
	        Connection conn = null;  
	        try {  
	            conn = DriverManager.getConnection(URL, NAME, PASSWORD);  
	            System.out.println("获取数据库连接成功！");
	            Statement stat = conn.createStatement();
	            ResultSet rs = stat.executeQuery("select * from student;");
	            while(rs.next()){
	            	String name = rs.getString("sname");
	            	System.out.println(name);
	            }
	            System.out.println("插入成功！");
	        } catch (SQLException e) {  
	            System.out.println("获取数据库连接失败！");  
	                        //添加一个println，如果连接失败，检查连接字符串或者登录名以及密码是否错误  
	            e.printStackTrace();  
	        }  
	               //数据库打开后就要关闭  
	        if(conn!=null)  
	        {  
	            try {  
	                conn.close();  
	            } catch (SQLException e) {  
	                // TODO Auto-generated catch block  
	                e.printStackTrace();  
	                conn=null;  
	            }  
	        }  
	    }  
	}  