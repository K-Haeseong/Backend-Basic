import Part3_UI코드분리하기.Exam;


// <재사용이란 무엇인가?> 
// * 소스코드를 재사용 X, 바이너리(배포코드) 배포 파일을 재사용 하는 것
//
// <재사용 하기 위한 방법>
// 1. 컴파일 => Exam.class
// 2. 압축 => Exam.zip
// 3. 파일명 바꾸기 => 확장자명을 jar(자바를 위한 압축파일)로 바꾸기
// 
// ---------배포-------------
//
// * 이클립스는 위 단계를 지원하는 기능이 존재
// * 재사용할 패키지/클래스가 있는 프로젝트에서 Export -> java -> JAR.file
//
// <배포파일 사용방법>
// 1. 사용할 프로젝트에서 build path 선택
// 2. class path에서 해당 jar파일 선택
// 3. import 후 사용하기

public class Program {

	public static void main(String[] args) {

//		NewlecExam exam = new NewlecExam();
//		exam.setEng(10);
//		exam.setKor(10);
//		exam.setMath(10);
//		exam.setCom(10);
		
		
		NewlecExam exam = new NewlecExam(1,1,1,1);
		
		System.out.println(exam.total());
		System.out.println(exam.avg());
		
	}

}
