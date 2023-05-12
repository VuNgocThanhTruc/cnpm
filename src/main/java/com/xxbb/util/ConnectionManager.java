package com.xxbb.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public final class ConnectionManager {
	String url = "jdbc:mysql://localhost:3306/db_library";
	String user = "root";
	String pass = "";
	Connection conn;
	private static ConnectionManager instance;

	private ConnectionManager() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public static ConnectionManager getInstance() {
		if(instance==null) {
			synchronized (ConnectionManager.class) {
				try {
					instance=new ConnectionManager();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}	
		}
		return instance;
	}
	public synchronized final Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
}
