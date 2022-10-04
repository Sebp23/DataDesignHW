using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StructuredFileParser.Interfaces;

namespace StructuredFileParser
{
    /// <summary>
    /// Class for files imported 
    /// </summary>
    internal class ImportedFile : IFile
    {
        public string Extension { get; set; }
        public string? Delimiter { get; set; } = null;
        public string SourcePath { get; set; }

        public ImportedFile(string extension, string path, string? delimiter = null)
        {
            Extension = extension;
            Delimiter = delimiter;
            SourcePath = path;
        }
    }
}
