import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class ReadSudokuValuesIntoArray {
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
		printArray(sudoku);
		rowsAreValid(sudoku);
		columnsAreValid(sudoku);
		regionsAreValid(sudoku);
		puzzleIsValid(sudoku);
	}
	
	public static void printArray(int[][] array) {
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				System.out.print(array[i][j]+ " ");
			}
			System.out.println();
		}
	}
	
	public static boolean rowsAreValid(int[][] array) {
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array [i].length; j++) {
				for (int column = 0; column < array.length; column++){
					if (column !=j && array[i][column] == array [i][j]){
						return false;
					}
				}
			}
		}
		return true;
	}
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
	
	public static boolean regionsAreValid(int[][] array) {
		int r, c, column;
		r = c = column = 0;
		for (int row = (r/3) * 3; row < (r/3) * 3 + 3; row++) {
			for (int colum = (c/3) * 3; column < (c/3) * 3 + 3; column++){
				if (row !=r && column !=c && array[row][column] == array[r][c]) {
					return false;
				}
			}
		}
		return true;
	}
	public static boolean puzzleIsValid(int[][] array) {
		if (regionsAreValid(array) && rowsAreValid(array) && columnsAreValid(array)){
			return true;
		}
		else {
			return false;
		}
	}
}
