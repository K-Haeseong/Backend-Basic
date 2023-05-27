package com.firstboard.web.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.firstboard.web.dao.Notice;
import com.firstboard.web.service.NoticeService;

public class BoardController implements Controller {

	
	private NoticeService noticeService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		List<Notice> list = noticeService.getList(1, "TITLE", "");
		ModelAndView mv = new ModelAndView("board");
		mv.addObject("list", list);
		
		return mv;
	}


	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	

}
