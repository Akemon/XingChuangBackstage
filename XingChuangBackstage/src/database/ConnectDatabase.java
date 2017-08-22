package database;
import java.sql.*;
import java.sql.Connection;
import java.sql.Statement;

public class ConnectDatabase {
	private   String url="jdbc:sqlserver://localhost;DatabaseName=XingChuang";
	private   String name="sa";
	private   String pass="123456";
	public ConnectDatabase(){
		try {
			// Mysql 的驱动
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动失败！！！");
			e.printStackTrace();
		}
		
	}
	public   Connection getConn(){
//		获取数据库的连接
		Connection connection = null;
		try{
			connection= DriverManager.getConnection(url, name, pass);
		}catch(Exception e){
			System.out.println("获取数据库连接失败！！！");
			e.printStackTrace();
		}
		return connection ;
	}

	public static void main(String args[]){
		Connection conn =new ConnectDatabase().getConn();
		
	}

}
