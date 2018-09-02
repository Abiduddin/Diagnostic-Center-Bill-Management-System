using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY
{
    public class TestGateway:ParentGateway
    {
        public void SaveTest(Test aTest)
        {
            Query = "INSERT INTO Test VALUES (@name, @fee, @typeId)";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("name", SqlDbType.VarChar).Value = aTest.Name;
            Command.Parameters.Add("fee", SqlDbType.Int).Value = aTest.Fee;
            Command.Parameters.Add("typeId", SqlDbType.Int).Value = aTest.TypeId;

            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();
        }

        public List<Test> GetAllTest()
        {
            List<Test> aTests = null;
            Query = "SELECT * FROM Test";
            Command = new SqlCommand(Query, Connection);

            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                aTests = new List<Test>();
                while (Reader.Read())
                {
                    Test aTest = new Test();
                    aTest.Id = Convert.ToInt32(Reader["Id"]);
                    aTest.Name = Reader["Name"].ToString();
                    aTest.Fee = Convert.ToInt32(Reader["Fee"]);
                    aTest.TypeId = Convert.ToInt32(Reader["TypeId"]);

                    aTests.Add(aTest);
                }
            }

            Reader.Close();
            Connection.Close();

            return aTests;
        }

        public Test GetTestById(int testId)
        {
            Query = "SELECT * from Test WHERE Id = @Id ";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("Id", SqlDbType.Int).Value = testId;

            Connection.Open();
            Reader = Command.ExecuteReader();
            Test aTest = null;
            if (Reader.HasRows)
            {
                Reader.Read();
                aTest = new Test();
                aTest.Id = testId;
                aTest.Name = Reader["Name"].ToString();
                aTest.Fee = Convert.ToInt32(Reader["Fee"]);
                aTest.TypeId = Convert.ToInt32(Reader["TypeId"]);
            }
            Reader.Close();
            Connection.Close();

            return aTest;

        }
    }
}