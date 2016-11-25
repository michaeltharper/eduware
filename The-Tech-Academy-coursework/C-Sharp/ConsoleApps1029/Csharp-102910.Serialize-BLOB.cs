using System;
using System.IO;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;

// <10>.    Create a Windows Console application that serializes a BLOB to a text file, 
//          and converts it back to its original form.
//          Serialized file will be:  ./bin/Debug/cars.bin

namespace Csharp_102910
{
    class Csharp_102910
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n10. Serialize a BLOB to a text file, and convert back to its original form.\n------------------------------------");
            Car.Serio();
        }


        [Serializable()]
        public class Car
        {
            public string carMaker { get; set; }
            public string carModel { get; set; }
            public float carPrice { get; set; }

            public Car(string maker, string model, int price)
            {
                carMaker = maker;
                carModel = model;
                carPrice = price;
            }

            public static void Serio()
            {
                // Create a List object to be serialized
                var carlist = new List<Car>();
                carlist.Add(new Car("Maserati", "Ghibli", 65600));
                carlist.Add(new Car("Audi", "A7", 68800));
                carlist.Add(new Car("Tesla", "Model S70", 71200));
                carlist.Add(new Car("Mercedes", "CLS", 74850));
                carlist.Add(new Car("BMW", "6-Series", 77600));
                carlist.Add(new Car("Porche", "Panamera", 78100));
                carlist.Add(new Car("Ferrari", "T Hardtop", 198000));


                // Serialize the List object and write it to the file 'cars.bin'
                try
                {
                    using (Stream stream = File.Open("cars.bin", FileMode.Create))
                    {
                        BinaryFormatter bin = new BinaryFormatter();
                        bin.Serialize(stream, carlist);
                    }
                }
                catch (IOException)
                { }


                // Deserialize the file 'cars.bin' and parse the object to the Console.
                try
                {
                    using (Stream stream = File.Open("cars.bin", FileMode.Open))
                    {
                        BinaryFormatter bin = new BinaryFormatter();

                        var carlist2 = (List<Car>)bin.Deserialize(stream);
                        foreach (Car Car in carlist2)
                        {
                            Console.WriteLine("Make, model and price:    {0} {1}, ${2}",
                            Car.carMaker, Car.carModel, Car.carPrice);
                        }
                    }
                }
                catch (IOException)
                { }

            }   // end Serio
        }       // end Car

    }
}
