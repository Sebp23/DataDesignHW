using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week6HW
{
    /// <summary>
    /// Engine class that will insert data, update location, increase price, delete expired items, and export to an output file
    /// where all the magic happens
    /// </summary>
    internal class Engine
    {
        SqlConnectionStringBuilder SqlConBuilder { get; set; }
        string SqlConString { get; set; }
        string TableName { get; set; }

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

        /// <summary>
        /// Insert the file into the SQL table
        /// </summary>
        /// <param name="sqlFile">The file that gets inserted</param>
        public void InsertIntoTable(SqlFile sqlFile)
        {
            //Lines in the file that will be inserted as rows in the SQL table
            List<string[]> rows = new List<string[]>();

            try
            {
                //Read from the file
                using (StreamReader sr = new StreamReader(sqlFile.SourcePath))
                {

                    //While there is a row/row to read in the file
                    string row;
                    while ((row = sr.ReadLine()) != null)
                    {
                        //if it contains the '|' delimiter. This ensures that the top row (column info) is not recorded
                        if (row.Contains(sqlFile.Delimiter))
                        {
                            //split the row by the delimiter and add the row to the list of rows
                            var rowInfo = row.Split(sqlFile.Delimiter);
                            rows.Add(rowInfo);
                        }
                    }
                }

                //Open a connection to the SQL server
                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //For every row in the list of rows
                    foreach (var row in rows)
                    {
                        //the SQL command that will be executed. Insert each string in the row into the SQL table as the proper data type
                        string inLineSql = $@"INSERT INTO {TableName} ([Name], [Location], [Price], [UoM], [SellBy]) " +
                                               $@"VALUES ('{row[0]}', '{row[1]}', {SqlMoney.Parse(row[2])}, '{row[3]}', '{row[4]}')";

                        //Execute the SQL query
                        using (var command = new SqlCommand(inLineSql, conn))
                        {
                            var query = command.ExecuteNonQuery();
                        }
                    }

                    //Close the connection
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

        /// <summary>
        /// Change every F in the location column to Z
        /// </summary>
        public void UpdateLocation()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //This will replace every instance of 'F' in the Location column with 'Z'
                    //REPLACE function found from: https://www.sqltutorial.org/sql-string-functions/sql-replace/
                    string inLineSql = $@"UPDATE {TableName}" +
                                       @"SET Location = REPLACE(Location, 'F', 'Z')";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        var query = command.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (InvalidCastException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InsertIntoTable()"));
                return;
            }
        }

        /// <summary>
        /// Delete all the items where the sell by date is older than current date
        /// </summary>
        public void DeleteExpired()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //Compare the SellBy value in each row with the current date, and delete it if it is less than the current date (older)
                    //GETDATE found from https://www.geeksforgeeks.org/sql-query-to-compare-results-with-todays-date/
                    string inLineSql = $@"DELETE FROM {TableName}" +
                                        @"WHERE SellBy < GETDATE()";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        var query = command.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (InvalidCastException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InsertIntoTable()"));
                return;
            }
        }

        /// <summary>
        /// increase the price of every item
        /// </summary>
        /// <param name="increaseNum">number to increase the price by</param>
        public void IncreasePrice(float increaseNum)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //Increase the price value in every row by the parameter value
                    string inLineSql = $@"UPDATE {TableName}" +
                                       $@"SET Price = Price + {increaseNum}";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        var query = command.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (InvalidCastException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InsertIntoTable()"));
                return;
            }
        }

        /// <summary>
        /// Export the new table with all the modified values into one txt file
        /// </summary>
        /// <param name="filePath"></param>
        public void ExportFromTable(string filePath)
        {
            try
            {
                //The path for the output file
                string outPath = filePath.Replace(filePath.Substring(filePath.IndexOf(".")), "_out.txt");

                //if the out file already exists, delete it
                if (File.Exists(outPath))
                {
                    File.Delete(outPath);
                }

                //list of records/rows found in the SQL table
                List<string> records = new List<string>();

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    conn.Open();

                    //Select all the rows from the table
                    string inLineSql = $@"SELECT * FROM {TableName}";

                    using (var command = new SqlCommand(inLineSql, conn))
                    {
                        //Reader to read records from the table
                        var tableReader = command.ExecuteReader();

                        //While there is a record to read, do stuff
                        while (tableReader.Read())
                        {
                            //A string with each value of the record
                            var record = $"{tableReader.GetValue(0)}|{tableReader.GetValue(1)}|{tableReader.GetValue(2)}|{tableReader.GetValue(3)}|{tableReader.GetValue(4)}|{tableReader.GetValue(5)}";

                            //Add it to the list of records
                            records.Add(record);
                        }

                        tableReader.Close();
                    }

                    conn.Close();
                }

                //Open a StreamWriter to start writing all the read records to the output file
                using (StreamWriter sw = new StreamWriter(outPath, true))
                {
                    //The column names
                    sw.WriteLine("ID,Name,Location,Price,UoM,Sell_by_Date");

                    //For every record, write the record on a new line
                    foreach (var record in records)
                    {
                        sw.WriteLine(record);
                    }
                }
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (InvalidCastException e)
            {
                Error.ErrorList.Add(new Error($"Could not insert data into {TableName}", "InsertIntoTable()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "InsertIntoTable()"));
                return;
            }
        }
    }
}
