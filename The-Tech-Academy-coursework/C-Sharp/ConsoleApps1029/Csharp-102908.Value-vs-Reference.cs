using System;

//  8.  Create a Windows Console application that demonstrates value types vs reference types

namespace Csharp_102908
{
    class Csharp_102908
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n\n8. Value types vs reference types\n------------------------------------");
            ValOrRef.CopyByType();
        }

        public class ValOrRef
        {
            public static void CopyByType()
            {
                Console.WriteLine("\nCOPY VALUE TYPE - copy creates new memory location");
                int anInt = 4;
                Console.WriteLine("anInt = " + anInt);
                int anotherInt = anInt;
                Console.WriteLine("anotherInt = " + anotherInt);
                Console.WriteLine("> modify the copy, original does not change:");
                anotherInt = anotherInt * 2;
                Console.WriteLine("anotherInt = " + anotherInt);
                Console.WriteLine("anInt = " + anInt);

                Console.WriteLine("\nCOPY REFERENCE TYPE - copy creates pointer to original memory location");
                int[] anArray = new int[1];
                anArray[0] = 6;
                Console.WriteLine("anArray[0] = " + anArray[0]);
                int[] anotherArray = anArray;
                Console.WriteLine("anotherArray[0] = " + anotherArray[0]);
                Console.WriteLine("> modify the copy and the original changes too:");
                anotherArray[0] = 7;
                Console.WriteLine("anotherArray[0] = " + anotherArray[0]);
                Console.WriteLine("anArray[0] = " + anArray[0] + "\n");
            }
        }
    }
}
