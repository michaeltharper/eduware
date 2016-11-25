using System;

//  4. Create a Windows Console application demonstrating the use of a sealed class

namespace Csharp_102904
{
    class Csharp_102904
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n4. Sealed class\n------------------------------------");
            Firstclass fc = new Firstclass();
            fc.foo();
            fc.baz();
            Secondclass sc = new Secondclass();
            sc.foo();
            sc.baz();
            Thirdclass tc = new Thirdclass();
            tc.foo();
            tc.baz();  // prints 'Secondclass.baz reached'
        }

        class Firstclass
        {
            public virtual void foo() { Console.WriteLine("Firstclass.foo called"); }
            public virtual void baz() { Console.WriteLine("Firstclass.baz called"); }
        }
        class Secondclass : Firstclass
        {
            public override void foo() { Console.WriteLine("Secondclass.foo called"); }
            // sealed class
            sealed public override void baz() { Console.WriteLine("Secondclass.baz called"); }
        }
        class Thirdclass : Secondclass
        {
            public override void foo() { Console.WriteLine("Thirdclass.foo called"); }
            /*  uncomment method below to throw compile error: 
                cannot override inherited member 'Secondclass.baz()' because it is sealed:  */

            // public override void baz() { Console.WriteLine("Thirdclass.baz called"); }   
        }
    }
}