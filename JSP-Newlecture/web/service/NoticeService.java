package com.newlecture.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;

public class NoticeService {
	
	public int removeNoticeAll(int[] ids) {
		
		return 0;
	}
	
	
	public int pubNoticeAll(int[] ids){
		
		return 0;
	}
	
	
	public int insertNotice(Notice notice){
		
		int result = 0;
		
		
		String sql = "insert into notice(title, content, writer_id, pub, files) values(?,?,?,?,?)";
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, notice.getTitle());
			st.setString(2, notice.getContent());
			st.setString(3, notice.getWriter_id());
			st.setBoolean(4, notice.getPub());
			st.setString(5, notice.getFiles());
			
			System.out.println();
			
			result = st.executeUpdate();

			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	public int deleteNotice(int id){
		
		
		return 0;
	}
	
	
	public int updateNotice(Notice notice){
		
		return 0;
	}
	
	
	List<Notice> getNoticeNewstList(){
		
		return null;
	}
	
	
	
	
	public List<NoticeView>getNoticeList() { // 1 페이지 공지사항 목록 가져오기
		
		return getNoticeList("title", "", 1);
	}
	
	public List<NoticeView>getNoticeList(int page) { // 입력한 페이지 공지사항 목록 가져오기

		return getNoticeList("title", "", page);
	}

	public List<NoticeView>getNoticeList(String field/*title, wirter_id*/, String query/*검색어*/, int page) { // 검색 요청
		
		List<NoticeView> list = new ArrayList<>();
		
		String sql = "select * from "
				+ " (select rownum num, N.* "
				+ " from (select * from notice_view3 where "+field+" like ? order by regdate desc) N) "
				+ " where num between ? and ?";
		
		// 첫번째 페이지 = 1 + (page - 10) * 10
		// 마지막 페이지 = page * 10
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			st.setInt(2, 1 + (page - 1) * 10);
			st.setInt(3, page * 10);
			
			ResultSet rs = st.executeQuery();


			while(rs.next()){
				
				int id = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writer_id = rs.getString("WRITER_ID");
				Date regdate = rs.getDate("REGDATE");
				String hit = rs.getString("HIT");
				String files = rs.getString("FILES");
				//String content = rs.getString("CONTENT");
				int cmtCount = rs.getInt("cmt_count");
				boolean pub = rs.getBoolean("PUB");
				
				
				
				NoticeView notice = new NoticeView(
						id,
						title,
						writer_id,
						regdate,
						hit,
						files,
						pub,
						//content,
						cmtCount
						
					);
				list.add(notice);
			}

				rs.close();
				st.close();
				con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
//	-------------------------------------------
	public int getNoticeCount() { // 무슨 기능?

		return getNoticeCount("title", "");
	}


	public int getNoticeCount(String field, String query) { // 무슨 기능?
		
		int count = 0;
		
		String sql = "select count(id) COUNT from "
				+ " (select rownum num, N.* "
				+ " from (select * from notice where "+field+" like ? order by regdate desc) N) ";
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
				count = rs.getInt("count");
			
				rs.close();
				st.close();
				con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
//-------------------------- 자세한 공지사항 -----------------------------------------	
	
	public Notice getNotice(int id) { // 자세한 공지사항
		
		Notice notice = null;
		
		String sql = "select * from notice where id= ?";
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1, id);
			
			
			ResultSet rs = st.executeQuery();


			if(rs.next()){
				
				int nid = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writer_id = rs.getString("WRITER_ID");
				Date regdate = rs.getDate("REGDATE");
				String hit = rs.getString("HIT");
				String files = rs.getString("FILES");
				String content = rs.getString("CONTENT");
				boolean pub = rs.getBoolean("PUB");
				
				notice = new Notice(
						nid,
						title,
						writer_id,
						regdate,
						hit,
						files,
						content,
						pub
					);
			}

				rs.close();
				st.close();
				con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return notice;
		
	}
	
	public Notice getNextNotice(int id) { // 자세한 공지사항 : 다음 공지사항
		Notice notice = null;
		
		String sql = "select * from notice "
				+ "	where id = ( "
				+ "	select id from notice "
				+ "	where regdate > (select regdate from notice where id = ?); "
				+ "	and rownum = 1; "
				+ "	) ";
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1, id);
			
			
			ResultSet rs = st.executeQuery();


			if(rs.next()){
				
				int nid = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writer_id = rs.getString("WRITER_ID");
				Date regdate = rs.getDate("REGDATE");
				String hit = rs.getString("HIT");
				String files = rs.getString("FILES");
				String content = rs.getString("CONTENT");
				boolean pub = rs.getBoolean("PUB");
				
				notice = new Notice(
						nid,
						title,
						writer_id,
						regdate,
						hit,
						files,
						content,
						pub
					);
			}

				rs.close();
				st.close();
				con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return notice;
		
	}
	
	public Notice getPrevNotice(int id) { // 자세한 공지사항 : 이전 공지사항
		Notice notice = null;
		
		String sql = "select id from (select * from notice order by regdate desc) "
				+ " where regdate < (select regdate from notice where id = ?) "
				+ " and rownum = 1";
		
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1, id);
			
			
			ResultSet rs = st.executeQuery();


			if(rs.next()){
				
				int nid = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writer_id = rs.getString("WRITER_ID");
				Date regdate = rs.getDate("REGDATE");
				String hit = rs.getString("HIT");
				String files = rs.getString("FILES");
				String content = rs.getString("CONTENT");
				boolean pub = rs.getBoolean("PUB");
				
				notice = new Notice(
						nid,
						title,
						writer_id,
						regdate,
						hit,
						files,
						content,
						pub
					);
			}

				rs.close();
				st.close();
				con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return notice;
		
	}


	public int deleteNoticeAll(int[] ids) {
		
		int result = 0;
		
		String params = "";
		
		for (int i = 0; i < ids.length; i++) {
			params +=ids[i];
			
			if(i < ids.length-1)
				params += ",";
		}
		
		String sql = "delete notice where id in ("+params+")";
		
		
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			Statement st = con.createStatement();
			
			
			result = st.executeUpdate(sql);

			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
