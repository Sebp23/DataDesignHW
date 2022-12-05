using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InClassFinal
{
    internal class Error
    {
        public static List<Error> Errors = new List<Error>();
        public string Message { get; set; }
        public string MethodSource { get; set; }

        public Error(string message, string methodSource)
        {
            Message = message;
            MethodSource = methodSource;
        }

        public static void ReportErrors()
        {
            if (Errors.Count > 0)
            {
                Console.WriteLine($"Encountered {Errors.Count} errors!");
                foreach (var error in Errors)
                {
                    Console.WriteLine($"{error.Message} -> {error.MethodSource}");
                }
            }
            else
            {
                Console.WriteLine("Encountered 0 errors!");
            }
        }
    }
}
