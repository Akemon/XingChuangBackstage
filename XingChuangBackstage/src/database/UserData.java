package database;
import java.sql.*;
public class UserData {
	public ConnectDatabase connectDatabase =new ConnectDatabase();
	public boolean check(String name,String pass){
		Connection conn =connectDatabase.getConn();
		try {
			Statement stmt =conn.createStatement();
			ResultSet rs =stmt.executeQuery("select * from userLogin where userName ='"+name+"'");
			if(rs.next()){
				String userPass =rs.getString("userPass");
				
				if(pass.equals(userPass)) return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
		
	}

}
