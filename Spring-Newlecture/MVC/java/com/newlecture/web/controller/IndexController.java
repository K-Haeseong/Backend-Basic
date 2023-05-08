package com.newlecture.web.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class IndexController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("index controller");
		
		// 기존방식
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("index");
//		mv.addObject("data", "Hello Spring MVC~!!");
//		mv.setViewName("/WEB_INF/view/index.jsp");
		
		// 변경된방식
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("data", "Hello Spring MVC~!!");
		
		
		return mv;
	}
}
