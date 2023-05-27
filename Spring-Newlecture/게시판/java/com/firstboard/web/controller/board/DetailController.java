package com.firstboard.web.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.firstboard.web.dao.Notice;
import com.firstboard.web.service.NoticeService;


public class DetailController implements Controller {

	
	private NoticeService noticeService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Notice notice = noticeService.search(Integer.parseInt(request.getParameter("id")));
		ModelAndView mv = new ModelAndView("detail");
		mv.addObject("notice", notice);
		
		return mv;
	}


	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	

}
