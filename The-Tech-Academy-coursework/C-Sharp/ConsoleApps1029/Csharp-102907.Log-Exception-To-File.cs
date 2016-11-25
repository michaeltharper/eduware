using System;

//  7.  Create a Windows Console application that handles an exception 
//      by writing the important data from the exception to a log file on the local machine

namespace Csharp_102907
{
    class Csharp_102907
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n\n7. Write exception errors to a local log file\n------------------------------------");
            LogErrorToFile.writeError();
        }


        class LogErrorToFile
        {
            public static void writeError()
            {
                Console.WriteLine("\nBadCast called:\n");
                int anInt = 123;
                string s = "Some string";
                object obj = s;

                try
                {   // Invalid conversion; obj contains a string, not a numeric type.
                    anInt = (int)obj;
                }
                catch (System.InvalidCastException e)
                {
                    Console.WriteLine("\nSorry, no can do - the {0}", e.Message);

                    Console.WriteLine("--> Writing exception data to the log file \"ExLog.txt\" on the local machine\n");
                     // WriteAllText creates a file, writes the string to the file, and closes the file
                    // no need for Flush() or Close().
                    System.IO.File.WriteAllText(@"C:\tta\ExLog.txt", e.Message);
                }
                catch (System.IO.IOException e)
                {
                    Console.WriteLine("Sorry, there was an error reading. The message was: = {0}", e.Message);
                }
                finally
                {   // Report that the finally block is run, and show that the value of i has not been changed.
                    Console.WriteLine("Confirming anInt still equals {0}.\n", anInt);
                }
            }
        }
    }
}
