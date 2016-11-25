using System;

//  3. Create a Windows Console application demonstrating each of the following access modifiers: 
//      public, protected, internal, private, protected, internal. 
//  9. Create a Windows Console application demonstrating the use of the keyword 'this'. 

namespace Csharp_102903
{
    class Csharp_102903
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n3. Access modifiers: public, protected, internal, private, protected internal\n------------------------------------");
            Modder aMod = new Modder();
            aMod.setProps(6, 4, 2, 10, "red");
            Console.WriteLine("\nProperties are: " + aMod.getProps() + "\n");
        }

        class Modder
        {
            public int height;
            protected int width;
            internal int length;
            private int weight;
            protected internal string color;

            public Modder()
            {
                height = 0;
                width = 0;
                length = 0;
                weight = 0;
                color = "clear";
            }

            public string getProps()
            {
                string theProps = "height " + height;
                theProps += ", width " + width;
                theProps += ", length " + length;
                theProps += ", weight " + weight;
                theProps += ", color " + color;
                return theProps;
            }

            // <9>. Use of the keyword ‘this’ to bind args to instance variables
            public void setProps(int h, int wd, int l, int wt, string c)
            {
                this.height = h;
                this.width = wt;
                this.length = l;
                this.weight = wt;
                this.color = c;
            }
        }

    }
}
