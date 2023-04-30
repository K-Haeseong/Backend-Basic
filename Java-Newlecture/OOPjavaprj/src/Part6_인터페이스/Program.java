package Part6_인터페이스;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Scanner;

public class Program {

	public static void main(String[] args) throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		
		FileInputStream fis = new FileInputStream("src/Part6_인터페이스/setting.txt");
		Scanner sc = new Scanner(fis);
		String className =  sc.nextLine();
		sc.close();
		fis.close();
		
		
		Class clazz = Class.forName(className);
		A a = new A(); // A a = A.class.newInstance();
		X x = (X) clazz.newInstance(); // X x = (X) clazz.getDeclaredConstructor().newInstance();
		  
		a.setX(x); 
		a.print();
		 
		

	}

}
