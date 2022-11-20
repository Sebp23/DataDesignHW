using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using Week11_HW_Forms.Services;

namespace Week11_HW_Forms
{
    internal static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            //On application exit, export the logs to a file.
            Application.ApplicationExit += new EventHandler(Logger.ExportLogsToFile);
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MonsterCharts());
        }
    }
}
