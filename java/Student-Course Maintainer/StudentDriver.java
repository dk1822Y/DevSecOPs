import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class StudentDriver {
	
	public static void main(String[] args) {
		ArrayList<Course> coursesTaken = new ArrayList<Course>();
		ArrayList<Course> currentSemesterCourses = new ArrayList<Course>();
		Scanner fileScanner = null;
		Scanner fileNameScanner =  null; 

		coursesTaken = readFile(true, coursesTaken, fileNameScanner, fileScanner);
		currentSemesterCourses = readFile(false, currentSemesterCourses,  fileNameScanner, fileScanner);
		Student student = new Student("00001234", "Joe", "Student", "Anthropology", "Biology", coursesTaken, currentSemesterCourses);
	
		student.merge();
		for (Course myCourse : student.getCoursesTaken()) {
			System.out.println(myCourse);
			System.out.println();
		}
		System.out.println();
		System.out.println(student);
	
	}
	
	public static ArrayList<Course> readFile(boolean taken, ArrayList<Course> courses, Scanner fileNameScanner, Scanner fileScanner) {
		Scanner lineScanner = null;
		try {
			fileNameScanner = new Scanner(System.in);
			if (taken) {
				System.out.println("Please enter the name of the file with the courses taken: ");
			} else {
				System.out.println("Please enter the name of the file with the current courses: ");
			}
			String fileName = fileNameScanner.next();
			File file = new File(fileName);
			fileScanner = new Scanner(file);
			
			while (fileScanner.hasNextLine()) {
				String line = fileScanner.nextLine();
				lineScanner = new Scanner(line).useDelimiter("#");
				lineScanner.useDelimiter("#");
				String courseDesignator = null;
				String courseNumber = null;
				String courseDescription = null;
				String credits = null;
				String section = null;
				String letterGrade = null;
				
				if (lineScanner.hasNext()) {
					courseDesignator = lineScanner.next().trim();
				}
				if (lineScanner.hasNext()) {
					courseNumber = lineScanner.next().trim();
				}	
				if (lineScanner.hasNext()) {
					courseDescription = lineScanner.next().trim();
				}
				if (lineScanner.hasNext()) {
					credits = lineScanner.next().trim();
				}
				if (lineScanner.hasNext()) {
					section = lineScanner.next().trim();
				}
				if (lineScanner.hasNext()) {
					letterGrade = lineScanner.next().trim();
				}
				int numCredits = Integer.parseInt(credits);
				Course course = new Course(courseDesignator, courseNumber, courseDescription, numCredits, section, letterGrade);
				courses.add(course);
			}
			//fileNameScanner.close();
			fileScanner.close();
		}	
		catch (FileNotFoundException fnfe) {
			System.out.println("File not found. Exiting.");
			System.exit(1);
		}
		lineScanner.close();		
		return courses;
	}	
}	