using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Week4_HW.Interfaces;

namespace Week4_HW
{
    internal class Parser
    {
        //public string path { get; set; }
        public List<string> SourcePaths { get; set; }
        public List<Error> Errors { get; set; }

        //Constructor
        public Parser(List<string> _paths)
        {
            //List of the paths for each file that needs to be parsed
            SourcePaths = new List<string>();
            foreach (var _path in _paths)
            {
                SourcePaths.Add($@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\Files\{_path}");
            }

            //list of errors for parser
            Errors = new List<Error>();

            //Get all the files and determine their extensions (relevant for the engine)
            GetAllFiles();
        }

        /// <summary>
        /// This will use the SourcePaths list to find all the files requested
        /// it will then use the Constants class to help determine the extension of the file
        /// it will then create an object from the ImportedFile class, using the Constants class to get the extension
        /// and delimiter of the file. It will then add the file to a list of files which will be passed
        /// to the engine for processing at the end of the method.
        /// </summary>
        public void GetAllFiles()
        {
            //list that will hold parsed files
            List<IFile> files = new List<IFile>();

            foreach (var path in SourcePaths)
            {
                //if the file is a ".csv"
                if (path.Substring(path.IndexOf('.')) == Constants.FileExtensions.CSV)
                {
                    //create an object out of the file with ".csv" extension and "," delimiter
                    ImportedFile myFile = new ImportedFile(Constants.FileExtensions.CSV, Constants.FileDelimiters.CSV, path);
                    files.Add(myFile);
                }
                //if the file uses pipe as a delimiter (".txt")
                else if (path.Substring(path.IndexOf('.')) == Constants.FileExtensions.Pipe)
                {
                    //create an object out of the file with a ".txt" extension and "|" delimiter
                    ImportedFile myFile = new ImportedFile(Constants.FileExtensions.Pipe, Constants.FileDelimiters.Pipe, path);
                    files.Add(myFile);
                }
                //if the file is not ".txt" or ".csv"
                else
                {
                    //Create a new error using Error class and then add it to the Parser's list of errors
                    Errors.Add(new Error("File has invalid file extension", "GetAllFiles()"));
                }
            }

            if (Errors.Count > 0)
            {
                Console.WriteLine("------------------------------------");
                Console.WriteLine("Parser encountered errors:");

                //Print all errors to the console
                foreach (var error in Errors)
                {
                    Console.WriteLine($"{error.Message}: {error.MethodSource}");
                    return;
                }
            }
            else
            {
                Console.WriteLine("Parser encountered no errors!");

                //Send the list of files to the engine for processing
                Engine.ProcessFiles(files);
            }
        }
    }
}
