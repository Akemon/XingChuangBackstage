package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import mode.Student;
import mode.Worker;
import service.WorkerService;

public class CompanyData {
	public ConnectDatabase connectDatabase =new ConnectDatabase();
	//�α���ƶ��Ĳ�ѯ
	public  List<Worker> queryWorkerInformation(String pageNumber,String pageSize,String searchString ){
		Connection connection =connectDatabase.getConn();
		String sql="";
		String preSql="";
		if(searchString.equals("")){
			sql ="select * from enterpriseData";
		}else{
			preSql ="select * from enterpriseData where peopleName like  ? "
					+ " or companyName like ? or companyPhone like ?   or "
					+ "companyAddress like ? or userName like ?";
		}

		List<Worker> workList =new ArrayList<Worker>();
		if(preSql.equals("")){
			try {
				Statement statement =connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				ResultSet rs =statement.executeQuery(sql);
				//�ƶ��α�

				ResultSet rsNew =new WorkerService().moveCursor(pageNumber, pageSize, rs);
				//ҳ��չʾ������
				int showDataNumber =Integer.parseInt(pageSize);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0;i<showDataNumber;i++){
					Worker worker =new Worker();
					worker.setPeopleName(rsNew.getString("peopleName"));
					worker.setCompanyName(rsNew.getString("companyName"));
					worker.setCompanyPhone(rsNew.getString("companyPhone"));
					worker.setCompanyAddress(rsNew.getString("companyAddress"));
					worker.setUserName(rsNew.getString("userName"));
					worker.setUpdateTime(df.format(rsNew.getDate("updateTime")));
					workList.add(worker);
					if(!rsNew.next()) break;

				}
			}catch(Exception e){
				System.out.println("������ҵ����ʧ�ܣ�����");
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

				ResultSet rsNew =new WorkerService().moveCursor(pageNumber, pageSize, rs);
				//ҳ��չʾ������
				int showDataNumber =Integer.parseInt(pageSize);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0;i<showDataNumber;i++){
					Worker worker =new Worker();
					worker.setPeopleName(rsNew.getString("peopleName"));
					worker.setCompanyName(rsNew.getString("companyName"));
					worker.setCompanyPhone(rsNew.getString("companyPhone"));
					worker.setCompanyAddress(rsNew.getString("companyAddress"));
					worker.setUserName(rsNew.getString("userName"));
					worker.setUpdateTime(df.format(rsNew.getDate("updateTime")));
					workList.add(worker);
					
					if(!rsNew.next()) break;

				}

			} catch (SQLException e) {
				e.printStackTrace();
			}


		}



		return workList;
	}
	
	//����
		public  void updateWorkerInformation(Worker worker){
			Connection connection =connectDatabase.getConn();
			try{
				String sql ="update enterpriseData set peopleName=?,companyName=?,companyPhone=?,companyAddress=? where userName=?";
				PreparedStatement preStatement =connection.prepareStatement(sql);
				preStatement.setString(1, worker.getPeopleName());
				preStatement.setString(2, worker.getCompanyName());
				preStatement.setString(3, worker.getCompanyPhone());
				preStatement.setString(4, worker.getCompanyAddress());
				preStatement.setString(5, worker.getUserName());
				preStatement.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//ɾ��
		public  void deleteWorkerInformation(String userName){
			Connection connection =connectDatabase.getConn();
			try {
				Statement stmt1 =connection.createStatement();
				stmt1.executeUpdate("delete from enterpriseData where userName='"+userName+"'" );
				
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
				ResultSet rs =statement.executeQuery("select * from enterpriseData");
				rs.last();
				total =rs.getRow();
			} catch (SQLException e) {
				System.out.println("��ȡ������������ʧ�ܣ�����");
				e.printStackTrace();
			}
			return total;
		}


}
