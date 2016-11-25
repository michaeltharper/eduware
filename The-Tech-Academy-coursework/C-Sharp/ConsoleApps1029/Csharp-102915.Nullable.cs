using System;

// <15>. Create a Windows Console application using a nullable types

namespace Csharp_102915
{
    class Csharp_102915
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n15. Create and use nullable types\n-----------------------------------");
            NullMe.doNulls();
        }

        class NullMe
        {
            public static void doNulls()
            {
                int? num1 = null;
                int? num2 = 45;
                double? num3 = new double?();
                double? num4 = 3.14157;
                bool? boolval = new bool?();

                // display values
                Console.WriteLine("\nShow nullable variables:");
                Console.WriteLine("doNulls: {0}, {1}, {2}, {3}", num1, num2, num3, num4);
                Console.WriteLine("Nullable boolean variable 'boolval': {0}\n", boolval);
                Console.WriteLine("Demo 'Null Coalescing Operator':");
                num3 = num1 ?? 5.34;
                Console.WriteLine("Value of num3: {0}", num3); // writes 5.34
                num3 = num2 ?? 5.34;
                Console.WriteLine("Value of num3: {0}\n", num3); // writes 45

            }
        }

    }
}
