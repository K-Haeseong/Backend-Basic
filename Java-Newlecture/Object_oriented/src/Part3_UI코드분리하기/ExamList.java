package Part3_UI코드분리하기;


public class ExamList {

	private Exam[] exams;
	private int current;

	
	public Exam get(int i) {

		return this.exams[i];
	}
	
	
	
	public void add(Exam exam) {

		 Exam[] exams = this.exams;
			int size = this.current;
			
			if (this.exams.length == this.current) {
				Exam[] temp = new Exam[size + 5];
				for (int i = 0; i < size; i++)
					temp[i] = exams[i];
				exams = temp;
			}
			
			exams[current] = exam;
			current++;
	}

	
	

	public ExamList() {

		exams = new Exam[3];
		current = 0;
	}

	
	
	
	public int size() {

		return current;
	}

}
