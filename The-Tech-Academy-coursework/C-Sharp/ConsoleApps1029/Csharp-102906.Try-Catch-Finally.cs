using System;

//  6. Create a Windows Console application demonstrating a try/catch/finally block

namespace Csharp_102906
{
    class Csharp_102906
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n\n6. Use of a try/catch/finally block\n------------------------------------");
            TryCast.BadCast();  // uh oh
        }


        class TryCast
        {
            public static void BadCast()
            {
                Console.WriteLine("\nRunning BacCast(): \n");
                int anInt = 123;
                string s = "Some string";
                object obj = s;

                try
                {   // Invalid conversion; obj contains a string, not a numeric type.
                    anInt = (int)obj;
                }
                catch (System.InvalidCastException e)
                {
                    Console.WriteLine("Sorry, no can do. Apparently, the {0}", e.Message);
                }
                catch (System.IO.IOException e)
                {
                    Console.WriteLine("Sorry, there was an error reading. The message was: = {0}", e.Message);
                }
                finally
                {   // Report that the finally block is run, and show that the value of i has not been changed.
                    Console.WriteLine("Verify anInt is unchanged:  i = {0}.\n", anInt);
                }
            }
        }
    }
}
