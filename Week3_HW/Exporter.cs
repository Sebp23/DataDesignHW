using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week3_HW
{
    internal static class Exporter
    {
        public static void BeginExport(DoublyList roomResult)
        {
            //export the results to the bin directory of this project
            string myFile = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName}\Results.txt";
            if (File.Exists(myFile))
            {
                //delete the file if it already exists
                File.Delete(myFile);
            }
            
            //Begin writing to the file
            RunExport(roomResult, myFile);
        }

        private static void RunExport(DoublyList roomResult, string path)
        {
            StreamWriter sw = new StreamWriter(path, true);
            //Write the result of the room
            using (sw)
            {
                sw.WriteLine(roomResult.Info);
            }

            //if the next node in the list is not null, then export its info to the file
            if (roomResult.Next != null)
            {
                roomResult = roomResult.Next;
                RunExport(roomResult, path);
            }
            else
            {
                sw.Close();
                return;
            }
        }
    }
}
