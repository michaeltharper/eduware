using System;

// <13>. Create a Windows Console application using a multicast delegate.


namespace Csharp_102913
{
    class Csharp_102913
    {
        delegate int NumberChanger(int n);

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

        static void Main(string[] args)
        {
            //create delegate instances
            NumberChanger nc;
            NumberChanger nc1 = new NumberChanger(AddNum);
            NumberChanger nc2 = new NumberChanger(MultNum);
            nc = nc1;
            nc += nc2;

            //calling multicast
            nc(15);
            Console.WriteLine("\nThe value of Num: {0}\n", getNum());
        }
    }
}