using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InClassFinal
{
    internal class Engine
    {
        private string SqlConnString { get; set; }
        private string SourcePath { get; set; }

        public Engine()
        {
            SqlConnectionStringBuilder sqlConnBuilder = new SqlConnectionStringBuilder();

            sqlConnBuilder["server"] = @"(localdb)\MSSQLLocalDB";
            sqlConnBuilder["Trusted_Connection"] = true;
            sqlConnBuilder["Integrated Security"] = "SSPI";
            sqlConnBuilder["Initial Catalog"] = "PROG260FA22";

            SqlConnString = sqlConnBuilder.ToString();

            SourcePath = @$"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\Files";
        }

        public void InsertIntoSubscribers()
        {
            List<string[]> subRecords = new List<string[]>();
            try
            {
                using (StreamReader sr = new StreamReader($@"{SourcePath}\subscriber.csv"))
                {
                    bool firstRow = true;
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {
                        if (!firstRow)
                        {
                            string[] record = line.Split(',');
                            subRecords.Add(record);
                        }
                        else
                        {
                            firstRow = false;
                            continue;
                        }
                    }
                }

                using (SqlConnection conn = new SqlConnection(SqlConnString))
                {
                    conn.Open();

                    foreach (var record in subRecords)
                    {
                        string inLineSql = $@"[dbo].[InsertIntoSubscribers]";
                        using (var command = new SqlCommand(inLineSql, conn))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@FirstName", record[1]);
                            command.Parameters.AddWithValue("@LastName", record[2]);
                            command.Parameters.AddWithValue("@Email", record[3] == String.Empty ? DBNull.Value : record[3]);

                            command.ExecuteNonQuery();
                        }
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.Errors.Add(new Error($"Could not insert data into Subscriber table", "InsertIntoSubscriber()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.Errors.Add(new Error(e.Message, "InsertIntoSubscriber()"));
                return;
            }
            catch (Exception e)
            {
                Error.Errors.Add(new Error(e.Message, "InsertIntoSubscriber()"));
                return;
            }
        }

        public void InsertIntoDependants()
        {
            List<string[]> depRecords = new List<string[]>();
            try
            {
                using (StreamReader sr = new StreamReader($@"{SourcePath}\dependent.csv"))
                {
                    bool firstRow = true;
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {
                        if (!firstRow)
                        {
                            string[] record = line.Split(',');
                            depRecords.Add(record);
                        }
                        else
                        {
                            firstRow = false;
                            continue;
                        }
                    }
                }

                using (SqlConnection conn = new SqlConnection(SqlConnString))
                {
                    conn.Open();

                    foreach (var record in depRecords)
                    {
                        string inLineSql = $@"[dbo].[InsertIntoDependent]";
                        using (var command = new SqlCommand(inLineSql, conn))
                        {
                            int subID = int.Parse(record[1]);

                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@SubID", int.Parse(record[1]));
                            command.Parameters.AddWithValue("@FirstName", record[2]);
                            command.Parameters.AddWithValue("@LastName", record[3]);

                            command.ExecuteNonQuery();
                        }
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.Errors.Add(new Error($"Could not insert data into Dependant table", "InsertIntoDependant()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.Errors.Add(new Error(e.Message, "InsertIntoDependant()"));
                return;
            }
            catch (Exception e)
            {
                Error.Errors.Add(new Error(e.Message, "InsertIntoDependant()"));
                return;
            }
        }

        public void GetDataAndExport()
        {
            try
            {
                Console.Write("Please type id of subscriber you wish to save to file: ");
                //int idRequest = Console.Read
            }
            catch (IOException e)
            {
                Error.Errors.Add(new Error($"Could not insert data into Dependant table", "InsertIntoDependant()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.Errors.Add(new Error(e.Message, "InsertIntoDependant()"));
                return;
            }
            catch (Exception e)
            {
                Error.Errors.Add(new Error(e.Message, "InsertIntoDependant()"));
                return;
            }
        }
    }
}
