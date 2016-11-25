using System;

// <14>. Create a Windows Console application using a struct

namespace Csharp_102914
{
    class Csharp_102914
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n\n14. Create and use a struct:\n-----------------------------------");
            Article article1 = new Article();   // Declare article1 of type Article 
            Article article2 = new Article();   // Declare article2 of type Article 

            // Article 1 specification
            article1.getValues("The Compleat Formatter",
            "Andy Dandy", 6495407);

            // Article 2 specification
            article2.getValues("Code in Motion",
            "Alice Dallas", 6495700);

            // print Article1 info
            article1.display();
            // print Article2 info
            article2.display();
        }


        struct Article
        {
            private string title;
            private string author;
            private int article_id;
            public void getValues(string t, string a, int id)
            {
                title = t;
                author = a;
                article_id = id;
            }
            public void display()
            {
                Console.WriteLine("Title : {0}", title);
                Console.WriteLine("Author : {0}", author);
                Console.WriteLine("Article_id :{0}\n", article_id);
            }
        }


    }
}
