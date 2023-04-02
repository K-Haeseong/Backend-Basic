package com.newlecture.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;

@WebServlet("/notice/detail")
public class NoticeDetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request
						, HttpServletResponse response) 
						throws ServletException, IOException {
		
		int id =  Integer.parseInt(request.getParameter("id"));


		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
		String sql = "SELECT * FROM NOTICE WHERE ID=?";


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"newlec", "101800");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);

			ResultSet rs = st.executeQuery();

			rs.next();

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
					
			request.setAttribute("n", notice); 
			
			/*
			 * request.setAttribute("title", title); 
			 * request.setAttribute("writer_id",writer_id); 
			 * request.setAttribute("regdate", regdate);
			 * request.setAttribute("hit", hit); request.setAttribute("files", files);
			 * request.setAttribute("content", content);
			 */

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
		
		
		// redirect => 여기서 다른 페이지로 가는 것 (로그인 안 되었으니까 로그인 하고 오라고 보내버릴 때)
		
		// forward => 여기서 작업했던 내용 이어 받아서 처리 할 때
		
		
		request.getRequestDispatcher("/WEB-INF/view/notice/detail.jsp")
		.forward(request, response);
		
	}
}
