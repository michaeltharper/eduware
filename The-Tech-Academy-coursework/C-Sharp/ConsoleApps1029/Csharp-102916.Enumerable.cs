using System;
using System.Collections;
using System.Linq;

// <16>. Create a Windows Console application using an Enumerable type
 
namespace Csharp_102916
{
    class Csharp_102916
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n16. Create and use an Enumerable\n------------------------------------");

            Person[] peopleArray = new Person[3]
            {   new Person("Jaron", "Lanier"),
                new Person("Mike", "Jones"),
                new Person("Ross", "Hansen"),
            };

            // Return each person object, print their first and last name:
            People peopleList = new People(peopleArray);
            foreach (Person pr in peopleList)
                Console.WriteLine(pr.firstName + " " + pr.lastName);

            // Returns the number of elements in a sequence.            
            // Count<TSource>(IEnumerable<TSource>)
            int ct = peopleArray.Count();
            Console.WriteLine("There are {0} people in the list.", ct);

            //Return the element at a specified index in a sequence.
            //ElementAt<TSource>(IEnumerable<TSource>, Int32)	
            string firstper = peopleArray.ElementAt(0).firstName;
            Console.WriteLine("First person's first name is {0}\n", firstper);
        }



        // Simple business object.
        public class Person
        {
            public Person(string fName, string lName)
            {
                this.firstName = fName;
                this.lastName = lName;
            }

            public string firstName;
            public string lastName;
        }

        // Collection of Person objects. 
        // This class implements IEnumerable so that it can be used
        // with ForEach syntax.
        public class People : IEnumerable
        {
            private Person[] _people;
            public People(Person[] pArray)
            {
                _people = new Person[pArray.Length];

                for (int i = 0; i < pArray.Length; i++)
                {
                    _people[i] = pArray[i];
                }
            }

            // Implementation for the GetEnumerator method.
            IEnumerator IEnumerable.GetEnumerator()
            {
                return (IEnumerator)GetEnumerator();
            }

            public PeopleEnum GetEnumerator()
            {
                return new PeopleEnum(_people);
            }
        }

        // When you implement IEnumerable, you must also implement IEnumerator.
        public class PeopleEnum : IEnumerator
        {
            public Person[] _people;

            // Enumerators are positioned before the first element
            // until the first MoveNext() call.
            int position = -1;

            public PeopleEnum(Person[] list)
            {
                _people = list;
            }

            public bool MoveNext()
            {
                position++;
                return (position < _people.Length);
            }

            public void Reset()
            {
                position = -1;
            }

            object IEnumerator.Current
            {
                get
                {
                    return Current;
                }
            }

            public Person Current
            {
                get
                {
                    try
                    {
                        return _people[position];
                    }
                    catch (IndexOutOfRangeException)
                    {
                        throw new InvalidOperationException();
                    }
                }
            }
        }


        /* This code produces output similar to the following:
         *
         * Jaron Lanier
         * Mike Jones
         * Ross Hansen
         *
         */
    }
}

