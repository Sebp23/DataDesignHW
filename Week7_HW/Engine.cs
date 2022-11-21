using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Week7_HW
{
    internal class Engine
    {
        SqlConnectionStringBuilder SqlConBuilder { get; set; }
        string SqlConString { get; set; }

        public Engine()
        {
            //Get all the server connection info when the engine is instantiated
            SqlConBuilder = new SqlConnectionStringBuilder();

            SqlConBuilder["server"] = @"(localdb)\MSSQLLocalDB";
            SqlConBuilder["Trusted_Connection"] = true;
            SqlConBuilder["Integrated Security"] = "SSPI";
            SqlConBuilder["Initial Catalog"] = "PROG260FA22";

            //String for opening connections to the SQL server
            SqlConString = SqlConBuilder.ToString();
        }


        /// <summary>
        /// Get all of the rows and insert the Character name and whether they're original or not into the parent table
        /// Get the id of the most recent entry so it can entered into the child table
        /// add the remaining fields into the child table
        /// Source for checking duplicates in sprocs: https://www.aspsnippets.com/questions/149003/How-to-avoid-duplicate-record-inserts-in-SQL-Server-using-C-and-ASPNet/
        /// </summary>
        /// <param name="file"></param>
        public void InsertIntoTables(CharacterFile file)
        {
            List<string[]> rows = new List<string[]>();

            try
            {
                //Get the rows from the CSV file
                using (StreamReader sr = new StreamReader(file.SourcePath))
                {
                    bool firstRow = true;
                    string row;
                    while ((row = sr.ReadLine()) != null)
                    {
                        //if it contains the ',' delimiter.
                        if (row.Contains(file.Delimiter))
                        {
                            //Make sure we dont record the top row
                            if (!firstRow)
                            {
                                //split the row by the delimiter and add the row to the list of rows
                                var rowInfo = row.Split(file.Delimiter);
                                //Add to list of rows
                                rows.Add(rowInfo);
                            }
                            else
                            {
                                //Skip the first row
                                firstRow = false;
                                continue;
                            }
                        }
                    }
                }

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    List<string> typesInserted = new List<string>();
                    List<string> mapsInserted = new List<string>();


                    foreach (var row in rows)
                    {
                        int? typeID = null;
                        int? mapID = null;
                        int? infoID = null;

                        string inLineSql = null;

                        //First make sure that the "Type" field is not empty
                        if (row[1] != String.Empty)
                        {
                            //Insert the type with sproc
                            inLineSql = $@"[dbo].[spInsertIntoCharTypes]";
                            using (var command = new SqlCommand(inLineSql, conn))
                            {
                                command.CommandType = CommandType.StoredProcedure;
                                command.Parameters.AddWithValue("@Type", row[1]);
                                command.Parameters.Add("@Return", SqlDbType.Int).Direction = ParameterDirection.Output;

                                command.ExecuteNonQuery();

                                //return the id
                                typeID = (int)command.Parameters["@Return"].Value;
                            }
                        }

                        //Same as above but with maps to avoid duplicates
                        if (row[2] != String.Empty)
                        {
                            //insert the map with sproc
                            inLineSql = $@"[dbo].[spInsertIntoCharMaps]";
                            using (var command = new SqlCommand(inLineSql, conn))
                            {
                                command.CommandType = CommandType.StoredProcedure;
                                command.Parameters.AddWithValue("@Map", row[2]).Direction = ParameterDirection.Input;
                                command.Parameters.Add("@Return", SqlDbType.Int).Direction = ParameterDirection.Output;

                                command.ExecuteNonQuery();

                                //return the id
                                mapID = (int)command.Parameters["@Return"].Value;
                            }
                        }

                        //insert info with sproc
                        inLineSql = $@"[dbo].[spInsertIntoCharInfo]";
                        using (var command = new SqlCommand(inLineSql, conn))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@OriginalChar", row[3]).Direction = ParameterDirection.Input;
                            command.Parameters.AddWithValue("@SwordFighter", row[4] != String.Empty ? row[4] : DBNull.Value).Direction = ParameterDirection.Input;
                            command.Parameters.AddWithValue("@MagicUser", row[5] != String.Empty ? row[5] : DBNull.Value).Direction = ParameterDirection.Input;
                            command.Parameters.Add("@Return", SqlDbType.Int).Direction = ParameterDirection.Output;

                            command.ExecuteNonQuery();

                            //return the id
                            infoID = (int)command.Parameters["@Return"].Value;
                        }

                        //Insert into the character table using all the IDs we found from previous insertions
                        inLineSql = $@"[dbo].[spInsertIntoChar]";
                        using (var command = new SqlCommand(inLineSql, conn))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@Char", row[0]);
                            command.Parameters.AddWithValue("@TypeID", typeID != null ? typeID : DBNull.Value);
                            command.Parameters.AddWithValue("@MapID", mapID != null ? mapID : DBNull.Value);
                            command.Parameters.AddWithValue("@InfoID", infoID != null ? infoID : DBNull.Value);

                            command.ExecuteNonQuery();
                        }
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into Character tables", "InsertIntoTable()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InsertIntoTable()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InsertIntoTable()"));
                return;
            }
        }

        /// <summary>
        /// Get a full report of all the characters and their details
        /// </summary>
        /// <param name="file"></param>
        public void InnerJoinReport()
        {
            try
            {
                List<string> records = new List<string>();
                string columNames = "ID,Character,Type,Map_Location,Original_Character,Sword_Fighter,Magic_User";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //Join the tables with an Inner Join
                    string inLineSql = $@"[dbo].[spGetFullCharReport]";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        //Read the joined table
                        var tableReader = command.ExecuteReader();

                        //While there is something to read
                        while (tableReader.Read())
                        {
                            //Write the row, checking to see if the value is null. If it is null, replace with "NULL" for the file
                            var record = $"{CheckIfNull(tableReader.GetValue(0))}|{CheckIfNull(tableReader.GetValue(1))}|{CheckIfNull(tableReader.GetValue(2))}|{CheckIfNull(tableReader.GetValue(3))}|{CheckIfNull(tableReader.GetValue(4))}|{CheckIfNull(tableReader.GetValue(5))}|{CheckIfNull(tableReader.GetValue(6))}";

                            //Add to the list of records
                            records.Add(record);
                        }

                        //close the table reader
                        tableReader.Close();
                    }

                    conn.Close();
                }

                //Export the records to a file
                ExportToFile(records, "FullReport.txt", columNames);
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not make a full report of the inner join", "InnerJoinReport()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InnerJoinReport()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InnerJoinReport()"));
                return;
            }
        }

        public string CheckIfNull(object value)
        {
            if (value != DBNull.Value)
            {
                return value.ToString();
            }
            else
            {
                return "NULL";
            }
        }

        /// <summary>
        /// Find all the characters whose Map_Location field is NULL
        /// </summary>
        /// <param name="file"></param>
        public void FindCharactersWithNoMap()
        {
            try
            {
                List<string> records = new List<string>();
                string columNames = "ID,Character";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //Left join where all Map_Location values are null
                    string inLineSql = $@"[dbo].[spGetCharNoMap]";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        var tableReader = command.ExecuteReader();

                        while (tableReader.Read())
                        {
                            //Each row is: "{ID}|{Character}"
                            var record = $"{tableReader.GetValue(0)}|{tableReader.GetValue(1)}";
                            records.Add(record);
                        }

                        tableReader.Close();
                    }

                    conn.Close();
                }

                ExportToFile(records, "Lost.txt", columNames);
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not find characters that did not have a map", "FindCharactersWithNoMap()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "FindCharactersWithNoMap()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "FindCharactersWithNoMap()"));
                return;
            }
        }

        /// <summary>
        /// Find all the characters who are non-human and able to wield a sword
        /// </summary>
        /// <param name="file"></param>
        public void FindSwordNonHuman()
        {
            try
            {
                List<string> records = new List<string>();
                string columNames = "ID,Character";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();
                    
                    //Inner join where Type != "Human" and where Sword_Fighter == "TRUE"
                    string inLineSql = $@"spGetSwordNonHuman";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        var tableReader = command.ExecuteReader();

                        while (tableReader.Read())
                        {
                            var record = $"{tableReader.GetValue(0)}|{tableReader.GetValue(1)}";
                            records.Add(record);
                        }

                        tableReader.Close();
                    }

                    conn.Close();
                }

                ExportToFile(records, "SwordNonHuman.txt", columNames);
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not find Non-Human characters that use swords", "FindSwordNonHuman()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "FindSwordNonHuman()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "FindSwordNonHuman()"));
                return;
            }
        }

        /// <summary>
        /// Use this to export tables to files
        /// </summary>
        /// <param name="recordList">The list of rows from the joined table</param>
        /// <param name="outName">The name of the output file</param>
        /// <param name="columNames">The names of the columns that will be in the output file</param>
        private void ExportToFile(List<string> recordList, string outName, string columNames)
        {
            try
            {
                //Get the output path
                string outPath = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\Files\{outName}";

                //If the file exists in the output path, delete it
                if (File.Exists(outPath))
                {
                    File.Delete(outPath);
                }

                //Streamwriter for writing the passed in records
                using (StreamWriter sw = new StreamWriter(outPath, true))
                {
                    //The column names
                    sw.WriteLine(columNames);

                    //For every record, write the record on a new line
                    foreach (var record in recordList)
                    {
                        sw.WriteLine(record);
                    }
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not write to file {outName}", "ExportToFile()"));
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
