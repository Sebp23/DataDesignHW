using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Week11_HW_Forms.Models;
using Newtonsoft.Json;
using System.Windows.Forms.DataVisualization.Charting;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Collections;
using System.IO;
using Week11_HW_Forms.Services;

namespace Week11_HW_Forms
{
    internal class Service
    {
        /// <summary>
        /// Get the data for chart 1
        /// </summary>
        /// <returns></returns>
        public async Task<List<ChartOneModel>> GetChartOne()
        {
            //list to hold the data
            List<ChartOneModel> models = new List<ChartOneModel>();

            //invoke the endpoint of the api that provides the data for chart 1
            using (HttpClient client = new HttpClient())
            {
                //Set the base url and the request headers
                client.BaseAddress = new Uri("https://localhost:7297/Chart/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //Invoke the end point
                HttpResponseMessage response = client.GetAsync("get-chart-one").Result;
                models = JsonConvert.DeserializeObject<List<ChartOneModel>>(await response.Content.ReadAsStringAsync());

                //add a log
                Logger.Logs.Add(new Logger($"Get Chart One: {response.StatusCode}", (int)response.StatusCode, DateTime.Now));
            }

            return models;
        }

        /// <summary>
        /// Get the data for chart 2
        /// </summary>
        /// <returns></returns>
        public async Task<List<ChartTwoModel>> GetChartTwo()
        {
            List<ChartTwoModel> models = new List<ChartTwoModel>();
            using (HttpClient client = new HttpClient())
            {
                //Set the base url and the request headers
                client.BaseAddress = new Uri("https://localhost:7297/Chart/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //Invoke the end point
                HttpResponseMessage response = client.GetAsync("get-chart-two").Result;
                models = JsonConvert.DeserializeObject<List<ChartTwoModel>>(await response.Content.ReadAsStringAsync());

                Logger.Logs.Add(new Logger($"Get Chart Two: {response.StatusCode}", (int)response.StatusCode, DateTime.Now));
            }

            return models;
        }

        /// <summary>
        /// get the data for chart 3
        /// </summary>
        /// <returns></returns>
        public async Task<List<ChartThreeModel>> GetChartThree()
        {
            List<ChartThreeModel> models = new List<ChartThreeModel>();
            using (HttpClient client = new HttpClient())
            {
                //Set the base url and the request headers
                client.BaseAddress = new Uri("https://localhost:7297/Chart/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //Invoke the end point
                HttpResponseMessage response = client.GetAsync("get-chart-three").Result;
                models = JsonConvert.DeserializeObject<List<ChartThreeModel>>(await response.Content.ReadAsStringAsync());

                Logger.Logs.Add(new Logger($"Get Chart Three: {response.StatusCode}", (int)response.StatusCode, DateTime.Now));
            }

            return models;
        }
    }
}
