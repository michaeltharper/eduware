using System;

// <12>.  Create a Windows Console application that shows the creation and use of a delegate.
//          per: tutorialspoint.com/csharp/csharp_delegates.htm

namespace Csharp_102912
{
    class Csharp_102912
    {
        delegate int NumberChanger(int n);

        static void Main(string[] args)
        {
            //create delegate instances
            NumberChanger nc1 = new NumberChanger(AddNum);
            NumberChanger nc2 = new NumberChanger(MultNum);

            //calling the methods using the delegate objects
            nc1(22);
            Console.WriteLine("\nValue of Num: {0}", getNum());
            nc2(44);
            Console.WriteLine("Value of Num: {0}\n", getNum());
            //Console.ReadKey();
        }


        static int num = 10;

        public static int AddNum(int p)
        {   
            num += p;
            return num;
        }

        public static int MultNum(int q)
        {
            num *= q;
            return num;
        }

        public static int getNum()
        {
            return num;
        }
    }
}