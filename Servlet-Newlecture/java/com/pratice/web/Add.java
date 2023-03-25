package com.pratice.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/add")
public class Add extends HttpServlet {

	protected void service(HttpServletRequest request
					, HttpServletResponse response) 
					throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		request.setCharacterEncoding("UTF-8");
		
		String x_=request.getParameter("x");
		String y_=request.getParameter("y");
		
		int x = 0, y =0;
		if(!x_.equals("")&&!y_.equals("")) {
			x = Integer.parseInt(x_);
			y = Integer.parseInt(y_);
		}
		
		int sum = x + y;
				
		PrintWriter out = response.getWriter();			 // 내가 한 것	
		out.printf("결과값 : %d\n", sum);
//		response.getWriter().printf("결과값 : %d\n", sum); // 뉴렉님
	
		
	}

}
