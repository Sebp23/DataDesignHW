using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week9_HW
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
        /// ETL for Report 1
        /// </summary>
        public void ETLReportOne()
        {
            try
            {
                //The colum names
                string columNames = "ID,Full_Name,SSN,Full_Address,Phone";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    //Open the connection
                    conn.Open();

                    //Get the records from the view
                    List<string> records = ReadFromView(conn, "vw_Report1");       

                    //Export the report file now that the data has been transformed (in the view) and get the path
                    string outPath = ExportToFile(records, "Report1.txt", columNames);

                    //Sproc for inserting into Report_1 Table
                    string sproc = $@"[dbo].[spInsertIntoReportOne]";

                    //Read from the recently made file
                    using (StreamReader sr = new StreamReader(outPath))
                    {
                        string row;
                        while ((row = sr.ReadLine()) != null)
                        {
                            if (row.Contains("|"))
                            {
                                var rowInfo = row.Split('|');
                                using (var command = new SqlCommand(sproc, conn))
                                {
                                    //Populate the parameters of the sprocs
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@FullName", rowInfo[1]);
                                    command.Parameters.AddWithValue("@SSN", rowInfo[2]);
                                    command.Parameters.AddWithValue("@FullAddress", rowInfo[3]);
                                    command.Parameters.AddWithValue("@Phone", rowInfo[4]);

                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                    }

                    conn.Close();
                }

            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not perform ETL for Report 1", "ETLReportOne()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportOne()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportOne()"));
                return;
            }
        }

        /// <summary>
        /// ETL for Report 2
        /// </summary>
        public void ETLReportTwo()
        {
            try
            {
                //Column names
                string columNames = "ID,Full_Name,Courses_Total,Courses_Completed,Courses_Incomplete,Courses_InProgress";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    //Open the connection
                    conn.Open();

                    //Get the records by reading the Report 2 view
                    List<string> records = ReadFromView(conn, "vw_Report2");

                    //Export the view to a file now that the data has been transformed (in the view)
                    string outPath = ExportToFile(records, "Report2.txt", columNames);

                    //Sproc for inserting into Repor_2 table
                    string sproc = $@"[dbo].[spInsertIntoReportTwo]";

                    using (StreamReader sr = new StreamReader(outPath))
                    {
                        string row;
                        while ((row = sr.ReadLine()) != null)
                        {
                            if (row.Contains("|"))
                            {
                                var rowInfo = row.Split('|');
                                using (var command = new SqlCommand(sproc, conn))
                                {
                                    //Populate the parameters of the sproc
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@FullName", rowInfo[1]);
                                    command.Parameters.AddWithValue("@CoursesTotal", int.Parse(rowInfo[2]));
                                    command.Parameters.AddWithValue("@CoursesCompleted", int.Parse(rowInfo[3]));
                                    command.Parameters.AddWithValue("@CoursesIncomplete", int.Parse(rowInfo[4]));
                                    command.Parameters.AddWithValue("@CoursesInProgress", int.Parse(rowInfo[5]));

                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                    }

                    conn.Close();
                }

            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not perform ETL for Report 2", "ETLReportTwo()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportTwo()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportTwo()"));
                return;
            }
        }

        /// <summary>
        /// ETL for Report 3
        /// </summary>
        public void ETLReportThree()
        {
            try
            {
                string columNames = "Full_Name,Courses_Total,Courses_Completed,Courses_Incomplete,Courses_InProgress";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    //Open the connection
                    conn.Open();

                    //The records read from the Report 3 view
                    List<string> records = ReadFromView(conn, "vw_Report3");

                    //Export the data to a file now that it has been transformed (in the view)
                    string outPath = ExportToFile(records, "Report3.txt", columNames);

                    //Sproc for inserting into Report_3 Table
                    string sproc = $@"[dbo].[spInsertIntoReportThree]";

                    using (StreamReader sr = new StreamReader(outPath))
                    {
                        string row;
                        while ((row = sr.ReadLine()) != null)
                        {
                            if (row.Contains("|"))
                            {
                                var rowInfo = row.Split('|');
                                using (var command = new SqlCommand(sproc, conn))
                                {
                                    //Populate the parameters of the sproc
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@Course_Code", rowInfo[0]);
                                    command.Parameters.AddWithValue("@Students_Enrolled", int.Parse(rowInfo[1]));
                                    command.Parameters.AddWithValue("@Students_Completed", int.Parse(rowInfo[2]));
                                    command.Parameters.AddWithValue("@Students_Failed_Dropped", int.Parse(rowInfo[3]));

                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                    }

                    conn.Close();
                }

            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not perform ETL for Report 3", "ETLReportThree()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportThree()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportThree()"));
                return;
            }
        }

        /// <summary>
        /// ETL for Report 4
        /// </summary>
        public void ETLReportFour()
        {
            try
            {
                //Column names for the file
                string columNames = "Course_Code, Student_IDs, Most_Students_State";

                using (SqlConnection conn = new SqlConnection(SqlConString))
                {
                    //Open the connection
                    conn.Open();

                    //Recrods from view, as well as list for new records after applying final transformations to data
                    //This was used to help me find the STRING_AGG function: https://database.guide/the-sql-server-equivalent-to-group_concat/
                    List<string> records = ReadFromView(conn, "vw_Report4");
                    List<string> newRecords = new List<string>();

                    //This foreach loop will find the state that has the most students enrolled in the course.
                    //It does this by finding which ever state is duplicated most in the record.
                    foreach (var r in records)
                    {
                        string[] split = r.Split("|");
                        string state = split[2].Split(',').GroupBy(s => s).OrderByDescending(s => s.Count()).FirstOrDefault().Key;
                        string newRecord = $"{split[0]}|{split[1]}|{state}";
                        newRecords.Add(newRecord);
                    }

                    //Export to the file now that the data has been transformed
                    string outPath = ExportToFile(newRecords, "Report4.txt", columNames);

                    //Sproc for inserting into Report_4 table
                    string sproc = $@"[dbo].[spInsertIntoReportFour]";

                    using (StreamReader sr = new StreamReader(outPath))
                    {
                        string row;
                        while ((row = sr.ReadLine()) != null)
                        {
                            if (row.Contains("|"))
                            {
                                var rowInfo = row.Split('|');
                                using (var command = new SqlCommand(sproc, conn))
                                {
                                    //Populate the parameters in the sproc
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@CourseCode", rowInfo[0]);
                                    command.Parameters.AddWithValue("@StudentIDs", rowInfo[1]);
                                    command.Parameters.AddWithValue("@MostStudentsState", rowInfo[2]);

                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                    }

                    conn.Close();
                }

            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not perform ETL for Report 4", "ETLReportFour()"));
                return;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportFour()"));
                return;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ETLReportFour()"));
                return;
            }
        }

        /// <summary>
        /// Use this to read from the views that transform the SQL data
        /// </summary>
        /// <param name="conn">The connection that the reader should use</param>
        /// <param name="viewName">Name of the view used as a parameter in the sproc</param>
        /// <returns>List of all the records read from the view</returns>
        private List<string> ReadFromView(SqlConnection conn,  string viewName)
        {
            //Records that will be returned
            List<string> records = new List<string>();

            //Sproc used for reading from specified view
            string sproc = $@"[dbo].[spSelectFromView]";

            using (var command = new SqlCommand(sproc, conn))
            {
                //Populate the parameter with the view namme that we want to read from
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ViewName", viewName);

                //Read the view
                var tableReader = command.ExecuteReader();

                //An array that is the size of the amount of values in each row
                Object[] values = new object[tableReader.FieldCount];
                //String builder for making the record string
                StringBuilder sb = new StringBuilder();

                //While there is something to read
                while (tableReader.Read())
                {
                    //populate the values array and get the count of elements in it
                    int count = tableReader.GetValues(values);

                    //While there are elements, add them to the string builder
                    for (int i = 0; i <= count - 1; i++)
                    {
                        if (i == 0)
                        {
                            sb.Append(values[i]);
                        }
                        else
                        {
                            sb.Append($"|{values[i]}");
                        }
                    }
                    //Add the string builder to the list of records
                    records.Add(sb.ToString());

                    //Clear the stringbuilder for the next record
                    sb.Clear();
                }

                //close the table reader
                tableReader.Close();
            }

            //return the list of records
            return records;
        }

        /// <summary>
        /// Use this to export tables to files
        /// Return the outpath so the ETL methods can insert the newly made file into the appropriate table
        /// </summary>
        /// <param name="recordList">The list of rows from the joined table</param>
        /// <param name="outName">The name of the output file</param>
        /// <param name="columNames">The names of the columns that will be in the output file</param>
        private string ExportToFile(List<string> recordList, string outName, string columNames)
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

                return outPath;
            }
            catch (IOException e)
            {
                Error.ErrorList.Add(new Error($"Could not write to file {outName}", "ExportToFile()"));
                return null;
            }
            catch (NullReferenceException e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ExportToFile()"));
                return null;
            }
            catch (Exception e)
            {
                Error.ErrorList.Add(new Error(e.Message, "ExportToFile()"));
                return null;
            }
        }
    }
}
