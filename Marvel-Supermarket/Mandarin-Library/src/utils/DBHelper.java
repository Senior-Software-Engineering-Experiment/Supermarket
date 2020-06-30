/**
 * 
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author sxy 
 *
 */
public class DBHelper {

	public String url = "jdbc:postgresql://localhost:5432/Mandarin-Library";
	public String username = "postgres";
	public String password = "123456";
	public static DBHelper instance = null;

	// ͨ����̬�����ע�����ݿ���������֤ע��ִֻ��һ��
	static {
		try {
			Class.forName("org.postgresql.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private DBHelper() {
	}

	/**
	 * �����ʵ��
	 * 
	 * @return
	 */
	public static DBHelper getInstance() {
		// �������,��ֹ�̲߳���
		synchronized (DBHelper.class) {
			if (instance == null) {
				instance = new DBHelper();
			}
		}
		return instance;
	}

	/**
	 * �������
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}

	/**
	 * �ر�����
	 * 
	 * @param conn
	 * @param st
	 * @param rs
	 */
	public static void closeConnection(Connection conn, Statement st,
			ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
