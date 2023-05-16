package com.newlecture.web.controller.admin.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller("adminNoticeController")
@RequestMapping("/admin/board/notice/")
public class NoticeController {
	
	@RequestMapping("list")
	@ResponseBody
	public String list() {
		
		return "list";
	}

	
	@RequestMapping("reg")
	@ResponseBody
	public String reg(String title, String content, String category, 
			String[] foods, String food, MultipartFile file) {
			
			String fileName = file.getOriginalFilename();
			long size = file.getSize();
			
			System.out.printf("fileName:%s, fileSize:%d\n", fileName, size);
			
			
			return String.format("title : %s<br> content : %s<br> category : %s<br> "
				+ "foods : %s<br> food : %s<br>"
							, title, content, category, foods, food);
			
	
	}
	
	@RequestMapping("edit")
	@ResponseBody
	public String edit() {
		
		return "edit";
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public String delete() {
		
		return "delete";
	}
	
	
}
