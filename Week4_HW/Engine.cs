using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Week4_HW.Interfaces;

namespace Week4_HW
{
    internal static class Engine
    {
        //List of errors generated in the Engine
        public static List<Error> Errors { get; set; }

        /// <summary>
        /// Process the files based on the delimiter that was designated in the parser
        /// then print the newly processed files out to individual files named the same as the original with "_out.txt" appended to the end
        /// </summary>
        /// <param name="_files">list of files generated and passed in by the parser</param>
        public static void ProcessFiles(List<IFile> _files)
        {
            //list for possible generated errors
            Errors = new List<Error>();

            //for every parsed file, basically
            foreach (var _file in _files)
            {
                //new list of string arrays since each line will come back as a string array (used for writing to the new file)
                List<string[]> lines = new List<string[]>();

                bool isValid = false;

                //the path that the generated file will be saved in
                string outPath = _file.SourcePath.Replace(_file.SourcePath.Substring(_file.SourcePath.IndexOf(".")), "_out.txt");

                if (File.Exists(outPath))
                {
                    //delete the file if it already exists
                    File.Delete(outPath);
                }

                //Read the file using the pre-determined delimiter
                using (StreamReader sr = new StreamReader(_file.SourcePath))
                {
                    //if the file has the valid delimiters
                    if (_file.Delimiter == Constants.FileDelimiters.CSV || _file.Delimiter == Constants.FileDelimiters.Pipe)
                    {
                        isValid = true;

                        //get each line of the file
                        string line;
                        while ((line = sr.ReadLine()) != null)
                        {
                            //get a string array by splitting the line based on the pre-determined delimiter
                            var lineInfo = line.Split(_file.Delimiter);
                            //add the string array to the list of lines
                            lines.Add(lineInfo);
                        }
                    }
                    //if the file doesn't have one of the valid delimiter, generate an error and add to the list of errors
                    else
                    {
                        isValid = false;
                        Errors.Add(new Error("File has invalid delimiters", $"ProcessFiles({_file.SourcePath})"));
                    }

                    //dispose and close the StreamReader
                    sr.Dispose();
                    sr.Close();
                }

                //if the file is valid
                if (isValid)
                {
                    using (StreamWriter sw = new StreamWriter(outPath, true))
                    {
                        //for every generated string array, write out the line number and each separated value found on the line
                        foreach (var lineInfo in lines)
                        {
                            sw.Write($"Line#{lines.IndexOf(lineInfo) + 1}: ");
                            for (int i = 0; i <= lineInfo.Length - 1; i++)
                            {
                                sw.Write($"Field#{i + 1}={lineInfo[i]}");

                                //check to see if this is the last value or not
                                if (i < lineInfo.Length - 1)
                                {
                                    sw.Write(" ==> ");
                                }
                                else if (i == lineInfo.Length - 1)
                                {
                                    sw.Write(Environment.NewLine);
                                }
                            }
                        }

                        //dispose and close the StreamWriter object
                        sw.Dispose();
                        sw.Close();
                    }
                }
                //if file is invalid, skip the file
                else
                {
                    continue;
                }
            }

            //if there are any errors, print them out to console
            if (Errors.Count > 0)
            {
                Console.WriteLine("------------------------------------");
                Console.WriteLine("Engine encountered errors:");
                foreach (var error in Errors)
                {
                    Console.WriteLine($"{error.Message} in Method: {error.MethodSource}");
                }
            }
            else
            {
                Console.WriteLine("Engine encountered no errors!");
            }
        }
    }
}
