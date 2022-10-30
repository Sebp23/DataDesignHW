using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week8_HW
{
    internal class Error
    {
        public string Message { get; set; }
        public string MethodSource { get; set; }
        public static List<Error> ErrorList = new List<Error>();

        public Error(string message, string methodSource)
        {
            this.Message = message;
            this.MethodSource = methodSource;
        }

        //Write out every error collected during the process
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
