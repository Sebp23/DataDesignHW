using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StructuredFileParser
{
    /// <summary>
    /// Class for generated errors
    /// </summary>
    internal class Error
    {
        public string Message { get; set; }
        public string MethodSource { get; set; }
        public static List<Error> ErrorList = new List<Error>();


        public Error(string message, string methodSource)
        {
            Message = message;
            MethodSource = methodSource;
        }

        public static void ReportErrors()
        {
            if (ErrorList.Count > 0)
            {
                foreach (var error in ErrorList)
                {
                    Console.WriteLine($"{error.Message}: {error.MethodSource}");
                }
            }
        }
    }
}
