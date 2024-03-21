/**
A Course class that maintains course information
via the instance variables specified
Author: Khalid Diriye
*/

public class Course {
	String courseDesignator;
	String courseNumber;
	String courseDescription;
	int credits;
	String section;
	String letterGrade;
	
	/**
		Course constructor
	*/
	public Course(String courseDesignator, String courseNumber,String courseDescription, int credits, String section, String letterGrade) {
		this.courseDesignator = courseDesignator;
		this.courseNumber = courseNumber;
		this.courseDescription = courseDescription;
		this.credits = credits;
		this.section = section;
		this.letterGrade = letterGrade;
	}

	public String getCourseDesignator() {
		return courseDesignator;
	}

	public void setCourseDesignator(String courseDesignator) {
		this.courseDesignator = courseDesignator;
	}	
	
	public String getCourseNumer() {
		return courseNumber;
	}

	public void setCourseNumber(String courseNumber) {
		this.courseNumber = courseNumber;
	}
	
	public String getCourseDescription() {
		return courseDescription;
	}

	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}
	
	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}	
	
	public String getSection() {
		return  section;
	}

	public void setSection(String section) {
		this. section =  section;
	}	
	
	public String getLetterGrade() {
		return letterGrade;
	}

	public void setLetterGrade(String letterGrade) {
		this.letterGrade = letterGrade;
	}	
	
	public String toString() {
		return "Course Designator: " + courseDesignator + "\n" + "Course Number: " + courseNumber + "\n" + "Course Description: " + courseDescription + "\n" + "Credits: " + credits + "\n" + "Section: " + section + "\n" + "Letter Grade: " + letterGrade;
	}
}