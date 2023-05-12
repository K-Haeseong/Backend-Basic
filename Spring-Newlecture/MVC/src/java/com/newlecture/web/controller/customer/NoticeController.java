package com.newlecture.web.controller.customer;

import java.sql.SQLException;
import java.util.List;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.service.NoticeService;


@Controller
@RequestMapping("/customer/notice")
public class NoticeController{

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list")
	public String list(@RequestParam(name="p", defaultValue = "1") int page) throws ClassNotFoundException, SQLException {
		System.out.println("page : " + page);
//		List<Notice> list = noticeService.getList(1, "TITLE", "");
		
		return "notice.list";
	}
	
	@RequestMapping("detail")
	public String detail() {
		return "notice.detail";
	}
	
	

	
//	  @Override public ModelAndView handleRequest(HttpServletRequest request,
//	  HttpServletResponse response) throws Exception {
//	  
//	  ModelAndView mv = new ModelAndView("notice.list");
//	  mv.setViewName("/WEB_INF/view/notice/list.jsp"); 
//	  List<Notice> list = noticeService.getList(1, "TITLE", ""); 
//	  mv.addObject("list", list);
//	  
//	  return mv; }
	 

}
