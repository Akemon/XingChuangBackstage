package service;
import java.sql.*;

import database.StudentData;
public class StudentService {
	
	public ResultSet moveCursor(String pageNumber,String pageSize,ResultSet rs){
		int pageNum =Integer.parseInt(pageNumber);
		int showNum =Integer.parseInt(pageSize);
		try {
			int toRow =(pageNum-1)*showNum+1;
			rs.absolute(toRow);
			return rs;
		} catch (SQLException e) {
			System.out.println("�α��ƶ�ʧ�ܣ�����");
			e.printStackTrace();
		}
		return null;
	}

}
