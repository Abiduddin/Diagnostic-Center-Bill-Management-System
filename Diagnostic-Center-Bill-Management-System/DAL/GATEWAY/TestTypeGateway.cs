using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY
{
    public class TestTypeGateway: ParentGateway
    {
        public void SaveTestType(TestType aTestType)
        {
            Query = "INSERT INTO TestType VALUES ( @Name)";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("Name", SqlDbType.VarChar).Value = aTestType.Name;

            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();

        }

        public List<TestType> GetAllTestTypes()
        {
            List<TestType> aTestTypes = null;
            Query = "SELECT * FROM TestType";
            Command = new SqlCommand(Query,Connection);

            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                aTestTypes = new List<TestType>();
                while (Reader.Read())
                {
                    TestType aTestType = new TestType();
                    aTestType.Id = Convert.ToInt32(Reader["Id"]);
                    aTestType.Name = Reader["Name"].ToString();
                    aTestTypes.Add(aTestType);
                }
            }
            
            Reader.Close();
            Connection.Close();

            return aTestTypes;

        }

        public bool IsUniqeTestTypeName(string name)
        {
/*            Query = "SELECT * FROM TestType WHERE Name = '@name'";*/
            Query = "SELECT * FROM TestType WHERE Name ='"+name+"'";
            Command = new SqlCommand(Query,Connection);
/*            Command.Parameters.Add("name", SqlDbType.VarChar).Value = name;*/
            Connection.Open();

            Reader = Command.ExecuteReader();

            bool rowAffected = Reader.HasRows;

            Connection.Close();

            return rowAffected;

        }
    }
}