using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;
using Week11_HW_Forms.Models;
using Week11_HW_Forms.Services;
using Newtonsoft.Json;
using System.IO;

namespace Week11_HW_Forms
{
    public partial class MonsterCharts : Form
    {
        Service service = new Service();

        public MonsterCharts()
        {
            InitializeComponent();
        }

        /// <summary>
        /// on load, clear the charts and panel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Form1_Load(object sender, EventArgs e)
        {
            ClearAllCharts();
        }

        /// <summary>
        /// Chart 1 on click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ChartOneButton(object sender, EventArgs e)
        {
            try
            {
                //clear previous charts and panel
                ClearAllCharts();

                //add chart 1
                panel1.Controls.Add(chartOne);

                //title and size config
                chartOne.Titles.Add("Monsters by State");
                chartOne.Size = new Size(panel1.Width, panel1.Height);

                //add area and configure
                var chartArea1 = chartOne.ChartAreas.Add("chartArea1");
                chartArea1.AxisX.Title = "State";
                chartArea1.AxisY.Title = "Monster Count";
                chartArea1.AxisX.TitleAlignment = StringAlignment.Center;
                chartArea1.AxisY.TitleAlignment = StringAlignment.Center;
                chartArea1.AxisX.Interval = 1;

                //add series for data
                var chartSeries1 = chartOne.Series.Add("Number of Monsters");
                chartSeries1.ChartType = SeriesChartType.Column;
                chartSeries1.IsValueShownAsLabel = true;
                chartSeries1.BorderWidth = 3;

                //get data
                var models = service.GetChartOne().Result;

                //add data to chart
                foreach (var model in models)
                {
                    chartSeries1.Points.AddXY(model.Location, model.Monster_Count);
                }
            }
            catch (IOException exc)
            {
                ReportError(new Errors($"Could not generate Chart 1 (make sure API is running)", "ChartOneButton()"));
                return;
            }
            catch (NullReferenceException exc)
            {

                ReportError(new Errors(exc.Message + " (make sure API is running)", "ChartOneButton()"));
                return;
            }
            catch (Exception exc)
            {
                ReportError(new Errors(exc.Message + " (make sure API is running)", "ChartOneButton()"));
                return;
            }
        }

        /// <summary>
        /// create chart 2 on click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ChartTwoButton(object sender, EventArgs e)
        {
            try
            {
                //clear previous charts and panel
                ClearAllCharts();

                //add chart 2
                panel1.Controls.Add(chartTwo);

                //title and size config
                chartTwo.Titles.Add("Monsters by HP");
                chartTwo.Size = new Size(panel1.Width, panel1.Height);

                //add and configure the area
                var chartArea2 = chartTwo.ChartAreas.Add("chartArea2");
                chartArea2.AxisX.Title = "HP";
                chartArea2.AxisY.Title = "Monster Count";
                chartArea2.AxisX.TitleAlignment = StringAlignment.Center;
                chartArea2.AxisY.TitleAlignment = StringAlignment.Center;

                //new series for data
                var chartSeries2 = chartTwo.Series.Add("Number of Monsters");
                chartSeries2.ChartType = SeriesChartType.Column;
                chartSeries2.IsValueShownAsLabel = true;
                chartSeries2.BorderWidth = 3;

                //get the data
                var models = service.GetChartTwo().Result;

                //organize the data so that it is properly shown on with each range of 200
                Dictionary<string, int> hpCount = new Dictionary<string, int>();
                hpCount.Add("0-200", models.Where(m => m.HP <= 200).Sum(m => m.Count));
                hpCount.Add("201-400", models.Where(m => m.HP > 200 && m.HP <= 400).Sum(m => m.Count));
                hpCount.Add("401-600", models.Where(m => m.HP > 400 && m.HP <= 600).Sum(m => m.Count));
                hpCount.Add("601-800", models.Where(m => m.HP > 600 && m.HP <= 800).Sum(m => m.Count));
                hpCount.Add("801-1000", models.Where(m => m.HP > 800 && m.HP <= 1000).Sum(m => m.Count));

                //add the data to the chart
                foreach (var kvp in hpCount)
                {
                    chartSeries2.Points.AddXY(kvp.Key, kvp.Value);
                }
            }
            catch (IOException exc)
            {
                ReportError(new Errors($"Could not generate Chart 2 (make sure API is running)", "ChartTwoButton()"));
                return;
            }
            catch (NullReferenceException exc)
            {
                ReportError(new Errors(exc.Message + " (make sure API is running)", "ChartTwoButton()"));
                return;
            }
            catch (Exception exc)
            {
                ReportError(new Errors(exc.Message + " (make sure API is running)", "ChartTwoButton()"));
                return;
            }
        }

