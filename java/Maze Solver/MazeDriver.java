import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import stackpackage.*;

/**
A program used to solve text based mazes
Author: Khalid Diriye
*/ 

public class MazeDriver {
	public static void main(String[] args) {
		GoodStack stack = new GoodStack();
		int[][] maze = null;
		//Reads the file
		File input = new File("maze1.txt");
		Scanner sc = null;
		printArray(maze);
		maze = initialize(maze, input, sc, stack);
		Coordinate coord = firstMove(stack, maze);
		stack.push(coord);
 		boolean done = false;
		while (!done) {
			try {
				coord = search(stack, maze);
				if (coord == null) {
					stack.pop();
				} else {
					stack.push(coord);
				}
			} 
			catch (ArrayIndexOutOfBoundsException aioobe) {	
				done = true;
				showPath(stack);
				System.out.println("maze solving completed");
			}
		}
	}	
	/**
	 * Initializes the maze
	 */
	public static int[][] initialize(int[][] maze, File input, Scanner sc, GoodStack stack) {
		try {
			sc = new Scanner(input);
			int rows = sc.nextInt();
			int columns = sc.nextInt();
			maze = new int[rows][columns];
			int count = 0;
			int i = 0, j = 0;
			int rowCount = 0;
			while (sc.hasNextInt() && count < (rows * columns)) {
				maze[i][j] = sc.nextInt();
				if (rowCount == maze.length - 1) {
					count++;
					i++;
					j = 0;
					rowCount = 0;
				} else {
					j++;
					count++;
					rowCount++;
				}
			}

			Coordinate coord = new Coordinate(sc.nextInt(), sc.nextInt());
			stack.push(coord);
			maze[coord.getRow()][coord.getColumn()] = 1;
		}	
		catch (FileNotFoundException fnfe) {
			System.out.println("File not Found");
			System.exit(1);
		}
		return maze;
	}
	
	/**
	 * Executes the first move in solving the maze
	 */
	public static Coordinate firstMove(GoodStack stack, int[][] maze) {
		Coordinate coord = (Coordinate) stack.peek();
		int i = coord.getRow();
		int j = coord.getColumn();
		//look north
		//i > 0 is North-specific so that it 
		//does not create an ArrayIndexOutOfBounds Exception
		//[i-1][j] is North-specific
		if (i > 0 && maze[i-1][j] == 0) {
			maze[i-1][j] = 1;
			return new Coordinate(i - 1, j);
		}
		//look east
		//j < maze.length-1 is East-specific so that it 
		//does not create an ArrayIndexOutOfBounds Exception
		//[i][j+1] is East-specific
		if (j < maze.length-1 && maze[i][j+1] == 0) {
			maze[i][j+1] = 1;
			return new Coordinate(i, j + 1);
		}
		//look south
		//i < maze.length-1 is South-specific so that it 
		//does not create an ArrayIndexOutOfBounds Exception
		//[i+1][j] is South-specific
		if (i < maze.length-1 && maze[i+1][j] == 0) {
			maze[i+1][j] = 1;
			return new Coordinate(i + 1, j);
		}
		//look west
		//j > 0 is West-specific so that it 
		//does not create an ArrayIndexOutOfBounds Exception
		//[i][j-1] is West-specific
		if (j > 0 && maze[i][j-1] == 0) {
			maze[i][j-1] = 1;
			return new Coordinate(i, j - 1);
		}
		
		//last line
		else {
			return null;
		}
	}
	/**
	 * Solves the rest of the maze by checking each move
	 */
	public static Coordinate search(GoodStack stack, int[][] maze) {
		Coordinate coord = (Coordinate) stack.peek();
		int i = coord.getRow();
		int j = coord.getColumn();
		//look north
		//[i-1][j] is North-specific
		if (maze[i-1][j] == 0) {
			maze[i-1][j] = 1;
			return new Coordinate(i - 1, j);
		}	
		// look east
		//[i][j+1] is East-specific
		if (maze[i][j+1] == 0) {
			maze[i][j+1] = 1;
			return new Coordinate(i, j + 1);
		}
		// look south
		//[i+1][j] is South-specific
		if (maze[i+1][j] == 0) {
			maze[i+1][j] = 1;
			return new Coordinate(i + 1, j);
		}
		// look west
		//[i][j-1] is West-specific
			if (maze[i][j-1] == 0) {
				maze[i][j-1] = 1;
				return new Coordinate(i, j - 1);
			}
		//last line
		else {
		return null;
		}	
		
	}
	/**
	Prints out two dimensional array
	*/	
	public static void printArray(int[][] array) {
			for (int y = 0; y < array.length; y++) {
				for (int x = 0; x < array[y].length; x++) {
					System.out.print(array[y][x]+ " ");
				}
				System.out.println();
			}
		}	
	/**
	 * Pops stack and pushes it into a new stack
	 */
	public static void showPath(GoodStack stack) {
		GoodStack stackShowPath = new GoodStack();
		//pops stack and dumps it into a new stack called stackShowPath
		while (!stack.isEmpty()) {
			stackShowPath.push(stack.pop());
		}
		while (!stackShowPath.isEmpty()) {
			System.out.println(stackShowPath.pop());
		}
	}
}
