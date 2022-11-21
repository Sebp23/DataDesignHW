using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week11_HW_Forms.Services
{
    internal class Errors
    {
        public string Message { get; set; }
        public string MethodSource { get; set; }
        public static List<Errors> ErrorList = new List<Errors>();

        public Errors(string message, string methodSource)
        {
            this.Message = message;
            this.MethodSource = methodSource;
        }
    }
}
