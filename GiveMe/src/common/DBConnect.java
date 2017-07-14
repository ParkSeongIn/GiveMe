package common;

import java.sql.*;


public class DBConnect {
	public DBConnect() {}
	
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String id = "sys as sysdba";
		String pass = "1111";
		
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,id,pass);
		}catch(Exception e) {
			System.out.println(e);
		}
		return conn;
	}
}

