package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDAO {
	static final String URL = "jdbc:mysql://10.42.129.142/20gr26";
	static final String USER = "20gr26";
	static final String PASSWORD = "20gr26";

	public String login(String mail, String password) {
		String count = null;
		try {
			String sql = "select count((address='" + mail + "' and pass='" + password
					+ "') or NULL) as count from user;";
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			result.next();
			count = result.getString("count");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public String getName(String mail, String password) {
		String name = null;
		try {
			String sql = "select u_name from user where address='" + mail + "' and pass='" + password + "';";
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			result.next();
			name = result.getString("u_name");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return name;
	}
}