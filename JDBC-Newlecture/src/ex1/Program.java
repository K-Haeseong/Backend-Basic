package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Program {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
		String sql = "SELECT * FROM NOTICE";
//		String sql = "SELECT * FROM NOTICE WHERE HIT > 10"; // 조회수가 10이 넘는 것만 출력 할때

		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url,"newlec", "101800");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
//		if(rs.next()) {
//			String title = rs.getString("TITLE");
//			System.out.println(title);
//		}
		
		
		while(rs.next()) {
			int id =rs.getInt("ID");
			String title = rs.getString("TITLE");
			String writerld = rs.getString("WRITER_ID");
			Date regDate = rs.getDate("REGDATE");
			String content = rs.getString("CONTENT");
			int hit = rs.getInt("hit");
			
//			if(hit > 10) - 조회수가 10이 넘는 것만 출력 - 이것은 바람직하지 못함
			System.out.printf(" id :%d, title:%s, wirterld:%s, regDate:%s, content:%s, hit:%d\n",
								id, title, writerld, regDate, content, hit);
		
		}
		rs.close();
		st.close();
		con.close();
		
		
	}

}
