using System.Data;
using System.Data.SqlClient;
using System.Text;
using Week11_HW_API.Models;

namespace Week11_HW_API
{
    public class Services
    {
        private string SqlConString { get; set; } = string.Empty;

        /// <summary>
        /// Make sure the SqlConnection string is not empty
        /// </summary>
        /// <param name="SqlConString"></param>
        /// <returns></returns>
        public void PrepareDBConnection()
        {
            if (SqlConString == string.Empty)
            {
                //Get all the server connection info when the engine is instantiated
                SqlConnectionStringBuilder SqlConBuilder = new SqlConnectionStringBuilder();

                SqlConBuilder["server"] = @"(localdb)\MSSQLLocalDB";
                SqlConBuilder["Trusted_Connection"] = true;
                SqlConBuilder["Integrated Security"] = "SSPI";
                SqlConBuilder["Initial Catalog"] = "PROG260FA22";

                //String for opening connections to the SQL server
                SqlConString = SqlConBuilder.ToString();
            }
        }

        public List<ChartOneModel> GetChartOne()
        {
            //list for chart one data
            List<ChartOneModel> dataList = new List<ChartOneModel>();

            using (SqlConnection conn = new SqlConnection(SqlConString))
            {
                conn.Open();

                //Sproc used for getting all the monsters from the table
                string sproc = $@"[dbo].[spSelectFromView]";

                using (var command = new SqlCommand(sproc, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ViewName", "vw_Chart1");

                    //Read the table
                    var tableReader = command.ExecuteReader();

                    //An array that is the size of the amount of values in each row
                    Object[] values = new object[tableReader.FieldCount];
                    //String builder for making the record string
                    StringBuilder sb = new StringBuilder();

                    //While there is something to read
                    while (tableReader.Read())
                    {
                        //Map the recieved data to the ChartOneModel and add to the list of records
                        ChartOneModel model = new ChartOneModel();
                        model.State = (string)tableReader["Location"];
                        model.Count = (int)tableReader["Monster_Count"];

                        dataList.Add(model);
                    }

                    //close the table reader
                    tableReader.Close();
                }

                conn.Close();
            }

            return dataList;
        }

        public List<ChartTwoModel> GetChartTwo()
        {
            //list for chart 2 data
            List<ChartTwoModel> dataList = new List<ChartTwoModel>();

            using (SqlConnection conn = new SqlConnection(SqlConString))
            {
                conn.Open();

                //Sproc used for getting all the monsters from the table
                string sproc = $@"[dbo].[spSelectFromView]";

                using (var command = new SqlCommand(sproc, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ViewName", "vw_Chart2");

                    //Read the table
                    var tableReader = command.ExecuteReader();

                    //An array that is the size of the amount of values in each row
                    Object[] values = new object[tableReader.FieldCount];
                    //String builder for making the record string
                    StringBuilder sb = new StringBuilder();

                    //While there is something to read
                    while (tableReader.Read())
                    {
                        //Map the recieved data to the ChartTwoModel and add to the list of records
                        ChartTwoModel model = new ChartTwoModel();
                        model.HP = (int)tableReader["HP"];
                        model.Count = (int)tableReader["Count"];

                        dataList.Add(model);
                    }

                    //close the table reader
                    tableReader.Close();
                }

                conn.Close();
            }

            return dataList;
        }

        public List<ChartThreeModel> GetChartThree()
        {
            //List for chart 3 model
            List<ChartThreeModel> dataList = new List<ChartThreeModel>();

            using (SqlConnection conn = new SqlConnection(SqlConString))
            {
                conn.Open();

                //Sproc used for getting all the monsters from the table
                string sproc = $@"[dbo].[spSelectFromView]";

                using (var command = new SqlCommand(sproc, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ViewName", "vw_Chart3");

                    //Read the table
                    var tableReader = command.ExecuteReader();

                    //An array that is the size of the amount of values in each row
                    Object[] values = new object[tableReader.FieldCount];
                    //String builder for making the record string
                    StringBuilder sb = new StringBuilder();

                    //While there is something to read
                    while (tableReader.Read())
                    {
                        //Map the recieved data to the ChartThreeModel and add to the list of records
                        ChartThreeModel model = new ChartThreeModel();
                        model.HP = (int)tableReader["HP"];
                        model.MP = (int)tableReader["MP"];

                        dataList.Add(model);
                    }

                    //close the table reader
                    tableReader.Close();
                }

                conn.Close();
            }

            return dataList;
        }
    }
}
