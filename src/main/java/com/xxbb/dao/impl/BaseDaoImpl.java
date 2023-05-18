package com.xxbb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xxbb.dao.BaseDao;
import com.xxbb.util.ConnectionManager;

public class BaseDaoImpl implements BaseDao {
	protected ConnectionManager cm;
	protected Connection conn;
	protected PreparedStatement ps;
	protected ResultSet rs;
	public BaseDaoImpl() {
		cm = ConnectionManager.getInstance();
	}
	@Override
	public void close() {
		// TODO Auto-generated method stub
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(System.err);
		}
	}
	@Override
	public ResultSet executeQuery(String sql) {
		// TODO Auto-generated method stub
		conn=cm.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println(e.getMessage());
		}
		return rs;
	}
	@Override
	public int executeUpdate(String sql) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			conn=cm.getConnection();
			ps=conn.prepareStatement(sql);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			System.err.println(e.getMessage());
		}
		return result;
	}

}
