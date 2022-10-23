using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week7_HW
{
    internal class CharacterFile
    {
        public string Delimiter { get; set; }
        public string SourcePath { get; set; }

        public CharacterFile(string sourcePath)
        {
            //In this case, the delimiter will always be ','
            Delimiter = ",";
            this.SourcePath = sourcePath;
        }
    }
}
