import java.util.ArrayList;
import java.text.DecimalFormat;
/**
A Student class that maintains course information
via the instance variables specified
Author: Khalid Diriye
*/
public class Student {
	private String id;
	private String firstName;
	private String lastName;
	private String major;
	private String minor;
	private ArrayList<Course> coursesTaken;
	private ArrayList<Course> currentSemesterCourses;
	private double gpa;
	
	/**
		Course constructor
	*/
	public Student(String id, String firstName, String lastName, String major, String minor, ArrayList<Course> coursesTaken, ArrayList<Course> currentSemesterCourses) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.major = major;
		this.minor = minor;
		this.coursesTaken = coursesTaken;
		this.currentSemesterCourses = currentSemesterCourses;
	}
	/**
	*This method calculates a student's gpa by iterating through the list of courses taken and obtaining the number of credits and the letter grades
	*for each course.  It uses the letterGradeConverter() method to give the numeric value for a given letter grade.  E.g., if the letter
	*grade is "A", it returns 4, etc.
	* @return GPA 
	*/
	public double calculateGpa() {
		double Gpa = 0;
		int totalCourses = coursesTaken.size();
		for (int i = 0; i < coursesTaken.size(); i++) {
			Gpa += letterGradeConverter(coursesTaken.get(i).letterGrade.charAt(0));
		}
		Gpa = Gpa/totalCourses;
		return Gpa;
	}
	/**
	*This method returns the numeric value for a letter grade passed in as a parameter.
	*E.g., if the letter
	*grade is "A", it returns 4, etc.
	* @param (char letterGrade) character letter given
	* @return zero if grade letter is not A,B,C,D, or F
	*/
	public int letterGradeConverter(char letterGrade) {
		int grade_val=0;
		if (letterGrade == 'A') {
			grade_val = 4;
		}
		else if (letterGrade == 'B') {
			grade_val = 3;
		}
		else if (letterGrade == 'C') {
			grade_val = 2;
		}
		else if (letterGrade == 'D') {
			grade_val = 1;
		}
		else if (letterGrade == 'F') {
			grade_val = 0;
		}
			return grade_val;
	}	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}	
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}	
	
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getMajor() {
		return major;
	}

	public void setMajor(String Major) {
		this.major = major;
	}
	
	public String getMinor() {
		return minor;
	}

	public void setMinor(String Minor) {
		this.minor = minor;
	}
	
	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}
	
	public ArrayList<Course> getCoursesTaken() {
		return coursesTaken;
	}

	public void setCoursesTaken(ArrayList<Course> coursesTaken) {
		this.coursesTaken = coursesTaken;
	}	
	
	public ArrayList<Course> getCurrentSemesterCourses() {
		return currentSemesterCourses;
	}

	public void setCurrentSemesterCourses(ArrayList<Course> currentSemesterCourses) {
		this.currentSemesterCourses = currentSemesterCourses;
	}	

	/**
	*This method copies all of the courses in the list of courses that a student is currently taking into
	*the list of courses that a student has already taken.  It then calculates the students gpa based on
	*the expanded list of coureses that a student has already taken.  The list of courses that a student is currently 
	*taken is then cleared
	*/
	public void merge() {
		for (int i=0; i < currentSemesterCourses.size(); i++) {
			coursesTaken.add(currentSemesterCourses.get(i));
		}
		double newGPA = calculateGpa();
		setGpa(newGPA);
	}	
	/*An already implemented toString() method */
	public String toString() {
		DecimalFormat formatter = new DecimalFormat("###.##");
		String gpaString = formatter.format(gpa);
		return "id: " + id + "\n" + "First Name: " + firstName + "\n" + "Last Name: " + lastName + "\n" + "Major: " + major + "\n" + "Minor: " + minor +
		"\n" +"Gpa: " + gpaString;
	}
}	