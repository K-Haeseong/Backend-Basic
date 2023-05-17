package com.newlecture.web.controller.admin.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller("adminNoticeController")
@RequestMapping("/admin/board/notice/")
public class NoticeController {
	
	@Autowired
	private ServletContext ctx;
	
	@RequestMapping("list")
	public String list() {
		
		return "admin.board.notice.list";
	}

	@GetMapping("reg")
	public String reg() {
		return "admin.board.notice.reg";
	}
	
	@PostMapping("reg")
	public String reg(String title, String content, String category, 
			String[] foods, String food, MultipartFile[] files) throws IllegalStateException, IOException {
			
			for (MultipartFile file : files) {
				String fileName = file.getOriginalFilename();
				long size = file.getSize();
				System.out.printf("fileName:%s, fileSize:%d\n", fileName, size);
				
				String webPath = "/static/upload";
				String realPath = ctx.getRealPath(webPath);
				System.out.printf("realPath : %s\n", realPath);
				// 경로설정
				File savePath = new File(realPath);
				if(!savePath.exists())
					savePath.mkdirs();
				// 파일저장
				realPath += File.separator + fileName;
				File saveFile = new File(realPath);
				file.transferTo(saveFile);
			}
			
			return "admin.board.notice.list";
	}
	
	@RequestMapping("edit")
	public String edit() {
		
		return "admin.board.notice.edit";
	}
	
	@RequestMapping("delete")
	public String delete() {
		
		return "admin.board.notice.delete";
	}
	
	
}
