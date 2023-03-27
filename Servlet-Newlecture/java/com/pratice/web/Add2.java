package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add2")
public class Add2 extends HttpServlet {

	protected void service(HttpServletRequest request
						, HttpServletResponse response) 
						throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
//		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String[] num_ = request.getParameterValues("num");
		
		int result = 0; 
		
		for(int i=0; num_.length > i; i++) {
			int num = Integer.parseInt(num_[i]);	// 변수선언은 반복 되지않고 선언만 반복된다.
			result+=num;
		}
		
		out.printf("계산 결과 : %d입니다.", result);
		
//		if(!x_.equals("") && !y_.equals("")) {
//			x = Integer.parseInt(x_);
//			y = Integer.parseInt(y_);
//		}
		
		
		
		
	}

}
