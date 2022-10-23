using System;
using System.Collections.Generic;
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
        string TableName { get; set; }

        int CharacterID { get; set; }

        public Engine(string tableName)
        {
            //Get the name of the table
            TableName = tableName;

            //Get all the server connection info when the engine is instantiated
            SqlConBuilder = new SqlConnectionStringBuilder();

            SqlConBuilder["server"] = @"(localdb)\MSSQLLocalDB";
            SqlConBuilder["Trusted_Connection"] = true;
            SqlConBuilder["Integrated Security"] = "SSPI";
            SqlConBuilder["Initial Catalog"] = "PROG260FA22";

            //String for opening connections to the SQL server
            SqlConString = SqlConBuilder.ToString();
        }


        //Get most recent insert: SELECT TOP 1 ID FROM [dbo].[Character] ORDER BY ID DESC
        public void InsertIntoTables(CharacterFile file)
        {
            List<string[]> rows = new List<string[]>();

            try
            {
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
                                foreach (var value in rowInfo)
                                {
                                    if (value == string.Empty)
                                    {
                                        string replace = "NULL";
                                        rowInfo[Array.IndexOf(rowInfo, value)] = replace;
                                    }
                                    else if (value.Contains("'"))
                                    {
                                        string replace = value.Replace(value.Substring(value.IndexOf(@"'")), @"''s");

                                        string apostrophe = string.Format($"'{replace}'");
                                        rowInfo[Array.IndexOf(rowInfo, value)] = apostrophe;
                                    }
                                    else
                                    {
                                        string apostrophe = string.Format($"'{value}'");
                                        rowInfo[Array.IndexOf(rowInfo, value)] = apostrophe;
                                    }
                                }
                                rows.Add(rowInfo);
                            }
                            else
                            {
                                firstRow = false;
                                continue;
                            }
                        }
                    }
                }

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //int characterID;

                    foreach (var row in rows)
                    {
                        string inLineSqlPrimary = $@"INSERT INTO {TableName} ([Character], [Original_Character]) VALUES ({row[0]}, {row[3]})";

                        //Insert into parent table
                        using (var command = new SqlCommand(inLineSqlPrimary, conn))
                        {
                            var query = command.ExecuteNonQuery();
                        }


                        string inLineSqlGetID = $@"SELECT TOP 1 ID FROM {TableName} ORDER BY ID DESC";
                        //get the id of the most recent insert
                        using (var command = new SqlCommand(inLineSqlGetID, conn))
                        {
                            var reader = command.ExecuteReader();

                            while (reader.Read())
                            {
                                CharacterID = (int)reader.GetValue(0);
                            }

                            reader.Close();
                        }

                        string inLineSqlForeign = $@"INSERT INTO [dbo].[Character_Traits] ([CharacterID], [Type], [Map_Location], [Sword_Fighter], [Magic_User])" +
                                                   $@"VALUES ({CharacterID}, {row[1]}, {row[2]}, {row[4]}, {row[5]})";
                        //insert into child table
                        using (var command = new SqlCommand(inLineSqlForeign, conn))
                        {
                            var query = command.ExecuteNonQuery();
                        }
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
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

        public void InnerJoinReport(CharacterFile file)
        {
            try
            {
                List<string> records = new List<string>();
                string columNames = "ID,Character,Original_Character,Type,Map_Location,Sword_Fighter,Magic_User";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    string inLineSql = $@"SELECT [dbo].[Character].ID, [dbo].[Character].Character, [dbo].[Character].Original_Character, [dbo].[Character_Traits].Type, " + 
                                            $@"[dbo].[Character_Traits].Map_Location, [dbo].[Character_Traits].Sword_Fighter, [dbo].[Character_Traits].Magic_User " + 
                                       $@"From [dbo].[Character] " +
                                       $@"INNER JOIN [dbo].[Character_Traits] " + 
                                       $@"On [dbo].[Character].ID = [dbo].[Character_Traits].CharacterID;";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        string nullStr = "NULL";
                        string empty = String.Empty;
                        var tableReader = command.ExecuteReader();

                        while (tableReader.Read())
                        {
                            var record = $"{tableReader.GetValue(0)}|{tableReader.GetValue(1)}|{tableReader.GetValue(2)}|{(tableReader.GetValue(3) != DBNull.Value ? tableReader.GetValue(3) : nullStr)}|{(tableReader.GetValue(4) != DBNull.Value ? tableReader.GetValue(4) : nullStr)}|{(tableReader.GetValue(5) != DBNull.Value ? tableReader.GetValue(5) : nullStr)}|{(tableReader.GetValue(6) != DBNull.Value ? tableReader.GetValue(6) : nullStr)}";

                            records.Add(record);
                        }

                        tableReader.Close();
                    }

                    conn.Close();
                }

                ExportToFile(records, file.SourcePath, "FullReport.txt", columNames);
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

        public void FindCharactersWithNoMap(CharacterFile file)
        {
            try
            {
                List<string> records = new List<string>();
                string columNames = "ID,Character";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    string inLineSql = $@"SELECT [dbo].[Character].ID, [dbo].[Character].Character " +
                                       $@"FROM [dbo].[Character] " +
                                       $@"LEFT JOIN [dbo].[Character_Traits] " +
                                       $@"On [dbo].[Character].ID = [dbo].[Character_Traits].CharacterID " +
                                       $@"WHERE [dbo].[Character_Traits].Map_Location is NULL";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
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

                ExportToFile(records, file.SourcePath, "Lost.txt", columNames);
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

        public void FindSwordNonHuman(CharacterFile file)
        {
            try
            {
                List<string> records = new List<string>();
                string columNames = "ID,Character";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    string inLineSql = $@"SELECT [dbo].[Character].ID, [dbo].[Character].Character " +
                                       $@"FROM [dbo].[Character] " +
                                       $@"LEFT JOIN [dbo].[Character_Traits] " +
                                       $@"On [dbo].[Character].ID = [dbo].[Character_Traits].CharacterID " +
                                       $@"WHERE [dbo].[Character_Traits].Type != 'Human' and [dbo].[Character_Traits].Sword_Fighter = 'TRUE'";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
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

                ExportToFile(records, file.SourcePath, "SwordNonHuman.txt", columNames);
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

        private void ExportToFile(List<string> recordList, string filePath, string outName, string columNames)
        {
            try
            {
                string outPath = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName}\Files\{outName}";

                if (File.Exists(outPath))
                {
                    File.Delete(outPath);
                }

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
