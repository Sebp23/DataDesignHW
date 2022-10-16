using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week6HW
{
    /// <summary>
    /// The object that represents the SqlFile that will be sent to the engine
    /// </summary>
    internal class SqlFile
    {
        public string Delimiter { get; set; }
        public string SourcePath { get; set; }

        public SqlFile(string sourcePath)
        {
            //In this case, the delimiter will always be '|'
            Delimiter = "|";
            this.SourcePath = sourcePath;
        }
    }
}