        /// <summary>
        /// create chart 3 on button click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ChartThreeButton(object sender, EventArgs e)
        {
            try
            {
                //clear the previous charts and panel
                ClearAllCharts();

                //add chart 3
                panel1.Controls.Add(chartThree);

                //add title and resize chart 3
                chartThree.Titles.Add("Top 10 Monsters by HP, MP");
                chartThree.Size = new Size(panel1.Width, panel1.Height);

                //add the area for chart three and configure
                var chartArea3 = chartThree.ChartAreas.Add("chartArea3");
                chartArea3.AxisX.Title = "MP";
                chartArea3.AxisY.Title = "HP";
                chartArea3.AxisX.TitleAlignment = StringAlignment.Center;
                chartArea3.AxisY.TitleAlignment = StringAlignment.Center;
                chartArea3.AxisY.Minimum = 985;
                chartArea3.AxisY.Maximum = 1000;
                chartArea3.AxisX.Minimum = 0;
                chartArea3.AxisX.Interval = 10;
                chartArea3.AxisY.Interval = 15;

                //new series of data for chart 3
                var chartSeries3 = chartThree.Series.Add("Monster");
                chartSeries3.ChartType = SeriesChartType.Point;
                chartSeries3.IsValueShownAsLabel = true;
                chartSeries3.BorderWidth = 3;

                //get the data
                var models = service.GetChartThree().Result;

                //add the data to the series
                foreach (var model in models)
                {
                    chartSeries3.Points.AddXY(model.MP, model.HP);
                }
            }
            catch (IOException exc)
            {
                ReportError(new Errors($"Could not generate Chart 3 (make sure API is running)", "ChartThreeButton()"));
                return;
            }
            catch (NullReferenceException exc)
            {
                ReportError(new Errors(exc.Message + " (make sure API is running)", "ChartThreeButton()"));
                return;
            }
            catch (Exception exc)
            {
                ReportError(new Errors(exc.Message + " (make sure API is running)", "ChartThreeButton()"));
                return;
            }
        }

        /// <summary>
        /// clear all charts and clear the panel so it is ready for the next chart
        /// </summary>
        private void ClearAllCharts()
        {
            chartOne.Series.Clear();
            chartOne.ChartAreas.Clear();
            chartTwo.Series.Clear();
            chartTwo.ChartAreas.Clear();
            chartThree.Series.Clear();
            chartThree.ChartAreas.Clear();
            panel1.Controls.Clear();
        }

        /// <summary>
        /// Uses a pop-up window to report an error
        /// Source: https://www.howtosolutions.net/2013/01/creating-a-new-popup-window-in-winform-using-csharp/
        /// </summary>
        /// <param name="err"></param>
        private void ReportError(Errors err)
        {
            //new instance of the popup window
            PopupForm popup = new PopupForm($"{err.Message}: {err.MethodSource}");

            //show the window
            DialogResult dialogResult = popup.ShowDialog();

            //if user clicks ok, close and dispose of the popup.
            if (dialogResult == DialogResult.OK)
            {
                popup.Dispose();
            }

        }
    }
}
