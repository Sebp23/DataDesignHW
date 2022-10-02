using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week4_HW.Interfaces
{
    /// <summary>
    /// Interface for files
    /// </summary>
    internal interface IFile
    {
        public string Extension { get; set; }
        public string Delimiter { get; set; }
        public string SourcePath { get; set; }
    }
}
