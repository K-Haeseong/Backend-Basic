package ex1;

import java.sql.SQLException;

import com.newlecture.app.console.NoticeConsole;

public class Program5 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		NoticeConsole console = new NoticeConsole();
		//int page;
		EXIT : while(true)	{
			console.printNoticeList();
			int menu = console.inputNoticeMenu();
			
			switch (menu) {
			case 1:	// 상세조회
				break;
			case 2:	// 이전
				console.movePrevList();
				//page--;
				break;
			case 3:	// 다음
				console.moveNextListh();
				//page++;
				break;
			case 4:	// 글쓰기
				break;
			case 5:	// 검색
				console.inputSearchWord();
				break;
			case 6:	// 종료
				System.out.println("안녕히가세요.");
				break EXIT;
			
			default:
				System.out.println("메뉴는 1~4까지 숫자만 입력해주세요.");
				break;
			} // switch문 끝
		} //while문 끝
		
	}
	
}
