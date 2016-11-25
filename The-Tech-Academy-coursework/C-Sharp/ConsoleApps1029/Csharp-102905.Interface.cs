using System;

//  5. Create a Windows Console app demonstrating the use of an interface

namespace Csharp_102905
{
    class Csharp_102905
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n5. Interface demo\n------------------------------------");
            BigDrum drumbeat = new BigDrum();
            drumbeat.BangDrum();
        }


        interface Drum
        {
            void BangDrum();
        }


        // implement Drum interface

        class BigDrum : Drum
        {
            public void BangDrum()
            {
                Console.WriteLine("BangDrum called...");
            }
        }
    }
}