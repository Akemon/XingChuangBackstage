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
			// Mysql ������
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("��������ʧ�ܣ�����");
			e.printStackTrace();
		}
		
	}
	public   Connection getConn(){
//		��ȡ���ݿ������
		Connection connection = null;
		try{
			connection= DriverManager.getConnection(url, name, pass);
		}catch(Exception e){
			System.out.println("��ȡ���ݿ�����ʧ�ܣ�����");
			e.printStackTrace();
		}
		return connection ;
	}

	public static void main(String args[]){
		Connection conn =new ConnectDatabase().getConn();
		
	}

}
