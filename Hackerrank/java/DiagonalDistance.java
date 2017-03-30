import java.io.*;
import java.util.*;

public class DiagonalDistance {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner in = new Scanner(System.in);

        // pop first item as size of array
        int edge = in.nextInt();

        int[][] gred = new int[edge][edge];
        
        for (int i = 0; i < edge; i++){
             for (int k = 0; k < edge; k++){          
                gred[i][k] = in.nextInt();
                // System.out.println("got " + gred[i][k]);
            }
         };
        
        int primDiag = gred[0][0] + gred[1][1] + gred[2][2];
        int secDiag = gred[2][0] + gred[1][1] + gred[0][2];

        int absdiff = Math.abs(primDiag - secDiag);
        System.out.println(absdiff);

    }
}