using System;

// <11> Create a Windows Console application that shows differences between an abstract class and an interface, 
//      in terms of creation and use of each

namespace Csharp_102911
{
    class Csharp_102911
    {
        static void Main(string[] args)
        {   Console.WriteLine("\n11. Differences between an abstract class and an interface         \n------------------------------------");

            // Instantiate using an Abstract class
            DerivedClass o = new DerivedClass();
            o.AbstractMethod();
            Console.WriteLine("- using an abstract class: w = {0}", o.W);

            // Instantiate using an Interface class
            Point pt = new Point(2, 3);
            Console.Write("- using an interface class: Point is " + pt.GetType() + "\n");
            pt.PrintPoint(pt);
        }

        // ABSTRACT CLASS
        abstract class BaseClass   // Abstract class
        {
            protected int _w = 100;
            public abstract void AbstractMethod();   // Abstract method
            public abstract int W { get; }
        }

        class DerivedClass : BaseClass
        {
            public override void AbstractMethod()
            {
                _w++;
            }

            public override int W   // overriding property
            {
                get
                {
                    return _w + 10;
                }
            }
        }



        interface IPoint
        {
            // Property signatures:
            int x
            {
                get;
                set;
            }

            int y
            {
                get;
                set;
            }
        }


        class Point : IPoint
        {
            // Fields:
            private int _x;
            private int _y;

            // Constructor:
            public Point(int x, int y)
            {
                _x = x;
                _y = y;
            }

            // Property implementation:
            public int x
            {
                get
                {
                    return _x;
                }
                set
                {
                    _x = value;
                }
            }

            public int y
            {
                get
                {
                    return _y;
                }
                set
                {
                    _y = value;
                }
            }

            public void PrintPoint(Point p)
            {
                Console.WriteLine("x={0}, y={1}", p.x, p.y);
            }
        }
    }
}
