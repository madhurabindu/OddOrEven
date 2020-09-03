using Microsoft.VisualStudio.TestPlatform.TestHost;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Diagnostics;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestEvenPositive1()
        {
            Debug.Assert(ConsoleApp3.Program.IsNumberEven(10));
        }
        [TestMethod]
        public void TestEvenPositive2()
        {
            Debug.Assert(ConsoleApp3.Program.IsNumberEven(32));
        }
        [TestMethod]
        public void TestEvenNegative1()
        {
            Debug.Assert(ConsoleApp3.Program.IsNumberEven(11) == false);
        }

        [TestMethod]
        public void TestEvenNegative2()
        {
            Debug.Assert(ConsoleApp3.Program.IsNumberEven(115) == false);

        }
        [TestMethod]
        public void TestOddPositive1()
        {
            Debug.Assert(ConsoleApp3.Program.IsNumberOdd(13));

        }

        [TestMethod]
        public void TestOddNegative()
        {
            Debug.Assert(ConsoleApp3.Program.IsNumberOdd(110) == false);

        }

        [TestMethod]
        public void TestMain()
        {
            ConsoleApp3.Program.Main(null);

        }

    }
}
