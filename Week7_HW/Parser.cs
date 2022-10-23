using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week7_HW
{
    internal class Parser
    {
        public string SourcePath { get; set; }
        public string RelativePath { get; set; }
        public List<Error> Errors { get; set; }


        public Parser()
        {
            //relative path of where the file will be collected
            RelativePath = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\Files";

            Errors = new List<Error>();
        }

        /// <summary>
        /// Read the file, get the necessary information (delimiter and path) and create an object out of it for the engine
        /// </summary>
        /// <param name="fileName">name of the file that it is reading</param>
        /// <returns>the SqlFile object</returns>
        public CharacterFile PrepareFileForEngine(string fileName)
        {
            //Get the relative path of the file
            var fileToParse = $@"{RelativePath}\{fileName}";

            //Make sure it has the proper extension (only .csv in this case)
            if (fileToParse.Substring(fileToParse.IndexOf('.')) == ".csv")
            {
                //create an object of the file and return it
                CharacterFile file = new CharacterFile(fileToParse);

                return file;
            }
            else
            {
                Error.ErrorList.Add(new Error($"{fileName} is invalid and cannot be parsed", "PrepareFileForEngine()"));
                return null;
            }
        }
    }
}
