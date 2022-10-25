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
        string CharacterTable { get; set; }
        string TypeTable { get; set; }
        string MapTable { get; set; }
        string InfoTable { get; set; }

        public Engine(string characterTable, string typeTable, string mapTable, string infoTable)
        {
            //Get the name of the table
            CharacterTable = characterTable;
            TypeTable = typeTable;
            MapTable = mapTable;
            InfoTable = infoTable;

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
                                    //If the field has an apostrophe, make sure the field uses proper SQL syntax to translate for the DB
                                    if (value.Contains("'"))
                                    {
                                        string trimmed = value.Trim();
                                        string replace = trimmed.Replace(trimmed.Substring(trimmed.IndexOf(@"'")), @"''s");

                                        //Add the string syntax around the field
                                        string apostrophe = string.Format($"'{replace}'").Trim();
                                        rowInfo[Array.IndexOf(rowInfo, value)] = apostrophe;
                                    }
                                    //No other edits other than adding SQL string syntax around the field
                                    else
                                    {
                                        if (value != String.Empty)
                                        {
                                            string trimmed = value.Trim();
                                            string apostrophe = string.Format($"'{trimmed}'");
                                            rowInfo[Array.IndexOf(rowInfo, value)] = apostrophe;
                                        }
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
                            //To avoid duplicates, check to see if this type has been inserted before
                            if (!typesInserted.Contains(row[1]))
                            {
                                inLineSql = $@"INSERT INTO {TypeTable} ([Type]) VALUES ({row[1]})";
                                using (var command = new SqlCommand(inLineSql, conn))
                                {
                                    var query = command.ExecuteNonQuery();
                                }

                                //Get the id of the inserted type
                                typeID = GetRecordId(TypeTable, conn);
                                typesInserted.Add(row[1]);
                            }
                            else
                            {
                                //If it has been inserted before, then all we need to do is get the id
                                inLineSql = $@"SELECT ID FROM {TypeTable} WHERE {TypeTable}.Type = {row[1]}";
                                using (var command = new SqlCommand(inLineSql, conn))
                                {
                                    var reader = command.ExecuteReader();

                                    while (reader.Read())
                                    {
                                        typeID = (int)reader.GetValue(0);
                                    }

                                    reader.Close();
                                }
                            }
                        }

                        //Same as above but with maps to avoid duplicates
                        if (row[2] != String.Empty)
                        {
                            if (!mapsInserted.Contains(row[2]))
                            {
                                inLineSql = $@"INSERT INTO {MapTable} ([Map_Location]) VALUES ({row[2]})";
                                using (var command = new SqlCommand(inLineSql, conn))
                                {
                                    var query = command.ExecuteNonQuery();
                                }

                                mapID = GetRecordId(MapTable, conn);
                                mapsInserted.Add(row[2]);
                            }
                            else
                            {
                                inLineSql = $@"SELECT ID FROM {MapTable} WHERE {MapTable}.Map_Location = {row[2]}";
                                using (var command = new SqlCommand(inLineSql, conn))
                                {
                                    var reader = command.ExecuteReader();

                                    while (reader.Read())
                                    {
                                        mapID = (int)reader.GetValue(0);
                                    }

                                    reader.Close();
                                }
                            }
                        }

                        //Insert into the Info table
                        inLineSql = $@"INSERT INTO {InfoTable} ([Original_Character], [Sword_Fighter], [Magic_User]) VALUES ({row[3]}, {(row[4] != String.Empty ? row[4] : "NULL")}, {(row[5] != String.Empty ? row[5] : "NULL")})";
                        using (var command = new SqlCommand(inLineSql, conn))
                        {
                            var query = command.ExecuteNonQuery();
                        }
                        infoID = GetRecordId(InfoTable, conn);

                        //Insert into the character table using all the IDs we found from previous insertions
                        inLineSql = $@"INSERT INTO {CharacterTable} ([Character], [TypeID], [MapID], [InfoID]) VALUES ({row[0]}, {(typeID != null ? typeID : "NULL")}, {(mapID != null ? mapID : "NULL")}, {infoID})";
                        using (var command = new SqlCommand(inLineSql, conn))
                        {
                            var query = command.ExecuteNonQuery();
                        }
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {CharacterTable}", "InsertIntoTable()"));
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
        /// Get the ID of the requested record
        /// </summary>
        /// <param name="tableName">Table in which the record is located</param>
        /// <param name="conn">Connection to use for SQL command</param>
        /// <returns></returns>
        private int? GetRecordId(string tableName, SqlConnection conn)
        {
            int? idToReturn = null;

            string inLineSqlGetID = $@"SELECT TOP 1 ID FROM {tableName} ORDER BY ID DESC";
            //get the id of the most recent insert in the parent table
            using (var command = new SqlCommand(inLineSqlGetID, conn))
            {
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    idToReturn = (int)reader.GetValue(0);
                }

                reader.Close();
            }

            return idToReturn;
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
                    string inLineSql = $@"SELECT {CharacterTable}.ID, {CharacterTable}.Character, " +
                                            $@"{TypeTable}.Type, {MapTable}.Map_Location, " + 
                                            $@"{InfoTable}.Original_Character, {InfoTable}.Sword_Fighter, {InfoTable}.Magic_User " + 
                                       $@"FROM {CharacterTable} " + 
                                       $@"INNER JOIN {TypeTable} ON {TypeTable}.ID = {CharacterTable}.TypeID " + 
                                       $@"INNER JOIN {MapTable} ON {MapTable}.ID = {CharacterTable}.MapID " + 
                                       $@"INNER JOIN {InfoTable} ON {InfoTable}.ID = {CharacterTable}.InfoID ";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        //Read the joined table
                        var tableReader = command.ExecuteReader();

                        //While there is something to read
                        while (tableReader.Read())
                        {
                            //Write the row, checking to see if the value is null. If it is null, replace with "NULL" for the file
                            var record = $"{tableReader.GetValue(0)}|{tableReader.GetValue(1)}|{tableReader.GetValue(2)}|{tableReader.GetValue(3)}|{tableReader.GetValue(4)}|{tableReader.GetValue(5)}|{tableReader.GetValue(6)}";

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
                    string inLineSql = $@"SELECT {CharacterTable}.ID, {CharacterTable}.Character " +
                                       $@"FROM {CharacterTable} " +
                                       $@"LEFT JOIN {MapTable} " +
                                       $@"On {MapTable}.ID = {CharacterTable}.MapID " +
                                       $@"WHERE {MapTable}.Map_Location is NULL";

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
                    
                    //Inner join where Type != "Human" and where Sword_Fighter == "TRUE"
                    string inLineSql = $@"SELECT {CharacterTable}.ID, {CharacterTable}.Character " +
                                       $@"FROM {CharacterTable} " +
                                       $@"INNER JOIN {TypeTable} ON {TypeTable}.ID = {CharacterTable}.TypeID " +
                                       $@"INNER JOIN {InfoTable} ON {InfoTable}.ID = {CharacterTable}.InfoID " +
                                       $@"WHERE {TypeTable}.Type != 'Human' and {InfoTable}.Sword_Fighter = 'TRUE'";

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
