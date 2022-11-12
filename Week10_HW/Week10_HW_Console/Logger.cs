using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week10_HW_Console
{
    internal class Logger
    {
        public string ResponseStatusMessage { get; set; }
        public int ResponseStatusCode { get; set; }
        public DateTime ResponseStatusDate { get; set; }

        public static List<Logger> Logs = new List<Logger>();

        public Logger(string message, int code, DateTime responseStatusDate)
        {
            this.ResponseStatusMessage = message;
            this.ResponseStatusCode = code;
            this.ResponseStatusDate = responseStatusDate;
        }

        public static void ExportLogsToFile()
        {
            try
            {
                //Get the output path
                string outPath = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\Files\LogReport.txt";

                //If the file exists in the output path, delete it
                if (File.Exists(outPath))
                {
                    File.Delete(outPath);
                }

                //Streamwriter for writing the passed in logs
                using (StreamWriter sw = new StreamWriter(outPath, true))
                {
                    //For every log, write it out on a new line
                    foreach (var log in Logs)
                    {
                        sw.WriteLine($"{log.ResponseStatusMessage}, {log.ResponseStatusCode}, {log.ResponseStatusDate}");
                        sw.WriteLine("-----------------------------------------------------------------------------------");
                    }
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not write to LogReport", "ExportToFile()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ExportToFile()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ExportToFile()"));
                return;
            }
        }
    }
}
