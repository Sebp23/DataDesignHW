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
        string PrimaryTableName { get; set; }
        string ForeignTableName { get; set; }

        public Engine(string primaryTableName, string foreignTableName)
        {
            //Get the name of the table
            PrimaryTableName = primaryTableName;
            ForeignTableName = foreignTableName;

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
                                foreach (var value in rowInfo)
                                {
                                    //If the value is empty, then it should be entered as NULL into the DB
                                    if (value == string.Empty)
                                    {
                                        string replace = "NULL";
                                        rowInfo[Array.IndexOf(rowInfo, value)] = replace;
                                    }
                                    //If the field has an apostrophe, make sure the field uses proper SQL syntax to translate for the DB
                                    else if (value.Contains("'"))
                                    {
                                        string replace = value.Replace(value.Substring(value.IndexOf(@"'")), @"''s");

                                        //Add the string syntax around the field
                                        string apostrophe = string.Format($"'{replace}'");
                                        rowInfo[Array.IndexOf(rowInfo, value)] = apostrophe;
                                    }
                                    //No other edits other than adding SQL string syntax around the field
                                    else
                                    {
                                        string apostrophe = string.Format($"'{value}'");
                                        rowInfo[Array.IndexOf(rowInfo, value)] = apostrophe;
                                    }
                                }
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

                    foreach (var row in rows)
                    {
                        int? characterID = null;

                        string inLineSqlPrimary = $@"INSERT INTO {PrimaryTableName} ([Character], [Original_Character]) VALUES ({row[0]}, {row[3]})";

                        //Insert into parent table
                        using (var command = new SqlCommand(inLineSqlPrimary, conn))
                        {
                            var query = command.ExecuteNonQuery();
                        }


                        string inLineSqlGetID = $@"SELECT TOP 1 ID FROM {PrimaryTableName} ORDER BY ID DESC";
                        //get the id of the most recent insert in the parent table
                        using (var command = new SqlCommand(inLineSqlGetID, conn))
                        {
                            var reader = command.ExecuteReader();

                            while (reader.Read())
                            {
                                characterID = (int)reader.GetValue(0);
                            }

                            reader.Close();
                        }

                        string inLineSqlForeign = $@"INSERT INTO {ForeignTableName} ([CharacterID], [Type], [Map_Location], [Sword_Fighter], [Magic_User])" +
                                                   $@"VALUES ({characterID}, {row[1]}, {row[2]}, {row[4]}, {row[5]})";
                        //insert into child table using previously assigned character id
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
                Error.ErrorList.Add(new Error($"Could not insert data into {PrimaryTableName}", "InsertIntoTable()"));
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
                string columNames = "ID,Character,Original_Character,Type,Map_Location,Sword_Fighter,Magic_User";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //Join the tables with an Inner Join
                    string inLineSql = $@"SELECT {PrimaryTableName}.ID, {PrimaryTableName}.Character, {PrimaryTableName}.Original_Character, {ForeignTableName}.Type, " + 
                                            $@"{ForeignTableName}.Map_Location, {ForeignTableName}.Sword_Fighter, {ForeignTableName}.Magic_User " + 
                                       $@"From {PrimaryTableName} " +
                                       $@"INNER JOIN {ForeignTableName} " + 
                                       $@"On {PrimaryTableName}.ID = {ForeignTableName}.CharacterID;";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        //string to replace null values read from the join table
                        string nullStr = "NULL";

                        //Read the joined table
                        var tableReader = command.ExecuteReader();

                        //While there is something to read
                        while (tableReader.Read())
                        {
                            //Write the row, checking to see if the value is null. If it is null, replace with "NULL" for the file
                            var record = $"{tableReader.GetValue(0)}|{tableReader.GetValue(1)}|{tableReader.GetValue(2)}|{(tableReader.GetValue(3) != DBNull.Value ? tableReader.GetValue(3) : nullStr)}|{(tableReader.GetValue(4) != DBNull.Value ? tableReader.GetValue(4) : nullStr)}|{(tableReader.GetValue(5) != DBNull.Value ? tableReader.GetValue(5) : nullStr)}|{(tableReader.GetValue(6) != DBNull.Value ? tableReader.GetValue(6) : nullStr)}";

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
                    string inLineSql = $@"SELECT {PrimaryTableName}.ID, {PrimaryTableName}.Character " +
                                       $@"FROM {PrimaryTableName} " +
                                       $@"LEFT JOIN {ForeignTableName} " +
                                       $@"On {PrimaryTableName}.ID = {ForeignTableName}.CharacterID " +
                                       $@"WHERE {ForeignTableName}.Map_Location is NULL";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
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
                    
                    //Left join where Type != "Human" and where Sword_Fighter == "TRUE"
                    string inLineSql = $@"SELECT {PrimaryTableName}.ID, {PrimaryTableName}.Character " +
                                       $@"FROM {PrimaryTableName} " +
                                       $@"LEFT JOIN {ForeignTableName} " +
                                       $@"On {PrimaryTableName}.ID = {ForeignTableName}.CharacterID " +
                                       $@"WHERE {ForeignTableName}.Type != 'Human' and {ForeignTableName}.Sword_Fighter = 'TRUE'";

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
