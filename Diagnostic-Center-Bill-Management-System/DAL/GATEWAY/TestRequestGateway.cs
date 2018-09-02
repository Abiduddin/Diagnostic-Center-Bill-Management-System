using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY
{
    public class TestRequestGateway: ParentGateway
    {
        public void RequestAllTest(List<Test> aTests, int patientId, int billNo)
        {
            foreach (Test test in aTests)
            {
                Query = "INSERT INTO TestRequest VALUES (@testId, @patientId, @bill )";
                Command = new SqlCommand(Query,Connection);
                Command.Parameters.Add("testId", SqlDbType.Int).Value = test.Id;
                Command.Parameters.Add("patientId", SqlDbType.Int).Value = patientId;
                Command.Parameters.Add("bill", SqlDbType.Int).Value = billNo;
                
                Connection.Open();
                Command.ExecuteNonQuery();
                Connection.Close();

            }
        }


        public bool IsBillNoUniqe(int billNo)
        {
            bool unique;

            Query = "SELECT * FROM TestRequest WHERE BillNo = @billno";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("billNo", SqlDbType.Int).Value = billNo;

            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                unique = false;
            }
            else
            {
                unique = true;
            }
            Reader.Close();
            Connection.Close();

            return unique;
        }
    }
}