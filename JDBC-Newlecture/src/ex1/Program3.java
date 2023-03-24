package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Program3 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		
		String title = "TEST3";
		String content = "hahaha3";
		String files = "";
		int id = 13;
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
		String sql = "update notice "
				+ "set"
				+ "    title=?, "
				+ "    content=?, "
				+ "    files=?"
				+ "    where id =?";

		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url,"newlec", "101800");
		//Statement st = con.createStatement();
		// st.ex.....(sql)
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, content);
		st.setString(3, files);
		st.setInt(4, id);
		
		int result = st.executeUpdate();
		
		System.out.println(result);
		
		
		
	
		st.close();
		con.close();
		
		
	}

}
