/***
 * Name: Jamecia Moore
 * Date: October 15th, 2018
 * P13.3
 * CSCI 150
 */
import java.util.Scanner;

public class RecursionPractice {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

					// Initalize all variables
			String word = " ";
		Scanner in = new Scanner(System.in);
		// Prompt the user to enter a word
		System.out.println("Enter a word to reverse: ");
		word = in.next();
		// Display the word reversed
		System.out.println("\nWord reversed: ");
		System.out.println(reverse(word));
		
	}
	/**
	 * reverse - recursive method that reverses the string
	 * @param text
	 * @return 
	 */
	public static String  reverse(String text)
	{
		
	       if (text.length() > 1) 
	       {
	    	   return reverse(text.substring(1)) + text.substring(0, 1);
	            
	        } else {
	        	return text;
	        }
	    
	}

}
