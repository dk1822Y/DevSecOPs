import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import stackpackage.*;

/**
 * Maze Solver 
 * Program finds a path through a 2D maze
 * @author Khalid Diriye
 */
public class MazeSolver {

    public static void main(String[] args) {
        GoodStack stack = new GoodStack();
        Scanner file = new Scanner(System.in);
        System.out.println("Enter maze filename: ");
        String filename = file.nextLine();
        File input = new File(filename);
        Scanner fileScanner = null;
	int[][] mazeArray = null;
        mazeArray = readMaze(mazeArray, fileScanner, input, stack);
        Coordinate coord = starting_Coord(stack, mazeArray);
        stack.push(coord);
	boolean finished = false;

        while (!finished) {
            try {
                coord = pathFinder(stack, mazeArray);
                if (coord == null) {
                    stack.pop();
                } else {
                    stack.push(coord);
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                finished = true;
                pathStack(stack);
                System.out.println("MazeSolver complete!");
            }
        }
    }

    /**
     * This method generates the maze by storing the rows and columns into an
     * array called mazeArray
     * @param mazeArray - initializes array called mazeArray
     * @param fileScanner - initializes Scanner called fileScanner
     * @param input - File named input
     * @param stack - initializes GoodStack called stack
     * @return mazeArray
     */
    public static int[][] readMaze(int[][] mazeArray, Scanner fileScanner, File input, GoodStack stack) {
        try {
            fileScanner = new Scanner(input);
            int rows = fileScanner.nextInt();
            int columns = fileScanner.nextInt();
            mazeArray = new int[rows][columns];
            int counter = 0;
            int row_Size = 0, column_Size = 0;
            int rowCount = 0;
            while (fileScanner.hasNextInt() && counter < (rows * columns)) {
                mazeArray[row_Size][column_Size] = fileScanner.nextInt();
                if (rowCount == mazeArray.length - 1) {
                    counter++;
                    row_Size++;
                    column_Size = 0;
                    rowCount = 0;
                } else {
                    column_Size++;
                    counter++;
                    rowCount++;
                }
            }

            Coordinate coord = new Coordinate(fileScanner.nextInt(), fileScanner.nextInt());
            stack.push(coord);
            mazeArray[coord.getRow()][coord.getColumn()] = 1;
        } catch (FileNotFoundException e) {
            System.out.println("Whoa slow down there! Could not find file!");
            System.exit(1);
        }
        return mazeArray;
    }

    /**
     * This method will print out the maze
     * @param mazeArray
     */
    public static void printMazeArray(int[][] mazeArray) {
        for (int y = 0; y < mazeArray.length; y++) {
            for (int x = 0; x < mazeArray[y].length; x++) {
                System.out.print(mazeArray[y][x] + " ");
            }
            System.out.println();
        }
    }

    /**
     * This method pops stack and pushes it into a new stack
     * @param stack
     */
    public static void pathStack(GoodStack stack) {
        GoodStack sPathStack = new GoodStack();
        //stack is pop and the information then goes into sPathStack
        while (!stack.isEmpty()) {
            sPathStack.push(stack.pop());
        }
        while (!sPathStack.isEmpty()) {
            System.out.println(sPathStack.pop());
        }
    }

    /**
     * This method will start the maze by going through the first point
     * starting_Coord
     * @param stack initializes GoodStack called stack
     * @param mazeArray initializes array called mazeArray
     * @return null
     */
    public static Coordinate starting_Coord(GoodStack stack, int[][] mazeArray) {
        Coordinate coord = (Coordinate) stack.peek();
        int row_Size = coord.getRow();
        int column_Size = coord.getColumn();
        //Look North
        if (row_Size > 0 && mazeArray[row_Size - 1][column_Size] == 0) {
            mazeArray[row_Size - 1][column_Size] = 1;
            return new Coordinate(row_Size - 1, column_Size);
        }
	//Look South
        if (row_Size < mazeArray.length - 1 && mazeArray[row_Size + 1][column_Size] == 0) {
            mazeArray[row_Size + 1][column_Size] = 1;
            return new Coordinate(row_Size + 1, column_Size);
        }
        //Look East
        if (column_Size < mazeArray.length - 1 && mazeArray[row_Size][column_Size + 1] == 0) {
            mazeArray[row_Size][column_Size + 1] = 1;
            return new Coordinate(row_Size, column_Size + 1);
        }
        //Look West
        if (column_Size > 0 && mazeArray[row_Size][column_Size - 1] == 0) {
            mazeArray[row_Size][column_Size - 1] = 1;
            return new Coordinate(row_Size, column_Size - 1);
        } else {
            return null;
        }
    }

    /**
     * This method will solve the remaining portion of the maze by going through
     * each coordinate
     * @param stack initializes GoodStack called stack
     * @param mazeArray initializes array called mazeArray
     * @return null
     */
    public static Coordinate pathFinder(GoodStack stack, int[][] mazeArray) {
        Coordinate coord = (Coordinate) stack.peek();
        int row_Size = coord.getRow();
        int column_Size = coord.getColumn();
        //Look North
        if (mazeArray[row_Size - 1][column_Size] == 0) {
            mazeArray[row_Size - 1][column_Size] = 1;
            Coordinate next_Coord = new Coordinate(row_Size - 1, column_Size);
            return next_Coord;
        }
	//Look South
        if (mazeArray[row_Size + 1][column_Size] == 0) {
            mazeArray[row_Size + 1][column_Size] = 1;
            Coordinate next_Coord = new Coordinate(row_Size + 1, column_Size);
            return next_Coord;
        }
        //Look East
        if (mazeArray[row_Size][column_Size + 1] == 0) {
            mazeArray[row_Size][column_Size + 1] = 1;
            Coordinate next_Coord = new Coordinate(row_Size, column_Size + 1);
            return next_Coord;
        }
        //Look West
        if (mazeArray[row_Size][column_Size - 1] == 0) {
            mazeArray[row_Size][column_Size - 1] = 1;
            Coordinate next_Coord = new Coordinate(row_Size, column_Size - 1);
            return next_Coord;
        } 
	else {
            return null;
        }

    }
}
