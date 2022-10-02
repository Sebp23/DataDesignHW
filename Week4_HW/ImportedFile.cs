using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Week4_HW.Interfaces;

namespace Week4_HW
{
    /// <summary>
    /// Class for files imported 
    /// </summary>
    internal class ImportedFile : IFile
    {
        public string Extension { get; set; }
        public string Delimiter { get; set; }
        public string SourcePath { get; set; }

        public ImportedFile(string extension, string delimiter, string path)
        {
            Extension = extension;
            Delimiter = delimiter;
            SourcePath = path;
        }
    }
}
