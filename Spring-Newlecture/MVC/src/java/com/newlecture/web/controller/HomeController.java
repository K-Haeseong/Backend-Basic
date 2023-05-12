package com.newlecture.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HomeController  {

	  @ResponseBody
	  @RequestMapping("index") 
	  public String index() { 
			return "Hello SPRINIG";
	  }
	  
//	  @RequestMapping("index")
//	  public String index() {
//		  return "root.index";
//	  }

//	  @RequestMapping("index") 
//	  public void index(HttpServletResponse response) { 
//		  PrintWriter out;
//		try {
//			out = response.getWriter();
//			out.print("spring");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	  }
	  
	 
	
//	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
// 		<기존방식>
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("index");
//		mv.addObject("data", "Hello Spring MVC~!!");
//		mv.setViewName("/WEB_INF/view/index.jsp");
		
// 		<변경된방식>
//		ModelAndView mv = new ModelAndView("root.index");
//		mv.addObject("data", "Hello Spring MVC~!!");
//		return mv;
}
