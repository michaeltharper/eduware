import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

//  https://www.hackerrank.com/challenges/points-on-a-line

public class PointsOnALine {

    static boolean checkarr(int[] arr) {
         
        int checknum = arr[0];
        boolean isLine = true;
        
        for (int i = 0; i < arr.length; i++){
            if (arr[i] != checknum){
                isLine = false;
            }
        }
        return isLine;
    }
    

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        int n = in.nextInt();
        int[] firstnums = new int[n];
        int[] secnums = new int[n];
        
    
        for(int a0 = 0; a0 < n; a0++){
            firstnums[a0] = in.nextInt();
            secnums[a0] = in.nextInt();
            //System.out.println("firstnums[a0]: " + firstnums[a0] + ", secnums[a0]:" + secnums[a0] + "\n");
        }
        
        Boolean firstres = checkarr(firstnums);
        Boolean secres = checkarr(secnums);
        
        if (firstres || secres) System.out.print("YES");
        else System.out.println("NO");
    }
}