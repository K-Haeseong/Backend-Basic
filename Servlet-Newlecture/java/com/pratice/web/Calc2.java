package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// application(전역 범위) / session(범위 제한, 특정사용자만) / Cookie(서버에 부담X)를 통한 상태 유지하기

// application	사용범위 : 전역범위에서 사용하는 저장 공간
//		"		생명주기 : WAS가 시작해서 종료할 때 까지
//		"		저장위치 : WAS 서버의 메모리

// session	사용범위 : 세션 범위에서 사용하는 저장 공간
//	 "		생명주기 : 세션이 시작해서 종료할 때 까지
//	 "		저장위치 : WAS 서버의 메모리

// Cookie	사용범위 : Web Browser별 지정한 path 범주 공간
//	 "		생명주기 : Browser에 전달한 만료시간까지
//	 "		저장위치 : Web Browser의 메모리 또는 파일

// Cookie의 setPath()	: url설정을 통해 해당 url로 이동시 쿠키 넘기기 
//							=> valueCookie.setPath("/calc2");
// Cookie의 setMaxAge()	: 쿠키의 만료시간 설정 가능(페이지를 닫아도 다시 사용가능, 1는 1초)  	
//							=> valueCookie.setMaxAge(24*60*60); 

@WebServlet("/calc2")
public class Calc2 extends HttpServlet {

	protected void service(javax.servlet.http.HttpServletRequest request
						, HttpServletResponse response) 
						throws ServletException, IOException {
	
//		ServletContext application = request.getServletContext();
//		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		
		PrintWriter out = response.getWriter();
		
		String op = request.getParameter("operator");
		String v_ = request.getParameter("v");
		int v = 0;
		if(!v_.equals("")) v = Integer.parseInt(v_);
		
		
		// 계산
		if(op.equals("=")) {
//			int x = (Integer)application.getAttribute("value"); // 앞에 저장 된 값
//			int x = (Integer)session.getAttribute("value");
			int x = 0;
			for(Cookie c : cookies) 
				if (c.getName().equals("value")) {
					x = Integer.parseInt(c.getValue());
					break;
			}
			int y = v;											// 현재 들어온 값			

			
//			String op2 = (String)application.getAttribute("op");
//			String op2 = (String)session.getAttribute("op");
			String op2 ="";
			for(Cookie c : cookies) 
				if (c.getName().equals("op")) {
					op2 = c.getValue();
					break;
				}
			
			int result = 0;
			
			if(op2.equals("+")) {
				result = x + y;
			} else {
				result = x - y;
			}
			out.printf("계산 결과 : %d입니다.", result);
			
		} else { // 값 저장 
//			application.setAttribute("value", v);
//			application.setAttribute("op", op); 

//			session.setAttribute("value", v);
//			session.setAttribute("op", op); 
				
			Cookie valueCookie = new Cookie("value", String.valueOf(v));
			Cookie opCookie = new Cookie("op", op);
			valueCookie.setPath("/calc2");
			valueCookie.setMaxAge(24*60*60); 
			opCookie.setPath("/calc2");
			response.addCookie(valueCookie);
			response.addCookie(opCookie);

			
//			넘겼을 때 한번에 배열로 넘어가서 하나씩 찾아야 하는 거라면 이렇게 넘겨도 되겠는데?!
//			Cookie[] calCookie = new Cookie[2];
//			calCookie[0] = new Cookie("value", String.valueOf(v));
//			calCookie[1] = new Cookie("op", op);
			
//			response.addCookie(calCookie[0]);
//			response.addCookie(calCookie[1]);
			
		}
		
	}
}
