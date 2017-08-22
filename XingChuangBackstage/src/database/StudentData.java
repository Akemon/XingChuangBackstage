package database;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

import mode.Student;
import service.StudentService;
public class StudentData {
	public ConnectDatabase connectDatabase =new ConnectDatabase();

	//�α���ƶ��Ĳ�ѯ
	public  List<Student> queryStudentInformation(String pageNumber,String pageSize,String searchString ){
		Connection connection =connectDatabase.getConn();
		String sql="";
		String preSql="";
		if(searchString.equals("")){
			sql ="select * from studentData";
		}else{
			preSql ="select * from studentData where stuNickName like  ? "
					+ " or stuMail like ? or stuPhone like ?   or "
					+ "stuSchool like ? or userName like ?";
		}
		
		List<Student> studentList =new ArrayList<Student>();
		if(preSql.equals("")){
			try {
				Statement statement =connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				ResultSet rs =statement.executeQuery(sql);
				//�ƶ��α�
			
				ResultSet rsNew =new StudentService().moveCursor(pageNumber, pageSize, rs);
				//ҳ��չʾ������
				int showDataNumber =Integer.parseInt(pageSize);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0;i<showDataNumber;i++){
							Student student =new Student();
							student.setStuNickName(rsNew.getString("stuNickName"));
							student.setStuSex(rsNew.getString("stuSex"));
							student.setStuMail(rsNew.getString("stuMail"));
							student.setStuPhone(rsNew.getString("stuPhone"));
							student.setStuSchool(rsNew.getString("stuSchool"));
							student.setStuCharacSigna(rsNew.getString("stuCharacSigna"));
							student.setStuVerifyQuestion(rsNew.getString("stuVerifyQuestion"));
							student.setStuVerifyAnswer(rsNew.getString("stuVerifyAnswer"));
							student.setStuPoints(rsNew.getString("stuPoints"));
							student.setUserName(rsNew.getString("userName"));
							student.setUpdateTime(df.format(rsNew.getDate("updateTime")));
							studentList.add(student);
							if(!rsNew.next()) break;
						
					}
			}catch(Exception e){
				System.out.println("����ѧ������ʧ�ܣ�����");
				e.printStackTrace();
			}
			
		}else{
			try {
				PreparedStatement preStmt =connection.prepareStatement(preSql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				preStmt.setString(1, "%"+searchString+"%");
				preStmt.setString(2, "%"+searchString+"%");
				preStmt.setString(3, "%"+searchString+"%");	
				preStmt.setString(4, "%"+searchString+"%");
				preStmt.setString(5, "%"+searchString+"%");
				ResultSet rs =preStmt.executeQuery();
				//�ƶ��α�
			
				ResultSet rsNew =new StudentService().moveCursor(pageNumber, pageSize, rs);
				//ҳ��չʾ������
				int showDataNumber =Integer.parseInt(pageSize);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0;i<showDataNumber;i++){
							Student student =new Student();
							student.setStuNickName(rsNew.getString("stuNickName"));
							student.setStuSex(rsNew.getString("stuSex"));
							student.setStuMail(rsNew.getString("stuMail"));
							student.setStuPhone(rsNew.getString("stuPhone"));
							student.setStuSchool(rsNew.getString("stuSchool"));
							student.setStuCharacSigna(rsNew.getString("stuCharacSigna"));
							student.setStuVerifyQuestion(rsNew.getString("stuVerifyQuestion"));
							student.setStuVerifyAnswer(rsNew.getString("stuVerifyAnswer"));
							student.setStuPoints(rsNew.getString("stuPoints"));
							student.setUserName(rsNew.getString("userName"));
							student.setUpdateTime(df.format(rsNew.getDate("updateTime")));
							studentList.add(student);
							if(!rsNew.next()) break;
						
					}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		
		return studentList;
	}

	//����
	public  void updateStudentInformation(Student student){
		Connection connection =connectDatabase.getConn();
		try{
			String sql ="update studentData set stuNickName=?,stuSex=?,stuMail=?,stuPhone=?,stuSchool=?,stuPoints=? where userName=?";
			PreparedStatement preStatement =connection.prepareStatement(sql);
			preStatement.setString(1, student.getStuNickName());
			preStatement.setString(2, student.getStuSex());
			preStatement.setString(3, student.getStuMail());
			preStatement.setString(4, student.getStuPhone());
			preStatement.setString(5, student.getStuSchool());
			preStatement.setString(6, student.getStuPoints());
			preStatement.setString(7, student.getUserName());
			preStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//ɾ��
	public  void deleteStudentInformation(String userName){
		Connection connection =connectDatabase.getConn();
		try {
			System.out.println("userName:"+userName);
			Statement stmt1 =connection.createStatement();
			stmt1.executeUpdate("delete from studentData where userName='"+userName+"'" );
			Statement stmt2 =connection.createStatement();
			stmt2.executeUpdate( "delete from userLogin where userName='"+userName+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public  int getTotalDataNumber(){
		Connection connection =connectDatabase.getConn();
		int total = 0;
		try {
			Statement statement =connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			ResultSet rs =statement.executeQuery("select * from studentData ");
			rs.last();
			total =rs.getRow();
		} catch (SQLException e) {
			System.out.println("��ȡ������������ʧ�ܣ�����");
			e.printStackTrace();
		}
		return total;
	}




}
