using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using StructuredFileParser.Entities.XML;
using StructuredFileParser.Interfaces;

namespace StructuredFileParser.Engines
{
    internal class XmlEngine : BaseEngine
    {
        /// <summary>
        /// An overridden version of the base ProcessFiles method.
        /// This version will take an XML file and then deserialize it
        /// and print all the information an output ".txt" file.
        /// </summary>
        /// <param name="file"></param>
        public override void ProcessFiles(IFile file)
        {
            //Get the output relative path
            string outPath = GetOutputPath(file.SourcePath);

            try
            {
                if (File.Exists(outPath))
                {
                    //delete the file if it already exists
                    File.Delete(outPath);
                }

                //Open the source file
                using (var fs = File.Open(file.SourcePath, FileMode.Open))
                {
                    //create the serializer object which acts as a middle man (like an API). Let it know that we are deserializing into a Market type object
                    XmlSerializer serializer = new XmlSerializer(typeof(Market));

                    //Create the list of market items that are taken and deserialized with the serializer object
                    var marketInventory = (Market)serializer?.Deserialize(fs);

                    //Write to the output file
                    using (StreamWriter sw = new StreamWriter(outPath, true))
                    {
                        for (int i = 0; i <= marketInventory.Items.Count - 1; i++)
                        {
                            sw.WriteLine($"Market Item #{i + 1}: {marketInventory.Items[i].Name} | {marketInventory.Items[i].Price}/{marketInventory.Items[i].UnitOfMeasurement}");
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "XmlEngine.ProcessFiles()"));
            }
        }
    }
}
