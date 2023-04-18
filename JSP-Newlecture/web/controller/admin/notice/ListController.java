package com.newlecture.web.controller.admin.notice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;
import com.newlecture.web.service.NoticeService;

@WebServlet("/admin/board/notice/list")
public class ListController extends HttpServlet {
	
	// 404 : URL X
	// 405 : URL O, 받을 메서드 X
	// 406 : URL O, 받을 메서드 O, 내가 권한이 X
	
	
	@Override
	protected void doPost(HttpServletRequest request
						, HttpServletResponse response) 
						throws ServletException, IOException 
	{
		
		String[] openIds = request.getParameterValues("open-id");
		String[] delIds = request.getParameterValues("del-id");
		String cmd =request.getParameter("cmd");
		
		switch(cmd) {
		case "일괄공개" :
			for (String openId : openIds) 
				System.out.printf("open id : %s\n", openId);
			break;
			
		case "일괄삭제" :
			NoticeService service = new NoticeService();
			int[] ids = new int[delIds.length];
			for (int i = 0; i < delIds.length; i++)
				ids[i] = Integer.parseInt(delIds[i]);
			
			int result = service.deleteNoticeAll(ids);
			break;
		}
		
		response.sendRedirect("list");
		
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request
						, HttpServletResponse response) 
						throws ServletException, IOException {
		
		// 검색기능
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");
		
		
		String field = "title";
		if(field_ != null && !field.equals(""))
			field = field_;
		
		
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;
		
		
		int page = 1;
		if(page_ != null && !page_.equals(""))
			page = Integer.parseInt(page_);
		
		
		NoticeService service = new NoticeService();
		List<NoticeView> list = service.getNoticeList(field, query, page);
		int count =service.getNoticeCount(field, query);
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		
		request.getRequestDispatcher("/WEB-INF/view/admin/board/notice/list.jsp")
		.forward(request, response);
		
	}
}

