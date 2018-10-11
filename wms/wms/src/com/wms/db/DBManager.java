package com.wms.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * 数据库管理类
 * @author win7
 *
 */
public class DBManager {
	public static final String DEFAULT_DRIVER_NAME = "net.sourceforge.jtds.jdbc.Driver";
	public static final String DEFAULT_DB_URL = "jdbc:jtds:sqlserver://localhost:1433;DatabaseName=wms";


	public static String DB_URL = null;

	public static Properties prop = null;

	public Connection getConnection() {

		Connection coon = null;
		try {
			Class.forName(DEFAULT_DRIVER_NAME);
			coon = DriverManager.getConnection(DEFAULT_DB_URL,"sa","8888");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coon;
	}

	public static void main(String[] args) {
		DBManager manager = new DBManager();
		manager.getConnection();
	}

	public boolean login(String username, String pwd) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon
					.prepareStatement("select * from admin where name='"
							+ username + "' and pwd='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

}
