import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        
        Scanner in = new Scanner(System.in);
        int stringLength = Integer.parseInt(in.nextLine());
        String theString = in.nextLine();
        int offset = Integer.parseInt(in.nextLine());
        System.out.println("stringLength: " + stringLength + ", theString: " + theString + ", offset: " + offset);     
        
        char[] msgArray = theString.toCharArray();
        for(int i=0; i < stringLength; i++){
          System.out.println("i starts " + msgArray[i]);
          if (isAlpha(msgArray[i])) {
            msgArray[i] = crypit(msgArray[i], offset);
            System.out.println("i encrypted: " + msgArray[i]  + "\n\n");
          }
          else { System.out.println("not encrypted.\n\n");}
        }
    }
    
    private static boolean isAlpha(char s){
        String tmp = s + "";
        String pattern= "^[a-zA-Z]+$";
        // System.out.println("tmp.matches(): " +  tmp.matches(pattern) );
        return tmp.matches(pattern);
    }

    private static char crypit(char c, int offset){
        System.out.println("offset is: " + offset);
        System.out.println("offset %26: " + offset %26);
        int offsetLocal = offset %26;
        
        int foo = (int) c;
        System.out.println("char-as-int: " + foo);
        foo = (foo + offsetLocal)%26;
        System.out.println("foo + offsetLocal %26: " + foo);     
        
        foo = foo %26;
        System.out.println("foo %26: " + foo);  
        
        return (char) foo;   
    }

}