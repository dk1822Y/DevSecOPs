import stackpackage.*;

public class Coordinate {
	
	private Integer row;
	private Integer column;
	
	public Coordinate (Integer row, Integer column) {
		this.row = row;
		this.column = column;
	}
	
	public void setRow(Integer row) {
		this.row = row;
	}
	
	public void setColumn(Integer column) {
		this.column = column;
	}
	
	public Integer getRow() {
		return row;
	}
	
	public Integer getColumn() {
		return column;
	}
	
	public String toString() {
		return "<"+row.toString()+","+column.toString()+">";
	}
}
