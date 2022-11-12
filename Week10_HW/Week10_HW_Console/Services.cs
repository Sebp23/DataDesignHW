using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace Week10_HW_Console
{
    internal class Services
    {
        /// <summary>
        /// Get all monsters in the DB
        /// </summary>
        public async void GetAllMonsters()
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    //Set the base url and the request headers
                    client.BaseAddress = new Uri("https://localhost:7043/Monster/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    //Invoke the end point
                    HttpResponseMessage response = client.GetAsync("get-all").Result;
                    List<MonsterModel> monsters = JsonConvert.DeserializeObject<List<MonsterModel>>(await response.Content.ReadAsStringAsync());


                    //For every monster returned by the response, print out its properties
                    foreach (var monster in monsters)
                    {
                        Console.WriteLine($"ID: {monster.ID}");
                        Console.WriteLine($"Name: {monster.Name}");
                        Console.WriteLine($"Type: {monster.Type}");
                        Console.WriteLine($"HP: {monster.HP}");
                        Console.WriteLine($"MP: {monster.MP}");
                        Console.WriteLine($"Location: {monster.Location}");
                        Console.WriteLine("------------------------------------------------");
                    }

                    //Log what happened
                    Logger.Logs.Add(new Logger($"Get All Monsters: {response.StatusCode}", (int)response.StatusCode, DateTime.Now));

                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not get all monsters. API error codes in LogReport.txt", "GetAllMonsters()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetAllMonsters()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetAllMonsters()"));
                return;
            }
        }

        /// <summary>
        /// Get a certain monster based on ID
        /// </summary>
        /// <param name="id"></param>
        public async void GetMonster(int id)
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    //Set up base url and request headers
                    client.BaseAddress = new Uri("https://localhost:7043/Monster/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    //invoke the end point
                    HttpResponseMessage response = client.GetAsync($"get-monster/{id}").Result;
                    MonsterModel monster = JsonConvert.DeserializeObject<MonsterModel>(await response.Content.ReadAsStringAsync());

                    //print out the info of the returned monster
                    Console.WriteLine($"ID: {monster.ID}");
                    Console.WriteLine($"Name: {monster.Name}");
                    Console.WriteLine($"Type: {monster.Type}");
                    Console.WriteLine($"HP: {monster.HP}");
                    Console.WriteLine($"MP: {monster.MP}");
                    Console.WriteLine($"Location: {monster.Location}");

                    //log what happened
                    Logger.Logs.Add(new Logger($"Get Monster By ID: {response.StatusCode}", (int)response.StatusCode, DateTime.Now));

                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not get all monsters. API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
        }

        /// <summary>
        /// Update 1 or multiple properties of a pre exisiting monster in the DB
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="type"></param>
        /// <param name="hp"></param>
        /// <param name="mp"></param>
        /// <param name="location"></param>
        public async void UpdateMonster(int id, string? name = null, string? type = null, int? hp = null, int? mp = null, string? location = null)
        {
            try
            {
                //make a new monster based on the recieved update parameters
                MonsterModel monster = new MonsterModel() { ID = id, Name = name, Type = type, HP = hp, MP = mp, Location = location };

                using (HttpClient client = new HttpClient())
                {
                    //serialize the monster into JSON
                    var content = JsonConvert.SerializeObject(monster);

                    //Set up the base url and request headers
                    client.BaseAddress = new Uri("https://localhost:7043/Monster/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    //invoke the end point, sending the serialized monster in the proper format to be recieved by the end point
                    //Got help from: https://makolyte.com/csharp-get-and-send-json-with-httpclient/
                    var response = client.PostAsync($"update-monster/{id}", new StringContent(content, Encoding.UTF8, "application/json")).Result;

                    //Add to the log the result
                    Logger.Logs.Add(new Logger($"Update Monster: {response.StatusCode}", (int)response.StatusCode, DateTime.Now));

                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not get all monsters. API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
        }

        /// <summary>
        /// Delete a monster from the DB
        /// </summary>
        /// <param name="id"></param>
        public async void DeleteMonster(int id)
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    //Set up base url and request headers
                    client.BaseAddress = new Uri("https://localhost:7043/Monster/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    //Invoke the end point
                    HttpResponseMessage response = client.DeleteAsync($"delete-monster/{id}").Result;

                    //Add the result to the log
                    Logger.Logs.Add(new Logger($"Delete Monster: {response.StatusCode}", (int)response.StatusCode, DateTime.Now));

                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not get all monsters. API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message + " API error codes in LogReport.txt", "GetMonster()"));
                return;
            }
        }
    }
}
