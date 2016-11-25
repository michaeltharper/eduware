using System;

// <1>. Write a Windows console app that shows the difference between overloading methods and overriding methods.

namespace Csharp_102901
{
    class Csharp_102901
    {
        static void Main(string[] args)
        {
            // <1>. Show the difference between overloading methods and overriding methods.
            Console.WriteLine("\n1. Method overloading and overriding\n------------------------------------");

            // Overloading allows multiple method signatures to invoke different method defs:
            Oload.IntOrString(5);
            Oload.IntOrString("The Larch");

            // Overriding is the extension of a parent class by a child class:
            Parent p = new Parent();
            p.Foo(8);

            Child c = new Child();
            c.Foo();
            c.Foo(12);
            c.Foo("The Larch");
        }



        // props and methods

        class Oload
        {
            public static void IntOrString(int x)
            {
                Console.WriteLine("IntOrString() got the int: {0}.", x);
            }

            public static void IntOrString(string x)
            {
                Console.WriteLine("IntOrString() got the string: \"{0}\".\n", x);
            }
        }

        class Parent
        {
            public void Foo(int x)
            {
                Console.WriteLine("Parent.Foo got the int {0}.", x);
            }
        }


        class Child : Parent
        {
            public void Foo()
            {
                Console.WriteLine("Child.Foo  got no args and didn't mind.");
            }
            public new void Foo(int x)
            {
                Console.WriteLine("Child.Foo  got the int {0}.", x);
            }
            public void Foo(string x)
            {
                Console.WriteLine("Child.Foo  got the string \"{0}\".\n", x);
            }
        }
    }
}
