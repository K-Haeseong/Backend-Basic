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

public class NoticeService {
	public List<Notice>getNoticeList() { // 1 페이지 공지사항 목록 가져오기
		
		return getNoticeList("title", "", 1);
	}
	
	public List<Notice>getNoticeList(int page) { // 입력한 페이지 공지사항 목록 가져오기

		return getNoticeList("title", "", page);
	}

	public List<Notice>getNoticeList(String field/*title, wirter_id*/, String query/*검색어*/, int page) { // 검색 요청
		
		List<Notice> list = new ArrayList<>();
		
		String sql = "select * from "
				+ " (select rownum num, N.* "
				+ " from (select * from notice where "+field+" like ? order by regdate desc) N) "
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
				String content = rs.getString("CONTENT");
				
				Notice notice = new Notice(
						id,
						title,
						writer_id,
						regdate,
						hit,
						files,
						content
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
		String sql = "select * from "
				+ " (select rownum num, N.* "
				+ " from (select * from notice order by regdate desc) N) "
				+ " where num between 6 and 10";

		return 0;
	}
	
//-------------------------- 자세한 공지사항 -----------------------------------------	
	
	public Notice getNotice(int id) { // 자세한 공지사항
		String sql = "select * from notice where id=?";
		
		return null;
		
	}
	
	public Notice getNextNotice(int id) { // 자세한 공지사항 : 다음 공지사항
		String sql = "select * from notice "
				+ "	where id = ( "
				+ "	select id from notice "
				+ "	where regdate > (select regdate from notice where id = 3); "
				+ "	and rownum = 1; "
				+ "	) ";
		
		return null;
		
	}
	
	public Notice getPrevNotice(int id) { // 자세한 공지사항 : 이전 공지사항
		
		String sql = "select id from (select * from notice order by regdate desc) "
				+ " where regdate < (select regdate from notice where id = 3) "
				+ " and rownum = 1";
		
		return null;
		
	}
	
}
