using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StructuredFileParser.Interfaces;

namespace StructuredFileParser.Engines
{
    //TODO move error checking out of Engine

    internal abstract class BaseEngine
    {
        //Small method to get the output path of the output file
        protected string GetOutputPath(string inputPath)
        {
            return inputPath.Replace(inputPath.Substring(inputPath.IndexOf(".")), "_out.txt");
        }

        /// <summary>
        /// Process the files based on the delimiter that was designated in the parser
        /// then print the newly processed files out to individual files named the same as the original with "_out.txt" appended to the end
        /// </summary>
        /// <param name="file">list of files generated and passed in by the parser</param>
        public virtual void ProcessFiles(IFile file)
        {
            //new list of string arrays since each line will come back as a string array (used for writing to the new file)
            List<string[]> lines = new List<string[]>();

            //the path that the generated file will be saved in
            string outPath = GetOutputPath(file.SourcePath);

            try
            {
                if (File.Exists(outPath))
                {
                    //delete the file if it already exists
                    File.Delete(outPath);
                }

                //Read the file using the pre-determined delimiter
                using (StreamReader sr = new StreamReader(file.SourcePath))
                {
                    //if the file has the valid delimiters
                    if (file.Delimiter == Constants.FileDelimiters.CSV || file.Delimiter == Constants.FileDelimiters.Pipe)
                    {
                        //get each line of the file
                        string line;
                        while ((line = sr.ReadLine()) != null)
                        {
                            //get a string array by splitting the line based on the pre-determined delimiter
                            var lineInfo = line.Split(file.Delimiter);
                            //add the string array to the list of lines
                            lines.Add(lineInfo);
                        }
                    }
                }

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
                }
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "BaseEngine.ProcessFiles()"));
            }
            
        }
    }
}
