using System;

// <2>. Write a Windows console app that uses a derived class:   Pyram derives from Kube

namespace Csharp_102902
{         
    class Csharp_102902
    {
        static void Main(string[] args)
        { 
            Console.WriteLine("\n2. Create a derived class\n------------------------------------");

            Kube aKube = new Kube(3, 4, 5);
            int kubeVol = aKube.findVolume();
            Console.WriteLine("Cuboid volume: {0}", kubeVol);

            Pyram aPyram = new Pyram(3, 4, 5);
            int pyrVol = aPyram.findVolume();
            Console.WriteLine("Pyramid volume: {0}\n", pyrVol);

        }



        public class Kube
        {
            protected int h;
            protected int w;
            protected int l;

            public Kube(int height, int width, int length)
            {
                this.h = height;
                this.w = width;
                this.l = length;
            }

            public virtual int findVolume()
            {
                int vol = h * w * l;       // volume of CUBOID
                return vol;
            }
        }

        class Pyram : Kube
        {
            public Pyram(int height, int width, int length) : base(height, width, length)
            { }

            public override int findVolume()
            {
                int vol = (h * w * l) / 3;    // volume of PYRAMID
                return vol;
            }
        }
    }
}