using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week6HW
{
    /// <summary>
    /// This is the parser that will find the file and turn into an object for the engine to do what it needs to with it
    /// </summary>
    internal class Parser
    {
        public string SourcePath { get; set; }
        public string RelativePath { get; set; }
        public List<Error> Errors { get; set; }


        public Parser()
        {
            //relative path of where the file will be collected
            RelativePath = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\files";
            
            Errors = new List<Error>();
        }

        /// <summary>
        /// Read the file, get the necessary information (delimiter and path) and create an object out of it for the engine
        /// </summary>
        /// <param name="fileName">name of the file that it is reading</param>
        /// <returns>the SqlFile object</returns>
        public SqlFile PrepareFileForEngine(string fileName)
        {
            //Get the relative path of the file
            var fileToParse = $@"{RelativePath}\{fileName}";

            //Make sure it has the proper extension (only .txt in this case)
            if (fileToParse.Substring(fileToParse.IndexOf('.')) == ".txt")
            {
                //create an object of the file and return it
                SqlFile file = new SqlFile(fileToParse);

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
