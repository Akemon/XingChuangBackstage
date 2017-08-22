package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import mode.EnterPro;
import service.EnterpriseProService;

public class EnterProData {
	public ConnectDatabase connectDatabase =new ConnectDatabase();
	//�α���ƶ��Ĳ�ѯ
	public  List<EnterPro> queryEnterInformation(String pageNumber,String pageSize,String searchString ){
		Connection connection =connectDatabase.getConn();
		String sql="";
		String preSql="";
		if(searchString.equals("")){
			sql ="select * from enterpriseProject where proStatu != '��ͨ��'";
		}else{
			preSql ="select * from enterpriseProject where proName like  ? "
					+ " or proType like ? or proContent like  ?  or "
					+ "proStatu like ?";
		}

		List<EnterPro> enterList =new ArrayList<EnterPro>();
		if(preSql.equals("")){
			try {
				Statement statement =connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				ResultSet rs =statement.executeQuery(sql);
				//�ƶ��α�

				ResultSet rsNew =new EnterpriseProService().moveCursor(pageNumber, pageSize, rs);
				//ҳ��չʾ������
				int showDataNumber =Integer.parseInt(pageSize);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0;i<showDataNumber;i++){
					EnterPro enterPro =new EnterPro();
					enterPro.setId(rsNew.getInt("id"));
					enterPro.setProName(rsNew.getString("proName"));
					enterPro.setProType(rsNew.getString("proType"));
					enterPro.setProContent(rsNew.getString("proContent"));
					enterPro.setDevelopTime(rsNew.getString("developTime"));
					enterPro.setDeadlineTime(rsNew.getString("deadlineTime"));
					enterPro.setRecruitNumber(rsNew.getInt("recruitNumber"));
					enterPro.setProStatu(rsNew.getString("proStatu"));
					enterPro.setCommentId(rsNew.getInt("commonID"));
					enterPro.setUpdateTime(df.format(rsNew.getDate("updateTime")));
					enterList.add(enterPro);
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
				ResultSet rs =preStmt.executeQuery();
				//�ƶ��α�

				ResultSet rsNew =new EnterpriseProService().moveCursor(pageNumber, pageSize, rs);
				//ҳ��չʾ������
				int showDataNumber =Integer.parseInt(pageSize);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0;i<showDataNumber;i++){
					EnterPro enterPro =new EnterPro();
					enterPro.setId(rsNew.getInt("id"));
					enterPro.setProName(rsNew.getString("proName"));
					enterPro.setProType(rsNew.getString("proType"));
					enterPro.setProContent(rsNew.getString("proContent"));
					enterPro.setDevelopTime(rsNew.getString("developTime"));
					enterPro.setDeadlineTime(rsNew.getString("deadlineTime"));
					enterPro.setRecruitNumber(rsNew.getInt("recruitNumber"));
					enterPro.setProStatu(rsNew.getString("proStatu"));
					enterPro.setCommentId(rsNew.getInt("commonID"));
					enterPro.setUpdateTime(df.format(rsNew.getDate("updateTime")));
					enterList.add(enterPro);
					if(!rsNew.next()) break;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}


		}
		return enterList;
	}
	
	//����
		public  void updateEnterInformation(EnterPro enterPro){
			Connection connection =connectDatabase.getConn();
			try{
				String sql ="update enterpriseProject set proStatu ='��ͨ��' where id =?";
				PreparedStatement preStatement =connection.prepareStatement(sql);
				preStatement.setInt(1, enterPro.getId());
				preStatement.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//ɾ��
		public  void deleteEnterInformation(int id,int commentId){
			Connection connection =connectDatabase.getConn();
			try {
				
				
				
				
				Statement stmt1 =connection.createStatement();
				stmt1.executeUpdate("delete from enterpriseProject where id="+id);
				
				Statement stmt2 =connection.createStatement();
				stmt2.executeUpdate( "delete from comment where id="+commentId);
		
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
				ResultSet rs =statement.executeQuery("select * from enterpriseProject where proStatu != '��ͨ��'");
				rs.last();
				total =rs.getRow();
			} catch (SQLException e) {
				System.out.println("��ȡ������������ʧ�ܣ�����");
				e.printStackTrace();
			}
			return total;
		}


}
