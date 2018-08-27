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
    }
}