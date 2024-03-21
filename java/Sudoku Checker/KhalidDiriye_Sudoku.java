import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

/**
Sudoku Checker Program
Reads and checks in values from a file and initializes a 2-dimensional (9x9) array with those values.
Author: Khalid Diriye
*/ 

public class KhalidDiriyeProgram2 {
	public static void main(String[] args) {
		int[][] sudoku = new int[9][9];
		Scanner sc = null;
		try {
			int i = 0, j = 0, count = 1;
			
			sc = new Scanner(new File("validsudoku1.txt")); //validsudoku1.txt
			while (sc.hasNextInt()) {	
				if ((count % 9) == 0) {
					sudoku[i][j] = sc.nextInt();
					count++;
					i++;
					j = 0;
				} else {
					sudoku[i][j++] = sc.nextInt();
					count++;
				}	
			}
		}	
		catch (FileNotFoundException fnfe) {
			System.out.println("No file found");
			System.exit(1);
		}
		finally {
			sc.close();
		}
		//Execute methods
		printArray(sudoku);
		rowsAreValid(sudoku);
		columnsAreValid(sudoku);
		regionsAreValid(sudoku);
		puzzleIsValid(sudoku);
	}
	/**
	* This method prints the array
	* @param (int[][] array) initializes an array
	*/
	public static void printArray(int[][] array) {
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				System.out.print(array[i][j]+ " ");
			}
			System.out.println();
		}
	}
	
	/**
	* This method checks the rows in the array
	* @param (int[][] array) initializes an array
	* @return returns true or false if rows are valid
	*/
	public static boolean rowsAreValid(int[][] array) {
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array [i].length; j++) {
				for (int col = 0; col < array.length; col++){
					//if  it's true row/column/region is already present. 
					if (col !=j && array[i][col] == array [i][j]){
						return false;
					}
				}
			}
		}
		return true;
	}
	
	/**
	* This method checks the columns in the array
	* @param (int[][] array) initializes an array
	* @return returns true or false if columns are valid
	*/
	public static boolean columnsAreValid(int[][] array){
		for (int i = 0; i < array.length; i++){
			for (int j = 0; j < array[i].length; j++){
				for (int row = 0; row < array.length; row++){
					if (row != i && array[row][j] == array[i][j]){
						return false;
					}
				}
			}
		}
		return true;
	}
	/**
	* This method checks regions 0-8. Hence, row = (i/3)*3 + {0,1,2} (0 or 1 or 2) / 3 = 0 because (3 or 4 or 5) / 3 = 1 (6 or 7 or 8) / 3 = 2
	* Same goes for columns
	* @param (int[][] array) initializes an array
	* @return returns true or false if all regions are valid
	*/
	public static boolean regionsAreValid(int[][] array) {
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				for (int row = (i / 3) * 3 ; row < (i / 3)* 3 + 3 ; row++) {
					for (int col =(j / 3) * 3; col < (j / 3) * 3 + 3; col++){
						if (row !=i && col !=j && array [row][col] == array [i][j]){
							return false;
						}
					}
				}
			}
		}
		return true;
	}
	/**
	* This method checks all methods if they return true else it returns false 
	* @param (int[][] array) initializes an array
	* @return returns true or false if Sudoku is valid
	*/
	public static boolean puzzleIsValid(int[][] array) {
		if (regionsAreValid(array) && rowsAreValid(array) && columnsAreValid(array)){
			return true;
		}
		else {
			return false;
		}
	}
}
