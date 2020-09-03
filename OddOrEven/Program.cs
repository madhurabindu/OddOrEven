using System;

namespace ConsoleApp3
{
    public class Program
    {
        public static bool IsNumberEven(int num)
        {
            return num % 2==0;
        }

        public static bool IsNumberOdd(int num)
        {
            return num % 2 != 0;
        }
        public static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
