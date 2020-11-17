import java.util.Scanner;
import java.util.Stack;



public class SentenceReverser {
	public static void main(String[] args) {
	

		Stack<String> stack = new Stack<String>();
		Stack<String> stack2 = new Stack<String>();
		Scanner in = new Scanner(System.in);
		String a = "Mary had a little lamb. Its fleece was white as snow.";
		
		System.out.println("                  The sentence entered    \n");
		System.out.println(a);
		System.out.println("\n                 The sentence reversed    \n");
	
		a = a.replace(".", "");
		String[] sort =a.split(" ");
	
		for (int i = 0; i < 5; i++)
	{
		
	if (i == 4)
	{
		stack.push(sort[4].toUpperCase().charAt(0) + sort[4].substring(1));
	}
	else if (i == 0)
	{
		stack.push(sort[i].toLowerCase().charAt(0) + sort[i].substring(1) +".");
	}
	else
	{
		stack.push(sort[i].toLowerCase().charAt(0) + sort[i].substring(1));
	
	}
	}
		// here
		for (int i = 5; i < 11; i++)
		{
		
			if (i == 10)
			{
			stack2.push(sort[10].toUpperCase().charAt(0) + sort[10].substring(1));
			}
			else if (i == 5)
			{
				stack2.push(sort[i].toLowerCase().charAt(0) + sort[i].substring(1) +".");
			}
			else
			{
			stack2.push(sort[i].toLowerCase().charAt(0) + sort[i].substring(1));
			}
			
		}
		while (stack.empty() == false)
		{
		System.out.print(stack.pop() + " ");
	
	
	}
		while (stack2.empty() == false)
		{
		System.out.print(stack2.pop() + " ");
	
	}
	}
}