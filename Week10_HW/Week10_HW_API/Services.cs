using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Text.Json.Serialization;

namespace Week10_HW_API
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

        /// <summary>
        /// Get all monsters from the DB
        /// </summary>
        /// <param name="SqlConString"></param>
        /// <returns></returns>
        public List<MonsterModel> GetAllFromTable()
        {
            //Records that will be returned
            List<MonsterModel> records = new List<MonsterModel>();

            using (SqlConnection conn = new SqlConnection(SqlConString))
            {
                conn.Open();

                //Sproc used for getting all the monsters from the table
                string sproc = $@"[dbo].[spGetAllMonsters]";

                using (var command = new SqlCommand(sproc, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    //Read the table
                    var tableReader = command.ExecuteReader();

                    //An array that is the size of the amount of values in each row
                    Object[] values = new object[tableReader.FieldCount];
                    //String builder for making the record string
                    StringBuilder sb = new StringBuilder();

                    //While there is something to read
                    while (tableReader.Read())
                    {
                        //Map the recieved data to the MonsterModel and add to the list of records
                        records.Add(MapToModel(tableReader));
                    }

                    //close the table reader
                    tableReader.Close();
                }

                conn.Close();
            }

            //return the list of records
            return records;
        }

        /// <summary>
        /// Get a monster based on passed in ID
        /// </summary>
        /// <param name="id"></param>
        /// <param name="SqlConString"></param>
        /// <returns></returns>
        public MonsterModel GetRecordByID(int id)
        {
            //record to be returned
            MonsterModel record = new MonsterModel();

            using (SqlConnection conn = new SqlConnection(SqlConString))
            {
                conn.Open();

                //Sproc used for getting monster by specified ID
                string sproc = $@"[dbo].[spGetMonsterByID]";

                using (var command = new SqlCommand(sproc, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    //Populate the parameter with the ID of the monster we want to recieve
                    command.Parameters.AddWithValue("@ID", id);

                    //Read the resulting table
                    var tableReader = command.ExecuteReader();

                    //An array that is the size of the amount of values in each row
                    Object[] values = new object[tableReader.FieldCount];
                    //String builder for making the record string
                    StringBuilder sb = new StringBuilder();

                    //While there is something to read
                    while (tableReader.Read())
                    {
                        //Map the recieved data to the MonsterModel
                        record = MapToModel(tableReader);
                    }

                    //close the table reader
                    tableReader.Close();
                }

                conn.Close();
            }
            return record;
        }

        /// <summary>
        /// Update a monster based on the id of the monster we want to update
        /// and the model with updated properties to apply to record in DB
        /// </summary>
        /// <param name="id"></param>
        /// <param name="monster"></param>
        /// <param name="SqlConString"></param>
        public void UpdateMonsterByID(int id, MonsterModel monster)
        {
            using (SqlConnection conn = new SqlConnection(SqlConString))
            {
                //Open the connection
                conn.Open();

                //Sproc for updating record by ID
                string sproc = $@"[dbo].[spUpdateMonsterByID]";

                using (var command = new SqlCommand(sproc, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    //Populate the parameters. The Sproc has functionality to make sure that null records are not applied for the update
                    command.Parameters.AddWithValue("@ID", id);
                    command.Parameters.AddWithValue("@Name", monster.Name);
                    command.Parameters.AddWithValue("@Type", monster.Type);
                    command.Parameters.AddWithValue("@HP", monster.HP);
                    command.Parameters.AddWithValue("@MP", monster.MP);
                    command.Parameters.AddWithValue("@Location", monster.Location);

                    command.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Delete a monster by the specified ID
        /// </summary>
        /// <param name="id"></param>
        /// <param name="SqlConString"></param>
        public void DeleteMonsterByID(int id)
        {
            using (SqlConnection conn = new SqlConnection(SqlConString))
            {
                conn.Open();

                //Sproc for deleting monster by ID
                string sproc = $@"[dbo].[spDeleteMonsterByID]";

                using (var command = new SqlCommand(sproc, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@ID", id);

                    command.ExecuteNonQuery();
                }
            }
        }


        /// <summary>
        /// For Get All and Get By ID
        /// This will map a read monster to the pre-established monster model
        /// so it can be returned in the proper format
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        private MonsterModel MapToModel(SqlDataReader? result)
        {
            MonsterModel model = new MonsterModel();

            model.ID = (int)result["id"];
            model.Name = (string)result["Name"];
            model.Type = (string)result["Type"];
            model.HP = (int)result["HP"];
            model.MP = (int)result["MP"];
            model.Location = (string)result["Location"];

            return model;
        }
    }
}
