using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Newtonsoft.Json;
using StructuredFileParser.Entities.JSON;
using StructuredFileParser.Interfaces;

namespace StructuredFileParser.Engines
{
    internal class JsonEngine : BaseEngine
    {
        /// <summary>
        /// An overridden version of the base ProcessFiles() method.
        /// This version will process JSON files by reading the entire JSON
        /// and then deserializing it into a Student object. It will then
        /// create an output ".txt" file with all the information from the JSON
        /// </summary>
        /// <param name="file"></param>
        public override void ProcessFiles(IFile file)
        {
            //Get the relative output path
            string outPath = GetOutputPath(file.SourcePath);

            if (File.Exists(outPath))
            {
                //delete the file if it already exists
                File.Delete(outPath);
            }

            try
            {
                //Read the source file
                using (StreamReader sr = new StreamReader(file.SourcePath))
                {
                    //Read the file in full to ensure that the JSON is completely deserialized and the student object is thus fully mapped
                    Student student = JsonConvert.DeserializeObject<Student>(sr.ReadToEnd());

                    //Write to the output file
                    using (StreamWriter sw = new StreamWriter(outPath, true))
                    {
                        //print all of the student's information in an organized manner
                        int phoneNumberCounter = 0;

                        sw.WriteLine($"Student Name: {student.FirstName} {student.LastName}");
                        sw.WriteLine($"Student Currently Enrolled: {(student.IsEnrolled ? "Yes" : "No")}");
                        sw.WriteLine($"Number of years enrolled: {student.YearsEnrolled}");
                        sw.WriteLine($"Primary Address: {student.FirstAddress.StreetAddress}, {student.FirstAddress.City}, {student.FirstAddress.State}, {student.FirstAddress.PostalCode}");

                        //If the student has a second address, print it, if not, print "None"
                        sw.WriteLine($"Secondary Address: {(student.SecondAddress != null ? $"{student.SecondAddress.StreetAddress}, {student.SecondAddress.City}, {student.SecondAddress.State}, {student.SecondAddress.PostalCode}" : "None")}");

                        //Print all the of the student's known phone numbers
                        sw.WriteLine($"Phone Number(s):");
                        foreach (var pn in student.PhoneNumbers)
                        {
                            phoneNumberCounter++;
                            sw.WriteLine($"Number {phoneNumberCounter}: {pn.Number} | {pn.Type} | Can contact: {(pn.CanContact ? "Yes" : "No")}");
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "JsonEngine.ProcessFiles()"));
            }
        }
    }
}
