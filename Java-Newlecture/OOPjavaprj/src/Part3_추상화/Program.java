package Part3_추상화;

public class Program {

	public static void main(String[] args) {
		
//		NewlecExam exam = new NewlecExam();
		
		ExamConsole console = new NewlecExamConsole();
		console.input();
		console.print();
		 
		
	}
		

}
