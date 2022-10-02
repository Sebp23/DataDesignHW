using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week4_HW
{
    /// <summary>
    /// Static class that contains the valid file extensions and delimiters
    /// </summary>
    internal static class Constants
    {
        public static class FileExtensions
        {
            public static string CSV => ".csv";
            public static string Pipe => ".txt";
        }

        public static class FileDelimiters
        {
            public static string CSV => ",";
            public static string Pipe => "|";
        }
    }
}
