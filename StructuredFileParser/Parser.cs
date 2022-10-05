using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StructuredFileParser.Engines;
using StructuredFileParser.Interfaces;

namespace StructuredFileParser
{
    //TODO Change error handling to use try/catches
    internal class Parser
    {
        public List<string> SourcePaths { get; set; }
        public string RelativePath { get; set; }
        public List<Error> Errors { get; set; }

        //Constructor
        public Parser()
        {
            //List of the paths for each file that needs to be parsed
            SourcePaths = new List<string>();
            RelativePath = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\Files";

            //list of errors for parser
            Errors = new List<Error>();

            SendFilesToEngine();
        }

        /// <summary>
        /// Check the extension of the files imported from relative paths and send them to the proper engine
        /// </summary>
        public void SendFilesToEngine()
        {
            BaseEngine engine;
            var filesToSend = GetAllFiles();

            //Check to see what the file type is, and send to the proper engine
            foreach (var file in filesToSend)
            {
                if (file.Extension == Constants.FileExtensions.CSV || file.Extension == Constants.FileExtensions.Pipe)
                {
                    engine = new DelimiterEngine();
                    engine.ProcessFiles(file);
                }
                else if (file.Extension == Constants.FileExtensions.JSON)
                {
                    engine = new JsonEngine();
                    engine.ProcessFiles(file);
                }
                else if (file.Extension == Constants.FileExtensions.XML)
                {
                    engine = new XmlEngine();
                    engine.ProcessFiles(file);
                }
            }
        }

        /// <summary>
        /// This will use the SourcePaths list to find all the files requested
        /// it will then use the Constants class to help determine the extension of the file
        /// it will then create an object from the ImportedFile class, using the Constants class to get the extension
        /// and delimiter of the file. It will then add the file to a list of files which will be passed
        /// to the engine for processing at the end of the method.
        /// </summary>
        public List<IFile> GetAllFiles()
        {
            //list that will hold parsed files
            List<IFile> files = new List<IFile>();

            SourcePaths = Directory.GetFiles(RelativePath).Where(f => !f.Contains("_out")).ToList();

            foreach (var path in SourcePaths)
            {
                //if the file is a ".csv"
                if (path.Substring(path.IndexOf('.')) == Constants.FileExtensions.CSV)
                {
                    //create an object out of the file with ".csv" extension and "," delimiter
                    ImportedFile myFile = new ImportedFile(Constants.FileExtensions.CSV, path, Constants.FileDelimiters.CSV);
                    files.Add(myFile);
                }
                //if the file uses pipe as a delimiter (".txt")
                else if (path.Substring(path.IndexOf('.')) == Constants.FileExtensions.Pipe)
                {
                    //create an object out of the file with a ".txt" extension and "|" delimiter
                    ImportedFile myFile = new ImportedFile(Constants.FileExtensions.Pipe, path, Constants.FileDelimiters.Pipe);
                    files.Add(myFile);
                }
                //if the file is of type ".json" (no delimiter)
                else if (path.Substring(path.IndexOf('.')) == Constants.FileExtensions.JSON)
                {
                    ImportedFile myFile = new ImportedFile(Constants.FileExtensions.JSON, path);
                    files.Add(myFile);
                }
                //if the file is of type ".xml" (no delimiter)
                else if (path.Substring(path.IndexOf('.')) == Constants.FileExtensions.XML)
                {
                    ImportedFile myFile = new ImportedFile(Constants.FileExtensions.XML, path);
                    files.Add(myFile);
                }
                //if the file is not ".txt" or ".csv"
                else
                {
                    //Create a new error using Error class and then add it to the Parser's list of errors
                    Error.ErrorList.Add(new Error($"File '{path.Substring(path.IndexOf("Files"))}' has invalid file extension", "Parser.GetAllFiles()"));
                }
            }

            //if (Errors.Count > 0)
            //{
            //    Console.WriteLine("Parser encountered errors:");

            //    //Print all errors to the console
            //    foreach (var error in Errors)
            //    {
            //        Console.WriteLine($"{error.Message}: {error.MethodSource}");
            //    }
            //}
            //else
            //{
            //    Console.WriteLine("Parser encountered no errors!");
            //}
            
            return files;
        }
    }
}
