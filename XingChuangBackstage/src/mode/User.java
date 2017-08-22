package mode;

import database.MD5;

public class User {
	private MD5 md =new MD5();
	private String userName;
	private String pass;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

}
