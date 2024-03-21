package stackpackage;

import java.util.LinkedList;

public class GoodStack {
	private LinkedList stack;
	
	public GoodStack() {
		stack = new LinkedList();
	}	
	
	public boolean isEmpty() {
		return stack.size() == 0;
	}	
	
	public Object pop() {
		if (isEmpty()) {
			throw new EmptyStackException("Empty Stack Exception");
		}
		return stack.pop();
	}	
	
	public void push(Object obj) {
		stack.push(obj);
	}

	public Object peek() {
		return stack.peek();
	}	
}	