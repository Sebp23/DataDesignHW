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

        public Error(string message, string methodSource)
        {
            Message = message;
            MethodSource = methodSource;
        }
    }
}
